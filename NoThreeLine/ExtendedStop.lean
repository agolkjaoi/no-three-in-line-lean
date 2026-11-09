import NoThreeLine.EventBudget
import NoThreeLine.BoundaryMeasurable

/-! Global stop on the full physical state. Coordinate values and credit
are retained, every active account retires, and the stop flag is set. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

def ExtendedState.stop {n : ℕ} (e : ExtendedState n) : ExtendedState n :=
  ⟨e.process.stop,e.clocks,e.lineCredits,e.handled⟩

theorem ExtendedState.stop_coordinates {n : ℕ} (e : ExtendedState n) :
    e.stop.coordinates = e.coordinates := by
  unfold stop coordinates
  congr 2
  funext p
  exact CreditAccount.retire_weight _ _

theorem ExtendedState.stop_valid {n : ℕ} (e : ExtendedState n) (B : ℝ)
    (he : e.Valid B) : e.stop.Valid B := by
  refine ⟨e.process.stop_valid he.1,?_,?_⟩
  · rw [stop_coordinates]
    exact he.2.1
  · intro L hL p hp ha
    have hold : (e.process.accounts p).status = .active := CreditAccount.retire_active _ _ ha
    simp [stop,ProcessState.stop,CreditAccount.retire,hold] at ha

theorem ExtendedState.stop_credit {n : ℕ} (e : ExtendedState n) (p : Grid n) :
    (e.stop.process.accounts p).credit = (e.process.accounts p).credit := e.process.stop_credit p

theorem ExtendedState.stop_budget_le {n : ℕ} (e : ExtendedState n) :
    e.stop.boundaryBudget ≤ e.boundaryBudget := by
  change e.process.stop.activeEvents.card + _ ≤ e.process.activeEvents.card + _
  rw [ProcessState.stop_activeEvents_empty]
  change 0 + (Fintype.card (LineIndex n) - e.handled.card) ≤
    e.process.activeEvents.card + (Fintype.card (LineIndex n) - e.handled.card)
  omega

theorem ExtendedState.measurable_stop (n : ℕ) : Measurable (@ExtendedState.stop n) := by
  exact measurable_mk _ _ _ _ ((ProcessState.measurable_stop n).comp (measurable_process n))
    (measurable_clocks n) (measurable_lineCredits n) (measurable_handled n)

end NoThreeLine

#print axioms NoThreeLine.ExtendedState.stop_valid
#print axioms NoThreeLine.ExtendedState.stop_credit
#print axioms NoThreeLine.ExtendedState.measurable_stop
