import NoThreeLine.RootBoardLineBudget
import NoThreeLine.GridLineCard

/-! Actual line/cell cardinal bounds and the finite height envelope used by
C22. The primitive direction map is constructed and injective. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.SectionHeight
open AuxiliaryODE PrimitiveLines FiniteDirections

def rootLineHeight {n : ℕ} (p : Grid n) (L : RootBoardLineIndex p) : ℕ :=
  (rootBoardLineDirection p L).1

theorem rootLineHeight_mem {n : ℕ} (p : Grid n) (L : RootBoardLineIndex p) :
    rootLineHeight p L ∈ Finset.Ico 1 n :=
  (Finset.mem_sigma.mp (rootBoardLineDirection_mem p L)).1

theorem rootLine_section_card_le {n : ℕ} (p : Grid n) (L : RootBoardLineIndex p)
    (E : Finset (Grid n)) :
    ((((L.val.val ∩ E).erase p).card:ℝ)) ≤ 2*(n:ℝ)/(rootLineHeight p L:ℝ) := by
  have hc : ((L.val.val ∩ E).erase p).card ≤ L.val.val.card :=
    Finset.card_le_card (fun q hq => (Finset.mem_inter.mp (Finset.mem_erase.mp hq).2).1)
  apply (show ((((L.val.val ∩ E).erase p).card:ℝ)) ≤ (L.val.val.card:ℝ) by exact_mod_cast hc).trans
  rw [rootBoardLineDirection_line]
  exact GridLineCard.directionIndex_gridLine_card_le n (gridEmbed p) _ (rootBoardLineDirection_mem p L)

theorem sum_rootLine_height_le {n : ℕ} (p : Grid n) (f : ℕ → ℝ)
    (hf : ∀ h ∈ Finset.Ico 1 n, 0 ≤ f h) :
    (∑ L : RootBoardLineIndex p, f (rootLineHeight p L)) ≤
      ∑ h ∈ Finset.Ico 1 n, (4*(h:ℝ))*f h := by
  classical
  have he : (∑ L : RootBoardLineIndex p, f (rootLineHeight p L)) =
      ∑ d ∈ Finset.univ.image (rootBoardLineDirection p), f d.1 := by
    rw [Finset.sum_image (fun L _ K _ h => rootBoardLineDirection_injective p h)]
    rfl
  rw [he]
  calc
    _ ≤ ∑ d ∈ directionIndices n, f d.1 := by
      apply Finset.sum_le_sum_of_subset_of_nonneg
      · intro d hd
        obtain ⟨L,_,rfl⟩ := Finset.mem_image.mp hd
        exact rootBoardLineDirection_mem p L
      · intro d hd _
        exact hf d.1 (Finset.mem_sigma.mp hd).1
    _ = ∑ h ∈ Finset.Ico 1 n, ((primitiveShell h).card:ℝ)*f h := by
      rw [directionIndices,Finset.sum_sigma]
      simp only [Finset.sum_const,nsmul_eq_mul]
    _ ≤ _ := Finset.sum_le_sum (fun h hh => mul_le_mul_of_nonneg_right
      (by exact_mod_cast primitiveShell_card_le h (Finset.mem_Ico.mp hh).1) (hf h hh))

def heightMomentEnvelope (n : ℕ) (B δ : ℝ) (m h : ℕ) : ℝ :=
  (2/(2+δ*(h:ℝ)))^m +
    ∑ a ∈ Finset.Ico 1 m, B^(m-a)*(a:ℝ)^m*(2*(n:ℝ)/(h:ℝ))^a/(δ*(n:ℝ))^m

theorem heightMomentEnvelope_nonneg (n : ℕ) (B δ : ℝ) (hB : 0 ≤ B) (hδ : 0 ≤ δ) (m h : ℕ) :
    0 ≤ heightMomentEnvelope n B δ m h := by
  unfold heightMomentEnvelope
  positivity

theorem cell_ratio_le_height (n h : ℕ) (hn : 0 < n) (hh : 0 < h)
    (ℓ δ : ℝ) (hℓ : 0 ≤ ℓ) (hδ : 0 < δ) (hbound : ℓ ≤ 2*(n:ℝ)/(h:ℝ)) :
    ℓ/(ℓ+δ*(n:ℝ)) ≤ 2/(2+δ*(h:ℝ)) := by
  have hnR : 0 < (n:ℝ) := by exact_mod_cast hn
  have hhR : 0 < (h:ℝ) := by exact_mod_cast hh
  have hb := (le_div_iff₀ hhR).mp hbound
  apply (div_le_div_iff₀ (by positivity) (by positivity)).mpr
  nlinarith [mul_le_mul_of_nonneg_left hb hδ.le]

theorem section_moment_height_bound (n h : ℕ) (hn : 0 < n) (hh : 0 < h)
    (B ℓ δ : ℝ) (hB : 0 ≤ B) (hℓ : 0 ≤ ℓ) (hδ : 0 < δ)
    (hbound : ℓ ≤ 2*(n:ℝ)/(h:ℝ)) (m : ℕ) :
    (ℓ^m + ∑ a ∈ Finset.Ico 1 m, B^(m-a)*(a:ℝ)^m*ℓ^a)/(ℓ+δ*(n:ℝ))^m ≤
      heightMomentEnvelope n B δ m h := by
  have hnR : 0 < (n:ℝ) := by exact_mod_cast hn
  have hhR : 0 < (h:ℝ) := by exact_mod_cast hh
  have hA : 0 < ℓ+δ*(n:ℝ) := by positivity
  rw [add_div,Finset.sum_div]
  apply add_le_add
  · rw [←div_pow]
    exact pow_le_pow_left₀ (by positivity) (cell_ratio_le_height n h hn hh ℓ δ hℓ hδ hbound) m
  · apply Finset.sum_le_sum
    intro a ha
    apply (div_le_div_of_nonneg_right
      (mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hℓ hbound a) (by positivity)) (pow_nonneg hA.le m)).trans
    exact div_le_div_of_nonneg_left (by positivity) (pow_pos (mul_pos hδ hnR) m)
      (pow_le_pow_left₀ (by positivity) (le_add_of_nonneg_left hℓ) m)

end NoThreeLine.SectionHeight
#print axioms NoThreeLine.SectionHeight.rootLine_section_card_le
#print axioms NoThreeLine.SectionHeight.sum_rootLine_height_le
#print axioms NoThreeLine.SectionHeight.section_moment_height_bound
