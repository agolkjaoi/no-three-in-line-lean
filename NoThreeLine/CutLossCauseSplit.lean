import NoThreeLine.BoundaryCauseKinds

/-! Early actual cut loss is supported by five explicit actual boundary
causes under one full-terminal point law. This finite union estimate does
not assign small probabilities to the clock, tag, or eta branches. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

theorem scheduledNonWeightBoundary_real_le_four {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    μ.real (scheduledNonWeightBoundaryBefore cs ε M deadline start hn e p J) ≤
      μ.real (scheduledBoundaryCauseBefore cs ε M deadline start hn e p .eta J) +
      μ.real (scheduledBoundaryCauseBefore cs ε M deadline start hn e p .virtual J) +
      μ.real (scheduledBoundaryCauseBefore cs ε M deadline start hn e p .clock J) +
      μ.real (scheduledBoundaryCauseBefore cs ε M deadline start hn e p .tag J) := by
  let E := scheduledBoundaryCauseBefore cs ε M deadline start hn e p .eta J
  let V := scheduledBoundaryCauseBefore cs ε M deadline start hn e p .virtual J
  let C := scheduledBoundaryCauseBefore cs ε M deadline start hn e p .clock J
  let G := scheduledBoundaryCauseBefore cs ε M deadline start hn e p .tag J
  rw [scheduledNonWeightBoundaryBefore_split]
  have h1 := measureReal_union_le (μ:=μ) E (V ∪ (C ∪ G))
  have h2 := measureReal_union_le (μ:=μ) V (C ∪ G)
  have h3 := measureReal_union_le (μ:=μ) C G
  change μ.real (E ∪ (V ∪ (C ∪ G))) ≤ μ.real E + μ.real V + μ.real C + μ.real G
  linarith

namespace BirthWitness

theorem scheduledCutLossProbability_le_five_causes {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) (N J : ℕ) (hN : N < J) (t : ℝ)
    (ht : t ∈ Icc (0:ℝ) (cs N).horizon)
    (hdeadline : phaseEndpoint cs start N+t < deadline p) :
    scheduledCutLossProbability cs ε M deadline start hn hB p N t ≤
      (phasePointMeasure cs ε M deadline start hn hB p J).real
        (scheduledActualWeightCapBefore cs ε M deadline start hn (augInitialState B hB deadline start) p J) +
      (phasePointMeasure cs ε M deadline start hn hB p J).real
        (scheduledBoundaryCauseBefore cs ε M deadline start hn (augInitialState B hB deadline start) p .eta J) +
      (phasePointMeasure cs ε M deadline start hn hB p J).real
        (scheduledBoundaryCauseBefore cs ε M deadline start hn (augInitialState B hB deadline start) p .virtual J) +
      (phasePointMeasure cs ε M deadline start hn hB p J).real
        (scheduledBoundaryCauseBefore cs ε M deadline start hn (augInitialState B hB deadline start) p .clock J) +
      (phasePointMeasure cs ε M deadline start hn hB p J).real
        (scheduledBoundaryCauseBefore cs ε M deadline start hn (augInitialState B hB deadline start) p .tag J) := by
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  apply (scheduledCutLossProbability_le_full_point_causes cs ε M deadline start hn hB p N J hN t ht hdeadline).trans
  have h := scheduledNonWeightBoundary_real_le_four cs ε M deadline start hn
    (augInitialState B hB deadline start) p J (phasePointMeasure cs ε M deadline start hn hB p J)
  linarith

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.scheduledNonWeightBoundary_real_le_four
#print axioms NoThreeLine.BirthWitness.scheduledCutLossProbability_le_five_causes
