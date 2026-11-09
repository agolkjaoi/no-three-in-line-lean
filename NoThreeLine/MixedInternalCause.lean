import NoThreeLine.MixedCauseGeometry

/-! Internal roots are not positive sources: all other-root compensation
is canceled by physical line connections, while self-growth equals one
and the actual self-birth kills the active-root indicator. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.MixedConnection
open AuxiliaryODE GridLines PrimitiveLines BirthLineGroups

theorem multiplicity_erase_candidate {n : ℕ} (C : Finset (Grid n)) (q : Grid n)
    (hqC : q∈C) (L : LineIndex n) (hqL : q∈L.val) :
    multiplicity C L=multiplicity (C.erase q) L+1 := by
  have he : C∩L.val=insert q (C.erase q∩L.val) := by
    ext p
    by_cases hpq : p=q
    · subst p
      simp [hqC,hqL]
    · simp [hpq]
  unfold multiplicity
  rw [he,Finset.card_insert_of_notMem (by simp)]

theorem internal_debit_group {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : s.Valid) (hC : C⊆s.activeEvents) (hqC : q∈C)
    (L : LineIndex n) (hL : L.val∈rootGroups (C.erase q) q) :
    causeLineDebit s Γ C q L=((rootFibre (C.erase q) q L.val).card:ℝ)*
      (1-groupMultiplier Γ s.selected (C.erase q) q L.val) := by
  have hqL := group_contains_candidate (C.erase q) q L.val hL
  have hD : C.erase q⊆s.activeEvents := (Finset.erase_subset q C).trans hC
  have hqD : q∉C.erase q := Finset.notMem_erase q C
  rw [causeLineDebit,if_pos hqL,multiplicity_erase_candidate C q hqC L hqL,
    Nat.add_sub_cancel_right,lineCauseFactor_group s Γ (C.erase q) q hs hD (hC hqC) hqD L hL,
    fibre_eq_inter (C.erase q) q hqD L hqL]
  rfl

theorem internal_debit_zero_outside {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hqC : q∈C) (L : LineIndex n)
    (hL : L.val∉rootGroups (C.erase q) q) : causeLineDebit s Γ C q L=0 := by
  by_cases hqL : q∈L.val
  · have hm : multiplicity (C.erase q) L=0 := by
      apply Finset.card_eq_zero.mpr
      apply Finset.eq_empty_iff_forall_notMem.mpr
      intro p hp
      obtain ⟨hpD,hpL⟩ := Finset.mem_inter.mp hp
      apply hL
      exact Finset.mem_image.mpr ⟨p,hpD,
        (boardLine_eq L q p hqL hpL (Finset.mem_erase.mp hpD).1.symm).symm⟩
    rw [causeLineDebit,if_pos hqL,multiplicity_erase_candidate C q hqC L hqL,hm]
    norm_num
  · simp [causeLineDebit,hqL]

theorem internal_debit_sum {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : s.Valid) (hC : C⊆s.activeEvents) (hqC : q∈C) :
    (∑ L : LineIndex n,causeLineDebit s Γ C q L)=∑ p∈C.erase q,localGrowthFactor Γ s.selected p q := by
  classical
  have hD : C.erase q⊆s.activeEvents := (Finset.erase_subset q C).trans hC
  have hqD : q∉C.erase q := Finset.notMem_erase q C
  rw [rootGrowth_sum_groups s Γ (C.erase q) q hs hD (hC hqC) hqD]
  apply Finset.sum_bij_ne_zero (fun L _ _=>L.val)
  · intro L _ hne
    by_contra hnot
    exact hne (internal_debit_zero_outside s Γ C q hqC L hnot)
  · intro L _ _ K _ _ he
    exact Subtype.ext he
  · intro L hL hne
    let Li : LineIndex n := ⟨L,group_is_boardLine (C.erase q) q hqD L hL⟩
    refine ⟨Li,Finset.mem_univ Li,?_,rfl⟩
    simpa only [internal_debit_group s Γ C q hs hC hqC Li hL] using hne
  · intro L _ hne
    have hg : L.val∈rootGroups (C.erase q) q := by
      by_contra hnot
      exact hne (internal_debit_zero_outside s Γ C q hqC L hnot)
    exact internal_debit_group s Γ C q hs hC hqC L hg

theorem causeGrowth_internal {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : s.Valid) (hC : C⊆s.activeEvents) (hqC : q∈C) :
    causeGrowth s Γ C q=1 := by
  rw [causeGrowth,internal_debit_sum s Γ C q hs hC hqC]
  have hsum := Finset.sum_erase_add C (fun p=>localGrowthFactor Γ s.selected p q) hqC
  have hself : localGrowthFactor Γ s.selected q q=1 := by simp [localGrowthFactor]
  rw [hself] at hsum
  linarith

theorem phi_internal_birth {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hqC : q∈C) : phi Γ C (birthSnapshot e Γ q)=0 := by
  have hnot : q∉(birthSnapshot e Γ q).process.activeEvents := by
    rw [snapshot_active_iff e Γ q q hstop hq hq]
    simp [birthMultiplier]
  have hCnot : ¬C⊆(birthSnapshot e Γ q).process.activeEvents := fun h=>hnot (h hqC)
  simp only [phi,if_neg hCnot]

end NoThreeLine.MixedConnection

#print axioms NoThreeLine.MixedConnection.causeGrowth_internal
#print axioms NoThreeLine.MixedConnection.phi_internal_birth
