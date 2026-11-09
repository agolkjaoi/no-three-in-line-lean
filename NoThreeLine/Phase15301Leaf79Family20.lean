import NoThreeLine.Phase15301Leaf79Family20Block00
import NoThreeLine.Phase15301Leaf79Family20Block01
import NoThreeLine.Phase15301Leaf79Family20Block02
import NoThreeLine.Phase15301Leaf79Family20Block03
import NoThreeLine.Phase15301Leaf79Family20Block04

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf79.Family20
open AutoEnvelope Phase15301Family20

def remaining05 : List (ℚ × AutoTrace) := []
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining05=some 0 := by decide +kernel

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((13/16:ℚ)) remaining04=some ((152764577444006799/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((13/16:ℚ)) block04 remaining05
    (1) ((152764577444006799/2305843009213693952:ℚ)) (0) block04_checked tail05
  have hsum : ((152764577444006799/2305843009213693952:ℚ) : ℚ)+(0)=((152764577444006799/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((19/64:ℚ)) remaining03=some ((5946657340443066009/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((19/64:ℚ)) block03 remaining04
    ((13/16:ℚ)) ((5335599030667038813/9223372036854775808:ℚ)) ((152764577444006799/2305843009213693952:ℚ)) block03_checked tail04
  have hsum : ((5335599030667038813/9223372036854775808:ℚ) : ℚ)+((152764577444006799/2305843009213693952:ℚ))=((5946657340443066009/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((5/32:ℚ)) remaining02=some ((3206742061266452815/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((5/32:ℚ)) block02 remaining03
    ((19/64:ℚ)) ((6880310904622745251/9223372036854775808:ℚ)) ((5946657340443066009/9223372036854775808:ℚ)) block02_checked tail03
  have hsum : ((6880310904622745251/9223372036854775808:ℚ) : ℚ)+((5946657340443066009/9223372036854775808:ℚ))=((3206742061266452815/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((19/256:ℚ)) remaining01=some ((37987648860186304251/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((19/256:ℚ)) block01 remaining02
    ((5/32:ℚ)) ((12333712370054681731/18446744073709551616:ℚ)) ((3206742061266452815/2305843009213693952:ℚ)) block01_checked tail02
  have hsum : ((12333712370054681731/18446744073709551616:ℚ) : ℚ)+((3206742061266452815/2305843009213693952:ℚ))=((37987648860186304251/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((5772393533571350687/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((19/256:ℚ)) ((8191499408384501245/18446744073709551616:ℚ)) ((37987648860186304251/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((8191499408384501245/18446744073709551616:ℚ) : ℚ)+((37987648860186304251/18446744073709551616:ℚ))=((5772393533571350687/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((5772393533571350687/2305843009213693952:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((5772393533571350687/2305843009213693952:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((5772393533571350687/2305843009213693952:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((5772393533571350687/2305843009213693952:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf79.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family20.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf79.root.x0 : ℝ) Phase15301Leaf79.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf79.root.y0 : ℝ) Phase15301Leaf79.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field2 x y u)^2)≤((5772393533571350687/2305843009213693952:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf79.root queryRoot 0 chartPermutation
    original_chart_checked ((5772393533571350687/2305843009213693952:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf79.Family20

#print axioms NoThreeLine.Phase15301Leaf79.Family20.data_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family20.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf79.Family20.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family20.original_directional_integral_bound
