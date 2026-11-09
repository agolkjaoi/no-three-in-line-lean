import NoThreeLine.RememberedSourceRestart
import NoThreeLine.ProtectedCompensatedTerminal

/-! Keep the actual elapsed source in the completed-phase payload, on
the original physical completion selector and residual board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

def protectedSourcePairObservable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (x : ProtectedTimedState cfg × ProtectedTimedState cfg) : ℝ :=
  protectedStatePairSource cfg L p (x.1.1,x.2.1)

theorem protectedSourcePairObservable_measurable {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (p : Grid n) : Measurable (protectedSourcePairObservable cfg L p) :=
  (protectedStatePairSource_measurable cfg L p).comp (measurable_fst.fst.prodMk measurable_snd.fst)

def protectedSourceFinitePair {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ)
    (ω : BoardClockPath n) : (ProtectedTimedState cfg × ℝ) × BoardClockPath n :=
  let r := protectedRecycledPair cfg ε M L hn s k ω
  ((r.1,cumulativeProtectedSource cfg ε M L p hn s k ω),r.2)

theorem protectedSourceFinitePair_eq_iterate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ)
    (ω : BoardClockPath n) :
    protectedSourceFinitePair cfg ε M L p hn s k ω=
      iterate (sourceRestart (protectedRestartStep cfg ε M L hn) (protectedSourcePairObservable cfg L p))
        (s,0) k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    let r := protectedRecycledPair cfg ε M L hn s k ω
    let q := protectedRecycledPair cfg ε M L hn s (k+1) ω
    have h : protectedSourcePairObservable cfg L p (r.1,q.1)=
        protectedClockRunningSource cfg ε M L p hn r :=
      protectedStatePairSource_actual cfg ε M L p r.1.1 (WinnerMarkLaw.firstMarkedRace hn r.2)
    change protectedSourceFinitePair cfg ε M L p hn s (k+1) ω=
      sourceRestart _ _ (iterate (sourceRestart (protectedRestartStep cfg ε M L hn)
        (protectedSourcePairObservable cfg L p)) (s,0) k ω)
    rw [←ih]
    change ((q.1,cumulativeProtectedSource cfg ε M L p hn s (k+1) ω),q.2)=
      ((q.1,cumulativeProtectedSource cfg ε M L p hn s k ω+
        protectedSourcePairObservable cfg L p (r.1,q.1)),q.2)
    rw [h,cumulativeProtectedSource_succ]

theorem protectedSourceFinitePair_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (k : ℕ) :
    Measurable (fun x : ProtectedTimedState cfg × BoardClockPath n=>
      protectedSourceFinitePair cfg ε M L p hn x.1 k x.2) := by
  simp_rw [protectedSourceFinitePair_eq_iterate]
  exact (iterate_joint_measurable _ (sourceRestart_measurable _ (protectedRestartStep_measurable cfg ε M L hn)
    _ (protectedSourcePairObservable_measurable cfg L p)) k).comp
      ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)

def protectedSourceTerminalPair {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (x : ProtectedTimedState cfg × BoardClockPath n) :
    (ProtectedTimedState cfg × ℝ) × BoardClockPath n :=
  protectedSourceFinitePair cfg ε M L p hn x.1 (augRecycledCompletionIndex cfg ε M hn x.1.1 x.2) x.2

theorem protectedSourceTerminalPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) :
    Measurable (protectedSourceTerminalPair cfg ε M L p hn) := by
  classical
  exact Measurable.find (protectedSourceFinitePair_joint_measurable cfg ε M L p hn)
    (fun k=>((augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).comp
      (measurable_fst.fst.prodMk measurable_snd)).setOf)
    (fun x=>augRecycledCompletionPredicate_exists cfg ε M hn x.1.1 x.2)

theorem protectedSourceTerminalPair_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω=>protectedSourceTerminalPair cfg ε M L p hn (s,ω))=
      ((boardClockMeasure n (cfg.B/n)).map (fun ω=>(protectedSourceTerminalPair cfg ε M L p hn (s,ω)).1)).prod
        (boardClockMeasure n (cfg.B/n)) := by
  let ν := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply residual_product_of_eventually_stable ν ν (protectedSourceFinitePair cfg ε M L p hn s)
    (fun ω=>protectedSourceTerminalPair cfg ε M L p hn (s,ω))
    (fun k=>(protectedSourceFinitePair_joint_measurable cfg ε M L p hn k).comp
      (measurable_const.prodMk measurable_id))
    ((protectedSourceTerminalPair_measurable cfg ε M L p hn).comp (measurable_const.prodMk measurable_id))
  · intro k
    let F := sourceRestart (protectedRestartStep cfg ε M L hn) (protectedSourcePairObservable cfg L p)
    have hF : Measurable F := sourceRestart_measurable _ (protectedRestartStep_measurable cfg ε M L hn)
      _ (protectedSourcePairObservable_measurable cfg L p)
    have hsect := sourceRestart_map (protectedRestartStep cfg ε M L hn)
      (protectedRestartStep_measurable cfg ε M L hn) (protectedSourcePairObservable cfg L p)
      (protectedSourcePairObservable_measurable cfg L p) ν
      (protectedRestartStep_map cfg ε M L hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    have he : protectedSourceFinitePair cfg ε M L p hn s k=iterate F (s,0) k :=
      funext (protectedSourceFinitePair_eq_iterate cfg ε M L p hn s k)
    rw [he]
    change ν.map (iterate F (s,0) k)=(ν.map (fun ω=>(iterate F (s,0) k ω).1)).prod ν
    rw [iterate_map F hF ν hsect,iterate_state_map F hF ν hsect]
  · filter_upwards [protectedRecycledTerminalPair_stable_ae cfg ε M L hn hB s,
      cumulativeProtectedSource_stable_ae cfg ε M L p hn hB s] with ω hp hg
    filter_upwards [hp,hg] with k hpk hgk
    exact congrArg₂ (fun (r : ProtectedTimedState cfg × BoardClockPath n) g=>((r.1,g),r.2)) hpk hgk

end NoThreeLine

#print axioms NoThreeLine.protectedSourceFinitePair_eq_iterate
#print axioms NoThreeLine.protectedSourceTerminalPair_measurable
#print axioms NoThreeLine.protectedSourceTerminalPair_map
