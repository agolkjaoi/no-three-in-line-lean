import NoThreeLine.ProtectedActualFirstCrossing

/-! The protected crossing event is measurable jointly in the actual
incoming timed ledger and board. Its witnesses refer only to real
boundary states and times in the executed segment. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedStateTotal {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (s : ProtectedTimedState cfg) : ℝ :=
  protectedScalarTotal L E A s.1.val.1.physical s.2

def protectedStateFlowTotal {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (x : ProtectedTimedState cfg×ℝ) : ℝ :=
  protectedScalarTotal L E A (selectedTrajectory cfg ((augTimedInput cfg x.1.1).1.1,x.2)) x.1.2

theorem protectedStateTotal_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Measurable A) :
    Measurable (protectedStateTotal cfg L E A) :=
  Finset.measurable_sum _ (fun p _=>hA.comp (protectedTimedCredit_measurable cfg L p))

theorem protectedStateFlowTotal_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Measurable A) :
    Measurable (protectedStateFlowTotal cfg L E A) := by
  have ht := (selectedTrajectory_measurable cfg).comp
    (((augTimedInput_measurable cfg).comp (measurable_fst.fst :
      Measurable (fun x : ProtectedTimedState cfg×ℝ=>x.1.1))).fst.fst.prodMk measurable_snd)
  exact Finset.measurable_sum _ (fun p _=>hA.comp
    ((protectedLineCredit_measurable L p).comp (ht.prodMk measurable_fst.snd)))

theorem protectedStateFlowTotal_continuous {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (s : ProtectedTimedState cfg) :
    Continuous (fun t=>protectedStateFlowTotal cfg L E A (s,t)) :=
  continuous_finsetSum _ (fun p _=>hA.comp
    (selectedProtectedLedger_continuous cfg (augTimedInput cfg s.1).1.1 L s.2 p))

theorem mem_protectedActualExceedance_iff {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n)
    (s : ProtectedTimedState cfg) (b : ℝ) (ω : BoardClockPath n) :
    ω∈protectedActualExceedance cfg ε M L N E A hn s b ↔
      ∃ k : ℕ, let v := (protectedRecycledPair cfg ε M L hn s k ω).1
        let w := (protectedRecycledPair cfg ε M L hn s (k+1) ω).1
        occupancy v.1.val.1.physical.process L=N ∧
        (b<protectedStateTotal cfg L E A v ∨
          ¬birthDone cfg v.1 ∧ ∃ t : ℝ, 0<t ∧ t≤v.1.val.2-w.1.val.2 ∧
            b<protectedStateFlowTotal cfg L E A (v,t)) := by
  simp only [protectedActualExceedance,lineStageExceedance,mem_iUnion,mem_union]
  apply exists_congr
  intro k
  have hp := congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s k ω)
  have hq := congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s (k+1) ω)
  change (protectedRecycledPair cfg ε M L hn s k ω).1.1=(augRecycledPair cfg ε M hn s.1 k ω).1 at hp
  change (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1=(augRecycledPair cfg ε M hn s.1 (k+1) ω).1 at hq
  simp only [lineStageBoundaryExceeds,lineStageHistoryExceeds,mem_setOf_eq,mem_univ,true_and]
  rw [protectedHistoryBoundaryTotal_recycled cfg ε M L E A hn s k ω]
  simp_rw [protectedHistoryFlowTotal_recycled cfg ε M L E A hn s k ω]
  simp only [protectedStateTotal,protectedStateFlowTotal,lineRecycledElapsed,lineCutHistory,
    StateHistory.history,Fin.val_last]
  rw [←hp,←hq]
  tauto

theorem protectedActualExceedance_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n)
    (b : ℝ) : Measurable (fun x : ProtectedTimedState cfg×BoardClockPath n=>
      x.2∈protectedActualExceedance cfg ε M L N E A hn x.1 b) := by
  let X := ProtectedTimedState cfg×BoardClockPath n
  let V := fun k (x : X)=>(protectedRecycledPair cfg ε M L hn x.1 k x.2).1
  have hV (k : ℕ) : Measurable (V k) :=
    (RecycledBoardProcess.iterate_joint_measurable _ (protectedRestartStep_measurable cfg ε M L hn) k).fst
  let d := fun k (x : X)=>(V k x).1.val.2-(V (k+1) x).1.val.2
  have hd (k : ℕ) : Measurable (d k) :=
    (measurable_subtype_coe.snd.comp (hV k).fst).sub (measurable_subtype_coe.snd.comp (hV (k+1)).fst)
  let C := fun k (x : X)=>occupancy (V k x).1.val.1.physical.process L=N ∧
    (b<protectedStateTotal cfg L E A (V k x) ∨
      ¬birthDone cfg (V k x).1 ∧ ∃ q : ℚ, 0<(q:ℝ) ∧ (q:ℝ)<d k x ∧
        b<protectedStateFlowTotal cfg L E A (V k x,q))
  have hC (k : ℕ) : Measurable (C k) := by
    have ho := ((ExtendedState.measurable_occupancy n L).comp
      ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp (hV k).fst))).eq_const N
    have hb : Measurable (fun x : X=>b<protectedStateTotal cfg L E A (V k x)) :=
      measurable_const.lt ((protectedStateTotal_measurable cfg L E A hA.measurable).comp (hV k))
    have hf (q : ℚ) := (protectedStateFlowTotal_measurable cfg L E A hA.measurable).comp
      ((hV k).prodMk (measurable_const (a := (q:ℝ))))
    exact ho.and (hb.or (((birthDone_measurable cfg).comp (hV k).fst).not.and
      (Measurable.exists (fun q : ℚ=>measurable_const.and ((measurable_const.lt (hd k)).and
        (measurable_const.lt (hf q)))))))
  have he : (fun x : X=>x.2∈protectedActualExceedance cfg ε M L N E A hn x.1 b)=
      fun x=>∃ k,C k x := by
    funext x
    apply propext
    rw [mem_protectedActualExceedance_iff]
    apply exists_congr
    intro k
    exact and_congr_right (fun _=>or_congr_right (and_congr_right (fun _=>
      continuous_positive_exceedance_rat (protectedStateFlowTotal_continuous cfg L E A hA (V k x))
        b (d k x))))
  rw [he]
  exact Measurable.exists hC

end NoThreeLine

#print axioms NoThreeLine.mem_protectedActualExceedance_iff
#print axioms NoThreeLine.protectedActualExceedance_joint_measurable

