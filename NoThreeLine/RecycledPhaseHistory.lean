import NoThreeLine.RecycledHistoryLaw
import NoThreeLine.RecycledPhaseComposition

/-! Every finite history of completed scheduled phases has its iid-phase
joint law, and the remaining original board is independent of that history. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem recycledPhases_history_residual_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (e : ValidAugmentedState n B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (fun ω =>
      ((fun j : Fin (k+1) => (recycledPhases cs ε M deadline start hn e j.val ω).1),
        (recycledPhases cs ε M deadline start hn e k ω).2)) =
      ((Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))).map
        (fun ω => fun j : Fin (k+1) => GenericCreditIteration.noiseState
          (augPhaseIndexedStep cs ε M deadline start hn) (0,e) j.val ω)).prod
            (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI := phaseNoise_probability (cs 0).config hn hB
  exact RememberedRestart.history_residual_map (recycledPhaseStep cs ε M deadline start hn)
    (recycledPhaseStep_measurable cs ε M deadline start hn)
    (augPhaseIndexedStep cs ε M deadline start hn) (augPhaseIndexedStep_measurable cs ε M deadline start hn)
    _ _ (recycledPhaseStep_map cs ε M deadline start hn hB) (0,e) k

theorem recycledPhaseState_history_residual_map {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (e : ValidAugmentedState n B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (fun ω =>
      ((fun j : Fin (k+1) => recycledPhaseState cs ε M deadline start hn e j.val ω),
        (recycledPhases cs ε M deadline start hn e k ω).2)) =
      ((Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))).map
        (fun ω => fun j : Fin (k+1) => augPhaseNoiseState cs ε M deadline start hn j.val e ω)).prod
          (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI := phaseNoise_probability (cs 0).config hn hB
  let p : (Fin (k+1) → ℕ × ValidAugmentedState n B) → (Fin (k+1) → ValidAugmentedState n B) :=
    fun f j => (f j).2
  have hp : Measurable p := measurable_pi_lambda _ (fun j => (measurable_pi_apply j).snd)
  have hq : Measurable (fun r : (Fin (k+1) → ℕ × ValidAugmentedState n B) × BoardClockPath n =>
      (p r.1,r.2)) := (hp.comp measurable_fst).prodMk measurable_snd
  have hs : Measurable (fun ω =>
      ((fun j : Fin (k+1) => (recycledPhases cs ε M deadline start hn e j.val ω).1),
        (recycledPhases cs ε M deadline start hn e k ω).2)) :=
    (measurable_pi_lambda _ (fun j : Fin (k+1) => (recycledPhases_measurable cs ε M deadline start hn e j.val).fst)).prodMk
      (recycledPhases_measurable cs ε M deadline start hn e k).snd
  have ht : Measurable (fun ω => fun j : Fin (k+1) => GenericCreditIteration.noiseState
      (augPhaseIndexedStep cs ε M deadline start hn) (0,e) j.val ω) :=
    measurable_pi_lambda _ (fun j => GenericCreditIteration.noiseState_measurable _
      (augPhaseIndexedStep_measurable cs ε M deadline start hn) (0,e) j.val)
  letI : IsProbabilityMeasure
      ((Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))).map
        (fun ω => fun j : Fin (k+1) => GenericCreditIteration.noiseState
          (augPhaseIndexedStep cs ε M deadline start hn) (0,e) j.val ω)) :=
    Measure.isProbabilityMeasure_map ht.aemeasurable
  have h := congrArg (fun μ : Measure ((Fin (k+1) → ℕ × ValidAugmentedState n B) × BoardClockPath n) =>
    μ.map (fun r => (p r.1,r.2))) (recycledPhases_history_residual_map cs ε M deadline start hn hB e k)
  rw [Measure.map_map hq hs,map_pair_with_fresh_right _ _ p hp,Measure.map_map hp ht] at h
  exact h

end NoThreeLine

#print axioms NoThreeLine.recycledPhases_history_residual_map
#print axioms NoThreeLine.recycledPhaseState_history_residual_map
