import NoThreeLine.FlowPositivity
import NoThreeLine.FlowFirstCredit

/-! Use the sign-invariance theorem to remove the path-nonnegativity
assumption from the actual first-candidate credit identity. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem ProcessState.bounded_flow_first_candidate_credit {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B T : ℝ)
    (hn : 0 < n) (hB : 0 < B) (hT : 0 ≤ T) (hs : s.Valid)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (w : ℝ → Grid n → ℝ) (hw : ContinuousOn w (Icc 0 T))
    (hwB : ∀ t ∈ Icc 0 T, ∀ q, (s.accounts q).status = .active → w t q ≤ B)
    (hwinit : w 0 = fun p => (s.accounts p).weight)
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt w (s.compensatedVectorField Γ mask (w t)) t)
    (positive : ℝ → Grid n → Grid n → Bool) (p : Grid n) :
    (∫ t, (if t ≤ T then (s.withWeights (w t)).candidateCreditMean Γ mask B (positive t) p
      else ((s.withWeights (w T)).accounts p).credit) ∂expMeasure ((n : ℝ)*B)) =
      (s.accounts p).credit := by
  apply s.flow_first_candidate_credit Γ mask B T hn hB hT hs hm w hw _ hwB hwinit hd positive p
  intro t ht q
  apply s.flow_weight_nonneg Γ mask T hT w hw hd _ t ht q
  intro r
  simpa only [hwinit] using hs.2.2 r

end NoThreeLine

#print axioms NoThreeLine.ProcessState.bounded_flow_first_candidate_credit
