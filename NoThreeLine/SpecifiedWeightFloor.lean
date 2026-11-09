import NoThreeLine.MixedConnection

/-! An active point can pay each specified-line halving only after a new
specified line becomes occupied. The resulting weight floor depends on the
number of specified directions, not on the board size or number of births. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine
open GridLines PrimitiveLines

def occupiedSpecifiedLines {n : ℕ} (Γ : Finset ZPoint) (S : Finset (Grid n))
    (p : Grid n) : Finset (Finset (Grid n)) := by
  classical
  exact (specifiedLines Γ p).filter (fun L => (S ∩ L).Nonempty)

theorem occupiedSpecifiedLines_card_le {n : ℕ} (Γ : Finset ZPoint)
    (S : Finset (Grid n)) (p : Grid n) : (occupiedSpecifiedLines Γ S p).card ≤ Γ.card := by
  classical
  exact (Finset.card_filter_le _ _).trans
    ((Finset.card_image_le).trans (Finset.card_filter_le _ _))

theorem occupiedSpecifiedLines_mono {n : ℕ} (Γ : Finset ZPoint)
    (S T : Finset (Grid n)) (hST : S ⊆ T) (p : Grid n) :
    occupiedSpecifiedLines Γ S p ⊆ occupiedSpecifiedLines Γ T p := by
  classical
  intro L hL
  obtain ⟨hL, y, hy⟩ := Finset.mem_filter.mp hL
  exact Finset.mem_filter.mpr ⟨hL, y, Finset.mem_inter.mpr
    ⟨hST (Finset.mem_inter.mp hy).1, (Finset.mem_inter.mp hy).2⟩⟩

theorem occupiedSpecifiedLines_new_birth {n : ℕ} (Γ : Finset ZPoint)
    (S : Finset (Grid n)) (p q : Grid n) (hpq : p ≠ q)
    (hsp : specifiedPair Γ p q) (hw : ¬selectedWitness S p q) :
    (occupiedSpecifiedLines Γ S p).card + 1 ≤
      (occupiedSpecifiedLines Γ (insert q S) p).card := by
  classical
  have hL : lineThrough p q ∈ specifiedLines Γ p :=
    (specifiedPair_iff_line_mem Γ p q hpq).mp hsp
  have hnot : lineThrough p q ∉ occupiedSpecifiedLines Γ S p := by
    intro hh
    obtain ⟨y, hy⟩ := (Finset.mem_filter.mp hh).2
    exact hw ⟨y, (Finset.mem_inter.mp hy).1,
      (mem_lineThrough p q y).mp (Finset.mem_inter.mp hy).2⟩
  have hsub : insert (lineThrough p q) (occupiedSpecifiedLines Γ S p) ⊆
      occupiedSpecifiedLines Γ (insert q S) p := by
    apply Finset.insert_subset
    · exact Finset.mem_filter.mpr ⟨hL, q, Finset.mem_inter.mpr
        ⟨Finset.mem_insert_self _ _, right_mem_lineThrough p q⟩⟩
    · exact occupiedSpecifiedLines_mono Γ S (insert q S) (Finset.subset_insert _ _) p
  simpa only [Finset.card_insert_of_notMem hnot] using Finset.card_le_card hsub

def ProcessState.ActiveWeightFloor {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint) : Prop :=
  ∀ p, (s.accounts p).status = .active →
    (1/2 : ℝ) ^ (occupiedSpecifiedLines Γ s.selected p).card ≤ (s.accounts p).weight

theorem ProcessState.initial_activeWeightFloor (n : ℕ) (Γ : Finset ZPoint) :
    (ProcessState.initial n).ActiveWeightFloor Γ := by
  classical
  intro p _
  simp [ProcessState.initial, occupiedSpecifiedLines]

theorem ProcessState.activeWeightFloor_uniform {n : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (hs : s.ActiveWeightFloor Γ) (p : Grid n)
    (hp : (s.accounts p).status = .active) :
    (1/2 : ℝ) ^ Γ.card ≤ (s.accounts p).weight :=
  (pow_le_pow_of_le_one (by norm_num : (0:ℝ) ≤ 1/2) (by norm_num)
    (occupiedSpecifiedLines_card_le Γ s.selected p)).trans (hs p hp)

theorem ProcessState.birth_activeWeightFloor {n : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (hs : s.ActiveWeightFloor Γ) (q : Grid n)
    (positive : Grid n → Bool) : (s.birth Γ q positive).ActiveWeightFloor Γ := by
  classical
  unfold ProcessState.birth
  split_ifs with hrun
  · intro p hp
    have hg := birthGeometry_active Γ s.selected p q (s.accounts p)
      (CreditAccount.retire_active _ _ hp)
    have hold := hs p hg.1
    change (1/2 : ℝ) ^ (occupiedSpecifiedLines Γ (insert q s.selected) p).card ≤
      (birthAccount Γ s.selected p q (s.accounts p) (positive p)).weight
    rw [MixedConnection.birthAccount_weight _ _ _ _ _ hg.1]
    simp only [birthMultiplier, if_neg hg.2.1, if_neg hg.2.2]
    split_ifs with hh
    · calc
        _ ≤ (1/2 : ℝ) ^ ((occupiedSpecifiedLines Γ s.selected p).card + 1) :=
          pow_le_pow_of_le_one (by norm_num) (by norm_num)
            (occupiedSpecifiedLines_new_birth Γ s.selected p q hg.2.1 hh.1 hh.2)
        _ = (1/2 : ℝ) * (1/2 : ℝ) ^ (occupiedSpecifiedLines Γ s.selected p).card := by
          rw [pow_succ, mul_comm]
        _ ≤ _ := mul_le_mul_of_nonneg_left hold (by norm_num)
    · rw [one_mul]
      exact (pow_le_pow_of_le_one (by norm_num : (0:ℝ) ≤ 1/2) (by norm_num)
        (Finset.card_le_card (occupiedSpecifiedLines_mono Γ s.selected (insert q s.selected)
          (Finset.subset_insert _ _) p))).trans hold
  · exact hs

theorem ProcessState.retire_activeWeightFloor {n : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (hs : s.ActiveWeightFloor Γ) (positive : Grid n → Bool) :
    (s.retire positive).ActiveWeightFloor Γ := by
  intro p hp
  simpa only [ProcessState.retire, CreditAccount.retire_weight] using
    hs p (CreditAccount.retire_active _ _ hp)

theorem ProcessState.withWeights_activeWeightFloor {n : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (hs : s.ActiveWeightFloor Γ) (w : Grid n → ℝ)
    (hw : ∀ p, (s.accounts p).weight ≤ w p) :
    (s.withWeights w).ActiveWeightFloor Γ := by
  intro p hp
  exact (hs p hp).trans (hw p)

end NoThreeLine

#print axioms NoThreeLine.occupiedSpecifiedLines_new_birth
#print axioms NoThreeLine.ProcessState.birth_activeWeightFloor
#print axioms NoThreeLine.ProcessState.activeWeightFloor_uniform
