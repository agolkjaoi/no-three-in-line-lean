import NoThreeLine.RootPhaseVirtualC4
import NoThreeLine.VirtualHitPhase

/-! Markov's inequality for actual postgeometry raw virtual hits. A hit at
any phase or candidate index is contained pathwise in one saved snapshot;
there is no union over times. Continuous first contact is not asserted. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines BirthWitness

attribute [local irreducible] initialRootPhaseWitness

theorem initial_rawHit_support {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (q : Grid n) (hn : 0<n) (hB : 1≤B) (hM : 0<M)
    (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions=Γ)
    (L : LineIndex n) (J : ℕ) (ω : BoardClockPath n)
    (hh : ω ∈ phaseVirtualHitBefore cs ε M deadline start q hn
      (initialGoodPhaseRootObservation B hB q deadline start).val L J) :
    specified Γ L ∧ q ∉ L.val := by
  let W := (initialRootPhaseWitness cs ε M deadline start q hn hB (unitBirthRetention n) J ω).augmented.physical
  have hm : M ≤ virtualMass W.process Γ W.coordinates L q :=
    initial_phaseVirtualHitBefore_full_snapshot cs ε M deadline start q hn hB _ hM Γ hΓ L J ω hh
  have he : enabled W.process Γ L q := by
    by_contra h
    rw [virtualMass_eq_zero_of_disabled _ _ _ _ _ h] at hm
    linarith
  exact ⟨he.2.1, he.2.2.2.1⟩

theorem initial_rawHit_measure_le_moment {n m : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (q : Grid n) (hn : 0<n) (hB : 1≤B) (hM : 0<M) (hm : 0<m)
    (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions=Γ)
    (L : LineIndex n) (J : ℕ) :
    (boardClockMeasure n (B/n)).real (phaseVirtualHitBefore cs ε M deadline start q hn
      (initialGoodPhaseRootObservation B hB q deadline start).val L J) ≤
      (∫ ω, let e := (initialRootPhaseWitness cs ε M deadline start q hn hB
        (unitBirthRetention n) J ω).augmented.physical
        virtualMass e.process Γ e.coordinates L q ^ m ∂boardClockMeasure n (B/n)) / M^m := by
  let W := fun ω : BoardClockPath n =>
    (initialRootPhaseWitness cs ε M deadline start q hn hB (unitBirthRetention n) J ω).augmented.physical
  let ν := boardClockMeasure n (B/n)
  have hB0 : 0<B := lt_of_lt_of_le zero_lt_one hB
  letI := boardClockMeasure_probability n (B/n) (div_pos hB0 (by exact_mod_cast hn))
  have hW : Measurable W := (AugmentedState.measurable_physical n).comp
    ((WitnessState.measurable_augmented n).comp
      (initialRootPhaseWitness_measurable cs ε M deadline start q hn hB _ J))
  have hv (ω) : (W ω).Valid B :=
    (initialRootPhaseWitness_valid cs ε M deadline start q hn hB _ J ω).1.1
  have h0 (ω) : 0 ≤ virtualMass (W ω).process Γ (W ω).coordinates L q :=
    virtualMass_nonneg _ _ _ _ _ (fun y => ((hv ω).2.1.1 y).1) ((hv ω).2.1.2.1 L).2
  have hi := virtualMass_pow_integrable ν W hW Γ L q B hB0 hm hv
  have hMarkov := mul_meas_ge_le_integral_of_nonneg
    (Filter.Eventually.of_forall (fun ω => pow_nonneg (h0 ω) m)) hi (M^m)
  have hsub : phaseVirtualHitBefore cs ε M deadline start q hn
      (initialGoodPhaseRootObservation B hB q deadline start).val L J ⊆
      {ω | M^m ≤ virtualMass (W ω).process Γ (W ω).coordinates L q ^ m} := by
    intro ω hh
    exact pow_le_pow_left₀ hM.le
      (initial_phaseVirtualHitBefore_full_snapshot cs ε M deadline start q hn hB _ hM Γ hΓ L J ω hh) m
  apply (le_div_iff₀ (pow_pos hM m)).mpr
  simpa only [mul_comm] using
    (mul_le_mul_of_nonneg_left (measureReal_mono (μ:=ν) hsub) (pow_nonneg hM.le m)).trans hMarkov

theorem initial_rawHit_C4_tail {n m : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ T ξ : ℝ)
    (hξ : 0<ξ) (q : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (L : LineIndex n) (hqL : q ∉ L.val) (hm : 0<m) (hM : 0<M)
    (hΓ : ∀ j, (cs j).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀ j, (cs j).K≤K) (hρ : ∀ j, ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε≤1/2) (J : ℕ) (hT : phaseEndpoint cs start J-start≤T) :
    (boardClockMeasure n (B/n)).real (phaseVirtualHitBefore cs ε M deadline start q hn
      (initialGoodPhaseRootObservation B hB q deadline start).val L J) ≤
      momentConstant Γ K δ T ξ hξ m *
        (∑ a ∈ Finset.Icc 1 m, B^(m-a) * (n : ℝ)^((a : ℝ)*ξ)) / M^m := by
  apply (initial_rawHit_measure_le_moment cs ε M deadline start q hn hB hM hm Γ hΓ L J).trans
  exact div_le_div_of_nonneg_right
    (initial_rootPhaseBoard_virtual_C4 cs ε M deadline start K ρ δ T ξ hξ q hn hB Γ L hqL hm
      hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε J hT) (pow_nonneg hM.le m)

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.initial_rawHit_support
#print axioms NoThreeLine.VirtualWitness.initial_rawHit_measure_le_moment
#print axioms NoThreeLine.VirtualWitness.initial_rawHit_C4_tail
