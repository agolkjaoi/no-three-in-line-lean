import NoThreeLine481.KnotEnvelope

/-! Integer fixed-slope slice soundness. The coordinate and coefficient
hypotheses are the interface to a finite corner table. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine

def projectedKnot (p q x y : ℤ) : ℤ := q*y-p*x

def chordNumerator {ι : Type*} (S : Finset ι) (X Y C : ι → ℤ) (p q t : ℤ) : ℤ :=
  ∑ i ∈ S, C i * max 0 (t-projectedKnot p q (X i) (Y i))

private theorem projectedKnot_real (p q G x y : ℤ) (hq : 0 < q) (hG : 0 < G) :
    (y:ℝ)/G-((p:ℝ)/q)*((x:ℝ)/G) = (projectedKnot p q x y:ℝ)/((q:ℝ)*G) := by
  have hq' : (0:ℝ) < q := by exact_mod_cast hq
  have hG' : (0:ℝ) < G := by exact_mod_cast hG
  unfold projectedKnot
  push_cast
  field_simp [hq'.ne', hG'.ne']

theorem rectangular_chord_eq_integer_slice {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (X Y C : ℝ × ℝ → ℤ)
    (p q G t : ℤ) (c : ℝ) (hp : 0 < p) (hq : 0 < q) (hG : 0 < G)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hcorner : ∀ i ∈ vertexSet S R, i.1 = (X i:ℝ)/G ∧ i.2 = (Y i:ℝ)/G ∧
      vertexCoefficient S R w i = c*(C i:ℝ)) :
    (∫ x : ℝ, rectangleField S R w x ((t:ℝ)/((q:ℝ)*G)+((p:ℝ)/q)*x)) =
      c*(chordNumerator (vertexSet S R) X Y C p q t:ℝ)/((p:ℝ)*G) := by
  have hp' : (0:ℝ) < p := by exact_mod_cast hp
  have hq' : (0:ℝ) < q := by exact_mod_cast hq
  rw [rectangleField_chord_eq_hingeSum _ _ _ _ _ hR (div_pos hp' hq'), hingeSum]
  unfold chordNumerator
  push_cast
  rw [Finset.mul_sum, Finset.sum_div]
  apply Finset.sum_congr rfl
  intro i hi
  obtain ⟨hx,hy,hc⟩ := hcorner i hi
  rw [hx,hy,hc]
  have hs := scaled_integer_hinge (C i) (X i) (Y i) t p q G hp hq hG
  calc
    _ = c*hinge (C i:ℝ) ((Y i:ℝ)/G-((p:ℝ)/q)*((X i:ℝ)/G))
      ((p:ℝ)/q) ((t:ℝ)/((q:ℝ)*G)) := by unfold hinge; ring
    _ = _ := by
      rw [hs]
      simp only [projectedKnot]
      push_cast
      ring

theorem rectangular_chord_le_of_integer_slice {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (X Y C : ℝ × ℝ → ℤ)
    (p q G L H U : ℤ) (c v : ℝ) (hp : 0 < p) (hq : 0 < q) (hG : 0 < G) (hc : 0 ≤ c)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hcorner : ∀ i ∈ vertexSet S R, i.1 = (X i:ℝ)/G ∧ i.2 = (Y i:ℝ)/G ∧
      vertexCoefficient S R w i = c*(C i:ℝ))
    (hv : v ∈ Icc ((L:ℝ)/((q:ℝ)*G)) ((H:ℝ)/((q:ℝ)*G)))
    (hL : chordNumerator (vertexSet S R) X Y C p q L ≤ U)
    (hH : chordNumerator (vertexSet S R) X Y C p q H ≤ U)
    (hK : ∀ i ∈ vertexSet S R, L ≤ projectedKnot p q (X i) (Y i) →
      projectedKnot p q (X i) (Y i) ≤ H →
      chordNumerator (vertexSet S R) X Y C p q (projectedKnot p q (X i) (Y i)) ≤ U) :
    (∫ x : ℝ, rectangleField S R w x (v+((p:ℝ)/q)*x)) ≤ c*(U:ℝ)/((p:ℝ)*G) := by
  have hp' : (0:ℝ) < p := by exact_mod_cast hp
  have hq' : (0:ℝ) < q := by exact_mod_cast hq
  have hG' : (0:ℝ) < G := by exact_mod_cast hG
  have hcut (t : ℤ) (ht : chordNumerator (vertexSet S R) X Y C p q t ≤ U) :
      (∫ x : ℝ, rectangleField S R w x ((t:ℝ)/((q:ℝ)*G)+((p:ℝ)/q)*x)) ≤
        c*(U:ℝ)/((p:ℝ)*G) := by
    rw [rectangular_chord_eq_integer_slice S R w X Y C p q G t c hp hq hG hR hcorner]
    exact div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left (by exact_mod_cast ht) hc)
      (mul_pos hp' hG').le
  apply rectangular_chord_le_of_knots S R w _ _ v _ _ hR (div_pos hp' hq') hv
    (hcut L hL) (hcut H hH)
  intro i hi hk
  have he : i.2-((p:ℝ)/q)*i.1 = (projectedKnot p q (X i) (Y i):ℝ)/((q:ℝ)*G) := by
    rw [(hcorner i hi).1,(hcorner i hi).2.1]
    exact projectedKnot_real p q G (X i) (Y i) hq hG
  rw [he] at hk ⊢
  exact hcut _ (hK i hi
    (by exact_mod_cast (div_le_div_iff_of_pos_right (mul_pos hq' hG')).mp hk.1)
    (by exact_mod_cast (div_le_div_iff_of_pos_right (mul_pos hq' hG')).mp hk.2))

#print axioms rectangular_chord_eq_integer_slice
#print axioms rectangular_chord_le_of_integer_slice


private def integerSliceCandidates {ι : Type*} (S : Finset ι) (X Y : ι → ℤ)
    (p q L H : ℤ) : Finset ℤ :=
  insert L (insert H ((S.image (fun i => projectedKnot p q (X i) (Y i))).filter
    (fun t => L ≤ t ∧ t ≤ H)))

/-- A direct finite maximum. A sweep implementation can replace the
evaluation once it is proved to return the same integers. -/
def integerSliceUpper {ι : Type*} (S : Finset ι) (X Y C : ι → ℤ)
    (p q L H : ℤ) : ℤ :=
  (integerSliceCandidates S X Y p q L H).sup'
    ⟨L,Finset.mem_insert_self _ _⟩ (chordNumerator S X Y C p q)

theorem rectangular_chord_le_integerSliceUpper {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (X Y C : ℝ × ℝ → ℤ)
    (p q G L H : ℤ) (c v : ℝ) (hp : 0 < p) (hq : 0 < q) (hG : 0 < G) (hc : 0 ≤ c)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hcorner : ∀ i ∈ vertexSet S R, i.1 = (X i:ℝ)/G ∧ i.2 = (Y i:ℝ)/G ∧
      vertexCoefficient S R w i = c*(C i:ℝ))
    (hv : v ∈ Icc ((L:ℝ)/((q:ℝ)*G)) ((H:ℝ)/((q:ℝ)*G))) :
    (∫ x : ℝ, rectangleField S R w x (v+((p:ℝ)/q)*x)) ≤
      c*(integerSliceUpper (vertexSet S R) X Y C p q L H:ℝ)/((p:ℝ)*G) := by
  apply rectangular_chord_le_of_integer_slice S R w X Y C p q G L H _ c v hp hq hG hc hR hcorner hv
  · apply Finset.le_sup'
    exact Finset.mem_insert_self _ _
  · apply Finset.le_sup'
    exact Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)
  · intro i hi hL hH
    apply Finset.le_sup'
    exact Finset.mem_insert_of_mem (Finset.mem_insert_of_mem
      (Finset.mem_filter.mpr ⟨Finset.mem_image_of_mem _ hi,hL,hH⟩))

#print axioms rectangular_chord_le_integerSliceUpper

end NoThreeLine481
