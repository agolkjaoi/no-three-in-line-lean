import NoThreeLine.ScheduledRawWeightCap

/-! The measurable event of an active raw weight reaching its cap in an
actually executed update of the original board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def rawWeightCapHit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (x : AugTimedState cfg×CandidateData n) : Prop :=
  ¬AugTimedDone cfg x.1 ∧
    ((augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2)).physical.process.accounts p).status=.active ∧
    cfg.B≤((augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2)).physical.process.accounts p).weight

theorem rawWeightCapHit_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (rawWeightCapHit cfg ε M p) := by
  have hr := (augRawOutcome_measurable cfg ε M).comp
    (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd)
  have ha := (ProcessState.measurable_account n p).comp
    ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp hr))
  exact ((augTimedDone_measurable cfg).comp measurable_fst).not.and
    (((CreditAccount.measurable_status.comp ha).eq_const .active).and
      (measurable_const.le' (CreditAccount.measurable_weight.comp ha)))

def scheduledRawWeightCapAt {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (p : Grid n) (j k : ℕ) (ω : BoardClockPath n) : Prop :=
  let x := augRecycledPair (cs j).config ε M hn
    (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
    k (recycledPhases cs ε M deadline start hn e j ω).2
  rawWeightCapHit (cs j).config ε M p (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem scheduledRawWeightCapAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (p : Grid n) (j k : ℕ) :
    Measurable (scheduledRawWeightCapAt cs ε M deadline start hn e p j k) := by
  have hs := ((augPhaseStart_measurable (cs j).config ε M).comp
    (recycledPhaseState_measurable cs ε M deadline start hn e j)).prodMk
      (recycledPhases_measurable cs ε M deadline start hn e j).snd
  have hi := (augRecycledPair_joint_measurable (cs j).config ε M hn k).comp hs
  exact (rawWeightCapHit_measurable (cs j).config ε M p).comp
    (hi.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hi.snd))

def scheduledRawWeightCapBefore {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃j,j<J ∧ ∃k,scheduledRawWeightCapAt cs ε M deadline start hn e p j k ω}

theorem scheduledRawWeightCapBefore_measurableSet {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) :
    MeasurableSet (scheduledRawWeightCapBefore cs ε M deadline start hn e p J) :=
  (Measurable.exists (fun j=>measurable_const.and
    (Measurable.exists (fun k=>scheduledRawWeightCapAt_measurable cs ε M deadline start hn e p j k)))).setOf

end NoThreeLine

#print axioms NoThreeLine.rawWeightCapHit_measurable
#print axioms NoThreeLine.scheduledRawWeightCapBefore_measurableSet
