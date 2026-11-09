import NoThreeLine.RecycledPhaseKernel
import NoThreeLine.AugmentedPhaseComposition

/-! Actual phase termination followed by its absolute deadline retirement,
returning the remaining original clock board for the next phase. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

def recycledScheduledPair {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (a : ValidAugmentedState n B × BoardClockPath n) : ValidAugmentedState n B × BoardClockPath n :=
  let r := augPhaseRecycledPair (cs j).config ε M hn a
  (augValidDeadlineRetirement deadline (phaseEndpoint cs start (j+1)) r.1,r.2)

theorem recycledScheduledPair_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ) :
    Measurable (recycledScheduledPair cs ε M deadline start hn j) := by
  have hr := augPhaseRecycledPair_measurable (cs j).config ε M hn
  exact ((augValidDeadlineRetirement_measurable deadline _).comp hr.fst).prodMk hr.snd

theorem recycledScheduledPair_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B) (j : ℕ)
    (e : ValidAugmentedState n B) :
    (boardClockMeasure n (B/n)).map (fun ω => recycledScheduledPair cs ε M deadline start hn j (e,ω)) =
      ((FreshBoardWaits.freshBoardMeasure n (B/n)).map
        (fun ω => augScheduledPhase cs ε M deadline start hn j (e,ω))).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let d := augValidDeadlineRetirement (B := B) deadline (phaseEndpoint cs start (j+1))
  have hd : Measurable d := augValidDeadlineRetirement_measurable deadline _
  have hp : Measurable (fun r : ValidAugmentedState n B × BoardClockPath n => (d r.1,r.2)) :=
    (hd.comp measurable_fst).prodMk measurable_snd
  have hr : Measurable (fun ω : BoardClockPath n => augPhaseRecycledPair (cs j).config ε M hn (e,ω)) :=
    (augPhaseRecycledPair_measurable (cs j).config ε M hn).comp (measurable_const.prodMk measurable_id)
  have ht : Measurable (fun ω : PhaseNoise n => augPhaseTerminal (cs j).config ε M hn (e,ω)) :=
    (augPhaseTerminal_measurable (cs j).config ε M hn).comp (measurable_const.prodMk measurable_id)
  letI := phaseNoise_probability (cs j).config hn hB
  letI : IsProbabilityMeasure ((FreshBoardWaits.freshBoardMeasure n (B/n)).map
      (fun ω => augPhaseTerminal (cs j).config ε M hn (e,ω))) :=
    Measure.isProbabilityMeasure_map ht.aemeasurable
  have h := congrArg (fun μ : Measure (ValidAugmentedState n B × BoardClockPath n) =>
    μ.map (fun r => (d r.1,r.2))) (augPhaseRecycledPair_map (cs j).config ε M hn hB e)
  rw [Measure.map_map hp hr,map_pair_with_fresh_right _ _ d hd,Measure.map_map hd ht] at h
  exact h

theorem recycledScheduledPair_stopped {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (e : ValidAugmentedState n B) (he : e.val.physical.process.stopped = true) (ω : BoardClockPath n) :
    recycledScheduledPair cs ε M deadline start hn j (e,ω) = (e,ω) := by
  simp only [recycledScheduledPair,augPhaseRecycledPair_stopped (cs j).config ε M hn e he,
    augValidDeadlineRetirement_stopped _ _ e he]

def recycledPhaseStep {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (a : (ℕ × ValidAugmentedState n B) × BoardClockPath n) : (ℕ × ValidAugmentedState n B) × BoardClockPath n :=
  let r := recycledScheduledPair cs ε M deadline start hn a.1.1 (a.1.2,a.2)
  ((a.1.1+1,r.1),r.2)

theorem recycledPhaseStep_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) :
    Measurable (recycledPhaseStep cs ε M deadline start hn) := by
  have hm : Measurable (fun a : ℕ × (ValidAugmentedState n B × BoardClockPath n) =>
      recycledScheduledPair cs ε M deadline start hn a.1 a.2) :=
    measurable_from_prod_countable_right (fun j => recycledScheduledPair_measurable cs ε M deadline start hn j)
  have hg : Measurable (fun a : (ℕ × ValidAugmentedState n B) × BoardClockPath n =>
      (a.1.1,(a.1.2,a.2))) :=
    measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd)
  have hr := hm.comp hg
  have hi : Measurable (fun a : (ℕ × ValidAugmentedState n B) × BoardClockPath n => a.1.1+1) :=
    (measurable_of_countable (fun j : ℕ => j+1)).comp measurable_fst.fst
  exact (hi.prodMk hr.fst).prodMk hr.snd

theorem recycledPhaseStep_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (a : ℕ × ValidAugmentedState n B) :
    (boardClockMeasure n (B/n)).map (fun ω => recycledPhaseStep cs ε M deadline start hn (a,ω)) =
      ((FreshBoardWaits.freshBoardMeasure n (B/n)).map
        (fun ω => augPhaseIndexedStep cs ε M deadline start hn (a,ω))).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hi : Measurable (fun e : ValidAugmentedState n B => (a.1+1,e)) :=
    measurable_const.prodMk measurable_id
  have hp : Measurable (fun r : ValidAugmentedState n B × BoardClockPath n => ((a.1+1,r.1),r.2)) :=
    (measurable_const.prodMk measurable_fst).prodMk measurable_snd
  have hr : Measurable (fun ω : BoardClockPath n => recycledScheduledPair cs ε M deadline start hn a.1 (a.2,ω)) :=
    (recycledScheduledPair_measurable cs ε M deadline start hn a.1).comp (measurable_const.prodMk measurable_id)
  have ht : Measurable (fun ω : PhaseNoise n => augScheduledPhase cs ε M deadline start hn a.1 (a.2,ω)) :=
    (augScheduledPhase_measurable cs ε M deadline start hn a.1).comp (measurable_const.prodMk measurable_id)
  letI := phaseNoise_probability (cs a.1).config hn hB
  letI : IsProbabilityMeasure ((FreshBoardWaits.freshBoardMeasure n (B/n)).map
      (fun ω => augScheduledPhase cs ε M deadline start hn a.1 (a.2,ω))) :=
    Measure.isProbabilityMeasure_map ht.aemeasurable
  have h := congrArg (fun μ : Measure (ValidAugmentedState n B × BoardClockPath n) =>
    μ.map (fun r => ((a.1+1,r.1),r.2))) (recycledScheduledPair_map cs ε M deadline start hn hB a.1 a.2)
  rw [Measure.map_map hp hr,map_pair_with_fresh_right _ _ _ hi,Measure.map_map hi ht] at h
  exact h

end NoThreeLine

#print axioms NoThreeLine.recycledScheduledPair_map
#print axioms NoThreeLine.recycledScheduledPair_stopped
#print axioms NoThreeLine.recycledPhaseStep_measurable
#print axioms NoThreeLine.recycledPhaseStep_map
