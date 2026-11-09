import NoThreeLine.RootPhaseVirtualAnchor
import NoThreeLine.ScheduledVirtualC4

/-! C4 for the canonical full-phase saved root snapshot, on the original
board measure. Its source estimates are proved for this saved law itself;
the deterministic-cut C4 theorem is not used to transfer observations. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines BirthWitness

attribute [local irreducible] initialRootPhaseWitness

theorem initial_rootPhaseBoard_virtual_finite_bound {n m : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ : ℝ)
    (q : Grid n) (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (L : LineIndex n) (hqL : q ∉ L.val) (hm : 0 < m)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK0 : 0 ≤ K) (hK2 : K < 2)
    (hK : ∀ j, (cs j).K ≤ K) (hρ : ∀ j, ρ ≤ (cs j).rho) (hρ1 : ρ ≤ 1)
    (hδ : 0 < δ) (hδ1 : δ ≤ 1) (hδρ : δ ≤ ρ) (hδK : δ ≤ (2-K)/2)
    (hε0 : 0 ≤ ε) (hε : ε ≤ 1/2) (J : ℕ) :
    (∫ ω, let e := (initialRootPhaseWitness cs ε M deadline start q hn hB (unitBirthRetention n) J ω).augmented.physical
      virtualMass e.process Γ e.coordinates L q ^ m
      ∂boardClockMeasure n (B/n)) ≤
      2^m * ∑ a ∈ Finset.Icc 1 m, B^(m-a) * (a : ℝ)^m *
        (((candidates L q).card : ℝ)^a *
          (physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start J-start)/n)^a)) := by
  let W := fun ω : BoardClockPath n =>
    (initialRootPhaseWitness cs ε M deadline start q hn hB (unitBirthRetention n) J ω).augmented.physical
  let ν := boardClockMeasure n (B/n)
  have hB0 : 0 < B := lt_of_lt_of_le zero_lt_one hB
  letI := boardClockMeasure_probability n (B/n) (div_pos hB0 (by exact_mod_cast hn))
  have hW : Measurable W := (AugmentedState.measurable_physical n).comp
    ((WitnessState.measurable_augmented n).comp
      (initialRootPhaseWitness_measurable cs ε M deadline start q hn hB _ J))
  have hv (ω) : (W ω).Valid B :=
    (initialRootPhaseWitness_valid cs ε M deadline start q hn hB _ J ω).1.1
  have hτ : 0 ≤ phaseEndpoint cs start J-start := by
    simpa only [add_zero] using scheduled_elapsed_nonneg cs start J 0 le_rfl
  have hsum (a : ℕ) : (∑ g ∈ anchors L q a, ∫ ω, anchorProduct g (W ω) ∂ν) ≤
      ((candidates L q).card : ℝ)^a *
        (physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start J-start)/n)^a) := by
    have hcost : 0 ≤ physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start J-start)/n)^a :=
      mul_nonneg (physicalBoardConstant_pos Γ K δ hδ a).le
        (pow_nonneg (div_nonneg hτ (Nat.cast_nonneg _)) _)
    calc
      _ ≤ ∑ _g ∈ anchors L q a,
          physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start J-start)/n)^a :=
        Finset.sum_le_sum (fun g hg => initial_rootPhaseBoard_anchor_time_bound
          cs ε M deadline start K ρ δ q hn hB Γ L hqL g hg hΓ hK0 hK2 hK hρ hρ1
          hδ hδ1 hδρ hδK hε0 hε J)
      _ = ((anchors L q a).card : ℝ) *
          (physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start J-start)/n)^a) := by simp
      _ ≤ _ := mul_le_mul_of_nonneg_right
        (by exact_mod_cast (show (anchors L q a).card ≤ (candidates L q).card^a by
          simpa using Finset.card_le_univ (anchors L q a))) hcost
  apply (virtualMass_pow_integral_le ν W hW Γ L q B hB0 hm hv).trans
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  exact Finset.sum_le_sum (fun a _ => mul_le_mul_of_nonneg_left (hsum a)
    (mul_nonneg (pow_nonneg hB0.le _) (by positivity)))

theorem initial_rootPhaseBoard_virtual_C4 {n m : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ T ξ : ℝ)
    (hξ : 0 < ξ) (q : Grid n) (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (L : LineIndex n) (hqL : q ∉ L.val) (hm : 0 < m)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK0 : 0 ≤ K) (hK2 : K < 2)
    (hK : ∀ j, (cs j).K ≤ K) (hρ : ∀ j, ρ ≤ (cs j).rho) (hρ1 : ρ ≤ 1)
    (hδ : 0 < δ) (hδ1 : δ ≤ 1) (hδρ : δ ≤ ρ) (hδK : δ ≤ (2-K)/2)
    (hε0 : 0 ≤ ε) (hε : ε ≤ 1/2) (J : ℕ) (hT : phaseEndpoint cs start J-start ≤ T) :
    (∫ ω, let e := (initialRootPhaseWitness cs ε M deadline start q hn hB (unitBirthRetention n) J ω).augmented.physical
      virtualMass e.process Γ e.coordinates L q ^ m
      ∂boardClockMeasure n (B/n)) ≤
      momentConstant Γ K δ T ξ hξ m *
        ∑ a ∈ Finset.Icc 1 m, B^(m-a) * (n : ℝ)^((a : ℝ)*ξ) := by
  apply (initial_rootPhaseBoard_virtual_finite_bound cs ε M deadline start K ρ δ q hn hB Γ L hqL hm
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε J).trans
  exact scalar_candidate_moment_le Γ K δ (geometryConstant ξ hξ) T B
    (phaseEndpoint cs start J-start) ((candidates L q).card : ℝ) ξ hn hδ
    (geometryConstant_pos ξ hξ).le (zero_le_one.trans hB)
    (by simpa only [add_zero] using scheduled_elapsed_nonneg cs start J 0 le_rfl)
    hT (Nat.cast_nonneg _) (candidates_le_geometryConstant ξ hξ L q hqL)

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.initial_rootPhaseBoard_virtual_finite_bound
#print axioms NoThreeLine.VirtualWitness.initial_rootPhaseBoard_virtual_C4
