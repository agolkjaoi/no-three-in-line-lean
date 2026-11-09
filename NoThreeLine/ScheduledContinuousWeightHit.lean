import NoThreeLine.WeightContinuousContact
import NoThreeLine.ScheduledCandidateRegular

/-! The measurable event of an actual continuous or raw weight-cap hit is
contained almost surely in the already defined raw-hit event. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

def scheduledContinuousWeightCapAt {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (j k : ℕ) (ω : BoardClockPath n) : Prop :=
  let x := augRecycledPair (cs j).config ε M hn
    (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
    k (recycledPhases cs ε M deadline start hn e j ω).2
  weightSegmentContact (cs j).config ε M p (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem scheduledContinuousWeightCapAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (j k : ℕ) :
    Measurable (scheduledContinuousWeightCapAt cs ε M deadline start hn e p j k) := by
  have hs := ((augPhaseStart_measurable (cs j).config ε M).comp
    (recycledPhaseState_measurable cs ε M deadline start hn e j)).prodMk
      (recycledPhases_measurable cs ε M deadline start hn e j).snd
  have hi := (augRecycledPair_joint_measurable (cs j).config ε M hn k).comp hs
  exact (weightSegmentContact_measurable (cs j).config ε M p).comp
    (hi.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hi.snd))

theorem scheduledContinuousWeightCapAt_rawHit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (j k : ℕ) (ω : BoardClockPath n)
    (hr : scheduledCandidateRegularAt cs ε M deadline start hn e j k ω)
    (hh : scheduledContinuousWeightCapAt cs ε M deadline start hn e p j k ω) :
    scheduledRawWeightCapAt cs ε M deadline start hn e p j k ω :=
  weightSegmentContact_rawHit (cs j).config ε M p _ hh hr.1.le hr.2

def scheduledContinuousWeightCapBefore {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃ j, j < J ∧ ∃ k, scheduledContinuousWeightCapAt cs ε M deadline start hn e p j k ω}

theorem scheduledContinuousWeightCapBefore_measurableSet {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) :
    MeasurableSet (scheduledContinuousWeightCapBefore cs ε M deadline start hn e p J) :=
  (Measurable.exists (fun j => measurable_const.and
    (Measurable.exists (fun k => scheduledContinuousWeightCapAt_measurable cs ε M deadline start hn e p j k)))).setOf

def scheduledActualWeightCapBefore {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) : Set (BoardClockPath n) :=
  scheduledRawWeightCapBefore cs ε M deadline start hn e p J ∪
    scheduledContinuousWeightCapBefore cs ε M deadline start hn e p J

theorem scheduledActualWeightCapBefore_measurableSet {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) :
    MeasurableSet (scheduledActualWeightCapBefore cs ε M deadline start hn e p J) :=
  (scheduledRawWeightCapBefore_measurableSet cs ε M deadline start hn e p J).union
    (scheduledContinuousWeightCapBefore_measurableSet cs ε M deadline start hn e p J)

theorem scheduledActualWeightCapBefore_raw_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (e : ValidAugmentedState n B) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n), ∀ p J,
      ω ∈ scheduledActualWeightCapBefore cs ε M deadline start hn e p J →
      ω ∈ scheduledRawWeightCapBefore cs ε M deadline start hn e p J := by
  filter_upwards [scheduled_all_candidateRegular_ae cs ε M deadline start hn hB e] with ω hω
  intro p J hh
  rcases hh with hh | hh
  · exact hh
  · obtain ⟨j,hj,k,hk⟩ := hh
    exact ⟨j,hj,k,scheduledContinuousWeightCapAt_rawHit cs ε M deadline start hn e p j k ω (hω j k) hk⟩

theorem initial_scheduledActualWeightCapBefore_raw_point_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (q : Grid n) (H : ℕ) :
    ∀ᵐ ω ∂phasePointMeasure cs ε M deadline start hn hB q H, ∀ p J,
      ω ∈ scheduledActualWeightCapBefore cs ε M deadline start hn (augInitialState B hB deadline start) p J →
      ω ∈ scheduledRawWeightCapBefore cs ε M deadline start hn (augInitialState B hB deadline start) p J :=
  (phasePointMeasure_absolutelyContinuous cs ε M deadline start hn hB q H).ae_le
    (scheduledActualWeightCapBefore_raw_ae cs ε M deadline start hn
      (zero_lt_one.trans_le hB) (augInitialState B hB deadline start))

theorem initial_scheduledActualWeightCapBefore_measure_le_raw {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p q : Grid n) (J H : ℕ) :
    phasePointMeasure cs ε M deadline start hn hB q H
        (scheduledActualWeightCapBefore cs ε M deadline start hn (augInitialState B hB deadline start) p J) ≤
      phasePointMeasure cs ε M deadline start hn hB q H
        (scheduledRawWeightCapBefore cs ε M deadline start hn (augInitialState B hB deadline start) p J) := by
  apply measure_mono_ae
  filter_upwards [initial_scheduledActualWeightCapBefore_raw_point_ae cs ε M deadline start hn hB q H] with ω hω
  exact hω p J

end NoThreeLine

#print axioms NoThreeLine.scheduledActualWeightCapBefore_measurableSet
#print axioms NoThreeLine.scheduledActualWeightCapBefore_raw_ae
#print axioms NoThreeLine.initial_scheduledActualWeightCapBefore_measure_le_raw
