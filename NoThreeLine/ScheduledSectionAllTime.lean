import NoThreeLine.SectionNoExceedanceControl

/-! Include local time zero in the actual executed-interval maximum. The
canonical initial bound and the proved no-upward-jump induction reduce this
event to the already measurable positive-time continuous event. -/
set_option autoImplicit false
set_option maxHeartbeats 1900000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator PrimitiveLines

def lineSectionAllTimeExceedance {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n) : Prop :=
  (¬phaseRootClosed p (observedTimedProjection cfg x.1) ∧ A < actualLineSectionMass L p E x.1.1.val.1) ∨
    lineSectionContinuousExceedance cfg ε M L p E A x

theorem lineSectionAllTimeExceedance_iff {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n) :
    lineSectionAllTimeExceedance cfg ε M L p E A x ↔
      ¬phaseRootClosed p (observedTimedProjection cfg x.1) ∧
        ∃ t : ℝ, 0 ≤ t ∧ t ≤ augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1) ∧
          A < actualLineSectionMass L p E (selectedAugmentedCurve cfg (augTimedInput cfg x.1.1).1 t) := by
  constructor
  · rintro (⟨hl,hm⟩ | ⟨hl,t,ht,hta,hm⟩)
    · refine ⟨hl,0,le_rfl,(augAdvance_mem cfg ε M _ x.1.1.property.1.1 x.2.1.1).1,?_⟩
      rwa [actualLineSectionMass_selected_initial]
    · exact ⟨hl,t,ht.le,hta,hm⟩
  · rintro ⟨hl,t,ht,hta,hm⟩
    rcases eq_or_lt_of_le ht with hz | hp
    · left
      subst t
      exact ⟨hl,(actualLineSectionMass_selected_initial cfg L p E x.1.1) ▸ hm⟩
    · exact Or.inr ⟨hl,t,hp,hta,hm⟩

theorem lineSectionAllTimeExceedance_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (lineSectionAllTimeExceedance cfg ε M L p E A) :=
  ((((phaseRootClosed_measurable p).comp ((observedTimedProjection_measurable cfg).comp measurable_fst)).not).and
    (measurable_const.lt ((actualLineSectionMass_measurable L p E).comp measurable_fst.fst.subtype_val.fst))).or
      (lineSectionContinuousExceedance_measurable cfg ε M L p E A)

def scheduledSectionAllTimeAt {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p)
    (N k : ℕ) (ω : BoardClockPath n) : Prop :=
  let v := RecycledBoardProcess.iterate (goodMarkedRestart (cs N).config ε M (phaseEndpoint cs start N) L p E A hn)
    (goodPhaseSectionStart (cs N).config ε M p (phaseSectionRecycledState cs ε M deadline start L p E A hn s N ω)) k
    (phaseSectionRecycledPair cs ε M deadline start L p E A hn s N ω).2
  lineSectionAllTimeExceedance (cs N).config ε M L p E A (v.1.val.1.1,WinnerMarkLaw.firstMarkedRace hn v.2)

theorem scheduledSectionAllTimeAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p) (N k : ℕ) :
    Measurable (scheduledSectionAllTimeAt cs ε M deadline start L p E A hn s N k) := by
  have hp := phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn s N
  have hv := (RecycledBoardProcess.iterate_joint_measurable _
    (goodMarkedRestart_measurable (cs N).config ε M (phaseEndpoint cs start N) L p E A hn) k).comp
      (((goodPhaseSectionStart_measurable (cs N).config ε M p).comp hp.fst.snd).prodMk hp.snd)
  exact (lineSectionAllTimeExceedance_measurable (cs N).config ε M L p E A).comp
    (hv.fst.subtype_val.fst.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hv.snd))

def scheduledSectionAllTimeBefore {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p) (J : ℕ) :
    Set (BoardClockPath n) := {ω | ∃ N < J, ∃ k, scheduledSectionAllTimeAt cs ε M deadline start L p E A hn s N k ω}

theorem scheduledSectionAllTimeBefore_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodPhaseLineSection n B p) (J : ℕ) :
    MeasurableSet (scheduledSectionAllTimeBefore cs ε M deadline start L p E A hn s J) := by
  apply Measurable.setOf
  exact Measurable.exists (fun N => measurable_const.and
    (Measurable.exists (fun k => scheduledSectionAllTimeAt_measurable cs ε M deadline start L p E A hn s N k)))

theorem scheduledSectionAllTimeBefore_subset_continuous {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodPhaseLineSection n B p) (hs : PhaseSectionMassControlled L p E A s.val.1) (J : ℕ) :
    scheduledSectionAllTimeBefore cs ε M deadline start L p E A hn s J ⊆
      scheduledSectionContinuousBefore cs ε M deadline start L p E A hn s J := by
  classical
  rintro ω ⟨N,hN,k,hk⟩
  by_contra hno
  have hprev : ω ∉ scheduledSectionContinuousBefore cs ε M deadline start L p E A hn s N := by
    rintro ⟨j,hj,i,hi⟩
    exact hno ⟨j,hj.trans hN,i,hi⟩
  have hphase := phaseSectionRecycledState_massControlled cs ε M deadline start L p E A hn s ω hs N hprev
  let v := phaseSectionRecycledPair cs ε M deadline start L p E A hn s N ω
  let a := goodPhaseSectionStart (cs N).config ε M p (v.1.2)
  have hstart : TimedSectionMassControlled (cs N).config L p E A a.val.1.1 := by
    change TimedSectionMassControlled (cs N).config L p E A
      (phaseLineSectionStart (cs N).config ε M p (v.1.2).val).1.1
    rw [phaseLineSectionStart_projection]
    exact hphase
  have hstep := goodMarkedIterate_massControlled (cs N).config ε M (phaseEndpoint cs start N) L p E A hn a v.2 hstart
    (fun i hi => hno ⟨N,hN,i,hi⟩) k
  rcases hk with hz | hp
  · exact (not_lt_of_ge (hstep.resolve_left hz.1)) hz.2
  · exact hno ⟨N,hN,k,hp⟩

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.lineSectionAllTimeExceedance_iff
#print axioms NoThreeLine.BirthWitness.scheduledSectionAllTimeBefore_measurableSet
#print axioms NoThreeLine.BirthWitness.scheduledSectionAllTimeBefore_subset_continuous
