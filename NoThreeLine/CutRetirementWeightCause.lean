import NoThreeLine.ScheduledCutRetirementCauses
import NoThreeLine.ScheduledContinuousWeightHit

/-! Extract the actual weight-cap event from the exact historical cause
classification. The remaining auxiliary, designated-clock, and new-tag
causes remain explicit measurable events; their rarity is not assumed. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def rawNonWeightBoundaryHit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (x : AugTimedState cfg × CandidateData n) : Prop :=
  let a := augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2)
  ¬AugTimedDone cfg x.1 ∧ (a.physical.process.accounts p).status = .active ∧
    (a.auxBad cfg.directions ε M ∨ clockTriggered a.physical.process cfg.directions cfg.K a.physical.clocks ∨
      ∃ L ∈ newTags a.physical.process cfg.directions a.physical.lineCredits cfg.rho a.physical.handled,
        p ∈ L.val)

theorem rootStepBoundaryCause_weight_or_other {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (s : AugTimedState cfg) (z : CandidateData n) :
    rootStepBoundaryCause cfg ε M p s z ↔
      rawWeightCapHit cfg ε M p (s,z) ∨ rawNonWeightBoundaryHit cfg ε M p (s,z) := by
  simp only [rootStepBoundaryCause,rootResolveCause,rootLocalBoundaryCause,rawWeightCapHit,
    rawNonWeightBoundaryHit]
  tauto

theorem rawNonWeightBoundaryHit_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (rawNonWeightBoundaryHit cfg ε M p) := by
  have hr := (augRawOutcome_measurable cfg ε M).comp
    (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd)
  have he := (AugmentedState.measurable_physical n).comp hr
  have ha := (ProcessState.measurable_account n p).comp ((ExtendedState.measurable_process n).comp he)
  have ht : Measurable (fun x : AugTimedState cfg × CandidateData n =>
      ∃ L ∈ newTags (augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2)).physical.process cfg.directions
        (augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2)).physical.lineCredits cfg.rho
        (augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2)).physical.handled, p ∈ L.val) := by
    apply Measurable.exists
    intro L
    exact ((measurable_finset_mem L).comp ((ExtendedState.measurable_newTags cfg.directions cfg.rho).comp he)).and
      measurable_const
  exact ((augTimedDone_measurable cfg).comp measurable_fst).not.and
    (((CreditAccount.measurable_status.comp ha).eq_const .active).and
      (((AugmentedState.auxBad_measurable cfg.directions ε M).comp hr).or
        (((ExtendedState.measurable_clockTriggered cfg.directions cfg.K).comp he).or ht)))

def scheduledNonWeightBoundaryAt {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (N k : ℕ) (ω : BoardClockPath n) : Prop :=
  let x := augRecycledPair (cs N).config ε M hn
    (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn e N ω))
    k (recycledPhases cs ε M deadline start hn e N ω).2
  rawNonWeightBoundaryHit (cs N).config ε M p (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem scheduledNonWeightBoundaryAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (N k : ℕ) :
    Measurable (scheduledNonWeightBoundaryAt cs ε M deadline start hn e p N k) := by
  have hs := ((augPhaseStart_measurable (cs N).config ε M).comp
    (recycledPhaseState_measurable cs ε M deadline start hn e N)).prodMk
      (recycledPhases_measurable cs ε M deadline start hn e N).snd
  have hi := (augRecycledPair_joint_measurable (cs N).config ε M hn k).comp hs
  exact (rawNonWeightBoundaryHit_measurable (cs N).config ε M p).comp
    (hi.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hi.snd))

def scheduledNonWeightBoundaryBefore {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃ N, N < J ∧ ∃ k, scheduledNonWeightBoundaryAt cs ε M deadline start hn e p N k ω}

theorem scheduledNonWeightBoundaryBefore_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) :
    MeasurableSet (scheduledNonWeightBoundaryBefore cs ε M deadline start hn e p J) :=
  (Measurable.exists (fun N => measurable_const.and
    (Measurable.exists (fun k => scheduledNonWeightBoundaryAt_measurable cs ε M deadline start hn e p N k)))).setOf

theorem scheduledRootBoundaryCauseUpToCut_weight_or_other {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (N : ℕ) (t : ℝ) (ω : BoardClockPath n)
    (hc : scheduledRootBoundaryCauseUpToCut cs ε M deadline start hn p e N t ω) :
    ω ∈ scheduledActualWeightCapBefore cs ε M deadline start hn e p (N+1) ∪
      scheduledNonWeightBoundaryBefore cs ε M deadline start hn e p (N+1) := by
  have hlocal (i k : ℕ) (hi : i < N+1)
      (hb : recycledRootBoundaryCauseAt (cs i).config ε M hn p
        (augPhaseStart (cs i).config ε M (recycledPhaseState cs ε M deadline start hn e i ω)) k
        (recycledPhases cs ε M deadline start hn e i ω).2) :
      ω ∈ scheduledActualWeightCapBefore cs ε M deadline start hn e p (N+1) ∪
        scheduledNonWeightBoundaryBefore cs ε M deadline start hn e p (N+1) := by
    rcases (rootStepBoundaryCause_weight_or_other (cs i).config ε M p _ _).mp hb with hw | ho
    · exact Or.inl (Or.inl ⟨i,hi,k,hw⟩)
    · exact Or.inr ⟨i,hi,k,ho⟩
  rcases hc with ⟨i,hi,hprev⟩ | hcurrent
  · obtain ⟨k,_,hk⟩ := hprev
    exact hlocal i k (Nat.lt_succ_of_lt hi) hk
  · obtain ⟨k,hk,_⟩ := hcurrent
    exact hlocal N k (Nat.lt_succ_self N) hk

theorem initial_scheduledCut_early_positive_loss_weight_or_other {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) (N : ℕ) (t : ℝ) (ω : BoardClockPath n)
    (ht : t ∈ Icc (0 : ℝ) (cs N).horizon)
    (hdeadline : phaseEndpoint cs start N+t < deadline p)
    (hc : 0 < scheduledCutCreditLoss cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) p N (ω,t)) :
    ω ∈ scheduledActualWeightCapBefore cs ε M deadline start hn (augInitialState B hB deadline start) p (N+1) ∪
      scheduledNonWeightBoundaryBefore cs ε M deadline start hn (augInitialState B hB deadline start) p (N+1) :=
  scheduledRootBoundaryCauseUpToCut_weight_or_other cs ε M deadline start hn _ p N t ω
    (initial_scheduledCut_early_positive_loss_boundary cs ε M deadline start hn hB p N t ω ht hdeadline hc)

end NoThreeLine

#print axioms NoThreeLine.rootStepBoundaryCause_weight_or_other
#print axioms NoThreeLine.scheduledNonWeightBoundaryBefore_measurableSet
#print axioms NoThreeLine.initial_scheduledCut_early_positive_loss_weight_or_other
