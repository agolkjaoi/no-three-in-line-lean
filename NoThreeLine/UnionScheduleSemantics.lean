import NoThreeLine.FiniteDurationSchedule
import NoThreeLine.GridCutTree

/-! Integrability and pointwise containment of actual accepted-union masks.
The same common finite boundary is erased on both sides of each comparison. -/
set_option autoImplicit false
open MeasureTheory Set
noncomputable section
namespace NoThreeLine

theorem rectangleUnionMask_bounds {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (V H : Finset ℝ) (x y : ℝ) :
    0 ≤ rectangleUnionMask S R V H x y ∧ rectangleUnionMask S R V H x y ≤ 1 := by
  classical
  by_cases hb : x ∈ V ∨ y ∈ H
  · simp [rectangleUnionMask,eraseGrid,hb]
  · by_cases hi : (x,y) ∈ interior (closedRectangleUnion S R) <;>
      simp [rectangleUnionMask,eraseGrid,hb,hi]

theorem rectangleUnionMask_mono {ι κ : Type*} (S : Finset ι) (T : Finset κ)
    (R : ι → Rect) (Q : κ → Rect) (V H : Finset ℝ)
    (hsub : closedRectangleUnion S R ⊆ closedRectangleUnion T Q) (x y : ℝ) :
    rectangleUnionMask S R V H x y ≤ rectangleUnionMask T Q V H x y := by
  classical
  have hi := interior_mono hsub
  by_cases hb : x ∈ V ∨ y ∈ H
  · simp [rectangleUnionMask,eraseGrid,hb]
  · by_cases hs : (x,y) ∈ interior (closedRectangleUnion S R)
    · have ht := hi hs
      simp [rectangleUnionMask,eraseGrid,hb,hs,ht]
    · by_cases ht : (x,y) ∈ interior (closedRectangleUnion T Q) <;>
        simp [rectangleUnionMask,eraseGrid,hb,hs,ht]

theorem gridUnionMask_le_of_cover {n m : ℕ} (G : ℕ) (hG : 0 < G)
    (R : Fin n → GridBox) (A : Fin m → GridBox) (cover : Fin n → Fin m)
    (hc : ∀ i, (A (cover i)).ContainsBox (R i)) (V H : Finset ℝ) (x y : ℝ) :
    rectangleUnionMask Finset.univ (fun i => ((R i).qrect G).real) V H x y ≤
      rectangleUnionMask Finset.univ (fun i => ((A i).qrect G).real) V H x y := by
  apply rectangleUnionMask_mono
  rintro z ⟨i,hi,hz⟩
  exact ⟨cover i,Finset.mem_univ _,
    ((A (cover i)).qrect G).containsBox_real_subset ((R i).qrect G)
      ((A (cover i)).contains_qrect G hG (R i) (hc i)) hz⟩

theorem gridUnionCheck_integrable {n m : ℕ} (G : ℕ) (hG : 0 < G)
    (R : Fin n → GridBox) (A : Fin m → GridBox)
    (cover : Fin n → Fin m) (source : Fin m → Fin n)
    (hc : gridUnionCheck G R A cover source = true) :
    Integrable (fun z : ℝ × ℝ => rectangleUnionMask Finset.univ
      (fun i => ((R i).qrect G).real) (commonGridLines G) (commonGridLines G) z.1 z.2) := by
  have he := qUnionNormalizationCheck_mask (fun i => (R i).qrect G)
    (fun i => (A i).qrect G) cover source (gridUnionCheck_sound G hG R A cover source hc)
    (commonGridLines G) (commonGridLines G)
    (fun j => (A j).endpoints_commonGrid G (gridUnionCheck_valid G R A cover source hc j))
  simp_rw [he]
  exact (rectangleField_plane_integrable Finset.univ (fun i => ((A i).qrect G).real)
    (fun _ => 1)).congr (eraseGrid_plane_ae _ _ _).symm

end NoThreeLine

#print axioms NoThreeLine.gridUnionMask_le_of_cover
#print axioms NoThreeLine.gridUnionCheck_integrable
