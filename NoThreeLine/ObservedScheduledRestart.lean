import NoThreeLine.ObservedPhaseRestart
import NoThreeLine.RecycledScheduledPhase

/-! The actual observed scheduled phase, including birth records and absolute
deadline retirement, returns the remaining original clock board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def observedScheduledPair {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (a : PhaseObservation n B × BoardClockPath n) : PhaseObservation n B × BoardClockPath n :=
  let r := observedPhaseRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn a
  (observedDeadline deadline (phaseEndpoint cs start (j+1)) r.1,r.2)

theorem observedScheduledPair_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ) :
    Measurable (observedScheduledPair cs ε M deadline start hn j) := by
  have hr := observedPhaseRecycledPair_measurable (cs j).config ε M (phaseEndpoint cs start j) hn
  exact ((observedDeadline_measurable deadline _).comp hr.fst).prodMk hr.snd

theorem observedScheduledPair_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B) (j : ℕ)
    (e : PhaseObservation n B) :
    (boardClockMeasure n (B/n)).map (fun ω => observedScheduledPair cs ε M deadline start hn j (e,ω)) =
      ((FreshBoardWaits.freshBoardMeasure n (B/n)).map
        (fun ω => observedScheduledPhase cs ε M deadline start hn j (e,ω))).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let d := observedDeadline (B := B) deadline (phaseEndpoint cs start (j+1))
  have hd : Measurable d := observedDeadline_measurable deadline _
  have hp : Measurable (fun r : PhaseObservation n B × BoardClockPath n => (d r.1,r.2)) :=
    (hd.comp measurable_fst).prodMk measurable_snd
  have hr : Measurable (fun ω : BoardClockPath n => observedPhaseRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn (e,ω)) :=
    (observedPhaseRecycledPair_measurable (cs j).config ε M (phaseEndpoint cs start j) hn).comp (measurable_const.prodMk measurable_id)
  have ht : Measurable (fun ω : PhaseNoise n => observedPhaseTerminal (cs j).config ε M (phaseEndpoint cs start j) hn (e,ω)) :=
    (observedPhaseTerminal_measurable (cs j).config ε M (phaseEndpoint cs start j) hn).comp (measurable_const.prodMk measurable_id)
  letI := phaseNoise_probability (cs j).config hn hB
  letI : IsProbabilityMeasure ((FreshBoardWaits.freshBoardMeasure n (B/n)).map
      (fun ω => observedPhaseTerminal (cs j).config ε M (phaseEndpoint cs start j) hn (e,ω))) :=
    Measure.isProbabilityMeasure_map ht.aemeasurable
  have h := congrArg (fun μ : Measure (PhaseObservation n B × BoardClockPath n) =>
    μ.map (fun r => (d r.1,r.2))) (observedPhaseRecycledPair_map (cs j).config ε M (phaseEndpoint cs start j) hn hB e)
  rw [Measure.map_map hp hr,map_pair_with_fresh_right _ _ d hd,Measure.map_map hd ht] at h
  exact h

theorem observedScheduledPair_base {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (x : PhaseObservation n B × BoardClockPath n) :
    ((observedScheduledPair cs ε M deadline start hn j x).1.1,
      (observedScheduledPair cs ε M deadline start hn j x).2) =
        recycledScheduledPair cs ε M deadline start hn j (x.1.1,x.2) := by
  exact congrArg (fun r : ValidAugmentedState n B × BoardClockPath n =>
    (augValidDeadlineRetirement deadline (phaseEndpoint cs start (j+1)) r.1,r.2))
      (observedPhaseRecycledPair_base (cs j).config ε M (phaseEndpoint cs start j) hn x)

theorem observedScheduledPair_consistent {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (x : PhaseObservation n B × BoardClockPath n) (hx : PhaseRecordsConsistent x.1) :
    PhaseRecordsConsistent (observedScheduledPair cs ε M deadline start hn j x).1 :=
  observedDeadline_consistent deadline _ _
    (observedPhaseRecycledPair_consistent (cs j).config ε M (phaseEndpoint cs start j) hn x hx)

def indexedObservedTransition {S W : Type*} (φ : ℕ → S × W → S)
    (x : (ℕ × S) × W) : ℕ × S := (x.1.1+1,φ x.1.1 (x.1.2,x.2))

theorem indexedObservedTransition_measurable {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (φ : ℕ → S × W → S) (hφ : ∀ j, Measurable (φ j)) : Measurable (indexedObservedTransition φ) := by
  have hm : Measurable (fun x : ℕ × (S × W) => φ x.1 x.2) :=
    measurable_from_prod_countable_right hφ
  have hg : Measurable (fun x : (ℕ × S) × W => (x.1.1,(x.1.2,x.2))) :=
    measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd)
  have hi : Measurable (fun x : (ℕ × S) × W => x.1.1+1) :=
    (measurable_of_countable (fun j : ℕ => j+1)).comp measurable_fst.fst
  exact hi.prodMk (hm.comp hg)

def observedPhaseIndexedStep {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) :
    (ℕ × PhaseObservation n B) × PhaseNoise n → ℕ × PhaseObservation n B :=
  indexedObservedTransition (observedScheduledPhase cs ε M deadline start hn)

theorem observedPhaseIndexedStep_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) :
    Measurable (observedPhaseIndexedStep cs ε M deadline start hn) :=
  indexedObservedTransition_measurable (observedScheduledPhase cs ε M deadline start hn)
    (observedScheduledPhase_measurable cs ε M deadline start hn)

def observedPhaseRestartStep {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (a : (ℕ × PhaseObservation n B) × BoardClockPath n) : (ℕ × PhaseObservation n B) × BoardClockPath n :=
  let r := observedScheduledPair cs ε M deadline start hn a.1.1 (a.1.2,a.2)
  ((a.1.1+1,r.1),r.2)

theorem observedPhaseRestartStep_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) :
    Measurable (observedPhaseRestartStep cs ε M deadline start hn) := by
  have hm : Measurable (fun a : ℕ × (PhaseObservation n B × BoardClockPath n) =>
      observedScheduledPair cs ε M deadline start hn a.1 a.2) :=
    measurable_from_prod_countable_right (fun j => observedScheduledPair_measurable cs ε M deadline start hn j)
  have hg : Measurable (fun a : (ℕ × PhaseObservation n B) × BoardClockPath n =>
      (a.1.1,(a.1.2,a.2))) :=
    measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd)
  have hr := hm.comp hg
  have hi : Measurable (fun a : (ℕ × PhaseObservation n B) × BoardClockPath n => a.1.1+1) :=
    (measurable_of_countable (fun j : ℕ => j+1)).comp measurable_fst.fst
  exact (hi.prodMk hr.fst).prodMk hr.snd

theorem observedPhaseRestartStep_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (a : ℕ × PhaseObservation n B) :
    (boardClockMeasure n (B/n)).map (fun ω => observedPhaseRestartStep cs ε M deadline start hn (a,ω)) =
      ((FreshBoardWaits.freshBoardMeasure n (B/n)).map
        (fun ω => observedPhaseIndexedStep cs ε M deadline start hn (a,ω))).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hi : Measurable (fun e : PhaseObservation n B => (a.1+1,e)) :=
    measurable_const.prodMk measurable_id
  have hp : Measurable (fun r : PhaseObservation n B × BoardClockPath n => ((a.1+1,r.1),r.2)) :=
    (measurable_const.prodMk measurable_fst).prodMk measurable_snd
  have hr : Measurable (fun ω : BoardClockPath n => observedScheduledPair cs ε M deadline start hn a.1 (a.2,ω)) :=
    (observedScheduledPair_measurable cs ε M deadline start hn a.1).comp (measurable_const.prodMk measurable_id)
  have ht : Measurable (fun ω : PhaseNoise n => observedScheduledPhase cs ε M deadline start hn a.1 (a.2,ω)) :=
    (observedScheduledPhase_measurable cs ε M deadline start hn a.1).comp (measurable_const.prodMk measurable_id)
  letI := phaseNoise_probability (cs a.1).config hn hB
  letI : IsProbabilityMeasure ((FreshBoardWaits.freshBoardMeasure n (B/n)).map
      (fun ω => observedScheduledPhase cs ε M deadline start hn a.1 (a.2,ω))) :=
    Measure.isProbabilityMeasure_map ht.aemeasurable
  have h := congrArg (fun μ : Measure (PhaseObservation n B × BoardClockPath n) =>
    μ.map (fun r => ((a.1+1,r.1),r.2))) (observedScheduledPair_map cs ε M deadline start hn hB a.1 a.2)
  rw [Measure.map_map hp hr,map_pair_with_fresh_right _ _ _ hi,Measure.map_map hi ht] at h
  exact h

theorem observedPhaseRestartStep_base {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (x : (ℕ × PhaseObservation n B) × BoardClockPath n) :
    (((observedPhaseRestartStep cs ε M deadline start hn x).1.1,
      (observedPhaseRestartStep cs ε M deadline start hn x).1.2.1),
      (observedPhaseRestartStep cs ε M deadline start hn x).2) =
        recycledPhaseStep cs ε M deadline start hn ((x.1.1,x.1.2.1),x.2) := by
  exact congrArg (fun r : ValidAugmentedState n B × BoardClockPath n => ((x.1.1+1,r.1),r.2))
    (observedScheduledPair_base cs ε M deadline start hn x.1.1 (x.1.2,x.2))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedScheduledPair_map
#print axioms NoThreeLine.BirthWitness.observedScheduledPair_base
#print axioms NoThreeLine.BirthWitness.observedPhaseRestartStep_measurable
#print axioms NoThreeLine.BirthWitness.observedPhaseRestartStep_map
