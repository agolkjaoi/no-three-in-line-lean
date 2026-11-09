import NoThreeLine.PhaseLineSectionPoint
import NoThreeLine.PhaseLineSectionEta

/-! D-empty physical leaf products at the actual additional cross-phase
snapshot under the original full-phase point law. Root/all-leaf active
gates remain, and the actual eta floor is supplied along the observer. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator PrimitiveLines

theorem initial_phaseSectionPoint_leaf_product {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (C labels : Finset (Grid n)) (hp : p ∈ C) (hCL : C ⊆ labels)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (k : ℕ) :
    (∫ ω, rootLeafPhi Γ C p
      (phaseSectionRecycledState cs ε M deadline start L p E A hn
        (initialPhaseSection B hB p deadline start) k ω).val.2.2.physical
      ∂phasePointMeasure cs ε M deadline start hn hB p k) ≤ 1/(1-ε)^labels.card.choose 2 := by
  let ν := phasePointMeasure cs ε M deadline start hn hB p k
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p k
  let V := phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) k
  have hv : Measurable V := (phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn
    (initialPhaseSection B hB p deadline start) k).fst.snd
  have hi : Integrable (fun ω => rootLeafPhi Γ C p (V ω).val.2.2.physical) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      ((rootLeafPhi_measurable Γ C p).comp ((AugmentedState.measurable_physical n).comp
        hv.subtype_val.snd.snd)) (rootLeafCap C p B)
      (fun ω => rootLeafPhi_bounds Γ C p _ B (V ω).property.1.saved.1)
  have hj : Integrable (fun ω => lineSectionCorrectedLeaf Γ C labels p (V ω).val.2.2) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      ((lineSectionCorrectedLeaf_measurable Γ C labels p).comp hv.subtype_val.snd.snd)
      (rootLeafCap C p B)
      (fun ω => lineSectionCorrectedLeaf_bounds Γ C labels p _ B (V ω).property.1.saved)
  have hh := integral_mono (hi.const_mul ((1-ε)^labels.card.choose 2)) hj (fun ω =>
    mul_le_mul_of_nonneg_right
      (initial_phaseSection_etaProduct_floor cs ε M deadline start L p E A hn hB labels hε0 hε.le k ω)
      (rootLeafPhi_bounds Γ C p _ B (V ω).property.1.saved.1).1)
  rw [integral_const_mul] at hh
  have hc := initial_phaseSectionPoint_correctedLeaf_mean_le cs ε M deadline start L p E A hn hB
    Γ hΓ hK C labels hp hCL k
  apply (le_div_iff₀ (pow_pos (sub_pos.mpr hε) _)).mpr
  simpa only [mul_comm] using hh.trans hc

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_leaf_product
