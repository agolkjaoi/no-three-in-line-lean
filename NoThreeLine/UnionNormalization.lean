import NoThreeLine.RectangleUnion

/-! A small finite witness verifies a union normalization. Each output box is
an input box; every input box is contained in its nominated output box; output
open boxes are separated. No union-area number is accepted without these checks. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
namespace NoThreeLine

def QRect.ContainsBox (A R : QRect) : Prop :=
  A.x0 ≤ R.x0 ∧ R.x1 ≤ A.x1 ∧ A.y0 ≤ R.y0 ∧ R.y1 ≤ A.y1

def QRect.QSeparated (A R : QRect) : Prop :=
  A.x1 ≤ R.x0 ∨ R.x1 ≤ A.x0 ∨ A.y1 ≤ R.y0 ∨ R.y1 ≤ A.y0

def QRect.QUnit (R : QRect) : Prop :=
  0 ≤ R.x0 ∧ R.x0 ≤ R.x1 ∧ R.x1 ≤ 1 ∧
    0 ≤ R.y0 ∧ R.y0 ≤ R.y1 ∧ R.y1 ≤ 1

instance (A R : QRect) : Decidable (A.ContainsBox R) := by unfold QRect.ContainsBox; infer_instance
instance (A R : QRect) : Decidable (A.QSeparated R) := by unfold QRect.QSeparated; infer_instance
instance (R : QRect) : Decidable R.QUnit := by unfold QRect.QUnit; infer_instance

def qUnionNormalizationCheck {n m : ℕ} (R : Fin n → QRect) (A : Fin m → QRect)
    (cover : Fin n → Fin m) (source : Fin m → Fin n) : Bool :=
  decide ((∀ j, A j = R (source j)) ∧ (∀ i, (A (cover i)).ContainsBox (R i)) ∧
    (∀ j, (A j).QUnit) ∧ (∀ i j, i ≠ j → (A i).QSeparated (A j)))

def qUnionArea {m : ℕ} (A : Fin m → QRect) : ℚ :=
  ∑ j, ((A j).x1-(A j).x0)*((A j).y1-(A j).y0)

noncomputable section

theorem QRect.containsBox_real_subset (A R : QRect) (h : A.ContainsBox R) :
    R.real.closedSet ⊆ A.real.closedSet := by
  have hc : (A.x0 : ℝ) ≤ R.x0 ∧ (R.x1 : ℝ) ≤ A.x1 ∧
      (A.y0 : ℝ) ≤ R.y0 ∧ (R.y1 : ℝ) ≤ A.y1 := by
    exact_mod_cast h
  intro z hz
  exact ⟨⟨hc.1.trans hz.1.1,hz.1.2.trans hc.2.1⟩,
    ⟨hc.2.2.1.trans hz.2.1,hz.2.2.trans hc.2.2.2⟩⟩

theorem QRect.qUnit_real (R : QRect) (h : R.QUnit) : R.real.InUnitSquare := by
  dsimp [Rect.InUnitSquare,QRect.real]
  exact_mod_cast h

theorem QRect.qSeparated_real (A R : QRect) (h : A.QSeparated R) : A.real.Separated R.real := by
  dsimp [Rect.Separated,QRect.real]
  exact_mod_cast h

theorem qUnionNormalizationCheck_sound {n m : ℕ} (R : Fin n → QRect) (A : Fin m → QRect)
    (cover : Fin n → Fin m) (source : Fin m → Fin n)
    (hc : qUnionNormalizationCheck R A cover source = true) :
    closedRectangleUnion Finset.univ (fun i => (R i).real) =
        closedRectangleUnion Finset.univ (fun i => (A i).real) ∧
      RectanglesSeparated Finset.univ (fun i => (A i).real) ∧
      (∀ j, (A j).real.InUnitSquare) := by
  have hh : (∀ j, A j = R (source j)) ∧ (∀ i, (A (cover i)).ContainsBox (R i)) ∧
      (∀ j, (A j).QUnit) ∧ (∀ i j, i ≠ j → (A i).QSeparated (A j)) := by
    simpa only [qUnionNormalizationCheck,decide_eq_true_eq] using hc
  refine ⟨?_,?_,fun j => (A j).qUnit_real (hh.2.2.1 j)⟩
  · apply Set.Subset.antisymm
    · rintro z ⟨i,hi,hz⟩
      exact ⟨cover i,Finset.mem_univ _,(A (cover i)).containsBox_real_subset (R i) (hh.2.1 i) hz⟩
    · rintro z ⟨j,hj,hz⟩
      refine ⟨source j,Finset.mem_univ _,?_⟩
      simpa only [hh.1 j] using hz
  · intro i hi j hj hij
    exact (A i).qSeparated_real (A j) (hh.2.2.2 i j hij)

theorem qUnionNormalizationCheck_mask {n m : ℕ} (R : Fin n → QRect) (A : Fin m → QRect)
    (cover : Fin n → Fin m) (source : Fin m → Fin n)
    (hc : qUnionNormalizationCheck R A cover source = true)
    (V H : Finset ℝ) (hb : ∀ j, (A j).real.EndpointsOn V H) :
    rectangleUnionMask Finset.univ (fun i => (R i).real) V H =
      eraseGrid V H (rectangleField Finset.univ (fun j => (A j).real) (fun _ => 1)) := by
  have hs := qUnionNormalizationCheck_sound R A cover source hc
  have he : rectangleUnionMask Finset.univ (fun i => (R i).real) V H =
      rectangleUnionMask Finset.univ (fun i => (A i).real) V H := by
    unfold rectangleUnionMask
    rw [hs.1]
  rw [he]
  exact rectangleUnionMask_eq_field Finset.univ _ V H (fun j _ => hb j) hs.2.1

theorem qUnionNormalizationCheck_area {n m : ℕ} (R : Fin n → QRect) (A : Fin m → QRect)
    (cover : Fin n → Fin m) (source : Fin m → Fin n)
    (hc : qUnionNormalizationCheck R A cover source = true)
    (V H : Finset ℝ) (hb : ∀ j, (A j).real.EndpointsOn V H) :
    (∫ z : ℝ × ℝ, rectangleUnionMask Finset.univ (fun i => (R i).real) V H z.1 z.2) =
      (qUnionArea A : ℝ) := by
  rw [qUnionNormalizationCheck_mask R A cover source hc V H hb,
    eraseGrid_plane_integral_eq,rectangleField_plane_integral]
  have hv := (qUnionNormalizationCheck_sound R A cover source hc).2.2
  unfold qUnionArea
  push_cast
  apply Finset.sum_congr rfl
  intro j hj
  rw [one_mul,Rect.area_of_ordered _ (hv j).2.1 (hv j).2.2.2.2.1]
  rfl

end
end NoThreeLine

#print axioms NoThreeLine.qUnionNormalizationCheck_mask
#print axioms NoThreeLine.qUnionNormalizationCheck_area
