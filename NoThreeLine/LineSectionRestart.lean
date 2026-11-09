import NoThreeLine.LineSectionMean
import NoThreeLine.RootFreezeRestart

/-! The additional contact snapshot has the actual residual-board product
law. Late candidate data cannot affect it, since its cap is no later than
the original physical/auxiliary/remaining guard. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness
open EtaMixedGenerator AuxiliaryODE

theorem lineSection_augAdvance_late {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (t : ℝ) (ht : augGuardTime cfg ε M x < t) :
    augAdvance cfg ε M (x,t) = augGuardTime cfg ε M x := by
  change max 0 (min (augGuardTime cfg ε M x) t) = _
  rw [min_eq_left ht.le,max_eq_right (augGuardTime_mem cfg ε M x he).1]

theorem lineSectionRawSnapshot_late_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : TimedObservation cfg) (z z' : CandidateData n)
    (hz : augGuardTime cfg ε M (augTimedInput cfg s.1) < z.1.1)
    (hz' : augGuardTime cfg ε M (augTimedInput cfg s.1) < z'.1.1) :
    lineSectionRawSnapshot cfg ε M L p E A (s,z) = lineSectionRawSnapshot cfg ε M L p E A (s,z') := by
  by_cases hd : observationDone cfg s
  · simp only [lineSectionRawSnapshot,if_pos hd]
  · have hg : augGuardTime cfg ε M (lineSectionInput cfg L p E A s.1) ≤
        augGuardTime cfg ε M (augTimedInput cfg s.1) := by
      rw [lineSectionInput,sourceCap_guard cfg ε M _ (selectedLineSectionTime_bounds cfg L p E A _).1]
      exact min_le_left _ _
    have hz1 := hg.trans_lt hz
    have hz2 := hg.trans_lt hz'
    simp only [lineSectionRawSnapshot,if_neg hd,augRawOutcome,
      not_le_of_gt hz1,not_le_of_gt hz2,and_false,if_false,augPreState_selectedAugmentedCurve]
    rw [lineSection_augAdvance_late cfg ε M _ s.1.property.1.1 z.1.1 hz1,
      lineSection_augAdvance_late cfg ε M _ s.1.property.1.1 z'.1.1 hz2]

theorem lineSectionObserverStep_done_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (hd : observationDone cfg s.1) (z z' : CandidateData n) :
    lineSectionObserverStep cfg ε M start L p E A (s,z) =
      lineSectionObserverStep cfg ε M start L p E A (s,z') := by
  have hc (u : CandidateData n) : lineSectionStepClose cfg ε M start L p E A (s.1,u) := by
    left
    rw [observedStep_frozen cfg ε M start (s.1,u) hd]
    exact Or.inl hd
  simp only [lineSectionObserverStep,observedStep_frozen cfg ε M start (s.1,z) hd,
    observedStep_frozen cfg ε M start (s.1,z') hd,if_pos (hc z),if_pos (hc z'),
    lineSectionRawSnapshot,if_pos hd]

theorem lineSectionObserverStep_late_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (z z' : CandidateData n)
    (hz : augGuardTime cfg ε M (augTimedInput cfg s.1.1) < z.1.1)
    (hz' : augGuardTime cfg ε M (augTimedInput cfg s.1.1) < z'.1.1) :
    lineSectionObserverStep cfg ε M start L p E A (s,z) =
      lineSectionObserverStep cfg ε M start L p E A (s,z') := by
  have hc : lineSectionStepClose cfg ε M start L p E A (s.1,z) ↔
      lineSectionStepClose cfg ε M start L p E A (s.1,z') := by
    simp only [lineSectionStepClose,observedStep_late_eq cfg ε M start s.1 z z' hz hz',
      lineSection_augAdvance_late cfg ε M _ s.1.1.property.1.1 z.1.1 hz,
      lineSection_augAdvance_late cfg ε M _ s.1.1.property.1.1 z'.1.1 hz']
  simp only [lineSectionObserverStep,observedStep_late_eq cfg ε M start s.1 z z' hz hz',
    lineSectionRawSnapshot_late_eq cfg ε M L p E A s.1 z z' hz hz']
  rw [propext hc]

def lineSectionClockStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : LineSectionObservation cfg × BoardClockPath n) : LineSectionObservation cfg :=
  lineSectionObserverStep cfg ε M start L p E A (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem lineSectionClockStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) :
    Measurable (lineSectionClockStep cfg ε M start L p E A hn) :=
  (lineSectionObserverStep_measurable cfg ε M start L p E A).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

def lineSectionRestartStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : LineSectionObservation cfg × BoardClockPath n) : LineSectionObservation cfg × BoardClockPath n :=
  (lineSectionClockStep cfg ε M start L p E A hn x,augResidualBoard cfg ε M hn (x.1.1.1,x.2))

theorem lineSectionRestartStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) :
    Measurable (lineSectionRestartStep cfg ε M start L p E A hn) :=
  (lineSectionClockStep_measurable cfg ε M start L p E A hn).prodMk
    ((augResidualBoard_measurable cfg ε M hn).comp (measurable_fst.fst.fst.prodMk measurable_snd))

theorem lineSectionRestartStep_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : LineSectionObservation cfg × BoardClockPath n) :
    ((lineSectionRestartStep cfg ε M start L p E A hn x).1.1,
      (lineSectionRestartStep cfg ε M start L p E A hn x).2) =
      observedRestartStep cfg ε M start hn (x.1.1,x.2) := by
  exact Prod.ext (lineSectionObserverStep_projection cfg ε M start L p E A _) rfl

theorem lineSectionRestartStep_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : LineSectionObservation cfg) :
    (boardClockMeasure n rate).map (fun ω => lineSectionRestartStep cfg ε M start L p E A hn (s,ω)) =
      ((boardClockMeasure n rate).map (fun ω => lineSectionClockStep cfg ε M start L p E A hn (s,ω))).prod
        (boardClockMeasure n rate) := by
  apply aug_observation_restart_map cfg ε M hn rate hr s.1.1
    (fun z => lineSectionObserverStep cfg ε M start L p E A (s,z))
    ((lineSectionObserverStep_measurable cfg ε M start L p E A).comp (measurable_const.prodMk measurable_id))
  · exact lineSectionObserverStep_done_eq cfg ε M start L p E A s
  · exact lineSectionObserverStep_late_eq cfg ε M start L p E A s

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineSectionRestartStep_projection
#print axioms NoThreeLine.BirthWitness.lineSectionRestartStep_map
