import NoThreeLine.GridShellChord

/-! The actual two axis chords are bounded directly. No invariance under
erasing grid boundary lines is asserted for either axis. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.FiniteDirections
open PrimitiveLines

def horizontalAxis : Σ _h : ℕ, ZPoint := ⟨1,(1,0)⟩
def verticalAxis : Σ _h : ℕ, ZPoint := ⟨1,(0,1)⟩

theorem axis_indices_subset (n : ℕ) :
    (directionIndices n).filter (fun d => ¬(d.2.1 ≠ 0 ∧ d.2.2 ≠ 0)) ⊆
      {horizontalAxis,verticalAxis} := by
  classical
  intro d hd
  obtain ⟨hd,haxis⟩ := Finset.mem_filter.mp hd
  have hheight := Finset.mem_Ico.mp (Finset.mem_sigma.mp hd).1
  obtain ⟨hs,hp⟩ := Finset.mem_filter.mp (Finset.mem_sigma.mp hd).2
  have hzero : d.2.1=0 ∨ d.2.2=0 := by tauto
  rcases (mem_rawShell d.1 d.2).mp hs with hs | hs
  · have hy : d.2.2=0 := by omega
    have hh : d.1=1 := by simpa [Primitive,hs.1,hy] using hp
    have he : d=horizontalAxis := by
      apply Sigma.ext hh
      apply heq_of_eq
      apply Prod.ext <;> dsimp [horizontalAxis] <;> omega
    simp [he]
  · have hx : d.2.1=0 := by omega
    have hh : d.1=1 := by simpa [Primitive,hs.1,hx] using hp
    have he : d=verticalAxis := by
      apply Sigma.ext hh
      apply heq_of_eq
      apply Prod.ext <;> dsimp [verticalAxis] <;> omega
    simp [he]

theorem axis_chord_sum_le {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (M : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R)
    (hw : ∀ r i, i ∈ S → 0 ≤ w r i ∧ w r i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    (∑ d ∈ (directionIndices n).filter (fun d => ¬(d.2.1 ≠ 0 ∧ d.2.2 ≠ 0)),
      (shellChord S R w p d)^2/(d.1 : ℝ)^2) ≤ 8*M^2 := by
  classical
  calc
    _ ≤ ∑ d ∈ {horizontalAxis,verticalAxis}, (shellChord S R w p d)^2/(d.1 : ℝ)^2 :=
      Finset.sum_le_sum_of_subset_of_nonneg (axis_indices_subset n)
        (fun _ _ _ => by positivity)
    _ ≤ _ := by
      have hH := shellChord_square_cap S R w p horizontalAxis M hM hsep hw hR
      have hV := shellChord_square_cap S R w p verticalAxis M hM hsep hw hR
      rw [Finset.sum_pair (by decide : horizontalAxis ≠ verticalAxis)]
      have hh : horizontalAxis.fst=1 := rfl
      have hv : verticalAxis.fst=1 := rfl
      rw [hh,hv]
      norm_num only [Nat.cast_one,one_pow,div_one]
      linarith

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.axis_chord_sum_le
