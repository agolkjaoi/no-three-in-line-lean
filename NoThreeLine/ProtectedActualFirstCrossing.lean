import NoThreeLine.LineStageFirstCrossing
import NoThreeLine.ProtectedHistoryFromTimed
import NoThreeLine.ProtectedScalarSquareTimed

/-! First strict exceedance of the actual moving and saved protected
credit. An arbitrary continuous scalar transform covers both credit
and the entropy used in the stopped-process cost estimate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedHistoryBoundaryTotal {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (saved : Grid n→ℝ) (k : ℕ) (a : LineCutHistory cfg k) : ℝ :=
  let v := protectedFromTimedHistory cfg L saved k a
  protectedScalarTotal L E A v.1.val.1.physical v.2

def protectedHistoryFlowTotal {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (saved : Grid n→ℝ) (k : ℕ) (a : LineCutHistory cfg k×ℝ) : ℝ :=
  let v := protectedFromTimedHistory cfg L saved k a.1
  protectedScalarTotal L E A (selectedTrajectory cfg ((augTimedInput cfg v.1).1.1,a.2)) v.2

theorem protectedHistoryBoundaryTotal_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Measurable A) (saved : Grid n→ℝ) (k : ℕ) :
    Measurable (protectedHistoryBoundaryTotal cfg L E A saved k) :=
  (Finset.measurable_sum _ (fun p _=>hA.comp (protectedTimedCredit_measurable cfg L p))).comp
    (protectedFromTimedHistory_measurable cfg L saved k)

theorem protectedHistoryFlowTotal_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Measurable A) (saved : Grid n→ℝ) (k : ℕ) :
    Measurable (protectedHistoryFlowTotal cfg L E A saved k) := by
  have hv := (protectedFromTimedHistory_measurable cfg L saved k).comp
    (measurable_fst : Measurable (Prod.fst : LineCutHistory cfg k×ℝ→LineCutHistory cfg k))
  have ht := (selectedTrajectory_measurable cfg).comp
    ((((augTimedInput_measurable cfg).comp hv.fst).fst.fst).prodMk measurable_snd)
  exact Finset.measurable_sum _ (fun p _=>hA.comp ((protectedLineCredit_measurable L p).comp (ht.prodMk hv.snd)))

theorem protectedHistoryFlowTotal_continuous {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (saved : Grid n→ℝ)
    (k : ℕ) (a : LineCutHistory cfg k) :
    Continuous (fun t=>protectedHistoryFlowTotal cfg L E A saved k (a,t)) := by
  let v := protectedFromTimedHistory cfg L saved k a
  exact continuous_finsetSum _ (fun p _=>hA.comp
    (selectedProtectedLedger_continuous cfg (augTimedInput cfg v.1).1.1 L v.2 p))

theorem protectedHistoryBoundaryTotal_recycled {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    protectedHistoryBoundaryTotal cfg L E A s.2 k (lineCutHistory cfg ε M hn s.1 k ω)=
      protectedScalarTotal L E A (protectedRecycledPair cfg ε M L hn s k ω).1.1.val.1.physical
        (protectedRecycledPair cfg ε M L hn s k ω).1.2 := by
  unfold protectedHistoryBoundaryTotal
  rw [protectedFromTimedHistory_recycled]

theorem protectedHistoryFlowTotal_recycled {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) (t : ℝ) :
    protectedHistoryFlowTotal cfg L E A s.2 k (lineCutHistory cfg ε M hn s.1 k ω,t)=
      protectedScalarTotal L E A (selectedTrajectory cfg
        ((augTimedInput cfg (protectedRecycledPair cfg ε M L hn s k ω).1.1).1.1,t))
        (protectedRecycledPair cfg ε M L hn s k ω).1.2 := by
  unfold protectedHistoryFlowTotal
  rw [protectedFromTimedHistory_recycled]

def protectedActualExceedance {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n)
    (s : ProtectedTimedState cfg) (b : ℝ) : Set (BoardClockPath n) :=
  lineStageExceedance cfg ε M L N hn s.1
    (protectedHistoryBoundaryTotal cfg L E A s.2) (protectedHistoryFlowTotal cfg L E A s.2) b

theorem phaseLineForbiddenLaw_protected_firstCrossing_ge {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (ho : occupancy s.1.val.1.physical.process L=N)
    (hk : s.1.val.1.physical.clocks L≤K) (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (b : ℝ) :
    (boardClockMeasure n (cfg.B/n)).real (protectedActualExceedance cfg ε M L N E A hn s b)≤
      (phaseLineForbiddenLaw cfg ε M K L N hn s.1).real (protectedActualExceedance cfg ε M L N E A hn s b) :=
  phaseLineForbiddenLaw_firstCrossing_ge cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
    _ (protectedHistoryBoundaryTotal_measurable cfg L E A hA.measurable s.2)
    _ (protectedHistoryFlowTotal_measurable cfg L E A hA.measurable s.2)
    (protectedHistoryFlowTotal_continuous cfg L E A hA s.2) b

end NoThreeLine

#print axioms NoThreeLine.protectedHistoryBoundaryTotal_recycled
#print axioms NoThreeLine.protectedHistoryFlowTotal_recycled
#print axioms NoThreeLine.phaseLineForbiddenLaw_protected_firstCrossing_ge

