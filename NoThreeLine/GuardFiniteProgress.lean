import NoThreeLine.GuardResolution

/-! Each pending boundary either stops the process, removes an active point,
or records a new tag line. These finite counters support later iteration. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine.AuxiliaryODE

theorem retire_activeEvents_subset {n : ℕ} (s : ProcessState n) (b : Grid n → Bool) :
    (s.retire b).activeEvents ⊆ s.activeEvents := by
  intro p hp
  exact s.mem_activeEvents p |>.mpr
    (CreditAccount.retire_active _ _ ((s.retire b).mem_activeEvents p |>.mp hp))

theorem handled_subset_after {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (r : LineIndex n → ℝ) (ρ : ℝ)
    (handled : Finset (LineIndex n)) : handled ⊆ handledAfter s Γ r ρ handled :=
  Finset.subset_union_left

theorem newTags_strict_progress {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (r : LineIndex n → ℝ) (ρ : ℝ)
    (handled : Finset (LineIndex n)) (h : (newTags s Γ r ρ handled).Nonempty) :
    handled.card < (handledAfter s Γ r ρ handled).card := by
  apply Finset.card_lt_card
  apply Finset.ssubset_iff_subset_ne.mpr
  refine ⟨handled_subset_after s Γ r ρ handled,?_⟩
  intro he
  obtain ⟨L,hL⟩ := h
  have hi : L ∈ handledAfter s Γ r ρ handled := Finset.mem_union_right _ hL
  rw [← he] at hi
  exact (Finset.mem_sdiff.mp hL).2 hi

theorem weight_boundary_strict_progress {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B ρ : ℝ) (r : LineIndex n → ℝ)
    (handled : Finset (LineIndex n))
    (h : ∃ p, (s.accounts p).status = .active ∧ B ≤ (s.accounts p).weight) :
    (s.retire (boundaryRetirement s Γ B ρ r handled)).activeEvents.card < s.activeEvents.card := by
  apply Finset.card_lt_card
  apply Finset.ssubset_iff_subset_ne.mpr
  refine ⟨retire_activeEvents_subset s _,?_⟩
  intro he
  obtain ⟨p,ha,hB⟩ := h
  have hi : p ∈ (s.retire (boundaryRetirement s Γ B ρ r handled)).activeEvents := by
    rw [he]
    exact s.mem_activeEvents p |>.mpr ha
  have hw := boundary_retire_active_weight_lt s Γ B ρ r handled p
    ((s.retire _).mem_activeEvents p |>.mp hi)
  have hew : ((s.retire (boundaryRetirement s Γ B ρ r handled)).accounts p).weight =
      (s.accounts p).weight := CreditAccount.retire_weight _ _
  rw [hew] at hw
  exact (not_le_of_gt hw) hB

theorem resolveBoundary_progress {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (k r : LineIndex n → ℝ)
    (handled : Finset (LineIndex n)) (h : pendingBoundary s Γ B K ρ k r handled) :
    (resolveBoundary s Γ B K ρ k r handled).stopped = true ∨
      (resolveBoundary s Γ B K ρ k r handled).activeEvents.card < s.activeEvents.card ∨
      handled.card < (handledAfter s Γ r ρ handled).card := by
  by_cases hc : clockTriggered s Γ K k
  · left
    simp [resolveBoundary,hc,ProcessState.stop]
  · rcases h.2 with hw | hk | hr
    · right; left
      rw [resolveBoundary,if_neg hc]
      exact weight_boundary_strict_progress s Γ B ρ r handled hw
    · exact False.elim (hc hk)
    · right; right
      exact newTags_strict_progress s Γ r ρ handled hr

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.resolveBoundary_progress
