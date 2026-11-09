import NoThreeLine.RememberedRestart

/-! Joint law of every finite state history and the actual remaining noise.
Unlike a collection of marginal laws, this records all earlier states together. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.RememberedRestart

def restrictHistory {S : Type*} (k : ℕ) (a : Memory S) : Fin (k+1) → S := fun j => a.2 j.val

theorem restrictHistory_measurable {S : Type*} [MeasurableSpace S] (k : ℕ) :
    Measurable (@restrictHistory S k) :=
  measurable_pi_lambda _ (fun j => (measurable_pi_apply j.val).comp measurable_snd)

theorem restrictHistory_memoryOf {S : Type*} (s : S) (f : ℕ → S) (k : ℕ) :
    restrictHistory k (memoryOf s f k) = fun j => f j.val := by
  funext j
  exact if_pos (by omega : j.val ≤ k)

theorem history_residual_map {S W V : Type*}
    [MeasurableSpace S] [MeasurableSpace W] [MeasurableSpace V]
    (F : S × W → S × W) (hF : Measurable F) (ψ : S × V → S) (hψ : Measurable ψ)
    (ν : Measure W) (ρ : Measure V) [IsProbabilityMeasure ν] [IsProbabilityMeasure ρ]
    (hsection : ∀ s, ν.map (fun w => F (s,w)) =
      (ρ.map (fun v => ψ (s,v))).prod ν) (s : S) (k : ℕ) :
    ν.map (fun w => ((fun j : Fin (k+1) => (RecycledBoardProcess.iterate F s j.val w).1),
        (RecycledBoardProcess.iterate F s k w).2)) =
      ((Measure.infinitePi (fun _ : ℕ => ρ)).map
        (fun v => fun j : Fin (k+1) => GenericCreditIteration.noiseState ψ s j.val v)).prod ν := by
  letI := FiniteTransitionLaw.stateLaw_probability _ (liftState_measurable ψ hψ) ρ (initial s) k
  have hp : Measurable (fun r : Memory S × W => (restrictHistory k r.1,r.2)) :=
    ((restrictHistory_measurable k).comp measurable_fst).prodMk measurable_snd
  have h := congrArg (fun μ : Measure (Memory S × W) => μ.map (fun r => (restrictHistory k r.1,r.2)))
    (RecycledBoardProcess.iterate_map_other_noise (lift F) (lift_measurable F hF)
      (liftState ψ) (liftState_measurable ψ hψ) ν ρ (lift_map F hF ψ hψ ν ρ hsection) (initial s) k)
  rw [Measure.map_map hp (RecycledBoardProcess.iterate_measurable _ (lift_measurable F hF) (initial s) k),
    map_pair_with_fresh_right _ _ _ (restrictHistory_measurable k),
    ← FiniteTransitionLaw.noiseState_map _ (liftState_measurable ψ hψ),
    Measure.map_map (restrictHistory_measurable k)
      (GenericCreditIteration.noiseState_measurable _ (liftState_measurable ψ hψ) (initial s) k)] at h
  simpa only [Function.comp_def,iterate_lift,noiseState_lift,restrictHistory_memoryOf] using h

end NoThreeLine.RememberedRestart

namespace NoThreeLine

theorem augRecycledHistory_residual_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : AugTimedState cfg) (k : ℕ) :
    (boardClockMeasure n rate).map (fun ω =>
      ((fun j : Fin (k+1) => (augRecycledPair cfg ε M hn s j.val ω).1),
        (augRecycledPair cfg ε M hn s k ω).2)) =
      ((FreshBoardWaits.freshBoardMeasure n rate).map
        (fun ω => fun j : Fin (k+1) => augTimedNoiseState cfg ε M hn s j.val ω)).prod
          (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  exact RememberedRestart.history_residual_map (augRestartStep cfg ε M hn)
    (augRestartStep_measurable cfg ε M hn) (augTimedClockStep cfg ε M hn)
    (augTimedClockStep_measurable cfg ε M hn) _ _
    (augRestartStep_map cfg ε M hn rate hr) s k

end NoThreeLine

#print axioms NoThreeLine.RememberedRestart.history_residual_map
#print axioms NoThreeLine.augRecycledHistory_residual_map
