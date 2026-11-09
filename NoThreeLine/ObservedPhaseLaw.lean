import NoThreeLine.ObservedRecycledPhases
import NoThreeLine.RecycledPhaseHistory

/-! Every finite history of completed observed phases has the existing iid
observed-phase law and is independent of the actual remaining original board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

theorem observedIndexedFiniteState {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (s : PhaseObservation n B) (v : Fin k → PhaseNoise n) :
    GenericCreditIteration.finiteState (observedPhaseIndexedStep cs ε M deadline start hn) k (0,s) v =
      (k,observedFinitePhase cs ε M deadline start hn k s v) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    rw [GenericCreditIteration.finiteState,ih]
    rfl

def observedPhaseNoiseState {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (s : PhaseObservation n B) (ω : ℕ → PhaseNoise n) : PhaseObservation n B :=
  observedFinitePhase cs ε M deadline start hn k s (GenericCreditIteration.noisePrefix k ω)

theorem observedIndexedNoiseState {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (s : PhaseObservation n B) (ω : ℕ → PhaseNoise n) :
    GenericCreditIteration.noiseState (observedPhaseIndexedStep cs ε M deadline start hn) (0,s) k ω =
      (k,observedPhaseNoiseState cs ε M deadline start hn k s ω) :=
  observedIndexedFiniteState cs ε M deadline start hn k s _

theorem observedPhaseNoiseState_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ) (s : PhaseObservation n B) :
    Measurable (observedPhaseNoiseState cs ε M deadline start hn k s) :=
  (observedFinitePhase_measurable cs ε M deadline start hn k).comp
    (measurable_const.prodMk (GenericCreditIteration.noisePrefix_measurable k))

theorem observedRecycledPhases_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (s : PhaseObservation n B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (observedRecycledPhases cs ε M deadline start hn s k) =
      (FiniteTransitionLaw.stateLaw (observedPhaseIndexedStep cs ε M deadline start hn)
        (FreshBoardWaits.freshBoardMeasure n (B/n)) (0,s) k).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI := phaseNoise_probability (cs 0).config hn hB
  exact RecycledBoardProcess.iterate_map_other_noise _ (observedPhaseRestartStep_measurable cs ε M deadline start hn)
    _ (observedPhaseIndexedStep_measurable cs ε M deadline start hn) _ _
    (observedPhaseRestartStep_map cs ε M deadline start hn hB) (0,s) k

theorem observedRecycledPhases_state_residual_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (s : PhaseObservation n B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (fun ω =>
      (observedRecycledPhaseState cs ε M deadline start hn s k ω,
        (observedRecycledPhases cs ε M deadline start hn s k ω).2)) =
      ((Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))).map
        (observedPhaseNoiseState cs ε M deadline start hn k s)).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI := phaseNoise_probability (cs 0).config hn hB
  letI := FiniteTransitionLaw.stateLaw_probability _
    (observedPhaseIndexedStep_measurable cs ε M deadline start hn)
    (FreshBoardWaits.freshBoardMeasure n (B/n)) (0,s) k
  have hp : Measurable (fun r : (ℕ × PhaseObservation n B) × BoardClockPath n => (r.1.2,r.2)) :=
    measurable_fst.snd.prodMk measurable_snd
  have h := congrArg (fun μ : Measure ((ℕ × PhaseObservation n B) × BoardClockPath n) =>
    μ.map (fun r => (r.1.2,r.2))) (observedRecycledPhases_map cs ε M deadline start hn hB s k)
  rw [Measure.map_map hp (observedRecycledPhases_measurable cs ε M deadline start hn s k),
    map_pair_with_fresh_right _ _ Prod.snd measurable_snd,
    ← FiniteTransitionLaw.noiseState_map _ (observedPhaseIndexedStep_measurable cs ε M deadline start hn),
    Measure.map_map measurable_snd
      (GenericCreditIteration.noiseState_measurable _ (observedPhaseIndexedStep_measurable cs ε M deadline start hn) (0,s) k)] at h
  simpa only [Function.comp_def,observedIndexedNoiseState,observedRecycledPhaseState] using h

theorem observedRecycledPhaseState_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (s : PhaseObservation n B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (observedRecycledPhaseState cs ε M deadline start hn s k) =
      (Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))).map
        (observedPhaseNoiseState cs ε M deadline start hn k s) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hp : Measurable (fun ω =>
      (observedRecycledPhaseState cs ε M deadline start hn s k ω,
        (observedRecycledPhases cs ε M deadline start hn s k ω).2)) :=
    (observedRecycledPhaseState_measurable cs ε M deadline start hn s k).prodMk
      (observedRecycledPhases_measurable cs ε M deadline start hn s k).snd
  have h := congrArg (fun μ : Measure (PhaseObservation n B × BoardClockPath n) => μ.map Prod.fst)
    (observedRecycledPhases_state_residual_map cs ε M deadline start hn hB s k)
  rw [Measure.map_map measurable_fst hp,Measure.map_fst_prod,measure_univ,one_smul] at h
  exact h

theorem observedRecycledPhases_history_residual_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (s : PhaseObservation n B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (fun ω =>
      ((fun j : Fin (k+1) => (observedRecycledPhases cs ε M deadline start hn s j.val ω).1),
        (observedRecycledPhases cs ε M deadline start hn s k ω).2)) =
      ((Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))).map
        (fun ω => fun j : Fin (k+1) => GenericCreditIteration.noiseState
          (observedPhaseIndexedStep cs ε M deadline start hn) (0,s) j.val ω)).prod
            (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI := phaseNoise_probability (cs 0).config hn hB
  exact RememberedRestart.history_residual_map (observedPhaseRestartStep cs ε M deadline start hn)
    (observedPhaseRestartStep_measurable cs ε M deadline start hn)
    (observedPhaseIndexedStep cs ε M deadline start hn) (observedPhaseIndexedStep_measurable cs ε M deadline start hn)
    _ _ (observedPhaseRestartStep_map cs ε M deadline start hn hB) (0,s) k

theorem observedRecycledPhaseState_history_residual_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (s : PhaseObservation n B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (fun ω =>
      ((fun j : Fin (k+1) => observedRecycledPhaseState cs ε M deadline start hn s j.val ω),
        (observedRecycledPhases cs ε M deadline start hn s k ω).2)) =
      ((Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))).map
        (fun ω => fun j : Fin (k+1) => observedPhaseNoiseState cs ε M deadline start hn j.val s ω)).prod
          (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI := phaseNoise_probability (cs 0).config hn hB
  let p : (Fin (k+1) → ℕ × PhaseObservation n B) → (Fin (k+1) → PhaseObservation n B) := fun f j => (f j).2
  have hp : Measurable p := measurable_pi_lambda _ (fun j => (measurable_pi_apply j).snd)
  have hq : Measurable (fun r : (Fin (k+1) → ℕ × PhaseObservation n B) × BoardClockPath n =>
      (p r.1,r.2)) := (hp.comp measurable_fst).prodMk measurable_snd
  have hs : Measurable (fun ω =>
      ((fun j : Fin (k+1) => (observedRecycledPhases cs ε M deadline start hn s j.val ω).1),
        (observedRecycledPhases cs ε M deadline start hn s k ω).2)) :=
    (measurable_pi_lambda _ (fun j : Fin (k+1) =>
      (observedRecycledPhases_measurable cs ε M deadline start hn s j.val).fst)).prodMk
        (observedRecycledPhases_measurable cs ε M deadline start hn s k).snd
  have ht : Measurable (fun ω => fun j : Fin (k+1) => GenericCreditIteration.noiseState
      (observedPhaseIndexedStep cs ε M deadline start hn) (0,s) j.val ω) :=
    measurable_pi_lambda _ (fun j => GenericCreditIteration.noiseState_measurable _
      (observedPhaseIndexedStep_measurable cs ε M deadline start hn) (0,s) j.val)
  letI : IsProbabilityMeasure
      ((Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))).map
        (fun ω => fun j : Fin (k+1) => GenericCreditIteration.noiseState
          (observedPhaseIndexedStep cs ε M deadline start hn) (0,s) j.val ω)) :=
    Measure.isProbabilityMeasure_map ht.aemeasurable
  have h := congrArg (fun μ : Measure ((Fin (k+1) → ℕ × PhaseObservation n B) × BoardClockPath n) =>
    μ.map (fun r => (p r.1,r.2))) (observedRecycledPhases_history_residual_map cs ε M deadline start hn hB s k)
  rw [Measure.map_map hq hs,map_pair_with_fresh_right _ _ p hp,Measure.map_map hp ht] at h
  simpa only [Function.comp_def,p,observedIndexedNoiseState,observedRecycledPhaseState] using h

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedIndexedFiniteState
#print axioms NoThreeLine.BirthWitness.observedRecycledPhaseState_map
#print axioms NoThreeLine.BirthWitness.observedRecycledPhaseState_history_residual_map
