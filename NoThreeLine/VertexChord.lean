import NoThreeLine.Rectangle

/-! C01: the actual open-rectangle chord has the four-corner positive-part
formula. This is derived from the exact intersection interval, not assumed. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section

namespace NoThreeLine

theorem interval_overlap_positivePart (a b c d : ℝ) (hab : a ≤ b) (hcd : c ≤ d) :
    max 0 (min b d - max a c) =
      -max 0 (a-c) + max 0 (b-c) + max 0 (a-d) - max 0 (b-d) := by
  simp only [max_def,min_def]
  split_ifs <;> linarith

theorem positivePart_affine (x y v u : ℝ) (hu : 0 < u) :
    max 0 (v-y+u*x) = u * max 0 (x-(y-v)/u) := by
  rw [mul_max_of_nonneg _ _ hu.le, mul_zero]
  congr 1
  field_simp
  ring

namespace Rect

def vertex (R : Rect) (k : Fin 4) : ℝ × ℝ :=
  ![(R.x0,R.y0),(R.x1,R.y0),(R.x0,R.y1),(R.x1,R.y1)] k

def vertexSign (k : Fin 4) : ℝ := ![-1,1,1,-1] k

def vertexSum (R : Rect) (v u : ℝ) : ℝ :=
  ∑ k : Fin 4, vertexSign k * max 0 (v-(R.vertex k).2+u*(R.vertex k).1)

theorem vertexSum_eq_four (R : Rect) (v u : ℝ) :
    R.vertexSum v u =
      -max 0 (v-R.y0+u*R.x0) + max 0 (v-R.y0+u*R.x1) +
       max 0 (v-R.y1+u*R.x0) - max 0 (v-R.y1+u*R.x1) := by
  simp [vertexSum,vertex,vertexSign,Fin.sum_univ_succ]
  ring

theorem vertexSum_eq_mul_chordLength (R : Rect) (v u : ℝ)
    (hx : R.x0 ≤ R.x1) (hy : R.y0 ≤ R.y1) (hu : 0 < u) :
    R.vertexSum v u = u * R.chordLength v u := by
  rw [vertexSum_eq_four]
  simp_rw [positivePart_affine _ _ v u hu]
  unfold chordLength upper lower
  rw [interval_overlap_positivePart R.x0 R.x1 ((R.y0-v)/u) ((R.y1-v)/u)
    hx (div_le_div_of_nonneg_right (sub_le_sub_right hy v) hu.le)]
  ring

theorem chordLength_eq_vertexSum (R : Rect) (v u : ℝ)
    (hx : R.x0 ≤ R.x1) (hy : R.y0 ≤ R.y1) (hu : 0 < u) :
    R.chordLength v u = (1/u) * R.vertexSum v u := by
  rw [vertexSum_eq_mul_chordLength R v u hx hy hu]
  field_simp

theorem chord_eq_vertexSum (R : Rect) (w v u : ℝ)
    (hx : R.x0 ≤ R.x1) (hy : R.y0 ≤ R.y1) (hu : 0 < u) :
    R.chord w v u = (w/u) * R.vertexSum v u := by
  rw [chord_eq_length R w v u hu, chordLength_eq_vertexSum R v u hx hy hu]
  ring

theorem chord_eq_four_vertices (R : Rect) (w v u : ℝ)
    (hx : R.x0 ≤ R.x1) (hy : R.y0 ≤ R.y1) (hu : 0 < u) :
    R.chord w v u = (w/u) *
      (-max 0 (v-R.y0+u*R.x0) + max 0 (v-R.y0+u*R.x1) +
       max 0 (v-R.y1+u*R.x0) - max 0 (v-R.y1+u*R.x1)) := by
  rw [chord_eq_vertexSum R w v u hx hy hu,vertexSum_eq_four]

end Rect

theorem rectangleField_chord_eq_vertexSum {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (v u : ℝ)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (v+u*t)) =
      (1/u) * ∑ i ∈ S, w i * (R i).vertexSum v u := by
  rw [rectangleField_chord S R w v u hu,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hi
  rw [(R i).chordLength_eq_vertexSum v u (hR i hi).1 (hR i hi).2 hu]
  ring

/-- Group repeated locations by summing their signed coefficients. The image
does not discard multiplicity: it is retained by each filtered fiber sum. -/
theorem finite_weighted_grouping {α β : Type*} [DecidableEq β] (T : Finset α) (p : α → β)
    (w : α → ℝ) (f : β → ℝ) :
    (∑ z ∈ T, w z * f (p z)) =
      ∑ q ∈ T.image p, (∑ z ∈ T.filter (fun z => p z = q), w z) * f q := by
  classical
  symm
  calc
    _ = ∑ q ∈ T.image p, ∑ z ∈ T.filter (fun z => p z = q), w z * f (p z) := by
      apply Finset.sum_congr rfl
      intro q _
      rw [Finset.sum_mul]
      apply Finset.sum_congr rfl
      intro z hz
      rw [(Finset.mem_filter.mp hz).2]
    _ = _ := Finset.sum_fiberwise_of_maps_to (fun z hz => Finset.mem_image_of_mem p hz) _

def cornerIndex {ι : Type*} (S : Finset ι) : Finset (ι × Fin 4) :=
  S.product Finset.univ

def cornerLocation {ι : Type*} (R : ι → Rect) (z : ι × Fin 4) : ℝ × ℝ :=
  (R z.1).vertex z.2

def cornerCoefficient {ι : Type*} (w : ι → ℝ) (z : ι × Fin 4) : ℝ :=
  w z.1 * Rect.vertexSign z.2

def vertexSet {ι : Type*} (S : Finset ι) (R : ι → Rect) : Finset (ℝ × ℝ) := by
  classical
  exact (cornerIndex S).image (cornerLocation R)

/-- The coefficient at a shared vertex is the sum of all incident corner
coefficients, including cancellation and coincident corners of degenerate cells. -/
def vertexCoefficient {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (p : ℝ × ℝ) : ℝ := by
  classical
  exact ∑ z ∈ (cornerIndex S).filter (fun z => cornerLocation R z = p), cornerCoefficient w z

theorem weighted_vertexSum_eq_corners {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (v u : ℝ) :
    (∑ i ∈ S, w i * (R i).vertexSum v u) =
      ∑ z ∈ cornerIndex S, cornerCoefficient w z *
        max 0 (v-(cornerLocation R z).2+u*(cornerLocation R z).1) := by
  unfold cornerIndex
  rw [Finset.product_eq_sprod,Finset.sum_product]
  apply Finset.sum_congr rfl
  intro i _
  unfold Rect.vertexSum
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k _
  unfold cornerCoefficient cornerLocation
  ring

theorem weighted_vertexSum_eq_grouped {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (v u : ℝ) :
    (∑ i ∈ S, w i * (R i).vertexSum v u) =
      ∑ p ∈ vertexSet S R, vertexCoefficient S R w p * max 0 (v-p.2+u*p.1) := by
  classical
  rw [weighted_vertexSum_eq_corners]
  exact finite_weighted_grouping (cornerIndex S) (cornerLocation R)
    (cornerCoefficient w) (fun p => max 0 (v-p.2+u*p.1))

/-- C01 for an actual finite rectangular field, with shared vertices combined. -/
theorem rectangleField_chord_eq_groupedVertices {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (v u : ℝ)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (v+u*t)) =
      (1/u) * ∑ p ∈ vertexSet S R,
        vertexCoefficient S R w p * max 0 (v-p.2+u*p.1) := by
  rw [rectangleField_chord_eq_vertexSum S R w v u hR hu,weighted_vertexSum_eq_grouped]

end NoThreeLine

#print axioms NoThreeLine.interval_overlap_positivePart
#print axioms NoThreeLine.Rect.chord_eq_four_vertices
#print axioms NoThreeLine.rectangleField_chord_eq_vertexSum
#print axioms NoThreeLine.finite_weighted_grouping
#print axioms NoThreeLine.rectangleField_chord_eq_groupedVertices
