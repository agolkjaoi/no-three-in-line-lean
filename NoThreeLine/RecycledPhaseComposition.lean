import NoThreeLine.RecycledScheduledPhase
import NoThreeLine.RecycledNoiseLaw
import NoThreeLine.AugmentedInitialization

/-! Finite scheduled phases driven by one original board, reusing its actual
residual board at each phase boundary. The finite state law, independent
residual law, and expected credit agree with the constructed iid-phase model. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

def recycledPhases {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (k : ℕ) (ω : BoardClockPath n) :
    (ℕ × ValidAugmentedState n B) × BoardClockPath n :=
  RecycledBoardProcess.iterate (recycledPhaseStep cs ε M deadline start hn) (0,e) k ω

theorem recycledPhases_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (e : ValidAugmentedState n B) (k : ℕ) :
    Measurable (recycledPhases cs ε M deadline start hn e k) :=
  RecycledBoardProcess.iterate_measurable _ (recycledPhaseStep_measurable cs ε M deadline start hn) (0,e) k

theorem recycledPhases_index {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (e : ValidAugmentedState n B)
    (k : ℕ) (ω : BoardClockPath n) : (recycledPhases cs ε M deadline start hn e k ω).1.1 = k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (recycledPhases cs ε M deadline start hn e k ω).1.1 + 1 = k+1
    rw [ih]

theorem recycledPhases_succ {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (e : ValidAugmentedState n B)
    (k : ℕ) (ω : BoardClockPath n) :
    let r := recycledPhases cs ε M deadline start hn e k ω
    let s := recycledScheduledPair cs ε M deadline start hn k (r.1.2,r.2)
    recycledPhases cs ε M deadline start hn e (k+1) ω = ((k+1,s.1),s.2) := by
  change recycledPhaseStep cs ε M deadline start hn (recycledPhases cs ε M deadline start hn e k ω) = _
  simp only [recycledPhaseStep,recycledPhases_index]

theorem recycledPhases_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (e : ValidAugmentedState n B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (recycledPhases cs ε M deadline start hn e k) =
      (FiniteTransitionLaw.stateLaw (augPhaseIndexedStep cs ε M deadline start hn)
        (FreshBoardWaits.freshBoardMeasure n (B/n)) (0,e) k).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI := phaseNoise_probability (cs 0).config hn hB
  exact RecycledBoardProcess.iterate_map_other_noise _ (recycledPhaseStep_measurable cs ε M deadline start hn)
    _ (augPhaseIndexedStep_measurable cs ε M deadline start hn) _ _
    (recycledPhaseStep_map cs ε M deadline start hn hB) (0,e) k

def recycledPhaseState {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (k : ℕ) (ω : BoardClockPath n) : ValidAugmentedState n B :=
  (recycledPhases cs ε M deadline start hn e k ω).1.2

theorem recycledPhaseState_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (e : ValidAugmentedState n B) (k : ℕ) :
    Measurable (recycledPhaseState cs ε M deadline start hn e k) :=
  (recycledPhases_measurable cs ε M deadline start hn e k).fst.snd

theorem recycledPhases_state_residual_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (e : ValidAugmentedState n B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (fun ω =>
      (recycledPhaseState cs ε M deadline start hn e k ω,(recycledPhases cs ε M deadline start hn e k ω).2)) =
      ((Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))).map
        (augPhaseNoiseState cs ε M deadline start hn k e)).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI := phaseNoise_probability (cs 0).config hn hB
  letI := FiniteTransitionLaw.stateLaw_probability _
    (augPhaseIndexedStep_measurable cs ε M deadline start hn)
    (FreshBoardWaits.freshBoardMeasure n (B/n)) (0,e) k
  have hp : Measurable (fun r : (ℕ × ValidAugmentedState n B) × BoardClockPath n => (r.1.2,r.2)) :=
    measurable_fst.snd.prodMk measurable_snd
  have h := congrArg (fun μ : Measure ((ℕ × ValidAugmentedState n B) × BoardClockPath n) =>
    μ.map (fun r => (r.1.2,r.2))) (recycledPhases_map cs ε M deadline start hn hB e k)
  rw [Measure.map_map hp (recycledPhases_measurable cs ε M deadline start hn e k),
    map_pair_with_fresh_right _ _ Prod.snd measurable_snd,
    ← FiniteTransitionLaw.noiseState_map _ (augPhaseIndexedStep_measurable cs ε M deadline start hn),
    Measure.map_map measurable_snd
      (GenericCreditIteration.noiseState_measurable _ (augPhaseIndexedStep_measurable cs ε M deadline start hn) (0,e) k)] at h
  exact h

theorem recycledPhaseState_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (e : ValidAugmentedState n B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (recycledPhaseState cs ε M deadline start hn e k) =
      (Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))).map
        (augPhaseNoiseState cs ε M deadline start hn k e) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hp : Measurable (fun ω =>
      (recycledPhaseState cs ε M deadline start hn e k ω,(recycledPhases cs ε M deadline start hn e k ω).2)) :=
    (recycledPhaseState_measurable cs ε M deadline start hn e k).prodMk
      (recycledPhases_measurable cs ε M deadline start hn e k).snd
  have h := congrArg (fun μ : Measure (ValidAugmentedState n B × BoardClockPath n) => μ.map Prod.fst)
    (recycledPhases_state_residual_map cs ε M deadline start hn hB e k)
  rw [Measure.map_map measurable_fst hp,Measure.map_fst_prod,measure_univ,one_smul] at h
  exact h

theorem recycledPhaseState_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (e : ValidAugmentedState n B) (k : ℕ) (p : Grid n) :
    (∫ ω, validAugStateCredit B p (recycledPhaseState cs ε M deadline start hn e k ω)
      ∂boardClockMeasure n (B/n)) = validAugStateCredit B p e := by
  have ht : Measurable (augPhaseNoiseState cs ε M deadline start hn k e) :=
    (augPhaseNoiseState_measurable cs ε M deadline start hn k).comp (measurable_const.prodMk measurable_id)
  have h := congrArg (fun μ : Measure (ValidAugmentedState n B) => ∫ x, validAugStateCredit B p x ∂μ)
    (recycledPhaseState_map cs ε M deadline start hn hB e k)
  rw [integral_map_of_stronglyMeasurable (recycledPhaseState_measurable cs ε M deadline start hn e k)
      (validAugStateCredit_measurable B p).stronglyMeasurable,
    integral_map_of_stronglyMeasurable ht (validAugStateCredit_measurable B p).stronglyMeasurable] at h
  exact h.trans (augPhaseNoiseState_expected_credit cs ε M deadline start hn hB k e p)

theorem recycledPhaseState_noThree {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (e : ValidAugmentedState n B)
    (k : ℕ) (ω : BoardClockPath n) :
    NoThree (recycledPhaseState cs ε M deadline start hn e k ω).val.physical.process.selected :=
  (recycledPhaseState cs ε M deadline start hn e k ω).property.1.1.1

theorem recycledPhaseState_initial_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (k : ℕ) (p : Grid n) :
    (∫ ω, validAugStateCredit B p
      (recycledPhaseState cs ε M deadline start hn (augInitialState B hB deadline start) k ω)
      ∂boardClockMeasure n (B/n)) = 1 := by
  rw [recycledPhaseState_expected_credit cs ε M deadline start hn (lt_of_lt_of_le zero_lt_one hB),
    augInitialState_credit]

end NoThreeLine

#print axioms NoThreeLine.recycledPhases_state_residual_map
#print axioms NoThreeLine.recycledPhaseState_expected_credit
#print axioms NoThreeLine.recycledPhaseState_noThree
#print axioms NoThreeLine.recycledPhaseState_initial_expected_credit
