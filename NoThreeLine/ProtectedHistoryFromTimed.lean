import NoThreeLine.LineStageHistoryCut
import NoThreeLine.ProtectedLedgerProcess

/-! The full saved protected ledger is determined measurably by the
observed timed state prefix and its actual incoming saved values. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedFromTimedHistory {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (saved : Grid n→ℝ) : (k : ℕ) → LineCutHistory cfg k → ProtectedTimedState cfg
  | 0,a => (a 0,saved)
  | k+1,a => protectedRemember cfg L
      (protectedFromTimedHistory cfg L saved k (fun i=>a i.castSucc)) (a (Fin.last (k+1)))

theorem protectedFromTimedHistory_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (saved : Grid n→ℝ) (k : ℕ) : Measurable (protectedFromTimedHistory cfg L saved k) := by
  induction k with
  | zero => exact (measurable_pi_apply 0).prodMk measurable_const
  | succ k ih =>
    exact (protectedRemember_measurable cfg L).comp
      ((ih.comp (measurable_pi_lambda _ (fun i=>measurable_pi_apply i.castSucc))).prodMk
        (measurable_pi_apply (Fin.last (k+1))))

theorem protectedFromTimedHistory_recycled {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    protectedFromTimedHistory cfg L s.2 k (lineCutHistory cfg ε M hn s.1 k ω)=
      (protectedRecycledPair cfg ε M L hn s k ω).1 := by
  induction k with
  | zero => rfl
  | succ k ih =>
    have hp := congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s (k+1) ω)
    change protectedRemember cfg L
      (protectedFromTimedHistory cfg L s.2 k (lineCutHistory cfg ε M hn s.1 k ω))
      (augRecycledPair cfg ε M hn s.1 (k+1) ω).1=_
    rw [ih,←hp]
    rfl

end NoThreeLine

#print axioms NoThreeLine.protectedFromTimedHistory_recycled
#print axioms NoThreeLine.protectedFromTimedHistory_measurable

