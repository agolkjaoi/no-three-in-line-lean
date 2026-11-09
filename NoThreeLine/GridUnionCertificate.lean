import NoThreeLine.UnionNormalization

/-! Integer-coordinate union witnesses avoid repeated rational normalization
inside the kernel. Soundness converts every integer comparison to its rational
rectangle meaning and includes all common grid boundary lines. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
namespace NoThreeLine

structure GridBox where
  x0 : ℕ
  x1 : ℕ
  y0 : ℕ
  y1 : ℕ
  deriving DecidableEq, Repr

def GridBox.qrect (G : ℕ) (R : GridBox) : QRect :=
  ⟨(R.x0 : ℚ)/G,(R.x1 : ℚ)/G,(R.y0 : ℚ)/G,(R.y1 : ℚ)/G⟩

def GridBox.Valid (G : ℕ) (R : GridBox) : Prop :=
  R.x0 ≤ R.x1 ∧ R.x1 ≤ G ∧ R.y0 ≤ R.y1 ∧ R.y1 ≤ G
def GridBox.ContainsBox (A R : GridBox) : Prop :=
  A.x0 ≤ R.x0 ∧ R.x1 ≤ A.x1 ∧ A.y0 ≤ R.y0 ∧ R.y1 ≤ A.y1
def GridBox.Separated (A R : GridBox) : Prop :=
  A.x1 ≤ R.x0 ∨ R.x1 ≤ A.x0 ∨ A.y1 ≤ R.y0 ∨ R.y1 ≤ A.y0

instance (G : ℕ) (R : GridBox) : Decidable (R.Valid G) := by unfold GridBox.Valid; infer_instance
instance (A R : GridBox) : Decidable (A.ContainsBox R) := by unfold GridBox.ContainsBox; infer_instance
instance (A R : GridBox) : Decidable (A.Separated R) := by unfold GridBox.Separated; infer_instance

def gridUnionCheck {n m : ℕ} (G : ℕ) (R : Fin n → GridBox) (A : Fin m → GridBox)
    (cover : Fin n → Fin m) (source : Fin m → Fin n) : Bool :=
  decide ((∀ j, A j = R (source j)) ∧ (∀ i, (A (cover i)).ContainsBox (R i)) ∧
    (∀ j, (A j).Valid G) ∧ (∀ i j, i ≠ j → (A i).Separated (A j)))

def gridUnionAreaUnits {m : ℕ} (A : Fin m → GridBox) : ℕ :=
  ∑ j, ((A j).x1-(A j).x0)*((A j).y1-(A j).y0)

theorem GridBox.valid_qrect (G : ℕ) (hG : 0 < G) (R : GridBox) (h : R.Valid G) :
    (R.qrect G).QUnit := by
  have hg : (0 : ℚ) < G := by exact_mod_cast hG
  dsimp [QRect.QUnit,GridBox.qrect]
  refine ⟨div_nonneg (Nat.cast_nonneg _) hg.le,?_,?_,
    div_nonneg (Nat.cast_nonneg _) hg.le,?_,?_⟩
  · exact (div_le_div_iff_of_pos_right hg).mpr (by exact_mod_cast h.1)
  · exact (div_le_one hg).mpr (by exact_mod_cast h.2.1)
  · exact (div_le_div_iff_of_pos_right hg).mpr (by exact_mod_cast h.2.2.1)
  · exact (div_le_one hg).mpr (by exact_mod_cast h.2.2.2)

theorem GridBox.contains_qrect (G : ℕ) (hG : 0 < G) (A R : GridBox) (h : A.ContainsBox R) :
    (A.qrect G).ContainsBox (R.qrect G) := by
  have hg : (0 : ℚ) < G := by exact_mod_cast hG
  dsimp [QRect.ContainsBox,GridBox.qrect]
  exact ⟨(div_le_div_iff_of_pos_right hg).mpr (by exact_mod_cast h.1),
    (div_le_div_iff_of_pos_right hg).mpr (by exact_mod_cast h.2.1),
    (div_le_div_iff_of_pos_right hg).mpr (by exact_mod_cast h.2.2.1),
    (div_le_div_iff_of_pos_right hg).mpr (by exact_mod_cast h.2.2.2)⟩

theorem GridBox.separated_qrect (G : ℕ) (hG : 0 < G) (A R : GridBox) (h : A.Separated R) :
    (A.qrect G).QSeparated (R.qrect G) := by
  have hg : (0 : ℚ) < G := by exact_mod_cast hG
  dsimp [QRect.QSeparated,GridBox.qrect]
  rcases h with h | h | h | h
  · exact Or.inl ((div_le_div_iff_of_pos_right hg).mpr (by exact_mod_cast h))
  · exact Or.inr (Or.inl ((div_le_div_iff_of_pos_right hg).mpr (by exact_mod_cast h)))
  · exact Or.inr (Or.inr (Or.inl ((div_le_div_iff_of_pos_right hg).mpr (by exact_mod_cast h))))
  · exact Or.inr (Or.inr (Or.inr ((div_le_div_iff_of_pos_right hg).mpr (by exact_mod_cast h))))

theorem gridUnionCheck_sound {n m : ℕ} (G : ℕ) (hG : 0 < G)
    (R : Fin n → GridBox) (A : Fin m → GridBox)
    (cover : Fin n → Fin m) (source : Fin m → Fin n)
    (hc : gridUnionCheck G R A cover source = true) :
    qUnionNormalizationCheck (fun i => (R i).qrect G) (fun j => (A j).qrect G) cover source = true := by
  have hh : (∀ j, A j = R (source j)) ∧ (∀ i, (A (cover i)).ContainsBox (R i)) ∧
      (∀ j, (A j).Valid G) ∧ (∀ i j, i ≠ j → (A i).Separated (A j)) := by
    simpa only [gridUnionCheck,decide_eq_true_eq] using hc
  apply decide_eq_true_eq.mpr
  refine ⟨fun j => congrArg (GridBox.qrect G) (hh.1 j),
    fun i => (A (cover i)).contains_qrect G hG (R i) (hh.2.1 i),
    fun j => (A j).valid_qrect G hG (hh.2.2.1 j),
    fun i j hij => (A i).separated_qrect G hG (A j) (hh.2.2.2 i j hij)⟩

theorem gridUnionCheck_valid {n m : ℕ} (G : ℕ)
    (R : Fin n → GridBox) (A : Fin m → GridBox)
    (cover : Fin n → Fin m) (source : Fin m → Fin n)
    (hc : gridUnionCheck G R A cover source = true) (j : Fin m) : (A j).Valid G := by
  have hh : (∀ j, A j = R (source j)) ∧ (∀ i, (A (cover i)).ContainsBox (R i)) ∧
      (∀ j, (A j).Valid G) ∧ (∀ i j, i ≠ j → (A i).Separated (A j)) := by
    simpa only [gridUnionCheck,decide_eq_true_eq] using hc
  exact hh.2.2.1 j

noncomputable section

def commonGridLines (G : ℕ) : Finset ℝ :=
  (Finset.range (G+1)).image (fun k : ℕ => (k : ℝ)/G)

theorem GridBox.endpoints_commonGrid (G : ℕ) (R : GridBox) (h : R.Valid G) :
    (R.qrect G).real.EndpointsOn (commonGridLines G) (commonGridLines G) := by
  have hp (k : ℕ) (hk : k ≤ G) : (k : ℝ)/G ∈ commonGridLines G := by
    exact Finset.mem_image.mpr ⟨k,Finset.mem_range.mpr (Nat.lt_succ_iff.mpr hk),rfl⟩
  dsimp [Rect.EndpointsOn,QRect.real,GridBox.qrect]
  push_cast
  exact ⟨hp R.x0 (h.1.trans h.2.1),hp R.x1 h.2.1,
    hp R.y0 (h.2.2.1.trans h.2.2.2),hp R.y1 h.2.2.2⟩

theorem gridUnionArea_qrect {m : ℕ} (G : ℕ) (A : Fin m → GridBox)
    (hv : ∀ j, (A j).Valid G) :
    qUnionArea (fun j => (A j).qrect G) = (gridUnionAreaUnits A : ℚ)/(G : ℚ)^2 := by
  unfold qUnionArea gridUnionAreaUnits
  push_cast
  rw [Finset.sum_div]
  apply Finset.sum_congr rfl
  intro j hj
  rw [Nat.cast_sub (hv j).1,Nat.cast_sub (hv j).2.2.1]
  dsimp [GridBox.qrect]
  ring

theorem gridUnionCheck_area {n m : ℕ} (G : ℕ) (hG : 0 < G)
    (R : Fin n → GridBox) (A : Fin m → GridBox)
    (cover : Fin n → Fin m) (source : Fin m → Fin n)
    (hc : gridUnionCheck G R A cover source = true) :
    (∫ z : ℝ × ℝ, rectangleUnionMask Finset.univ (fun i => ((R i).qrect G).real)
      (commonGridLines G) (commonGridLines G) z.1 z.2) =
        (gridUnionAreaUnits A : ℝ)/(G : ℝ)^2 := by
  have hv := gridUnionCheck_valid G R A cover source hc
  rw [qUnionNormalizationCheck_area _ _ cover source (gridUnionCheck_sound G hG R A cover source hc)
    _ _ (fun j => (A j).endpoints_commonGrid G (hv j)),gridUnionArea_qrect G A hv]
  push_cast
  rfl

end
end NoThreeLine

#print axioms NoThreeLine.gridUnionCheck_sound
#print axioms NoThreeLine.gridUnionCheck_area
