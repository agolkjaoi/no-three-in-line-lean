import NoThreeLine.GuardFirstCredit

/-! Deterministic boundary resolution for subsequent segments. Tag lines
are remembered, so a previously processed r=ρ contact cannot retrigger. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine.AuxiliaryODE

def triggeredTags {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (r : LineIndex n → ℝ) (ρ : ℝ) : Finset (LineIndex n) :=
  Finset.univ.filter (fun L => ¬specified Γ L ∧ occupancy s L = 1 ∧ r L ≤ ρ)

def newTags {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (r : LineIndex n → ℝ) (ρ : ℝ) (handled : Finset (LineIndex n)) : Finset (LineIndex n) :=
  triggeredTags s Γ r ρ \ handled

def handledAfter {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (r : LineIndex n → ℝ) (ρ : ℝ) (handled : Finset (LineIndex n)) : Finset (LineIndex n) :=
  handled ∪ newTags s Γ r ρ handled

def boundaryRetirement {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B ρ : ℝ) (r : LineIndex n → ℝ) (handled : Finset (LineIndex n)) (p : Grid n) : Bool :=
  decide (B ≤ (s.accounts p).weight ∨ ∃ L ∈ newTags s Γ r ρ handled, p ∈ L.val)

def clockTriggered {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (K : ℝ) (k : LineIndex n → ℝ) : Prop :=
  ∃ L, specified Γ L ∧ occupancy s L ≤ 1 ∧ K ≤ k L

instance {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (K : ℝ) (k : LineIndex n → ℝ) : Decidable (clockTriggered s Γ K k) := by
  unfold clockTriggered
  infer_instance

def resolveBoundary {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ : ℝ) (k r : LineIndex n → ℝ) (handled : Finset (LineIndex n)) : ProcessState n :=
  if clockTriggered s Γ K k then s.stop
  else s.retire (boundaryRetirement s Γ B ρ r handled)

def pendingBoundary {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ : ℝ) (k r : LineIndex n → ℝ) (handled : Finset (LineIndex n)) : Prop :=
  s.stopped = false ∧
    ((∃ p, (s.accounts p).status = .active ∧ B ≤ (s.accounts p).weight) ∨
      clockTriggered s Γ K k ∨ (newTags s Γ r ρ handled).Nonempty)

theorem resolveBoundary_selected {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (k r : LineIndex n → ℝ)
    (handled : Finset (LineIndex n)) :
    (resolveBoundary s Γ B K ρ k r handled).selected = s.selected := by
  unfold resolveBoundary
  split_ifs <;> rfl

theorem resolveBoundary_credit {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (k r : LineIndex n → ℝ)
    (handled : Finset (LineIndex n)) (p : Grid n) :
    ((resolveBoundary s Γ B K ρ k r handled).accounts p).credit = (s.accounts p).credit := by
  unfold resolveBoundary
  split_ifs
  · exact s.stop_credit p
  · exact CreditAccount.retire_credit _ _

theorem resolveBoundary_valid {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (k r : LineIndex n → ℝ)
    (handled : Finset (LineIndex n)) (hs : s.Valid) :
    (resolveBoundary s Γ B K ρ k r handled).Valid := by
  unfold resolveBoundary
  split_ifs
  · exact s.stop_valid hs
  · exact s.retire_valid _ hs

theorem triggeredTags_congr_selected {n : ℕ} (s t : ProcessState n)
    (h : s.selected = t.selected) (Γ : Finset PrimitiveLines.ZPoint)
    (r : LineIndex n → ℝ) (ρ : ℝ) : triggeredTags s Γ r ρ = triggeredTags t Γ r ρ := by
  simp only [triggeredTags,occupancy,h]

theorem newTags_after_empty {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (k r : LineIndex n → ℝ)
    (handled : Finset (LineIndex n)) :
    newTags (resolveBoundary s Γ B K ρ k r handled) Γ r ρ
      (handledAfter s Γ r ρ handled) = ∅ := by
  unfold newTags
  rw [triggeredTags_congr_selected _ _ (resolveBoundary_selected s Γ B K ρ k r handled)]
  apply Finset.sdiff_eq_empty_iff_subset.mpr
  intro L hL
  by_cases hh : L ∈ handled
  · exact Finset.mem_union_left _ hh
  · exact Finset.mem_union_right _ (Finset.mem_sdiff.mpr ⟨hL,hh⟩)

theorem boundary_retire_active_weight_lt {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B ρ : ℝ) (r : LineIndex n → ℝ)
    (handled : Finset (LineIndex n)) (p : Grid n)
    (ha : ((s.retire (boundaryRetirement s Γ B ρ r handled)).accounts p).status = .active) :
    ((s.retire (boundaryRetirement s Γ B ρ r handled)).accounts p).weight < B := by
  have hw : ((s.retire (boundaryRetirement s Γ B ρ r handled)).accounts p).weight =
      (s.accounts p).weight := CreditAccount.retire_weight _ _
  rw [hw]
  by_contra h
  have hB : B ≤ (s.accounts p).weight := le_of_not_gt h
  have hp : boundaryRetirement s Γ B ρ r handled p = true := by
    simp [boundaryRetirement,hB]
  have hactive : (s.accounts p).status = .active := CreditAccount.retire_active _ _ ha
  simp [ProcessState.retire,CreditAccount.retire,hp,hactive] at ha

/-- Resolving all current boundaries clears every pending boundary, including
remembered tag contacts. This is a deterministic step, not a process law. -/
theorem resolveBoundary_clears_pending {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (k r : LineIndex n → ℝ)
    (handled : Finset (LineIndex n)) :
    ¬pendingBoundary (resolveBoundary s Γ B K ρ k r handled) Γ B K ρ k r
      (handledAfter s Γ r ρ handled) := by
  intro h
  have hn := newTags_after_empty s Γ B K ρ k r handled
  by_cases hc : clockTriggered s Γ K k
  · simp [pendingBoundary,resolveBoundary,hc,ProcessState.stop] at h
  · obtain ⟨_,hp | hclock | htag⟩ := h
    · obtain ⟨p,ha,hB⟩ := hp
      rw [resolveBoundary,if_neg hc] at ha hB
      exact (not_le_of_gt (boundary_retire_active_weight_lt s Γ B ρ r handled p ha)) hB
    · have he : clockTriggered (resolveBoundary s Γ B K ρ k r handled) Γ K k =
          clockTriggered s Γ K k := by
        simp only [clockTriggered,occupancy,resolveBoundary_selected]
      exact hc (he ▸ hclock)
    · rw [hn] at htag
      exact Finset.not_nonempty_empty htag

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.resolveBoundary_valid
#print axioms NoThreeLine.AuxiliaryODE.resolveBoundary_credit
#print axioms NoThreeLine.AuxiliaryODE.resolveBoundary_clears_pending
