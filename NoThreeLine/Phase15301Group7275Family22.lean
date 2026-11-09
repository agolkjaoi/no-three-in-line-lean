import NoThreeLine.Phase15301Group7275Family22Block00
import NoThreeLine.Phase15301Group7275Family22Block01
import NoThreeLine.Phase15301Group7275Family22Block02

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group7275.Family22
open AutoEnvelope Phase15301Family22

def remaining03 : List (ℚ × AutoTrace) := []
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining03=some 0 := by decide +kernel

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((9/16:ℚ)) remaining02=some ((145828640358513171/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((9/16:ℚ)) block02 remaining03
    (1) ((145828640358513171/1152921504606846976:ℚ)) (0) block02_checked tail03
  have hsum : ((145828640358513171/1152921504606846976:ℚ) : ℚ)+(0)=((145828640358513171/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((13/512:ℚ)) remaining01=some ((6290697675329794029/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((13/512:ℚ)) block01 remaining02
    ((9/16:ℚ)) ((3957439429593583293/18446744073709551616:ℚ)) ((145828640358513171/1152921504606846976:ℚ)) block01_checked tail02
  have hsum : ((3957439429593583293/18446744073709551616:ℚ) : ℚ)+((145828640358513171/1152921504606846976:ℚ))=((6290697675329794029/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((10947342967148262643/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((13/512:ℚ)) ((2328322645909234307/9223372036854775808:ℚ)) ((6290697675329794029/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((2328322645909234307/9223372036854775808:ℚ) : ℚ)+((6290697675329794029/18446744073709551616:ℚ))=((10947342967148262643/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((10947342967148262643/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((10947342967148262643/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((10947342967148262643/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((10947342967148262643/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group7275.root queryRoot 2 chartPermutation=true := by
  have h := Phase15301Family22.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group7275.root.x0 : ℝ) Phase15301Group7275.root.x1)
    (hy : y∈Set.Icc (Phase15301Group7275.root.y0 : ℝ) Phase15301Group7275.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 2 Phase15301Original.field2 x y u)^2)≤((10947342967148262643/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group7275.root queryRoot 2 chartPermutation
    original_chart_checked ((10947342967148262643/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group7275.Family22

#print axioms NoThreeLine.Phase15301Group7275.Family22.data_checked
#print axioms NoThreeLine.Phase15301Group7275.Family22.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Group7275.Family22.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group7275.Family22.original_directional_integral_bound
