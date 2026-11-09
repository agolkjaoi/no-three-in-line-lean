import NoThreeLine.Phase15301Leaf74Family10Block00
import NoThreeLine.Phase15301Leaf74Family10Block01
import NoThreeLine.Phase15301Leaf74Family10Block02
import NoThreeLine.Phase15301Leaf74Family10Block03

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf74.Family10
open AutoEnvelope Phase15301Family10

def remaining04 : List (ℚ × AutoTrace) := []
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining04=some 0 := by decide +kernel

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((1/2:ℚ)) remaining03=some ((136860397478926209/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1/2:ℚ)) block03 remaining04
    (1) ((136860397478926209/2305843009213693952:ℚ)) (0) block03_checked tail04
  have hsum : ((136860397478926209/2305843009213693952:ℚ) : ℚ)+(0)=((136860397478926209/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((45/256:ℚ)) remaining02=some ((280359575937998933/576460752303423488:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((45/256:ℚ)) block02 remaining03
    ((1/2:ℚ)) ((984577906273069523/2305843009213693952:ℚ)) ((136860397478926209/2305843009213693952:ℚ)) block02_checked tail03
  have hsum : ((984577906273069523/2305843009213693952:ℚ) : ℚ)+((136860397478926209/2305843009213693952:ℚ))=((280359575937998933/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((77/1024:ℚ)) remaining01=some ((26742367776459998985/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((77/1024:ℚ)) block01 remaining02
    ((45/256:ℚ)) ((17770861346444033129/18446744073709551616:ℚ)) ((280359575937998933/576460752303423488:ℚ)) block01_checked tail02
  have hsum : ((17770861346444033129/18446744073709551616:ℚ) : ℚ)+((280359575937998933/576460752303423488:ℚ))=((26742367776459998985/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((39200359242066709115/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((77/1024:ℚ)) ((6228995732803355065/9223372036854775808:ℚ)) ((26742367776459998985/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((6228995732803355065/9223372036854775808:ℚ) : ℚ)+((26742367776459998985/18446744073709551616:ℚ))=((39200359242066709115/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((39200359242066709115/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((39200359242066709115/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((39200359242066709115/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((39200359242066709115/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf74.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family10.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf74.root.x0 : ℝ) Phase15301Leaf74.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf74.root.y0 : ℝ) Phase15301Leaf74.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field1 x y u)^2)≤((39200359242066709115/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf74.root queryRoot 0 chartPermutation
    original_chart_checked ((39200359242066709115/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf74.Family10

#print axioms NoThreeLine.Phase15301Leaf74.Family10.data_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family10.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf74.Family10.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family10.original_directional_integral_bound
