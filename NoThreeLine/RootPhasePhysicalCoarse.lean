import NoThreeLine.RootPhaseLeafProduct
import NoThreeLine.RootPhaseConnectionFloor
import NoThreeLine.RootBoardComparison
import NoThreeLine.PhysicalLeafConnectionRemoval
import NoThreeLine.UnitBirthWitness

/-! Physical-leaf source estimates at the actual full-phase saved snapshot.
The connection and board-density costs come from that snapshot's proved
guard and weight floors. No deterministic-cut law is transferred here. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection

theorem initial_rootPhasePoint_physicalLeaf_coarse_product {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (C D U : Finset (Grid n)) (hp : p ∈ C) (hCDU : C ∪ D ⊆ U)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK0 : 0 ≤ K) (hK2 : K < 2)
    (hK : ∀ j, (cs j).K ≤ K) (hρ : ∀ j, ρ ≤ (cs j).rho) (hρ1 : ρ ≤ 1)
    (hδ : 0 < δ) (hδ1 : δ ≤ 1) (hδρ : δ ≤ ρ) (hδK : δ ≤ (2-K)/2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (J : ℕ) :
    (∫ ω, physicalLeafProduct C D p
      (initialRootPhaseWitness cs ε M deadline start p hn hB (unitBirthRetention n) J ω).augmented.physical
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
      (δ^(C.card^3))⁻¹ * ((∏ z ∈ D, accumulatedPhaseCoarsePrice cs start (unitBirthRetention n) J z) /
        (1-ε)^(U.card.choose 2)) := by
  let W := initialRootPhaseWitness cs ε M deadline start p hn hB (unitBirthRetention n) J
  let ν := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure ν := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hW : Measurable W := initialRootPhaseWitness_measurable cs ε M deadline start p hn hB _ J
  have hv (ω) : (W ω).Valid B := initialRootPhaseWitness_valid cs ε M deadline start p hn hB _ J ω
  by_cases hCD : Disjoint C D
  · have hi : Integrable (fun ω => physicalLeafProduct C D p (W ω).augmented.physical) ν :=
      physicalLeafProduct_integrable ν _ ((AugmentedState.measurable_physical n).comp
        ((WitnessState.measurable_augmented n).comp hW)) C D p B (fun ω => (hv ω).1.1)
    have hj : Integrable (fun ω => rootLeafWitness Γ C D p (W ω)) ν :=
      GenericCreditIteration.bounded_nonnegative_integrable ν _
        ((rootLeafWitness_measurable Γ C D p).comp hW) (rootLeafCap C p B)
        (fun ω => rootLeafWitness_bounds Γ C D p _ B (hv ω))
    have hh : (∫ ω, physicalLeafProduct C D p (W ω).augmented.physical ∂ν) ≤
        (δ^(C.card^3))⁻¹ * (∫ ω, rootLeafWitness Γ C D p (W ω) ∂ν) := by
      rw [← integral_const_mul]
      apply integral_mono hi (hj.const_mul _)
      intro ω
      apply physicalLeafProduct_le_connection_cost Γ C D p (W ω) B δ (hv ω) hδ
        (initial_rootPhaseWitness_unit_retained cs ε M deadline start p hn hB J ω)
      intro hC
      exact initialRootPhaseWitness_connection_lower cs ε M deadline start K ρ δ p hn hB _
        hK0 hK2 Γ hΓ hK hρ hρ1 hδ.le hδ1 hδρ hδK J ω C hC
    apply hh.trans
    apply mul_le_mul_of_nonneg_left _ (by positivity)
    exact initial_rootPhasePoint_leaf_coarse_product cs ε M deadline start p hn hB _ Γ C D U hp
      hΓ (fun j => (hK j).trans_lt hK2) hCD hCDU hε0 hε J
  · have hz : (∫ ω, physicalLeafProduct C D p (W ω).augmented.physical ∂ν) = 0 := by
      apply integral_eq_zero_of_ae
      exact Filter.Eventually.of_forall (fun ω =>
        physicalLeafProduct_zero_of_not_disjoint C D p _ (hv ω).1.1.1 hCD)
    change (∫ ω, physicalLeafProduct C D p (W ω).augmented.physical ∂ν) ≤ _
    rw [hz]
    exact mul_nonneg (by positivity) (div_nonneg
      (Finset.prod_nonneg (fun z _ => accumulatedPhaseCoarsePrice_nonneg cs start _ J z))
      (pow_nonneg (sub_nonneg.mpr hε.le) _))

theorem initial_rootPhaseBoard_physicalLeaf_coarse_product {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (C D U : Finset (Grid n)) (hp : p ∈ C) (hCDU : C ∪ D ⊆ U)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK0 : 0 ≤ K) (hK2 : K < 2)
    (hK : ∀ j, (cs j).K ≤ K) (hρ : ∀ j, ρ ≤ (cs j).rho) (hρ1 : ρ ≤ 1)
    (hδ : 0 < δ) (hδ1 : δ ≤ 1) (hδρ : δ ≤ ρ) (hδK : δ ≤ (2-K)/2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (J : ℕ) :
    (∫ ω, physicalLeafProduct C D p
      (initialRootPhaseWitness cs ε M deadline start p hn hB (unitBirthRetention n) J ω).augmented.physical
      ∂boardClockMeasure n (B/n)) ≤
      (2:ℝ)^Γ.card * ((δ^(C.card^3))⁻¹ *
        ((∏ z ∈ D, accumulatedPhaseCoarsePrice cs start (unitBirthRetention n) J z) /
          (1-ε)^(U.card.choose 2))) := by
  let W := initialRootPhaseWitness cs ε M deadline start p hn hB (unitBirthRetention n) J
  have hW : Measurable W := initialRootPhaseWitness_measurable cs ε M deadline start p hn hB _ J
  have hv (ω) : (W ω).Valid B := initialRootPhaseWitness_valid cs ε M deadline start p hn hB _ J ω
  have hcomp := initial_rootPhase_board_integral_le_point cs ε M deadline start hn hB Γ hΓ p J
    (unitBirthRetention n) (fun ω => physicalLeafProduct C D p (W ω).augmented.physical)
    ((physicalLeafProduct_measurable C D p).comp ((AugmentedState.measurable_physical n).comp
      ((WitnessState.measurable_augmented n).comp hW)))
    ((max 1 B)^(C.erase p).card) (fun ω => physicalLeafProduct_bounds C D p _ B (hv ω).1.1)
    (by
      intro ω ha
      exact if_neg (fun hC => ha ((ProcessState.mem_activeEvents _ p).mp (hC hp))))
  exact hcomp.trans (mul_le_mul_of_nonneg_left
    (initial_rootPhasePoint_physicalLeaf_coarse_product cs ε M deadline start K ρ δ p hn hB Γ C D U hp hCDU
      hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε J) (by positivity))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_physicalLeaf_coarse_product
#print axioms NoThreeLine.BirthWitness.initial_rootPhaseBoard_physicalLeaf_coarse_product
