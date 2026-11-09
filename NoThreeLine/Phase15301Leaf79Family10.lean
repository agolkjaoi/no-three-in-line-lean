import NoThreeLine.Phase15301Leaf79Family10Block00
import NoThreeLine.Phase15301Leaf79Family10Block01
import NoThreeLine.Phase15301Leaf79Family10Block02
import NoThreeLine.Phase15301Leaf79Family10Block03

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf79.Family10
open AutoEnvelope Phase15301Family10

def remaining04 : List (ℚ × AutoTrace) := []
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining04=some 0 := by decide +kernel

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((1/2:ℚ)) remaining03=some ((274055830752287155/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1/2:ℚ)) block03 remaining04
    (1) ((274055830752287155/4611686018427387904:ℚ)) (0) block03_checked tail04
  have hsum : ((274055830752287155/4611686018427387904:ℚ) : ℚ)+(0)=((274055830752287155/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((23/128:ℚ)) remaining02=some ((2147701872739188033/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((23/128:ℚ)) block02 remaining03
    ((1/2:ℚ)) ((936823020993450439/2305843009213693952:ℚ)) ((274055830752287155/4611686018427387904:ℚ)) block02_checked tail03
  have hsum : ((936823020993450439/2305843009213693952:ℚ) : ℚ)+((274055830752287155/4611686018427387904:ℚ))=((2147701872739188033/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((77/1024:ℚ)) remaining01=some ((13379699345822959079/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((77/1024:ℚ)) block01 remaining02
    ((23/128:ℚ)) ((9084295600344583013/9223372036854775808:ℚ)) ((2147701872739188033/4611686018427387904:ℚ)) block01_checked tail02
  have hsum : ((9084295600344583013/9223372036854775808:ℚ) : ℚ)+((2147701872739188033/4611686018427387904:ℚ))=((13379699345822959079/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((39226862696970880357/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((77/1024:ℚ)) ((12467464005324962199/18446744073709551616:ℚ)) ((13379699345822959079/9223372036854775808:ℚ)) block00_checked tail01
  have hsum : ((12467464005324962199/18446744073709551616:ℚ) : ℚ)+((13379699345822959079/9223372036854775808:ℚ))=((39226862696970880357/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((39226862696970880357/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((39226862696970880357/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((39226862696970880357/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((39226862696970880357/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf79.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family10.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf79.root.x0 : ℝ) Phase15301Leaf79.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf79.root.y0 : ℝ) Phase15301Leaf79.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field1 x y u)^2)≤((39226862696970880357/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf79.root queryRoot 0 chartPermutation
    original_chart_checked ((39226862696970880357/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf79.Family10

#print axioms NoThreeLine.Phase15301Leaf79.Family10.data_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family10.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf79.Family10.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family10.original_directional_integral_bound
