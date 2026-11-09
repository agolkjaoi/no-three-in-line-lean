import NoThreeLine.CandidateGuardNoTie
import NoThreeLine.RecycledPhaseComposition
import NoThreeLine.PhasePointHistory

/-! Positive candidate times and no physical/auxiliary/remaining guard
ties on every phase and step of the actual unobserved original-board path. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory

namespace NoThreeLine

def timedCandidateRegular {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (x : AugTimedState cfg × BoardClockPath n) : Prop :=
  0 < BoardFirstCandidate.firstTime hn x.2 ∧
    BoardFirstCandidate.firstTime hn x.2 ≠ augGuardTime cfg ε M (augTimedInput cfg x.1)

theorem timedCandidateRegular_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) :
    Measurable (timedCandidateRegular cfg ε M hn) :=
  (measurable_const.lt ((BoardFirstCandidate.firstTime_measurable hn).comp measurable_snd)).and
    ((((BoardFirstCandidate.firstTime_measurable hn).comp measurable_snd).eq
      ((augGuardTime_measurable cfg ε M).comp ((augTimedInput_measurable cfg).comp measurable_fst))).not)

theorem augRecycledCandidateRegular_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : AugTimedState cfg) (k : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n rate,
      timedCandidateRegular cfg ε M hn (augRecycledPair cfg ε M hn s k ω) := by
  let ν := boardClockMeasure n rate
  letI := boardClockMeasure_probability n rate hr
  let μ := FiniteTransitionLaw.stateLaw (augTimedClockStep cfg ε M hn) ν s k
  letI : IsProbabilityMeasure μ := FiniteTransitionLaw.stateLaw_probability _
    (augTimedClockStep_measurable cfg ε M hn) ν s k
  apply residual_sections_ae ν μ ν (augRecycledPair cfg ε M hn s k)
    (augRecycledPair_measurable cfg ε M hn s k) (augRecycledPair_map cfg ε M hn rate hr s k)
    (timedCandidateRegular cfg ε M hn) (timedCandidateRegular_measurable cfg ε M hn)
  intro a
  exact (BoardFirstCandidate.firstTime_ae_positive hn rate hr).and
    (actualFirstTime_ne_ae hn rate hr (augGuardTime cfg ε M (augTimedInput cfg a)))

def scheduledCandidateRegularAt {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (N k : ℕ) (ω : BoardClockPath n) : Prop :=
  timedCandidateRegular (cs N).config ε M hn
    (augRecycledPair (cs N).config ε M hn
      (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn e N ω))
      k (recycledPhases cs ε M deadline start hn e N ω).2)

theorem scheduledCandidateRegularAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (N k : ℕ) :
    Measurable (scheduledCandidateRegularAt cs ε M deadline start hn e N k) := by
  have hs := ((augPhaseStart_measurable (cs N).config ε M).comp
    (recycledPhaseState_measurable cs ε M deadline start hn e N)).prodMk
      (recycledPhases_measurable cs ε M deadline start hn e N).snd
  exact (timedCandidateRegular_measurable (cs N).config ε M hn).comp
    ((augRecycledPair_joint_measurable (cs N).config ε M hn k).comp hs)

theorem scheduledCandidateRegularAt_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (e : ValidAugmentedState n B) (N k : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n), scheduledCandidateRegularAt cs ε M deadline start hn e N k ω := by
  let ν := boardClockMeasure n (B/n)
  let f := fun ω => (recycledPhaseState cs ε M deadline start hn e N ω,
    (recycledPhases cs ε M deadline start hn e N ω).2)
  let μ := ν.map (recycledPhaseState cs ε M deadline start hn e N)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := Measure.isProbabilityMeasure_map
    (recycledPhaseState_measurable cs ε M deadline start hn e N).aemeasurable
  have hf : Measurable f := (recycledPhaseState_measurable cs ε M deadline start hn e N).prodMk
    (recycledPhases_measurable cs ε M deadline start hn e N).snd
  have hlaw : ν.map f = μ.prod ν := by
    change _ = ((boardClockMeasure n (B/n)).map (recycledPhaseState cs ε M deadline start hn e N)).prod _
    rw [recycledPhaseState_map cs ε M deadline start hn hB e N]
    exact recycledPhases_state_residual_map cs ε M deadline start hn hB e N
  let P : ValidAugmentedState n B × BoardClockPath n → Prop := fun x =>
    timedCandidateRegular (cs N).config ε M hn
      (augRecycledPair (cs N).config ε M hn (augPhaseStart (cs N).config ε M x.1) k x.2)
  have hP : Measurable P := (timedCandidateRegular_measurable (cs N).config ε M hn).comp
    ((augRecycledPair_joint_measurable (cs N).config ε M hn k).comp
      (((augPhaseStart_measurable (cs N).config ε M).comp measurable_fst).prodMk measurable_snd))
  exact residual_sections_ae ν μ ν f hf hlaw P hP
    (fun a => augRecycledCandidateRegular_ae (cs N).config ε M hn (B/n)
      (div_pos hB (by exact_mod_cast hn)) (augPhaseStart (cs N).config ε M a) k)

theorem scheduled_all_candidateRegular_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (e : ValidAugmentedState n B) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n), ∀ N k, scheduledCandidateRegularAt cs ε M deadline start hn e N k ω :=
  ae_all_iff.mpr (fun N => ae_all_iff.mpr (scheduledCandidateRegularAt_ae cs ε M deadline start hn hB e N))

end NoThreeLine

#print axioms NoThreeLine.augRecycledCandidateRegular_ae
#print axioms NoThreeLine.scheduled_all_candidateRegular_ae
