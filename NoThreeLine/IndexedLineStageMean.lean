import NoThreeLine.ScheduledLineStageMartingale

/-! Harmonic line-stage values on any remaining suffix of the original
schedule, using its original indices, masks, deadlines, and board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE RecycledBoardProcess

theorem indexedLineStageValue_expected {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (a : ℕ × ValidAugmentedState n B)
    (ha : validLineStageRegion K L N a.2) (k : ℕ) :
    (∫ω,validLineStageValue K L N (iterate (recycledPhaseStep cs ε M deadline start hn) a k ω).1.2
      ∂boardClockMeasure n (B/n))=validLineStageValue K L N a.2 := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let F := recycledPhaseStep cs ε M deadline start hn
  have hF := recycledPhaseStep_measurable cs ε M deadline start hn
  have he := section_state_map F hF (augPhaseIndexedStep cs ε M deadline start hn)
    _ _ (recycledPhaseStep_map cs ε M deadline start hn hB)
  have hsection (a : ℕ × ValidAugmentedState n B) :
      ν.map (fun ω=>F (a,ω))=(ν.map (fun ω=>(F (a,ω)).1)).prod ν := by
    rw [he a]
    exact recycledPhaseStep_map cs ε M deadline start hn hB a
  have h := credit_martingale_of_invariant F hF ν hsection
    (fun a=>validLineStageValue K L N a.2) ((validLineStageValue_measurable K L N).comp measurable_snd)
    ((2/(2-K))^2) (fun a=>validLineStageValue_bounds K hK L N hN a.2)
    (fun a=>validLineStageRegion K L N a.2) ((validLineStageRegion_measurable K L N).comp measurable_snd)
    (fun a ha ω=>recycledScheduledPair_lineStageRegion cs ε M K deadline start hn a.1 (hKcfg a.1)
      L (hsp a.1) N hN a.2 ha ω)
    (fun a ha=>recycledScheduledPair_lineStageValue_mean cs ε M K deadline start hn hB a.1
      (hKcfg a.1) hK L (hsp a.1) N hN a.2 ha) a ha
  have hh := (h.setIntegral_eq (Nat.zero_le k) MeasurableSet.univ).symm
  simpa [setIntegral_univ,state,iterate] using hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.indexedLineStageValue_expected
