import NoThreeLine.LineSectionContactCapture
import NoThreeLine.AugmentedWeightGrowth
import NoThreeLine.SelectedLineCreditIntegral

/-! Candidate birth and boundary resolution cannot cause an upward jump
of the actual credit-weighted active line-section mass. Thus a new upper
crossing arises along the continuous physical flow, not from a birth. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator

theorem actualLineSectionMass_le_of_active_weight_le {n : ℕ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (a b : AugmentedState n)
    (hactive : a.physical.process.activeEvents ⊆ b.physical.process.activeEvents)
    (hw0 : ∀ q, 0 ≤ (b.physical.process.accounts q).weight)
    (hw : ∀ q, (a.physical.process.accounts q).weight ≤ (b.physical.process.accounts q).weight)
    (hr : a.physical.lineCredits L = b.physical.lineCredits L) (hr0 : 0 ≤ b.physical.lineCredits L) :
    actualLineSectionMass L p E a ≤ actualLineSectionMass L p E b := by
  change a.physical.lineCredits L * _ ≤ b.physical.lineCredits L * _
  rw [hr]
  apply mul_le_mul_of_nonneg_left _ hr0
  apply Finset.sum_le_sum
  intro q hq
  by_cases ha : (a.physical.process.accounts q).status = .active
  · have hb := (ProcessState.mem_activeEvents _ q).mp (hactive ((ProcessState.mem_activeEvents _ q).mpr ha))
    simp only [if_pos ha,if_pos hb]
    exact hw q
  · simp only [if_neg ha]
    split_ifs
    · exact hw0 q
    · exact le_rfl

theorem augRawOutcome_lineSectionMass_le_pre {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n))
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (hη : ∀ q r, 0 ≤ x.1.2 q r ∧ x.1.2 q r ≤ 1) (z : CandidateData n) :
    actualLineSectionMass L p E (augRawOutcome cfg ε M (x,z)) ≤
      actualLineSectionMass L p E (augPreState cfg ε M (x,z)) := by
  have hv := augPreState_valid cfg ε M x he hη z
  apply actualLineSectionMass_le_of_active_weight_le L p E _ _
    (augRawOutcome_active_subset cfg ε M (x,z))
    (fun q => (hv.1.2.1.1 q).1) (augRawOutcome_weight_le_pre cfg ε M x he z)
  · unfold augRawOutcome
    split_ifs <;> rfl
  · exact (hv.1.2.1.2.2 L).1

theorem resolve_lineSectionMass_le {n : ℕ} (a : AugmentedState n) (B : ℝ)
    (ha : a.Valid B) (Γ : Finset PrimitiveLines.ZPoint) (K ρ ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) :
    actualLineSectionMass L p E (a.resolve Γ B K ρ ε M) ≤ actualLineSectionMass L p E a := by
  apply actualLineSectionMass_le_of_active_weight_le L p E _ _
    (augmented_resolve_active_subset a Γ B K ρ ε M) (fun q => (ha.1.2.1.1 q).1)
  · intro q
    have hcoord : (a.resolve Γ B K ρ ε M).physical.coordinates = a.physical.coordinates := by
      unfold AugmentedState.resolve
      split_ifs
      · exact a.physical.stop_coordinates
      · exact a.physical.resolve_coordinates Γ B K ρ
    exact (congrArg (fun z : Coordinates n => z.1 q) hcoord).le
  · exact congrFun (AugmentedState.resolve_lineCredits a Γ B K ρ ε M) L
  · exact (ha.1.2.1.2.2 L).1

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.augRawOutcome_lineSectionMass_le_pre
#print axioms NoThreeLine.BirthWitness.resolve_lineSectionMass_le
