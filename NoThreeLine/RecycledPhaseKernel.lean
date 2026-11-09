import NoThreeLine.TerminalResidualLaw

/-! A constructed fixed phase on the original board, with its actual
remaining board returned. Its state law is exactly the iid phase-terminal
law and its residual board is independent with the original clock law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem RecycledBoardProcess.iterate_joint_measurable {S W : Type*}
    [MeasurableSpace S] [MeasurableSpace W] (F : S × W → S × W) (hF : Measurable F) (k : ℕ) :
    Measurable (fun a : S × W => iterate F a.1 k a.2) := by
  induction k with
  | zero => exact measurable_id
  | succ k ih => exact hF.comp ih

theorem augRecycledPair_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) (k : ℕ) :
    Measurable (fun a : AugTimedState cfg × BoardClockPath n => augRecycledPair cfg ε M hn a.1 k a.2) :=
  RecycledBoardProcess.iterate_joint_measurable _ (augRestartStep_measurable cfg ε M hn) k

theorem augRecycledCompletionPredicate_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0 < n) (k : ℕ) :
    Measurable (fun a : AugTimedState cfg × BoardClockPath n =>
      augRecycledCompletionPredicate cfg ε M hn a.1 k a.2) := by
  have hm (j : ℕ) : Measurable (fun a : AugTimedState cfg × BoardClockPath n =>
      AugTimedDone cfg (augRecycledPair cfg ε M hn a.1 j a.2).1) :=
    (augTimedDone_measurable cfg).comp (augRecycledPair_joint_measurable cfg ε M hn j).fst
  exact (hm k).or (Measurable.exists hm).not

theorem augRecycledTerminalPair_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) :
    Measurable (fun a : AugTimedState cfg × BoardClockPath n => augRecycledTerminalPair cfg ε M hn a.1 a.2) := by
  classical
  exact Measurable.find (augRecycledPair_joint_measurable cfg ε M hn)
    (fun k => (augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).setOf)
    (fun a : AugTimedState cfg × BoardClockPath n => augRecycledCompletionPredicate_exists cfg ε M hn a.1 a.2)

theorem augRecycledTerminalPair_eq_of_done {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (hs : AugTimedDone cfg s) (ω : BoardClockPath n) :
    augRecycledTerminalPair cfg ε M hn s ω = (s,ω) :=
  augRecycledPair_absorbing cfg ε M hn s ω 0 hs _ (Nat.zero_le _)

def augTimedStateProjection {n : ℕ} (cfg : FlowConfig n) (s : AugTimedState cfg) : ValidAugmentedState n cfg.B :=
  ⟨s.val.1,s.property.1⟩

theorem augTimedStateProjection_measurable {n : ℕ} (cfg : FlowConfig n) :
    Measurable (augTimedStateProjection cfg) := measurable_subtype_coe.fst.subtype_mk

def augPhaseRecycledPair {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (a : ValidAugmentedState n cfg.B × BoardClockPath n) : ValidAugmentedState n cfg.B × BoardClockPath n :=
  let r := augRecycledTerminalPair cfg ε M hn (augPhaseStart cfg ε M a.1) a.2
  (augTimedStateProjection cfg r.1,r.2)

theorem augPhaseRecycledPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) :
    Measurable (augPhaseRecycledPair cfg ε M hn) := by
  have ht := (augRecycledTerminalPair_joint_measurable cfg ε M hn).comp
    (((augPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd)
  exact ((augTimedStateProjection_measurable cfg).comp ht.fst).prodMk ht.snd

theorem augPhaseRecycledPair_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (e : ValidAugmentedState n cfg.B) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω => augPhaseRecycledPair cfg ε M hn (e,ω)) =
      ((FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map
        (fun ω => augPhaseTerminal cfg ε M hn (e,ω))).prod (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hp : Measurable (fun r : AugTimedState cfg × BoardClockPath n =>
      (augTimedStateProjection cfg r.1,r.2)) :=
    ((augTimedStateProjection_measurable cfg).comp measurable_fst).prodMk measurable_snd
  have h := congrArg (fun μ : Measure (AugTimedState cfg × BoardClockPath n) =>
    μ.map (fun r => (augTimedStateProjection cfg r.1,r.2)))
      (augRecycledTerminalPair_map cfg ε M hn hB (augPhaseStart cfg ε M e))
  rw [Measure.map_map hp (augRecycledTerminalPair_measurable cfg ε M hn (augPhaseStart cfg ε M e)),
    map_pair_with_fresh_right _ _ _ (augTimedStateProjection_measurable cfg),
    augRecycledTerminal_map cfg ε M hn hB,
    Measure.map_map (augTimedStateProjection_measurable cfg)
      (augTimedTerminal_measurable cfg ε M hn (augPhaseStart cfg ε M e))] at h
  exact h

theorem augPhaseRecycledPair_stopped {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n cfg.B) (he : e.val.physical.process.stopped = true) (ω : BoardClockPath n) :
    augPhaseRecycledPair cfg ε M hn (e,ω) = (e,ω) := by
  have hs : AugTimedDone cfg (augPhaseStart cfg ε M e) := Or.inr he
  simp only [augPhaseRecycledPair,augRecycledTerminalPair_eq_of_done cfg ε M hn _ hs]
  rfl

theorem augPhaseRecycledPair_zero_horizon {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hh : cfg.horizon = 0) (e : ValidAugmentedState n cfg.B) (ω : BoardClockPath n) :
    augPhaseRecycledPair cfg ε M hn (e,ω) = (e,ω) := by
  have hs : AugTimedDone cfg (augPhaseStart cfg ε M e) := Or.inl (by simp [augPhaseStart,hh])
  simp only [augPhaseRecycledPair,augRecycledTerminalPair_eq_of_done cfg ε M hn _ hs]
  rfl

end NoThreeLine

#print axioms NoThreeLine.augRecycledTerminalPair_joint_measurable
#print axioms NoThreeLine.augPhaseRecycledPair_map
#print axioms NoThreeLine.augPhaseRecycledPair_stopped
