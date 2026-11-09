import NoThreeLine.ScheduledSectionAllTime

/-! One-cell/one-line maximum tail, including local time zero and the
actual postgeometry/pre-resolution raw snapshot. The canonical mass bound
is supplied internally; the threshold is at least the actual cell length. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines EtaMixedGenerator

def lineSectionRawExceedance {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n) : Prop :=
  ¬observationDone cfg x.1 ∧ ¬phaseRootClosed p (observedTimedProjection cfg x.1) ∧
    A < actualLineSectionMass L p E (rawStepSaved cfg ε M start x).1

theorem lineSectionRawExceedance_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (lineSectionRawExceedance cfg ε M start L p E A) :=
  (((observationDone_measurable cfg).comp measurable_fst).not).and
    ((((phaseRootClosed_measurable p).comp ((observedTimedProjection_measurable cfg).comp measurable_fst)).not).and
      (measurable_const.lt ((actualLineSectionMass_measurable L p E).comp (rawStepSaved_measurable cfg ε M start).fst)))

theorem lineSectionRawExceedance_allTime {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n)
    (hx : lineSectionRawExceedance cfg ε M start L p E A x) :
    lineSectionAllTimeExceedance cfg ε M L p E A x := by
  apply (lineSectionAllTimeExceedance_iff cfg ε M L p E A x).mpr
  refine ⟨hx.2.1,augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1),
    (augAdvance_mem cfg ε M _ x.1.1.property.1.1 x.2.1.1).1,le_rfl,?_⟩
  have hh := hx.2.2
  simp only [rawStepSaved,if_neg hx.1] at hh
  exact hh.trans_le (augRawOutcome_lineSectionMass_le_pre cfg ε M L p E (augTimedInput cfg x.1.1)
    x.1.1.property.1.1 x.1.1.property.1.2 x.2)

def scheduledSectionRawAt {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p)
    (N k : ℕ) (ω : BoardClockPath n) : Prop :=
  let v := RecycledBoardProcess.iterate (goodMarkedRestart (cs N).config ε M (phaseEndpoint cs start N) L p E A hn)
    (goodPhaseSectionStart (cs N).config ε M p (phaseSectionRecycledState cs ε M deadline start L p E A hn s N ω)) k
    (phaseSectionRecycledPair cs ε M deadline start L p E A hn s N ω).2
  lineSectionRawExceedance (cs N).config ε M (phaseEndpoint cs start N) L p E A
    (v.1.val.1.1,WinnerMarkLaw.firstMarkedRace hn v.2)

theorem scheduledSectionRawAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p) (N k : ℕ) :
    Measurable (scheduledSectionRawAt cs ε M deadline start L p E A hn s N k) := by
  have hp := phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn s N
  have hv := (RecycledBoardProcess.iterate_joint_measurable _
    (goodMarkedRestart_measurable (cs N).config ε M (phaseEndpoint cs start N) L p E A hn) k).comp
      (((goodPhaseSectionStart_measurable (cs N).config ε M p).comp hp.fst.snd).prodMk hp.snd)
  exact (lineSectionRawExceedance_measurable (cs N).config ε M (phaseEndpoint cs start N) L p E A).comp
    (hv.fst.subtype_val.fst.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hv.snd))

def scheduledSectionMaximumBefore {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p) (J : ℕ) :
    Set (BoardClockPath n) := {ω | ∃ N < J, ∃ k,
      scheduledSectionAllTimeAt cs ε M deadline start L p E A hn s N k ω ∨
        scheduledSectionRawAt cs ε M deadline start L p E A hn s N k ω}

theorem scheduledSectionMaximumBefore_eq_allTime {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodPhaseLineSection n B p) (J : ℕ) :
    scheduledSectionMaximumBefore cs ε M deadline start L p E A hn s J =
      scheduledSectionAllTimeBefore cs ε M deadline start L p E A hn s J := by
  ext ω
  constructor
  · rintro ⟨N,hN,k,hk | hk⟩
    · exact ⟨N,hN,k,hk⟩
    · exact ⟨N,hN,k,lineSectionRawExceedance_allTime (cs N).config ε M (phaseEndpoint cs start N) L p E A _ hk⟩
  · rintro ⟨N,hN,k,hk⟩
    exact ⟨N,hN,k,Or.inl hk⟩

theorem scheduledSectionMaximumBefore_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodPhaseLineSection n B p) (J : ℕ) :
    MeasurableSet (scheduledSectionMaximumBefore cs ε M deadline start L p E A hn s J) := by
  rw [scheduledSectionMaximumBefore_eq_allTime]
  exact scheduledSectionAllTimeBefore_measurableSet cs ε M deadline start L p E A hn s J

theorem initial_phaseSectionPoint_maximum_tail {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hA : 0 < A)
    (hcard : (((L.val ∩ E).erase p).card:ℝ) ≤ A)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (m : ℕ) (hm : 0 < m) (J : ℕ) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      (scheduledSectionMaximumBefore cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J) ≤
      (((((L.val ∩ E).erase p).card:ℝ)^m +
        ∑ d ∈ Finset.Ico 1 m, B^(m-d)*(d:ℝ)^m*(((L.val ∩ E).erase p).card:ℝ)^d)/(1-ε)^(m+1).choose 2)/A^m := by
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  rw [scheduledSectionMaximumBefore_eq_allTime]
  apply (measureReal_mono (scheduledSectionAllTimeBefore_subset_continuous cs ε M deadline start L p E A hn
    _ (initialPhaseSection_massControlled B hB L p E A deadline start hcard) J)).trans
  exact initial_phaseSectionPoint_continuous_tail L p E A hA Γ hL hpL cs ε M deadline start hn hB hp
    hΓ hK hε0 hε m hm J

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.lineSectionRawExceedance_allTime
#print axioms NoThreeLine.BirthWitness.scheduledSectionMaximumBefore_measurableSet
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_maximum_tail
