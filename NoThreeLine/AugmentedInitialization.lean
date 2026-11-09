import NoThreeLine.AugmentedPhaseComposition

/-! Canonical initial state after all deadlines at or before the starting
time have been retired. Its eta is one and virtual deletion mass is zero. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

def augInitialState {n : ℕ} (B : ℝ) (hB : 1 ≤ B) (deadline : Grid n → ℝ)
    (start : ℝ) : ValidAugmentedState n B :=
  augValidDeadlineRetirement deadline start ⟨AugmentedState.initial n,AugmentedState.initial_valid n B hB⟩

theorem augInitialState_eta {n : ℕ} (B : ℝ) (hB : 1 ≤ B) (deadline : Grid n → ℝ)
    (start : ℝ) (a b : Grid n) : (augInitialState B hB deadline start).val.eta a b = 1 := by
  unfold augInitialState
  rw [augValidDeadlineRetirement_eta]
  rfl

theorem augInitialState_credit {n : ℕ} (B : ℝ) (hB : 1 ≤ B) (deadline : Grid n → ℝ)
    (start : ℝ) (p : Grid n) : validAugStateCredit B p (augInitialState B hB deadline start) = 1 := by
  unfold augInitialState
  rw [augValidDeadlineRetirement_credit]
  simp [validAugStateCredit,AugmentedState.initial,ExtendedState.initial,ProcessState.initial,CreditAccount.credit]

theorem augInitialState_stopped {n : ℕ} (B : ℝ) (hB : 1 ≤ B) (deadline : Grid n → ℝ)
    (start : ℝ) : (augInitialState B hB deadline start).val.physical.process.stopped = false := by
  unfold augInitialState
  rw [augValidDeadlineRetirement_stop_flag]
  rfl

theorem augInitialState_selected {n : ℕ} (B : ℝ) (hB : 1 ≤ B) (deadline : Grid n → ℝ)
    (start : ℝ) : (augInitialState B hB deadline start).val.physical.process.selected = ∅ := by
  rfl

theorem augInitialState_expired {n : ℕ} (B : ℝ) (hB : 1 ≤ B) (deadline : Grid n → ℝ)
    (start : ℝ) (p : Grid n) (hp : deadline p ≤ start) :
    ((augInitialState B hB deadline start).val.physical.process.accounts p).status ≠ .active := by
  exact augValidDeadlineRetirement_inactive deadline start _ Bool.false_ne_true p hp

theorem virtualMass_empty_selected {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (z : Coordinates n) (L : LineIndex n) (q : Grid n) (hs : s.selected = ∅) :
    virtualMass s Γ z L q = 0 := by
  simp [virtualMass,virtualLeaf,selectedWitness,hs]

theorem augInitialState_virtualMass {n : ℕ} (B : ℝ) (hB : 1 ≤ B) (deadline : Grid n → ℝ)
    (start : ℝ) (Γ : Finset PrimitiveLines.ZPoint) (L : LineIndex n) (q : Grid n) :
    virtualMass (augInitialState B hB deadline start).val.physical.process Γ
      (augInitialState B hB deadline start).val.physical.coordinates L q = 0 :=
  virtualMass_empty_selected _ _ _ _ _ (augInitialState_selected B hB deadline start)

theorem augInitialState_not_auxBad {n : ℕ} (B : ℝ) (hB : 1 ≤ B) (deadline : Grid n → ℝ)
    (start : ℝ) (Γ : Finset PrimitiveLines.ZPoint) (ε M : ℝ) (hε : 0 < ε) (hM : 0 < M) :
    ¬(augInitialState B hB deadline start).val.auxBad Γ ε M := by
  rintro (hη | hV)
  · obtain ⟨a,b,hab,h⟩ := hη
    rw [augInitialState_eta] at h
    linarith
  · have hsmall : ∀ L q, virtualMass (augInitialState B hB deadline start).val.physical.process Γ
        (augInitialState B hB deadline start).val.physical.coordinates L q < M := by
      intro L q
      rw [augInitialState_virtualMass]
      exact hM
    exact ((outside_virtualGuard _ _ _ _).mpr hsmall) hV

theorem augFinitePhase_initial_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (k : ℕ) (p : Grid n) :
    (∫ v, validAugStateCredit B p
      (augFinitePhaseState cs ε M deadline start hn k (augInitialState B hB deadline start) v)
      ∂MeasureTheory.Measure.pi (fun _ : Fin k => FreshBoardWaits.freshBoardMeasure n (B/n))) = 1 := by
  rw [augFinitePhaseState_expected_credit cs ε M deadline start hn (lt_of_lt_of_le zero_lt_one hB),
    augInitialState_credit]

end NoThreeLine

#print axioms NoThreeLine.augInitialState_expired
#print axioms NoThreeLine.augInitialState_not_auxBad
#print axioms NoThreeLine.augFinitePhase_initial_expected_credit
