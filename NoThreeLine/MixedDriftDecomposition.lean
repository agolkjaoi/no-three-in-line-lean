import NoThreeLine.MixedCauseGeometry

/-! Expand the actual mixed continuous drift into the actual finite
candidate rates, with the causewise connection debit proved previously. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.MixedConnection
open AuxiliaryODE PrimitiveLines

theorem lineIntensity_univ {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ)
    (z : Coordinates n) (L : LineIndex n) :
    lineIntensity s mask z L=∑ q : Grid n,if q∈L.val then phaseRate s mask z.1 q else 0 := by
  classical
  rw [lineIntensity,← Finset.sum_filter]
  congr 1
  ext q
  simp

theorem connectionDamping_factor {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (hstop : s.stopped=false) (L : LineIndex n) :
    connectionDamping s Γ mask z L=lineIntensity s mask z L*lineCauseFactor s Γ L := by
  by_cases hsp : specified Γ L <;> by_cases hN : occupancy s L≤1 <;> by_cases hN1 : occupancy s L=1 <;>
    simp [connectionDamping,clockDamping,creditDamping,lineCauseFactor,hstop,hsp,hN,hN1,div_eq_mul_inv]

theorem connectionDamping_sum {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (hstop : s.stopped=false) (L : LineIndex n) :
    connectionDamping s Γ mask z L=
      ∑ q : Grid n,phaseRate s mask z.1 q*(if q∈L.val then lineCauseFactor s Γ L else 0) := by
  rw [connectionDamping_factor s Γ mask z hstop L,lineIntensity_univ,Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro q _
  by_cases hq : q∈L.val <;> simp [hq]

theorem perCapitaGrowth_univ {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (w : Grid n → ℝ) (hstop : s.stopped=false) (p : Grid n)
    (hp : p∈s.activeEvents) :
    s.perCapitaGrowth Γ mask w p=∑ q : Grid n,phaseRate s mask w q*localGrowthFactor Γ s.selected p q := by
  classical
  simp only [ProcessState.perCapitaGrowth,hstop,(s.mem_activeEvents p).mp hp,and_self,if_true,
    ProcessState.activeEvents,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro q _
  by_cases hq : (s.accounts q).status=.active <;> simp [phaseRate,hstop,hq]

theorem phiGrowth_sum_causes {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (mask : Grid n → ℝ) (z : Coordinates n)
    (hstop : s.stopped=false) (hC : C⊆s.activeEvents) :
    phiGrowth s Γ C mask z=∑ q : Grid n,phaseRate s mask z.1 q*causeGrowth s Γ C q := by
  have hroots : (∑ p∈C,s.perCapitaGrowth Γ mask z.1 p)=
      ∑ q : Grid n,phaseRate s mask z.1 q*(∑ p∈C,localGrowthFactor Γ s.selected p q) := by
    calc
      _ = ∑ p∈C,∑ q : Grid n,phaseRate s mask z.1 q*localGrowthFactor Γ s.selected p q := by
        apply Finset.sum_congr rfl
        intro p hp
        exact perCapitaGrowth_univ s Γ mask z.1 hstop p (hC hp)
      _ = _ := by rw [Finset.sum_comm]; simp only [Finset.mul_sum]
  have hlines : (∑ L : LineIndex n,-((multiplicity C L-1:ℕ):ℝ)*connectionDamping s Γ mask z L)=
      ∑ q : Grid n,-(phaseRate s mask z.1 q*(∑ L : LineIndex n,causeLineDebit s Γ C q L)) := by
    simp_rw [connectionDamping_sum s Γ mask z hstop,Finset.mul_sum]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro q _
    rw [← Finset.sum_neg_distrib]
    apply Finset.sum_congr rfl
    intro L _
    by_cases hqL : q∈L.val <;> simp [causeLineDebit,hqL] <;> ring
  rw [phiGrowth,hroots,hlines,← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro q _
  unfold causeGrowth
  ring

end NoThreeLine.MixedConnection

#print axioms NoThreeLine.MixedConnection.phiGrowth_sum_causes
