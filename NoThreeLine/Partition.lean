import NoThreeLine.BranchChecker
import NoThreeLine.IntegralCertificate

set_option autoImplicit false
open MeasureTheory Set
open scoped Interval

namespace NoThreeLine

/-- Check every adjacent interval, terminating exactly at 1. The precision
parameter must be positive when applying the soundness theorem. -/
def checkPartition (e : Expr) (S : ℕ) (r : ℚ) : List ℚ → Option ℚ
  | [] => if r = 1 then some 0 else none
  | s :: cuts => (e.check r s).bind fun c =>
      if BranchValid c.a c.b r s then
        (checkPartition e S s cuts).bind fun tail =>
          some (roundUp S (branchBound c.a c.b r s) + tail)
      else none

theorem coeff_square_intervalIntegrable (c : Coeff) (r s : ℚ)
    (h : BranchValid c.a c.b r s) :
    IntervalIntegrable (fun u : ℝ => (c.eval u)^2) volume r s := by
  by_cases hr0 : r = 0
  · have hb : c.b = 0 := h.2.2.1 hr0
    simp only [Coeff.eval, hb, Rat.cast_zero, zero_div, add_zero]
    exact intervalIntegrable_const
  · have hrpos : (0 : ℝ) < r := by
      exact_mod_cast lt_of_le_of_ne h.1 (Ne.symm hr0)
    have hrs : (r : ℝ) ≤ s := by exact_mod_cast h.2.1.le
    have hc : ContinuousOn (fun u : ℝ => c.eval u) (Icc (r : ℝ) s) := by
      unfold Coeff.eval
      apply continuousOn_const.add
      apply continuousOn_const.div continuousOn_id
      intro u hu
      exact ne_of_gt (lt_of_lt_of_le hrpos hu.1)
    exact (hc.pow 2).intervalIntegrable_of_Icc hrs

/-- A checked expression branch supplies both integrability and its rounded
bound. Endpoints of the expression may differ, so equality is used on Ioo. -/
theorem checked_branch_integral (e : Expr) (S : ℕ) (r s : ℚ) (c : Coeff)
    (hS : 0 < S) (hvalid : BranchValid c.a c.b r s)
    (hcheck : e.check r s = some c) :
    IntervalIntegrable (fun u : ℝ => (e.eval u)^2) volume r s ∧
      (∫ u in (r : ℝ)..(s : ℝ), (e.eval u)^2) ≤
        (roundUp S (branchBound c.a c.b r s) : ℝ) := by
  have hrs : (r : ℝ) ≤ s := by exact_mod_cast hvalid.2.1.le
  have heq : EqOn (fun u : ℝ => (e.eval u)^2)
      (fun u : ℝ => (c.eval u)^2) (Ioo (r : ℝ) s) := by
    intro u hu
    dsimp only
    rw [Expr.check_sound e r s c u hvalid.1 hu.1 hu.2.le hcheck]
  constructor
  · apply (coeff_square_intervalIntegrable c r s hvalid).congr_uIoo
    rw [uIoo_of_le hrs]
    exact heq.symm
  · rw [intervalIntegral.integral_congr_Ioo_of_le hrs heq]
    exact rounded_branch_sound S hS c.a c.b r s hvalid

/-- Success proves exact full coverage, interval integrability, and a rounded
finite upper sum; no analytic or geometric conclusion is assumed. -/
theorem checkPartition_sound (e : Expr) (S : ℕ) (r : ℚ) (cuts : List ℚ)
    (B : ℚ) (hS : 0 < S) (hcheck : checkPartition e S r cuts = some B) :
    IntervalIntegrable (fun u : ℝ => (e.eval u)^2) volume r 1 ∧
      (∫ u in (r : ℝ)..(1 : ℝ), (e.eval u)^2) ≤ (B : ℝ) := by
  induction cuts generalizing r B with
  | nil =>
      simp only [checkPartition] at hcheck
      split_ifs at hcheck with hr
      have hb : B = 0 := (Option.some.inj hcheck).symm
      subst r
      subst B
      simp
  | cons s cuts ih =>
      simp only [checkPartition, Option.bind_eq_some_iff] at hcheck
      obtain ⟨c, hc, hrest⟩ := hcheck
      split_ifs at hrest with hv
      simp only [Option.bind_eq_some_iff] at hrest
      obtain ⟨tail, ht, hb⟩ := hrest
      have hb' := Option.some.inj hb
      subst B
      have hlocal := checked_branch_integral e S r s c hS hv hc
      have htail := ih s tail ht
      refine ⟨hlocal.1.trans htail.1, ?_⟩
      rw [← intervalIntegral.integral_add_adjacent_intervals hlocal.1 htail.1]
      exact_mod_cast add_le_add hlocal.2 htail.2

/-- Public unit-interval entry point also rejects zero rounding precision. -/
def checkUnitIntegral (e : Expr) (S : ℕ) (cuts : List ℚ) : Option ℚ :=
  if 0 < S then checkPartition e S 0 cuts else none

theorem checkUnitIntegral_sound (e : Expr) (S : ℕ) (cuts : List ℚ) (B : ℚ)
    (hcheck : checkUnitIntegral e S cuts = some B) :
    IntervalIntegrable (fun u : ℝ => (e.eval u)^2) volume 0 1 ∧
      (∫ u in (0 : ℝ)..(1 : ℝ), (e.eval u)^2) ≤ (B : ℝ) := by
  unfold checkUnitIntegral at hcheck
  split_ifs at hcheck with hS
  simpa using checkPartition_sound e S 0 cuts B hS hcheck

/-- Kernel reduction exercises valid coverage, a crossing requiring a cut,
missing endpoint, repeated endpoint, and zero precision. -/
def partitionExample : Expr :=
  .max (.atom ⟨1, 0⟩) (.atom ⟨2, -1/2⟩)

example : checkUnitIntegral partitionExample 100 [1/2, 1] = some (7/5) := by
  norm_num [checkUnitIntegral, checkPartition, partitionExample, Expr.check,
    Coeff.leOn, BranchValid, roundUp, branchBound, qAlpha, qBeta]

example : checkUnitIntegral partitionExample 100 [1] = none := by
  norm_num [checkUnitIntegral, checkPartition, partitionExample, Expr.check, Coeff.leOn]
example : checkUnitIntegral partitionExample 100 [1/2] = none := by
  norm_num [checkUnitIntegral, checkPartition, partitionExample, Expr.check, Coeff.leOn,
    BranchValid]
example : checkUnitIntegral partitionExample 100 [1/2, 1/2, 1] = none := by
  norm_num [checkUnitIntegral, checkPartition, partitionExample, Expr.check, Coeff.leOn,
    BranchValid]
example : checkUnitIntegral partitionExample 0 [1/2, 1] = none := by decide

end NoThreeLine

#print axioms NoThreeLine.checked_branch_integral
#print axioms NoThreeLine.checkPartition_sound
#print axioms NoThreeLine.checkUnitIntegral_sound
