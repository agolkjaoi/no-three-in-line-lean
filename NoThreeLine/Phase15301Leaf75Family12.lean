import NoThreeLine.Phase15301Leaf75Family12Block00
import NoThreeLine.Phase15301Leaf75Family12Block01

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf75.Family12
open AutoEnvelope Phase15301Family12

def remaining02 : List (ℚ × AutoTrace) := []
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining02=some 0 := by decide +kernel

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((7/8:ℚ)) remaining01=some ((73205677094390005/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((7/8:ℚ)) block01 remaining02
    (1) ((73205677094390005/9223372036854775808:ℚ)) (0) block01_checked tail02
  have hsum : ((73205677094390005/9223372036854775808:ℚ) : ℚ)+(0)=((73205677094390005/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((4983752541737772849/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((7/8:ℚ)) ((4837341187548992839/18446744073709551616:ℚ)) ((73205677094390005/9223372036854775808:ℚ)) block00_checked tail01
  have hsum : ((4837341187548992839/18446744073709551616:ℚ) : ℚ)+((73205677094390005/9223372036854775808:ℚ))=((4983752541737772849/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((4983752541737772849/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((4983752541737772849/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((4983752541737772849/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((4983752541737772849/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf75.root queryRoot 2 chartPermutation=true := by
  have h := Phase15301Family12.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf75.root.x0 : ℝ) Phase15301Leaf75.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf75.root.y0 : ℝ) Phase15301Leaf75.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 2 Phase15301Original.field1 x y u)^2)≤((4983752541737772849/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf75.root queryRoot 2 chartPermutation
    original_chart_checked ((4983752541737772849/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf75.Family12

#print axioms NoThreeLine.Phase15301Leaf75.Family12.data_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family12.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf75.Family12.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family12.original_directional_integral_bound
