import NoThreeLine.LineSectionPhaseBoundary
import NoThreeLine.LineSectionTerminalResidual

/-! The permanent-contact marker is evolved on an actual invariant subtype.
Every predicate is initialized and preserved by the concrete update. The
expanded observer uses the original capped residual board. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

abbrev GoodMarkedLineSection {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :=
  {s : MarkedLineSectionObservation cfg // MarkedLineSectionInvariant cfg p s ∧
    EmptyLineCredit s.1.1.1.val.1.physical ∧ LineSectionReopenBound cfg p s ∧ UnmarkedLineSectionCredit cfg p s}

def goodMarkedCore {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : GoodMarkedLineSection cfg p) : GoodLineSectionObservation cfg p :=
  ⟨s.val.1,s.property.1.core,s.property.2.1⟩

theorem goodMarkedCore_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :
    Measurable (goodMarkedCore cfg p) := measurable_subtype_coe.fst.subtype_mk

def goodMarkedInitial {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : GoodObservation cfg) : GoodMarkedLineSection cfg p :=
  ⟨markedLineSectionInitial cfg p s.val,markedLineSectionInitial_invariant cfg p s.val s.property.1,
    s.property.2,markedLineSectionInitial_reopenBound cfg p s.val,markedLineSectionInitial_credit cfg p s.val⟩

theorem goodMarkedInitial_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :
    Measurable (goodMarkedInitial cfg p) :=
  ((markedLineSectionInitial_measurable cfg p).comp measurable_subtype_coe).subtype_mk

def goodMarkedStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : GoodMarkedLineSection cfg p × CandidateData n) : GoodMarkedLineSection cfg p :=
  ⟨markedLineSectionStep cfg ε M start L p E A (x.1.val,x.2),
    markedLineSectionStep_invariant cfg ε M start L p E A x.1.val x.2 x.1.property.1,
    by rw [markedLineSectionStep_projection,lineSectionObserverStep_projection]
       exact emptyLineCredit_augTimedStep cfg ε M x.1.val.1.1.1 x.2 x.1.property.2.1,
    markedLineSectionStep_reopenBound cfg ε M start L p E A x.1.val x.2 x.1.property.1 x.1.property.2.2.1,
    markedLineSectionStep_credit cfg ε M start L p E A x.1.val x.2 x.1.property.1 x.1.property.2.2.2⟩

theorem goodMarkedStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (goodMarkedStep cfg ε M start L p E A) :=
  ((markedLineSectionStep_measurable cfg ε M start L p E A).comp
    ((measurable_subtype_coe.comp measurable_fst).prodMk measurable_snd)).subtype_mk

theorem goodMarkedStep_core {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : GoodMarkedLineSection cfg p × CandidateData n) :
    goodMarkedCore cfg p (goodMarkedStep cfg ε M start L p E A x) =
      goodLineSectionStep cfg ε M start L p E A (goodMarkedCore cfg p x.1,x.2) := rfl

theorem goodMarkedStep_done {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : GoodMarkedLineSection cfg p) (hd : observationDone cfg s.val.1.1) (z : CandidateData n) :
    goodMarkedStep cfg ε M start L p E A (s,z) = s := by
  classical
  have hf : s.val.1.2.1 = true := by
    by_contra h
    exact s.property.1.core.open_root (Bool.eq_false_iff.mpr h) (Or.inl hd)
  apply Subtype.ext
  apply Prod.ext
  · exact Prod.ext (by
      change (markedLineSectionStep cfg ε M start L p E A (s.val,z)).1.1 = s.val.1.1
      rw [markedLineSectionStep_projection,lineSectionObserverStep_projection,
        observedStep_frozen cfg ε M start (s.val.1.1,z) hd])
      (lineSectionObserverStep_preserves_frozen cfg ε M start L p E A (s.val.1,z) hf)
  · change (if _ then true else false) = s.val.2
    simp only [hf,Bool.true_eq_false,false_and,or_false]
    cases h : s.val.2 <;> simp

theorem goodMarkedStep_late_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : GoodMarkedLineSection cfg p) (z z' : CandidateData n)
    (hz : augGuardTime cfg ε M (augTimedInput cfg s.val.1.1.1) < z.1.1)
    (hz' : augGuardTime cfg ε M (augTimedInput cfg s.val.1.1.1) < z'.1.1) :
    goodMarkedStep cfg ε M start L p E A (s,z) = goodMarkedStep cfg ε M start L p E A (s,z') := by
  apply Subtype.ext
  apply Prod.ext
  · exact lineSectionObserverStep_late_eq cfg ε M start L p E A s.val.1 z z' hz hz'
  · simp only [goodMarkedStep,markedLineSectionStep,lineSectionPermanentContact,
      lineSection_augAdvance_late cfg ε M _ s.val.1.1.1.property.1.1 z.1.1 hz,
      lineSection_augAdvance_late cfg ε M _ s.val.1.1.1.property.1.1 z'.1.1 hz']

def goodMarkedRestart {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : GoodMarkedLineSection cfg p × BoardClockPath n) : GoodMarkedLineSection cfg p × BoardClockPath n :=
  (goodMarkedStep cfg ε M start L p E A (x.1,WinnerMarkLaw.firstMarkedRace hn x.2),
    augResidualBoard cfg ε M hn (x.1.val.1.1.1,x.2))

theorem goodMarkedRestart_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) :
    Measurable (goodMarkedRestart cfg ε M start L p E A hn) :=
  ((goodMarkedStep_measurable cfg ε M start L p E A).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))).prodMk
    ((augResidualBoard_measurable cfg ε M hn).comp
      ((measurable_subtype_coe.comp measurable_fst).fst.fst.fst.prodMk measurable_snd))

theorem goodMarkedRestart_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : GoodMarkedLineSection cfg p) :
    (boardClockMeasure n rate).map (fun ω => goodMarkedRestart cfg ε M start L p E A hn (s,ω)) =
      ((boardClockMeasure n rate).map (fun ω => (goodMarkedRestart cfg ε M start L p E A hn (s,ω)).1)).prod
        (boardClockMeasure n rate) := by
  apply aug_observation_restart_map cfg ε M hn rate hr s.val.1.1.1
    (fun z => goodMarkedStep cfg ε M start L p E A (s,z))
    ((goodMarkedStep_measurable cfg ε M start L p E A).comp (measurable_const.prodMk measurable_id))
  · intro hd z z'
    rw [goodMarkedStep_done cfg ε M start L p E A s hd z,
      goodMarkedStep_done cfg ε M start L p E A s hd z']
  · exact goodMarkedStep_late_eq cfg ε M start L p E A s

theorem goodMarkedRestart_core {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : GoodMarkedLineSection cfg p × BoardClockPath n) :
    (goodMarkedCore cfg p (goodMarkedRestart cfg ε M start L p E A hn x).1,
      (goodMarkedRestart cfg ε M start L p E A hn x).2) =
      goodLineSectionRestart cfg ε M start L p E A hn (goodMarkedCore cfg p x.1,x.2) := rfl

theorem goodMarkedIterate_core {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (k : ℕ) (ω : BoardClockPath n) :
    (goodMarkedCore cfg p (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1,
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).2) =
      RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) (goodMarkedCore cfg p s) k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (goodMarkedCore cfg p (goodMarkedRestart cfg ε M start L p E A hn _).1,
      (goodMarkedRestart cfg ε M start L p E A hn _).2) = _
    rw [goodMarkedRestart_core,ih]
    rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.goodMarkedStep_done
#print axioms NoThreeLine.BirthWitness.goodMarkedRestart_map
#print axioms NoThreeLine.BirthWitness.goodMarkedIterate_core
