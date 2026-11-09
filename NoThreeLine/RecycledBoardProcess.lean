import NoThreeLine.FiniteTransitionLaw

/-! Repeat the actual state-dependent capped restart on one original board
of infinite clock arrays. Every finite state has the iid-driven state law,
and the actual unconsumed board remains independent with its original law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Function

namespace NoThreeLine
namespace RecycledBoardProcess
open FiniteTransitionLaw

def iterate {S W : Type*} (F : S × W → S × W) (s : S) : ℕ → W → S × W
  | 0, ω => (s,ω)
  | k+1, ω => F (iterate F s k ω)

theorem iterate_measurable {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (s : S) (k : ℕ) :
    Measurable (iterate F s k) := by
  induction k with
  | zero => exact measurable_const.prodMk measurable_id
  | succ k ih => exact hF.comp ih

theorem iterate_map {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s, ν.map (fun ω => F (s,ω)) =
      (ν.map (fun ω => (F (s,ω)).1)).prod ν) (s : S) (k : ℕ) :
    ν.map (iterate F s k) = (stateLaw (fun x => (F x).1) ν s k).prod ν := by
  induction k with
  | zero =>
    rw [stateLaw,Measure.dirac_prod]
    rfl
  | succ k ih =>
    letI := stateLaw_probability (fun x => (F x).1) hF.fst ν s k
    change ν.map (F ∘ iterate F s k) = _
    rw [← Measure.map_map hF (iterate_measurable F hF s k),ih,
      product_restart_of_sections _ ν F hF hsection]
    rfl

theorem iterate_state_map {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s, ν.map (fun ω => F (s,ω)) =
      (ν.map (fun ω => (F (s,ω)).1)).prod ν) (s : S) (k : ℕ) :
    ν.map (fun ω => (iterate F s k ω).1) = stateLaw (fun x => (F x).1) ν s k := by
  have h := congrArg (fun μ : Measure (S × W) => μ.map Prod.fst) (iterate_map F hF ν hsection s k)
  rw [Measure.map_map measurable_fst (iterate_measurable F hF s k),
    Measure.map_fst_prod,measure_univ,one_smul] at h
  exact h

end RecycledBoardProcess

def augRecycledPair {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : AugTimedState cfg × BoardClockPath n :=
  RecycledBoardProcess.iterate (augRestartStep cfg ε M hn) s k ω

theorem augRecycledPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (k : ℕ) : Measurable (augRecycledPair cfg ε M hn s k) :=
  RecycledBoardProcess.iterate_measurable _ (augRestartStep_measurable cfg ε M hn) s k

theorem augRecycledPair_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : AugTimedState cfg) (k : ℕ) :
    (boardClockMeasure n rate).map (augRecycledPair cfg ε M hn s k) =
      (FiniteTransitionLaw.stateLaw (augTimedClockStep cfg ε M hn) (boardClockMeasure n rate) s k).prod
        (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  exact RecycledBoardProcess.iterate_map _ (augRestartStep_measurable cfg ε M hn)
    (boardClockMeasure n rate) (augRestartStep_map cfg ε M hn rate hr) s k

theorem augRecycledState_map_eq_noiseState {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : AugTimedState cfg) (k : ℕ) :
    (boardClockMeasure n rate).map (fun ω => (augRecycledPair cfg ε M hn s k ω).1) =
      (Measure.infinitePi (fun _ : ℕ => boardClockMeasure n rate)).map (augTimedNoiseState cfg ε M hn s k) := by
  letI := boardClockMeasure_probability n rate hr
  unfold augTimedNoiseState
  rw [FiniteTransitionLaw.noiseState_map (augTimedClockStep cfg ε M hn) (augTimedClockStep_measurable cfg ε M hn)]
  exact RecycledBoardProcess.iterate_state_map _ (augRestartStep_measurable cfg ε M hn)
    (boardClockMeasure n rate) (augRestartStep_map cfg ε M hn rate hr) s k

theorem augRecycledState_expected_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : AugTimedState cfg) (p : Grid n) (k : ℕ) :
    (∫ ω, augTimedCredit cfg p (augRecycledPair cfg ε M hn s k ω).1
      ∂boardClockMeasure n (cfg.B/n)) = augTimedCredit cfg p s := by
  have h := congrArg (fun μ : Measure (AugTimedState cfg) => ∫ x, augTimedCredit cfg p x ∂μ)
    (augRecycledState_map_eq_noiseState cfg ε M hn (cfg.B/n)
      (div_pos hB (by exact_mod_cast hn)) s k)
  rw [integral_map_of_stronglyMeasurable (augRecycledPair_measurable cfg ε M hn s k).fst
      (augTimedCredit_measurable cfg p).stronglyMeasurable,
    integral_map_of_stronglyMeasurable (augTimedNoiseState_measurable cfg ε M hn s k)
      (augTimedCredit_measurable cfg p).stronglyMeasurable] at h
  exact h.trans (augTimedNoiseState_expected_credit cfg ε M hn hB hm s p k)

end NoThreeLine

#print axioms NoThreeLine.augRecycledPair_map
#print axioms NoThreeLine.augRecycledState_map_eq_noiseState
#print axioms NoThreeLine.augRecycledState_expected_credit
