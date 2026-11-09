import NoThreeLine.ProtectedLedgerDensityHistory
import NoThreeLine.ProtectedRunningMean

/-! Global original-board bounds for a root on the specified line.
An active root forces occupancy at most one; a real update can add at
most one selected point, and division at occupancy two gives zero.
No forbidden-stage event is assumed for these original-board bounds. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness LineDrift

theorem protectedPhysicalCredit_bounds_two {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (p : Grid n) (B : ℝ) (he : e.Valid B) (hN : occupancy e.process L≤2) :
    0≤(e.process.accounts p).credit/protection (occupancy e.process L) (e.clocks L) ∧
      (e.process.accounts p).credit/protection (occupancy e.process L) (e.clocks L)≤2*B := by
  have hc := (e.process.accounts p).credit_bounds B (he.2.1.1 p)
  have hk := he.2.1.2.1 L
  have hB : 0≤B := hc.1.trans hc.2
  have hform : (e.process.accounts p).credit/protection (occupancy e.process L) (e.clocks L)=
      (e.process.accounts p).credit*(2-e.clocks L)/(2-(occupancy e.process L:ℝ)) := by
    unfold protection
    simp only [div_eq_mul_inv,mul_inv_rev,inv_inv]
    ring
  rw [hform]
  by_cases htwo : occupancy e.process L=2
  · simp only [htwo,Nat.cast_ofNat,sub_self,div_zero]
    exact ⟨le_rfl,mul_nonneg (by norm_num) hB⟩
  · have hone : (occupancy e.process L:ℝ)≤1 := by exact_mod_cast (show occupancy e.process L≤1 by omega)
    have hden : 0<2-(occupancy e.process L:ℝ) := by linarith
    have hk0 : 0≤e.clocks L := hk.1
    have hk2 : e.clocks L≤2 := hk.2
    refine ⟨div_nonneg (mul_nonneg hc.1 (sub_nonneg.mpr hk2)) hden.le,?_⟩
    apply (div_le_iff₀ hden).mpr
    have ha := mul_nonneg hc.1 hk0
    have hb := mul_nonneg hB (show 0≤1-(occupancy e.process L:ℝ) by linarith)
    nlinarith

theorem protectedLineCredit_bounds_all {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (hsp : specified Γ L)
    (p : Grid n) (hpL : p∈L.val) (B : ℝ) (he : e.Valid B)
    (hsv : 0≤saved p ∧ saved p≤2*B) :
    0≤protectedLineCredit L e saved p ∧ protectedLineCredit L e saved p≤2*B := by
  cases hp : (e.process.accounts p).status with
  | active =>
      have hN := state_designated_count_le_one e.process Γ p he.1 hp L.val
        ((specified_iff_designated Γ p L hpL).mp hsp)
      have hb := protectedPhysicalCredit_bounds_two L e p B he (hN.trans (by omega))
      simpa only [protectedLineCredit,hp,reduceCtorEq,if_false] using hb
  | retired => simpa only [protectedLineCredit,hp,if_true] using hsv
  | selected => simp only [protectedLineCredit,hp,reduceCtorEq,if_false,CreditAccount.credit,or_self,zero_div]; exact ⟨le_rfl,hsv.1.trans hsv.2⟩
  | dead => simp only [protectedLineCredit,hp,reduceCtorEq,if_false,CreditAccount.credit,or_self,zero_div]; exact ⟨le_rfl,hsv.1.trans hsv.2⟩

theorem protectedLineSave_timed_bounds_all {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (s : ProtectedTimedState cfg) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) (z : CandidateData n) :
    0≤(protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z))).2 p ∧
      (protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z))).2 p≤2*cfg.B := by
  change 0≤protectedLineSave L s.1.val.1.physical (augTimedStep cfg ε M (s.1,z)).val.1.physical s.2 p ∧
    protectedLineSave L s.1.val.1.physical (augTimedStep cfg ε M (s.1,z)).val.1.physical s.2 p≤2*cfg.B
  unfold protectedLineSave
  split_ifs with hr
  · have hN := state_designated_count_le_one s.1.val.1.physical.process cfg.directions p s.1.property.1.1.1 hr.1 L.val
      ((specified_iff_designated cfg.directions p L hpL).mp hsp)
    change occupancy s.1.val.1.physical.process L≤1 at hN
    have hpost : occupancy (augTimedStep cfg ε M (s.1,z)).val.1.physical.process L≤2 := by
      rw [augTimedStep_occupancy]
      split_ifs <;> omega
    exact protectedPhysicalCredit_bounds_two L _ p cfg.B (augTimedStep cfg ε M (s.1,z)).property.1.1 hpost
  · exact hsv

theorem protectedRecycledPair_saved_bounds_all {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (k : ℕ) (ω : BoardClockPath n) :
    0≤(protectedRecycledPair cfg ε M L hn s k ω).1.2 p ∧
      (protectedRecycledPair cfg ε M L hn s k ω).1.2 p≤2*cfg.B := by
  induction k with
  | zero => exact hsv
  | succ k ih =>
      exact protectedLineSave_timed_bounds_all cfg ε M L hsp p hpL
        (protectedRecycledPair cfg ε M L hn s k ω).1 ih _

theorem protectedRecycledPair_credit_bounds_all {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (k : ℕ) (ω : BoardClockPath n) :
    0≤protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1 ∧
      protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1≤2*cfg.B :=
  protectedLineCredit_bounds_all L _ _ cfg.directions hsp p hpL cfg.B
    (protectedRecycledPair cfg ε M L hn s k ω).1.1.property.1.1
    (protectedRecycledPair_saved_bounds_all cfg ε M L hsp p hpL hn s hsv k ω)

theorem protectedLinePositiveDrift_bounds_all {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (hsp : specified Γ L)
    (p : Grid n) (hpL : p∈L.val) (B : ℝ) (he : e.Valid B) (hm : ∀q,0≤mask q ∧ mask q≤1) :
    0≤protectedLinePositiveDrift e mask L p ∧ protectedLinePositiveDrift e mask L p≤(B/n)*B := by
  have hB : 0≤B := (he.2.1.1 p).1.trans (he.2.1.1 p).2
  by_cases hp : (e.process.accounts p).status=.active
  · have hN := state_designated_count_le_one e.process Γ p he.1 hp L.val
      ((specified_iff_designated Γ p L hpL).mp hsp)
    have hc : 0≤specifiedLineWeight e L p ∧ specifiedLineWeight e L p≤2*B := by
      simpa only [CreditAccount.credit,hp,true_or,if_true,specifiedLineWeight] using
        protectedPhysicalCredit_bounds_two L e p B he (hN.trans (by omega))
    have hb := one_sub_b_bounds _ hN
    have hr := e.process.birthRate_nonneg mask (fun q=>(hm q).1) he.1 p
    have hrB : e.process.birthRate mask p≤B/n := by
      unfold ProcessState.birthRate
      split_ifs
      · exact div_le_div_of_nonneg_right
          ((mul_le_of_le_one_left (he.2.1.1 p).1 (hm p).2).trans (he.2.1.1 p).2) (Nat.cast_nonneg n)
      · exact div_nonneg hB (Nat.cast_nonneg n)
    unfold protectedLinePositiveDrift
    refine ⟨mul_nonneg (mul_nonneg hr hb.1) hc.1,?_⟩
    calc
      _ ≤ ((B/n)*(1/2))*(2*B) := mul_le_mul
        (mul_le_mul hrB hb.2 hb.1 (div_nonneg hB (Nat.cast_nonneg n))) hc.2 hc.1
        (mul_nonneg (div_nonneg hB (Nat.cast_nonneg n)) (by norm_num))
      _ = _ := by ring
  · simp only [protectedLinePositiveDrift,ProcessState.birthRate,hp,and_false,if_false,zero_mul]
    exact ⟨le_rfl,mul_nonneg (div_nonneg hB (Nat.cast_nonneg n)) hB⟩

end NoThreeLine

#print axioms NoThreeLine.protectedRecycledPair_saved_bounds_all
#print axioms NoThreeLine.protectedRecycledPair_credit_bounds_all
#print axioms NoThreeLine.protectedLinePositiveDrift_bounds_all
