import NoThreeLine.Phase15301Group6568Family12IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group6568Family12IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group6568Family12IntervalNormalizedBlock02
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group6568.Family12.IntervalNormalized
open AutoEnvelope Phase15301Family12

def remaining03 : List NormalizedBlock := []
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining03=some 0 := by decide +kernel

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((13/16:ℚ)) remaining02=some ((207129467610510227/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((13/16:ℚ)) (1) ((207129467610510227/18446744073709551616:ℚ)) (0)
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((207129467610510227/18446744073709551616:ℚ):ℚ)+(0)=((207129467610510227/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((5/256:ℚ)) remaining01=some ((1304536377199087219/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((5/256:ℚ)) ((13/16:ℚ)) ((34293965924643031/576460752303423488:ℚ)) ((207129467610510227/18446744073709551616:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((34293965924643031/576460752303423488:ℚ):ℚ)+((207129467610510227/18446744073709551616:ℚ))=((1304536377199087219/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((1234159144614908933/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((5/256:ℚ)) ((3632100201260548513/18446744073709551616:ℚ)) ((1304536377199087219/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((3632100201260548513/18446744073709551616:ℚ):ℚ)+((1304536377199087219/18446744073709551616:ℚ))=((1234159144614908933/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((1234159144614908933/4611686018427387904:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((1234159144614908933/4611686018427387904:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((1234159144614908933/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group6568.root queryRoot 2 chartPermutation=true := by
  have h := Phase15301Family12.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group6568.root.x0 : ℝ) Phase15301Group6568.root.x1)
    (hy : y∈Set.Icc (Phase15301Group6568.root.y0 : ℝ) Phase15301Group6568.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 2 Phase15301Original.field1 x y u)^2)≤((1234159144614908933/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group6568.root queryRoot 2 chartPermutation
    original_chart_checked ((1234159144614908933/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group6568.Family12.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group6568.Family12.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group6568.Family12.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group6568.Family12.IntervalNormalized.original_directional_integral_bound
