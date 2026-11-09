import NoThreeLine.ExtendedTransitions

/-! A finite descending counter for positive boundary resolutions. Births
and flow do not increase it; a nonterminal pending-boundary step decreases it. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

theorem ProcessState.birth_activeEvents_subset {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (q : Grid n) (positive : Grid n → Bool) :
    (s.birth Γ q positive).activeEvents ⊆ s.activeEvents := by
  intro p hp
  have ha := (s.birth Γ q positive).mem_activeEvents p |>.mp hp
  apply s.mem_activeEvents p |>.mpr
  unfold ProcessState.birth at ha
  split_ifs at ha
  · exact (birthGeometry_active Γ s.selected p q (s.accounts p)
      (CreditAccount.retire_active _ _ ha)).1
  · exact ha

theorem ProcessState.stop_activeEvents_empty {n : ℕ} (s : ProcessState n) :
    s.stop.activeEvents = ∅ := by
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro p hp
  have ha := s.stop.mem_activeEvents p |>.mp hp
  have hold : (s.accounts p).status = .active := CreditAccount.retire_active _ _ ha
  simp [ProcessState.stop,CreditAccount.retire,hold] at ha

theorem resolve_activeEvents_subset {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (k r : LineIndex n → ℝ)
    (handled : Finset (LineIndex n)) :
    (resolveBoundary s Γ B K ρ k r handled).activeEvents ⊆ s.activeEvents := by
  unfold resolveBoundary
  split_ifs
  · rw [s.stop_activeEvents_empty]
    exact Finset.empty_subset _
  · exact retire_activeEvents_subset s _

def ExtendedState.boundaryBudget {n : ℕ} (e : ExtendedState n) : ℕ :=
  e.process.activeEvents.card + (Fintype.card (LineIndex n) - e.handled.card)

theorem ExtendedState.withCoordinates_budget {n : ℕ} (e : ExtendedState n) (z : Coordinates n) :
    (e.withCoordinates z).boundaryBudget = e.boundaryBudget := rfl

theorem ExtendedState.birth_budget_le {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (q : Grid n) (positive : Grid n → Bool) :
    (e.birth Γ q positive).boundaryBudget ≤ e.boundaryBudget :=
  Nat.add_le_add_right (Finset.card_le_card (e.process.birth_activeEvents_subset Γ q positive)) _

theorem ExtendedState.candidateUpdate_budget_le {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (B : ℝ) (q : Grid n)
    (positive : Grid n → Bool) (mark : ℝ) :
    (e.candidateUpdate Γ mask B q positive mark).boundaryBudget ≤ e.boundaryBudget := by
  rw [candidateUpdate_eq]
  split_ifs
  · exact e.birth_budget_le Γ q positive
  · exact le_rfl

theorem ExtendedState.resolve_budget_le {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) :
    (e.resolve Γ B K ρ).boundaryBudget ≤ e.boundaryBudget := by
  have ha := Finset.card_le_card (resolve_activeEvents_subset e.process Γ B K ρ
    e.clocks e.lineCredits e.handled)
  have hh := Finset.card_le_card (handled_subset_after e.process Γ e.lineCredits ρ e.handled)
  change _ + _ ≤ _ + _
  exact Nat.add_le_add ha (Nat.sub_le_sub_left hh _)

theorem ExtendedState.resolve_budget_strict {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ)
    (hp : pendingBoundary e.process Γ B K ρ e.clocks e.lineCredits e.handled)
    (hn : (e.resolve Γ B K ρ).process.stopped ≠ true) :
    (e.resolve Γ B K ρ).boundaryBudget < e.boundaryBudget := by
  have ha := Finset.card_le_card (resolve_activeEvents_subset e.process Γ B K ρ
    e.clocks e.lineCredits e.handled)
  have hh := Finset.card_le_card (handled_subset_after e.process Γ e.lineCredits ρ e.handled)
  have hcap : (handledAfter e.process Γ e.lineCredits ρ e.handled).card ≤ Fintype.card (LineIndex n) :=
    Finset.card_le_univ _
  have hprogress := resolveBoundary_progress e.process Γ B K ρ e.clocks e.lineCredits e.handled hp
  change (resolveBoundary e.process Γ B K ρ e.clocks e.lineCredits e.handled).stopped ≠ true at hn
  rcases hprogress with hs | hw | ht
  · exact False.elim (hn hs)
  · unfold boundaryBudget resolve
    dsimp only
    omega
  · unfold boundaryBudget resolve
    dsimp only
    omega

end NoThreeLine

#print axioms NoThreeLine.ExtendedState.candidateUpdate_budget_le
#print axioms NoThreeLine.ExtendedState.resolve_budget_strict
