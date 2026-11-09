import NoThreeLine.LineSectionRestart
import NoThreeLine.RecycledHistoryInequality

/-! Actual original-board iteration of the contact observer. The subtype
contains only proved validity/record/empty-line invariants. Its D-empty
mixed family is a supermartingale and has a uniform finite-step mean bound. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine.BirthWitness
open EtaMixedGenerator AuxiliaryODE

abbrev GoodLineSectionObservation {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :=
  {s : LineSectionObservation cfg // LineSectionInvariant cfg p s ∧ EmptyLineCredit s.1.1.val.1.physical}

def goodLineSectionInitial {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : GoodObservation cfg) : GoodLineSectionObservation cfg p :=
  ⟨lineSectionInitial cfg p s.val,lineSectionInitial_invariant cfg p s.val s.property.1,s.property.2⟩

def goodLineSectionStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : GoodLineSectionObservation cfg p × CandidateData n) : GoodLineSectionObservation cfg p :=
  ⟨lineSectionObserverStep cfg ε M start L p E A (x.1.val,x.2),
    lineSectionObserverStep_invariant cfg ε M start L p E A x.1.val x.2 x.1.property.1,
    by rw [lineSectionObserverStep_projection]
       exact emptyLineCredit_augTimedStep cfg ε M x.1.val.1.1 x.2 x.1.property.2⟩

theorem goodLineSectionStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (goodLineSectionStep cfg ε M start L p E A) :=
  ((lineSectionObserverStep_measurable cfg ε M start L p E A).comp
    ((measurable_subtype_coe.comp measurable_fst).prodMk measurable_snd)).subtype_mk

def goodLineSectionRestart {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : GoodLineSectionObservation cfg p × BoardClockPath n) : GoodLineSectionObservation cfg p × BoardClockPath n :=
  (goodLineSectionStep cfg ε M start L p E A (x.1,WinnerMarkLaw.firstMarkedRace hn x.2),
    augResidualBoard cfg ε M hn (x.1.val.1.1,x.2))

theorem goodLineSectionRestart_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) :
    Measurable (goodLineSectionRestart cfg ε M start L p E A hn) :=
  ((goodLineSectionStep_measurable cfg ε M start L p E A).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))).prodMk
    ((augResidualBoard_measurable cfg ε M hn).comp
      (((measurable_subtype_coe.comp measurable_fst).fst.fst).prodMk measurable_snd))

theorem goodLineSectionRestart_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : GoodLineSectionObservation cfg p) :
    (boardClockMeasure n rate).map (fun ω => goodLineSectionRestart cfg ε M start L p E A hn (s,ω)) =
      ((boardClockMeasure n rate).map
        (fun ω => (goodLineSectionRestart cfg ε M start L p E A hn (s,ω)).1)).prod (boardClockMeasure n rate) := by
  apply aug_observation_restart_map cfg ε M hn rate hr s.val.1.1
    (fun z => goodLineSectionStep cfg ε M start L p E A (s,z))
    ((goodLineSectionStep_measurable cfg ε M start L p E A).comp (measurable_const.prodMk measurable_id))
  · intro hd z z'
    apply Subtype.ext
    exact lineSectionObserverStep_done_eq cfg ε M start L p E A s.val hd z z'
  · intro z z' hz hz'
    apply Subtype.ext
    exact lineSectionObserverStep_late_eq cfg ε M start L p E A s.val z z' hz hz'

def goodLineSectionPhi {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (C labels : Finset (Grid n)) (s : GoodLineSectionObservation cfg p) : ℝ :=
  correctedPhi cfg.directions C labels s.val.2.2

theorem goodLineSectionPhi_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (C labels : Finset (Grid n)) : Measurable (goodLineSectionPhi cfg p C labels) :=
  (correctedPhi_measurable cfg.directions C labels).comp measurable_subtype_coe.snd.snd

theorem goodLineSectionPhi_bounds {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (C labels : Finset (Grid n)) (s : GoodLineSectionObservation cfg p) :
    0 ≤ goodLineSectionPhi cfg p C labels s ∧ goodLineSectionPhi cfg p C labels s ≤ mixedCap C cfg.B := by
  have hv : (WitnessState.mk s.val.2.2 (fun _ => 0)).Valid cfg.B :=
    ⟨s.property.1.saved,fun _ => ⟨le_rfl,zero_le_one⟩,fun _ _ => rfl⟩
  exact ⟨correctedPhi_nonneg _ cfg.directions C labels cfg.B s.property.1.saved,
    by simpa only [mixed_empty,goodLineSectionPhi] using mixed_le_cap _ cfg.directions C ∅ labels cfg.B hv⟩

theorem goodLineSectionRecycled_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) (k : ℕ) (ω : BoardClockPath n) :
    ((RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).1.val.1,
      (RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).2) =
      observedRecycledPair cfg ε M start hn s.val.1 k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change ((lineSectionObserverStep cfg ε M start L p E A _).1,_) = _
    rw [lineSectionObserverStep_projection,observedRecycledPair_succ]
    change observedRestartStep cfg ε M start hn
      ((RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).1.val.1,
        (RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).2) = _
    rw [ih]

theorem goodLineSectionPhi_supermartingale {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (C labels : Finset (Grid n)) (hn : 0 < n) (hB : 0 < cfg.B)
    (hm : ∀ q, cfg.mask q ≤ 1) (hK : cfg.K < 2) (hCL : C ⊆ labels)
    (s : GoodLineSectionObservation cfg p) :
    Supermartingale
      (fun k ω => goodLineSectionPhi cfg p C labels
        (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω))
      (StateHistory.filtration
        (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s)
        (RecycledBoardProcess.state_measurable _ (goodLineSectionRestart_measurable cfg ε M start L p E A hn) s))
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact RecycledBoardProcess.credit_supermartingale _
    (goodLineSectionRestart_measurable cfg ε M start L p E A hn) _
    (goodLineSectionRestart_map cfg ε M start L p E A hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    _ (goodLineSectionPhi_measurable cfg p C labels) (mixedCap C cfg.B)
    (goodLineSectionPhi_bounds cfg p C labels)
    (fun x => lineSectionObserverStep_source_free cfg ε M start L p E A x.val C labels
      hn hB hm x.property.1 hCL x.property.2 hK) s

theorem goodLineSectionPhi_expected_le {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (C labels : Finset (Grid n)) (hn : 0 < n) (hB : 0 < cfg.B)
    (hm : ∀ q, cfg.mask q ≤ 1) (hK : cfg.K < 2) (hCL : C ⊆ labels)
    (s : GoodLineSectionObservation cfg p) (k : ℕ) :
    (∫ ω, goodLineSectionPhi cfg p C labels
      (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω)
      ∂boardClockMeasure n (cfg.B/n)) ≤ goodLineSectionPhi cfg p C labels s := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  induction k with
  | zero => simp [RecycledBoardProcess.state,RecycledBoardProcess.iterate]
  | succ k ih =>
    have h := RecycledBoardProcess.history_estimate _
      (goodLineSectionRestart_measurable cfg ε M start L p E A hn) _
      (goodLineSectionRestart_map cfg ε M start L p E A hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
      _ _ (goodLineSectionPhi_measurable cfg p C labels) (goodLineSectionPhi_measurable cfg p C labels)
      (mixedCap C cfg.B) (mixedCap C cfg.B)
      (goodLineSectionPhi_bounds cfg p C labels) (goodLineSectionPhi_bounds cfg p C labels)
      (fun x => lineSectionObserverStep_source_free cfg ε M start L p E A x.val C labels
        hn hB hm x.property.1 hCL x.property.2 hK) s k Set.univ MeasurableSet.univ
    simp only [Measure.restrict_univ] at h
    exact h.trans ih

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.goodLineSectionRecycled_projection
#print axioms NoThreeLine.BirthWitness.goodLineSectionPhi_supermartingale
#print axioms NoThreeLine.BirthWitness.goodLineSectionPhi_expected_le
