import NoThreeLine.Phase15301Family02Vertices
import NoThreeLine.Phase15301Family02RefinedUnitSparse

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval

namespace NoThreeLine.Phase15301Family02.Refined

theorem unit_expression_from_actual_field :
    (fullExpr rectangles weights positiveEdges root cap).unitNormalize = unitSparseExpr := by
  rw [fullExpr_eq_qTableFullExpr rectangles weights positiveEdges root cap 16 vertexKeys vertexTerms
    vertex_keys_checked vertex_table_checked vertex_terms_nodup]
  decide +kernel

#print axioms unit_expression_from_actual_field

theorem negative_edges_nonpositive : ∀ j, (negativeEdges j).jump ≤ 0 := by
  have hh : qEdgeDataValid positiveEdges = true ∧ qEdgeDataValid negativeEdges = true ∧
      (∀ j, 0 ≤ (positiveEdges j).jump) ∧ (∀ j, (negativeEdges j).jump ≤ 0) ∧
      qEdgesMatchCheck rectangles weights (qCompleteEdges positiveEdges negativeEdges) = true := by
    simpa only [qPositiveEdgeWitnessCheck,decide_eq_true_eq] using positive_witness_checked
  exact hh.2.2.2.1

theorem actual_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (root.x0 : ℝ) root.x1)
    (hy : y ∈ Set.Icc (root.y0 : ℝ) root.y1) :
    (∫ u in (0 : ℝ)..1, (actualChord rectangles weights x y u)^2) ≤
      ((538276081476110743/2305843009213693952:ℚ) : ℝ) := by
  exact unit_normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    root cap 18446744073709551616 unitInnerCuts ((538276081476110743/2305843009213693952:ℚ)) unitSparseExpr all_data_checked
    negative_edges_nonpositive unit_expression_from_actual_field unit_partition_checked x y hx hy

theorem erased_actual_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (root.x0 : ℝ) root.x1)
    (hy : y ∈ Set.Icc (root.y0 : ℝ) root.y1) (vertical horizontal : Finset ℝ) :
    (∫ u in (0 : ℝ)..1, (∫ t : ℝ, eraseGrid vertical horizontal
      (rectangleField Finset.univ (fun i => (rectangles i).real) (fun i => (weights i : ℝ)))
      t (y-u*x+u*t))^2) ≤ ((538276081476110743/2305843009213693952:ℚ) : ℝ) := by
  rw [erased_fieldChord_square_integral_eq]
  exact actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Family02.Refined

#print axioms NoThreeLine.Phase15301Family02.Refined.actual_integral_bound
#print axioms NoThreeLine.Phase15301Family02.Refined.erased_actual_integral_bound
