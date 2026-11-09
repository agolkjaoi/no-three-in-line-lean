import NoThreeLine.EdgeVertices

set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section

namespace NoThreeLine

theorem weighted_grouping_on {α β : Type*} [DecidableEq β]
    (T : Finset α) (U : Finset β) (p : α → β) (w : α → ℝ) (f : β → ℝ)
    (hU : ∀ z ∈ T, p z ∈ U) :
    (∑ z ∈ T, w z * f (p z)) =
      ∑ q ∈ U, (∑ z ∈ T.filter (fun z => p z = q), w z) * f q := by
  classical
  symm
  calc
    _ = ∑ q ∈ U, ∑ z ∈ T.filter (fun z => p z = q), w z * f (p z) := by
      apply Finset.sum_congr rfl
      intro q _
      rw [Finset.sum_mul]
      apply Finset.sum_congr rfl
      intro z hz
      rw [(Finset.mem_filter.mp hz).2]
    _ = _ := Finset.sum_fiberwise_of_maps_to hU _

def edgeCornerIndex {ι : Type*} (S : Finset ι) : Finset (ι × Fin 2) := S.product Finset.univ
def edgeCornerLocation {ι : Type*} (E : ι → HEdge) (z : ι × Fin 2) : ℝ × ℝ :=
  (E z.1).vertex z.2
def edgeCornerCoefficient {ι : Type*} (E : ι → HEdge) (z : ι × Fin 2) : ℝ :=
  (E z.1).jump * HEdge.vertexSign z.2
def edgeVertexSet {ι : Type*} (S : Finset ι) (E : ι → HEdge) : Finset (ℝ × ℝ) := by
  classical
  exact (edgeCornerIndex S).image (edgeCornerLocation E)
def edgeVertexCoefficient {ι : Type*} (S : Finset ι) (E : ι → HEdge)
    (p : ℝ × ℝ) : ℝ := by
  classical
  exact ∑ z ∈ (edgeCornerIndex S).filter (fun z => edgeCornerLocation E z = p),
    edgeCornerCoefficient E z

theorem weighted_edge_vertexSum_eq_corners {ι : Type*} (S : Finset ι) (E : ι → HEdge)
    (v u : ℝ) :
    (∑ i ∈ S, (E i).jump * (E i).vertexSum v u) =
      ∑ z ∈ edgeCornerIndex S, edgeCornerCoefficient E z *
        max 0 (v-(edgeCornerLocation E z).2+u*(edgeCornerLocation E z).1) := by
  unfold edgeCornerIndex
  rw [Finset.product_eq_sprod,Finset.sum_product]
  apply Finset.sum_congr rfl
  intro i _
  unfold HEdge.vertexSum
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k _
  unfold edgeCornerCoefficient edgeCornerLocation
  ring

/-- The representation check is only a finite equality of explicit coordinate
coefficients. It does not assume equality of fields, chords, or integrals. -/
def EdgesMatch {ι κ : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (T : Finset κ) (E : κ → HEdge) : Prop := by
  classical
  exact ∀ p ∈ vertexSet S R ∪ edgeVertexSet T E,
    vertexCoefficient S R w p = edgeVertexCoefficient T E p

theorem vertexSums_eq_of_match {ι κ : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (T : Finset κ) (E : κ → HEdge) (hm : EdgesMatch S R w T E) (v u : ℝ) :
    (∑ i ∈ S, w i * (R i).vertexSum v u) =
      ∑ j ∈ T, (E j).jump * (E j).vertexSum v u := by
  classical
  let U := vertexSet S R ∪ edgeVertexSet T E
  rw [weighted_vertexSum_eq_corners, weighted_edge_vertexSum_eq_corners]
  rw [weighted_grouping_on (cornerIndex S) U (cornerLocation R) (cornerCoefficient w)
      (fun p => max 0 (v-p.2+u*p.1))
      (fun z hz => Finset.mem_union_left _ (Finset.mem_image_of_mem _ hz))]
  rw [weighted_grouping_on (edgeCornerIndex T) U (edgeCornerLocation E) (edgeCornerCoefficient E)
      (fun p => max 0 (v-p.2+u*p.1))
      (fun z hz => Finset.mem_union_right _ (Finset.mem_image_of_mem _ hz))]
  exact Finset.sum_congr rfl fun p hp => congrArg (fun c => c * max 0 (v-p.2+u*p.1)) (hm p hp)

/-- Matching signed corner coefficients connects an arbitrary horizontal-edge
representation to the actual rectangular field for every positive slope. -/
theorem rectangle_jump_chord_eq {ι κ : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (T : Finset κ) (E : κ → HEdge) (hm : EdgesMatch S R w T E)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hE : ∀ j ∈ T, (E j).left ≤ (E j).right) (v u : ℝ) (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (v+u*t)) =
      ∫ t : ℝ, jumpField T E t (v+u*t) := by
  rw [rectangleField_chord_eq_vertexSum S R w v u hR hu,
    jumpField_chord_eq_vertexSum T E v u hE hu, vertexSums_eq_of_match S R w T E hm]

/-- C03 for the actual rectangle field, after the finite representation check.
The signed edge list may include negative jumps; only its positive part is charged. -/
theorem matched_horizontal_band_upper {ι κ : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (T : Finset κ) (E : κ → HEdge) (hm : EdgesMatch S R w T E)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hE : ∀ j ∈ T, (E j).left ≤ (E j).right)
    (l h v u : ℝ) (hu : 0 < u) (hlv : l ≤ v) (hvh : v ≤ h) :
    (∫ t : ℝ, rectangleField S R w t (v+u*t)) ≤
      (∫ t : ℝ, rectangleField S R w t (l+u*t)) +
        ∑ j ∈ T, max 0 (E j).jump * (E j).bandLength l h u := by
  rw [rectangle_jump_chord_eq S R w T E hm hR hE v u hu,
    rectangle_jump_chord_eq S R w T E hm hR hE l u hu]
  exact jumpField_chord_band_upper T E l h v u hu hlv hvh

end NoThreeLine

#print axioms NoThreeLine.rectangle_jump_chord_eq
#print axioms NoThreeLine.matched_horizontal_band_upper
