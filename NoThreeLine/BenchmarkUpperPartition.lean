import NoThreeLine.BenchmarkBoundChecker
import NoThreeLine.Partition

/-! A rational partition with independent upper traces on every interval.
The actual nonnegative function, rather than an arbitrary signed expression,
is squared. Branch validity and rounded branch integration are unchanged. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped Interval
namespace NoThreeLine.OneSided

def checkUpperPartition (e : Expr) (S : ℕ) (r : ℚ) : List (ℚ × BoundTrace) → Option ℚ
  | [] => if r=1 then some 0 else none
  | (s,t)::cuts => (checkBound e t true r s).bind fun c =>
      if BranchValid c.a c.b r s then
        (checkUpperPartition e S s cuts).bind fun tail =>
          some (roundUp S (branchBound c.a c.b r s)+tail)
      else none

theorem checkUpperPartition_range (e : Expr) (S : ℕ) (r : ℚ)
    (cuts : List (ℚ × BoundTrace)) (B : ℚ)
    (hc : checkUpperPartition e S r cuts=some B) : 0≤r ∧ r≤1 := by
  induction cuts generalizing r B with
  | nil =>
      simp only [checkUpperPartition] at hc
      split_ifs at hc with hr
      subst r
      norm_num
  | cons p cuts ih =>
      obtain ⟨s,t⟩ := p
      simp only [checkUpperPartition,Option.bind_eq_some_iff] at hc
      obtain ⟨c,he,hrest⟩ := hc
      split_ifs at hrest with hv
      simp only [Option.bind_eq_some_iff] at hrest
      obtain ⟨tail,ht,hb⟩ := hrest
      exact ⟨hv.1,hv.2.1.le.trans (ih s tail ht).2⟩

theorem checked_upper_branch_integral (e : Expr) (t : BoundTrace) (S : ℕ)
    (r s : ℚ) (c : Coeff) (G : ℝ → ℝ) (hS : 0<S)
    (hv : BranchValid c.a c.b r s)
    (hc : checkBound e t true r s=some c)
    (hI : IntervalIntegrable (fun u => (G u)^2) volume r s)
    (hG : ∀ u∈Ioo (r : ℝ) s, 0≤G u ∧ G u≤e.eval u) :
    (∫ u in (r : ℝ)..(s : ℝ), (G u)^2)≤
      (roundUp S (branchBound c.a c.b r s) : ℝ) := by
  have hrs : (r : ℝ)≤s := by exact_mod_cast hv.2.1.le
  apply le_trans (intervalIntegral.integral_mono_on_of_le_Ioo hrs hI
    (coeff_square_intervalIntegrable c r s hv) ?_)
    (rounded_branch_sound S hS c.a c.b r s hv)
  intro u hu
  exact pow_le_pow_left₀ (hG u hu).1
    ((hG u hu).2.trans (checkUpper_sound e t r s c u hv.1 hu.1 hu.2.le hc)) 2

theorem checkUpperPartition_sound (e : Expr) (S : ℕ) (r : ℚ)
    (cuts : List (ℚ × BoundTrace)) (B : ℚ) (G : ℝ → ℝ)
    (hS : 0<S) (hc : checkUpperPartition e S r cuts=some B)
    (hI : IntervalIntegrable (fun u => (G u)^2) volume 0 1)
    (hG : ∀ u∈Ioo (0 : ℝ) 1, 0≤G u ∧ G u≤e.eval u) :
    (∫ u in (r : ℝ)..1, (G u)^2)≤(B : ℝ) := by
  induction cuts generalizing r B with
  | nil =>
      simp only [checkUpperPartition] at hc
      split_ifs at hc with hr
      have hb := (Option.some.inj hc).symm
      subst r
      subst B
      simp
  | cons p cuts ih =>
      obtain ⟨s,t⟩ := p
      simp only [checkUpperPartition,Option.bind_eq_some_iff] at hc
      obtain ⟨c,he,hrest⟩ := hc
      split_ifs at hrest with hv
      simp only [Option.bind_eq_some_iff] at hrest
      obtain ⟨tail,ht,hb⟩ := hrest
      have hb' := Option.some.inj hb
      subst B
      have hr0 : (0 : ℝ)≤r := by exact_mod_cast hv.1
      have hrs : (r : ℝ)≤s := by exact_mod_cast hv.2.1.le
      have hs1 : (s : ℝ)≤1 := by exact_mod_cast (checkUpperPartition_range e S s cuts tail ht).2
      have hlocalI : IntervalIntegrable (fun u => (G u)^2) volume r s := by
        apply hI.mono_set
        rw [uIcc_of_le hrs,uIcc_of_le (by norm_num : (0 : ℝ)≤1)]
        exact Icc_subset_Icc hr0 hs1
      have htailI : IntervalIntegrable (fun u => (G u)^2) volume s 1 := by
        apply hI.mono_set
        rw [uIcc_of_le hs1,uIcc_of_le (by norm_num : (0 : ℝ)≤1)]
        exact Icc_subset_Icc (hr0.trans hrs) le_rfl
      have hlocal := checked_upper_branch_integral e t S r s c G hS hv he hlocalI
        (fun u hu => hG u ⟨hr0.trans_lt hu.1,hu.2.trans_le hs1⟩)
      have htail := ih s tail ht
      rw [←intervalIntegral.integral_add_adjacent_intervals hlocalI htailI]
      exact_mod_cast add_le_add hlocal htail

def checkUpperUnitIntegral (e : Expr) (S : ℕ) (cuts : List (ℚ × BoundTrace)) : Option ℚ :=
  if 0<S then checkUpperPartition e S 0 cuts else none

theorem checkUpperUnitIntegral_sound (e : Expr) (S : ℕ) (cuts : List (ℚ × BoundTrace))
    (B : ℚ) (G : ℝ → ℝ) (hc : checkUpperUnitIntegral e S cuts=some B)
    (hI : IntervalIntegrable (fun u => (G u)^2) volume 0 1)
    (hG : ∀ u∈Ioo (0 : ℝ) 1, 0≤G u ∧ G u≤e.eval u) :
    (∫ u in (0 : ℝ)..1, (G u)^2)≤(B : ℝ) := by
  unfold checkUpperUnitIntegral at hc
  split_ifs at hc with hS
  simpa only [Rat.cast_zero] using checkUpperPartition_sound e S 0 cuts B G hS hc hI hG

example : checkUpperUnitIntegral skipCrossing 100 [(1,.minLeft .exact)]=some 9 := by
  decide +kernel
example : checkUpperUnitIntegral skipCrossing 100 [(1/2,.minLeft .exact)]=none := by
  decide +kernel
example : checkUpperUnitIntegral skipCrossing 0 [(1,.minLeft .exact)]=none := by
  decide +kernel
example : checkUpperUnitIntegral skipCrossing 100
    [(1/2,.minLeft .exact),(1/2,.minLeft .exact),(1,.minLeft .exact)]=none := by
  decide +kernel

end NoThreeLine.OneSided

#print axioms NoThreeLine.OneSided.checkUpperUnitIntegral_sound
