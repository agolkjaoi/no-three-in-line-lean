import NoThreeLine.ProtectedCrossingObserver
import NoThreeLine.ProtectedLedgerDensityHistory
import NoThreeLine.TerminalObservedEvent

/-! Retain the actual one-phase crossing flag at its physical completion.
The marked terminal ledger and the original unconsumed board factor under
the base law. The marker does not alter the executed phase. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem augFiltration_le_protected {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    augRecycledStateFiltration cfg ε M hn s.1 k≤protectedStateFiltration cfg ε M L hn s k := by
  let H := lineCutHistory cfg ε M hn s.1 k
  let G := StateHistory.history (fun j ω=>(protectedRecycledPair cfg ε M L hn s j ω).1) k
  let ψ := fun a : Fin (k+1)→ProtectedTimedState cfg=>fun i : Fin (k+1)=>(a i).1
  have hψ : Measurable ψ := measurable_pi_lambda _ (fun i=>measurable_fst.comp (measurable_pi_apply i))
  have he : H=ψ ∘ G := by
    funext ω i
    exact (congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s i.val ω)).symm
  change MeasurableSpace.comap H inferInstance≤MeasurableSpace.comap G inferInstance
  rw [he,←MeasurableSpace.comap_comp]
  exact MeasurableSpace.comap_mono hψ.comap_le

def protectedCrossingTerminalPair {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ)
    (x : ProtectedTimedState cfg×BoardClockPath n) : (ProtectedTimedState cfg×Bool)×BoardClockPath n := by
  classical
  let r := protectedRecycledTerminalPair cfg ε M L hn x.1 x.2
  exact ((r.1,decide (x.2∈protectedActualExceedance cfg ε M L N E A hn x.1 b)),r.2)

theorem protectedCrossingTerminalPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (b : ℝ) :
    Measurable (protectedCrossingTerminalPair cfg ε M L N E A hn b) := by
  classical
  have ht : Measurable (fun x : ProtectedTimedState cfg×BoardClockPath n=>
      protectedRecycledTerminalPair cfg ε M L hn x.1 x.2) :=
    Measurable.find (fun k=>iterate_joint_measurable _ (protectedRestartStep_measurable cfg ε M L hn) k)
      (fun k=>((augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).comp
        (measurable_fst.fst.prodMk measurable_snd)).setOf)
      (fun x=>augRecycledCompletionPredicate_exists cfg ε M hn x.1.1 x.2)
  have hf : Measurable (fun x : ProtectedTimedState cfg×BoardClockPath n=>
      decide (x.2∈protectedActualExceedance cfg ε M L N E A hn x.1 b)) :=
    Measurable.ite (protectedActualExceedance_joint_measurable cfg ε M L N E A hA hn b).setOf
      measurable_const measurable_const
  exact (ht.fst.prodMk hf).prodMk ht.snd

theorem protectedCrossingTerminalPair_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A)
    (hn : 0<n) (hB : 0<cfg.B) (b : ℝ) (s : ProtectedTimedState cfg) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω=>protectedCrossingTerminalPair cfg ε M L N E A hn b (s,ω))=
      ((boardClockMeasure n (cfg.B/n)).map (fun ω=>(protectedCrossingTerminalPair cfg ε M L N E A hn b (s,ω)).1)).prod
        (boardClockMeasure n (cfg.B/n)) := by
  classical
  let μ := boardClockMeasure n (cfg.B/n)
  have hr := div_pos hB (show (0:ℝ)<n by exact_mod_cast hn)
  letI := boardClockMeasure_probability n (cfg.B/n) hr
  let g := protectedHistoryBoundaryTotal cfg L E A s.2
  let f := protectedHistoryFlowTotal cfg L E A s.2
  let R : ℕ → Set (BoardClockPath n)
    | 0 => ∅
    | k+1 => lineStageBoundaryExceeds cfg ε M L N hn s.1 k (g k) b ∪
        lineStageHistoryExceeds cfg ε M L N hn s.1 k univ (f k) b
  have hR (k : ℕ) : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] (R k) := by
    cases k with
    | zero => exact @MeasurableSet.empty (BoardClockPath n) (protectedStateFiltration cfg ε M L hn s 0)
    | succ k =>
      apply (augFiltration_le_protected cfg ε M L hn s (k+1)) _
      have hb := lineStageBoundaryExceeds_history cfg ε M L N hn s.1 k (g k)
        (protectedHistoryBoundaryTotal_measurable cfg L E A hA.measurable s.2 k) b
      have hf := lineStageHistoryExceeds_history cfg ε M L N hn s.1 k univ MeasurableSet.univ (f k)
        (protectedHistoryFlowTotal_measurable cfg L E A hA.measurable s.2 k)
        (protectedHistoryFlowTotal_continuous cfg L E A hA s.2 k) b
      exact (((augRecycledStateFiltration cfg ε M hn s.1).mono (Nat.le_succ k)) _ hb).union hf
  have hU : (⋃k,R k)=protectedActualExceedance cfg ε M L N E A hn s b := by
    ext ω
    simp only [protectedActualExceedance,lineStageExceedance,mem_iUnion]
    constructor
    · rintro ⟨k,hk⟩
      cases k with
      | zero => exact False.elim hk
      | succ k => exact ⟨k,hk⟩
    · rintro ⟨k,hk⟩
      exact ⟨k+1,hk⟩
  have h := terminal_observed_event_residual_product (protectedRestartStep cfg ε M L hn)
    (protectedRestartStep_measurable cfg ε M L hn) μ
    (protectedRestartStep_map cfg ε M L hn (cfg.B/n) hr) s
    (protectedRecycledTerminalPair cfg ε M L hn s) (protectedRecycledTerminalPair_measurable cfg ε M L hn s)
    (protectedRecycledTerminalPair_stable_ae cfg ε M L hn hB s) R hR
  rw [hU] at h
  exact h

end NoThreeLine

#print axioms NoThreeLine.augFiltration_le_protected
#print axioms NoThreeLine.protectedCrossingTerminalPair_map

