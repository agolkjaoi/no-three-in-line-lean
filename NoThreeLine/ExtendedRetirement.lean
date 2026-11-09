import NoThreeLine.EventBudget
import NoThreeLine.BoundaryMeasurable

/-! Deterministic point deadlines retire only active accounts and preserve
their already computed credit, line clocks and handled-line invariant. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

def ExtendedState.retire {n : ℕ} (e : ExtendedState n) (positive : Grid n → Bool) : ExtendedState n :=
  ⟨e.process.retire positive,e.clocks,e.lineCredits,e.handled⟩

theorem ExtendedState.retire_coordinates {n : ℕ} (e : ExtendedState n) (positive : Grid n → Bool) :
    (e.retire positive).coordinates = e.coordinates := by
  unfold retire coordinates
  congr 2
  funext p
  exact CreditAccount.retire_weight _ _

theorem ExtendedState.retire_valid {n : ℕ} (e : ExtendedState n) (B : ℝ)
    (he : e.Valid B) (positive : Grid n → Bool) : (e.retire positive).Valid B := by
  refine ⟨e.process.retire_valid positive he.1,?_,?_⟩
  · rw [retire_coordinates]
    exact he.2.1
  · intro L hL p hp ha
    exact he.2.2 L hL p hp (CreditAccount.retire_active _ _ ha)

theorem ExtendedState.retire_credit {n : ℕ} (e : ExtendedState n) (positive : Grid n → Bool)
    (p : Grid n) : ((e.retire positive).process.accounts p).credit = (e.process.accounts p).credit :=
  CreditAccount.retire_credit _ _

theorem ExtendedState.retire_budget_le {n : ℕ} (e : ExtendedState n) (positive : Grid n → Bool) :
    (e.retire positive).boundaryBudget ≤ e.boundaryBudget :=
  Nat.add_le_add_right (Finset.card_le_card (retire_activeEvents_subset e.process positive)) _

theorem ExtendedState.measurable_retire (n : ℕ) :
    Measurable (fun x : ExtendedState n × (Grid n → Bool) => x.1.retire x.2) := by
  apply measurable_mk
  · exact (ProcessState.measurable_retire n).comp
      (((measurable_process n).comp measurable_fst).prodMk measurable_snd)
  · exact (measurable_clocks n).comp measurable_fst
  · exact (measurable_lineCredits n).comp measurable_fst
  · exact (measurable_handled n).comp measurable_fst

def deadlineRetirement {n : ℕ} (deadline : Grid n → ℝ) (x : ExtendedState n × ℝ) : ExtendedState n :=
  x.1.retire (fun p => decide (deadline p ≤ x.2))

theorem deadlineRetirement_measurable {n : ℕ} (deadline : Grid n → ℝ) :
    Measurable (deadlineRetirement deadline) := by
  change Measurable ((fun x : ExtendedState n × (Grid n → Bool) => x.1.retire x.2) ∘
    (fun x : ExtendedState n × ℝ => (x.1,fun p => decide (deadline p ≤ x.2))))
  apply (ExtendedState.measurable_retire n).comp
  apply Measurable.prodMk measurable_fst
  apply measurable_pi_lambda
  intro p
  exact measurable_decide_pred _ (measurable_const.le' measurable_snd)

theorem deadlineRetirement_valid {n : ℕ} (deadline : Grid n → ℝ) (e : ExtendedState n)
    (B t : ℝ) (he : e.Valid B) : (deadlineRetirement deadline (e,t)).Valid B :=
  e.retire_valid B he _

theorem deadlineRetirement_credit {n : ℕ} (deadline : Grid n → ℝ) (e : ExtendedState n)
    (t : ℝ) (p : Grid n) :
    ((deadlineRetirement deadline (e,t)).process.accounts p).credit = (e.process.accounts p).credit :=
  e.retire_credit _ p

theorem deadlineRetirement_inactive {n : ℕ} (deadline : Grid n → ℝ) (e : ExtendedState n)
    (t : ℝ) (p : Grid n) (hp : deadline p ≤ t) :
    ((deadlineRetirement deadline (e,t)).process.accounts p).status ≠ .active := by
  intro ha
  have hold : (e.process.accounts p).status = .active :=
    CreditAccount.retire_active (e.process.accounts p) (decide (deadline p ≤ t)) ha
  simp [deadlineRetirement,ExtendedState.retire,ProcessState.retire,
    CreditAccount.retire,hold,hp] at ha

end NoThreeLine

#print axioms NoThreeLine.ExtendedState.retire_valid
#print axioms NoThreeLine.deadlineRetirement_measurable
#print axioms NoThreeLine.deadlineRetirement_credit
#print axioms NoThreeLine.deadlineRetirement_inactive
