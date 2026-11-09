import NoThreeLine.CutLossCauseProbability

/-! Four actual nonweight cause kinds, with the original executed-step
and raw-active-root gates. The finite cause split does not assert rarity. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

inductive BoundaryCauseKind where
  | eta | virtual | clock | tag
  deriving DecidableEq, Fintype

def boundaryCauseCondition {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (c : BoundaryCauseKind) (a : AugmentedState n) : Prop :=
  match c with
  | .eta => ∃ u v : Grid n, u ≠ v ∧ a.eta u v ≤ 1-ε
  | .virtual => ∃ L q, M ≤ virtualMass a.physical.process cfg.directions a.physical.coordinates L q
  | .clock => clockTriggered a.physical.process cfg.directions cfg.K a.physical.clocks
  | .tag => ∃ L ∈ newTags a.physical.process cfg.directions a.physical.lineCredits cfg.rho a.physical.handled,
      p ∈ L.val

theorem boundaryCauseCondition_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (c : BoundaryCauseKind) : Measurable (boundaryCauseCondition cfg ε M p c) := by
  cases c with
  | eta =>
    exact measurableSet_setOf.mp ((etaGuard_closed n ε).measurableSet.preimage (AugmentedState.measurable_eta n))
  | virtual =>
    apply Measurable.exists
    intro L
    apply Measurable.exists
    intro q
    exact measurable_const.le' ((ExtendedState.measurable_virtualMass cfg.directions L q).comp
      (AugmentedState.measurable_physical n))
  | clock =>
    exact (ExtendedState.measurable_clockTriggered cfg.directions cfg.K).comp (AugmentedState.measurable_physical n)
  | tag =>
    apply Measurable.exists
    intro L
    exact ((measurable_finset_mem L).comp ((ExtendedState.measurable_newTags cfg.directions cfg.rho).comp
      (AugmentedState.measurable_physical n))).and measurable_const

def rawBoundaryCauseHit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (c : BoundaryCauseKind)
    (x : AugTimedState cfg × CandidateData n) : Prop :=
  let a := augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2)
  ¬AugTimedDone cfg x.1 ∧ (a.physical.process.accounts p).status = .active ∧
    boundaryCauseCondition cfg ε M p c a

theorem rawBoundaryCauseHit_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (c : BoundaryCauseKind) : Measurable (rawBoundaryCauseHit cfg ε M p c) := by
  have hr := (augRawOutcome_measurable cfg ε M).comp
    (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd)
  have ha := (ProcessState.measurable_account n p).comp ((ExtendedState.measurable_process n).comp
    ((AugmentedState.measurable_physical n).comp hr))
  exact ((augTimedDone_measurable cfg).comp measurable_fst).not.and
    (((CreditAccount.measurable_status.comp ha).eq_const .active).and
      ((boundaryCauseCondition_measurable cfg ε M p c).comp hr))

theorem rawNonWeightBoundaryHit_split {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (x : AugTimedState cfg × CandidateData n) :
    rawNonWeightBoundaryHit cfg ε M p x ↔
      rawBoundaryCauseHit cfg ε M p .eta x ∨ rawBoundaryCauseHit cfg ε M p .virtual x ∨
      rawBoundaryCauseHit cfg ε M p .clock x ∨ rawBoundaryCauseHit cfg ε M p .tag x := by
  simp only [rawNonWeightBoundaryHit,rawBoundaryCauseHit,boundaryCauseCondition,
    AugmentedState.auxBad,etaGuard,virtualGuard,Set.mem_setOf_eq,Set.mem_iUnion]
  constructor
  · rintro ⟨hd,ha,(he | hv) | hc | ht⟩
    · exact Or.inl ⟨hd,ha,he⟩
    · exact Or.inr (Or.inl ⟨hd,ha,hv⟩)
    · exact Or.inr (Or.inr (Or.inl ⟨hd,ha,hc⟩))
    · exact Or.inr (Or.inr (Or.inr ⟨hd,ha,ht⟩))
  · rintro (⟨hd,ha,he⟩ | ⟨hd,ha,hv⟩ | ⟨hd,ha,hc⟩ | ⟨hd,ha,ht⟩)
    · exact ⟨hd,ha,Or.inl (Or.inl he)⟩
    · exact ⟨hd,ha,Or.inl (Or.inr hv)⟩
    · exact ⟨hd,ha,Or.inr (Or.inl hc)⟩
    · exact ⟨hd,ha,Or.inr (Or.inr ht)⟩

def scheduledBoundaryCauseAt {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (c : BoundaryCauseKind) (N k : ℕ)
    (ω : BoardClockPath n) : Prop :=
  let x := augRecycledPair (cs N).config ε M hn
    (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn e N ω))
    k (recycledPhases cs ε M deadline start hn e N ω).2
  rawBoundaryCauseHit (cs N).config ε M p c (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem scheduledBoundaryCauseAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (c : BoundaryCauseKind) (N k : ℕ) :
    Measurable (scheduledBoundaryCauseAt cs ε M deadline start hn e p c N k) := by
  have hs := ((augPhaseStart_measurable (cs N).config ε M).comp
    (recycledPhaseState_measurable cs ε M deadline start hn e N)).prodMk
      (recycledPhases_measurable cs ε M deadline start hn e N).snd
  have hi := (augRecycledPair_joint_measurable (cs N).config ε M hn k).comp hs
  exact (rawBoundaryCauseHit_measurable (cs N).config ε M p c).comp
    (hi.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hi.snd))

def scheduledBoundaryCauseBefore {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (c : BoundaryCauseKind) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃ N, N < J ∧ ∃ k, scheduledBoundaryCauseAt cs ε M deadline start hn e p c N k ω}

theorem scheduledBoundaryCauseBefore_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (c : BoundaryCauseKind) (J : ℕ) :
    MeasurableSet (scheduledBoundaryCauseBefore cs ε M deadline start hn e p c J) :=
  (Measurable.exists (fun N => measurable_const.and
    (Measurable.exists (fun k => scheduledBoundaryCauseAt_measurable cs ε M deadline start hn e p c N k)))).setOf

theorem scheduledNonWeightBoundaryBefore_split {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) :
    scheduledNonWeightBoundaryBefore cs ε M deadline start hn e p J =
      scheduledBoundaryCauseBefore cs ε M deadline start hn e p .eta J ∪
      (scheduledBoundaryCauseBefore cs ε M deadline start hn e p .virtual J ∪
      (scheduledBoundaryCauseBefore cs ε M deadline start hn e p .clock J ∪
        scheduledBoundaryCauseBefore cs ε M deadline start hn e p .tag J)) := by
  ext ω
  constructor
  · rintro ⟨N,hN,k,hk⟩
    rcases (rawNonWeightBoundaryHit_split (cs N).config ε M p _).mp hk with hη | hv | hc | ht
    · exact Or.inl ⟨N,hN,k,hη⟩
    · exact Or.inr (Or.inl ⟨N,hN,k,hv⟩)
    · exact Or.inr (Or.inr (Or.inl ⟨N,hN,k,hc⟩))
    · exact Or.inr (Or.inr (Or.inr ⟨N,hN,k,ht⟩))
  · rintro (⟨N,hN,k,hk⟩ | ⟨N,hN,k,hk⟩ | ⟨N,hN,k,hk⟩ | ⟨N,hN,k,hk⟩)
    · exact ⟨N,hN,k,(rawNonWeightBoundaryHit_split (cs N).config ε M p _).mpr (Or.inl hk)⟩
    · exact ⟨N,hN,k,(rawNonWeightBoundaryHit_split (cs N).config ε M p _).mpr (Or.inr (Or.inl hk))⟩
    · exact ⟨N,hN,k,(rawNonWeightBoundaryHit_split (cs N).config ε M p _).mpr (Or.inr (Or.inr (Or.inl hk)))⟩
    · exact ⟨N,hN,k,(rawNonWeightBoundaryHit_split (cs N).config ε M p _).mpr (Or.inr (Or.inr (Or.inr hk)))⟩

end NoThreeLine

#print axioms NoThreeLine.boundaryCauseCondition_measurable
#print axioms NoThreeLine.scheduledBoundaryCauseBefore_measurableSet
#print axioms NoThreeLine.scheduledNonWeightBoundaryBefore_split
