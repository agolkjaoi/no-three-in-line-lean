import NoThreeLine.Phase15301Group6568Family00IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group6568Family00IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group6568Family00IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group6568Family00IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group6568Family00IntervalNormalizedBlock04
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group6568.Family00.IntervalNormalized
open AutoEnvelope Phase15301Family00

def remaining05 : List NormalizedBlock := []
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining05=some 0 := by decide +kernel

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((15/32:ℚ)) remaining04=some ((1194924514019228655/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((15/32:ℚ)) (1) ((1194924514019228655/18446744073709551616:ℚ)) (0)
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((1194924514019228655/18446744073709551616:ℚ):ℚ)+(0)=((1194924514019228655/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((25/128:ℚ)) remaining03=some ((165851543509043411/576460752303423488:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((25/128:ℚ)) ((15/32:ℚ)) ((4112324878270160497/18446744073709551616:ℚ)) ((1194924514019228655/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((4112324878270160497/18446744073709551616:ℚ):ℚ)+((1194924514019228655/18446744073709551616:ℚ))=((165851543509043411/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((7/64:ℚ)) remaining02=some ((2157140462036384463/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((7/64:ℚ)) ((25/128:ℚ)) ((1493734288000210819/2305843009213693952:ℚ)) ((165851543509043411/576460752303423488:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((1493734288000210819/2305843009213693952:ℚ):ℚ)+((165851543509043411/576460752303423488:ℚ))=((2157140462036384463/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((7/256:ℚ)) remaining01=some ((15342923579093172371/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((7/256:ℚ)) ((7/64:ℚ)) ((6714361730947634519/9223372036854775808:ℚ)) ((2157140462036384463/2305843009213693952:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((6714361730947634519/9223372036854775808:ℚ):ℚ)+((2157140462036384463/2305843009213693952:ℚ))=((15342923579093172371/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((1117210671143617495/576460752303423488:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((7/256:ℚ)) ((2532447159204707549/9223372036854775808:ℚ)) ((15342923579093172371/9223372036854775808:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((2532447159204707549/9223372036854775808:ℚ):ℚ)+((15342923579093172371/9223372036854775808:ℚ))=((1117210671143617495/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((1117210671143617495/576460752303423488:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((1117210671143617495/576460752303423488:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((1117210671143617495/576460752303423488:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group6568.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family00.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group6568.root.x0 : ℝ) Phase15301Group6568.root.x1)
    (hy : y∈Set.Icc (Phase15301Group6568.root.y0 : ℝ) Phase15301Group6568.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field0 x y u)^2)≤((1117210671143617495/576460752303423488:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group6568.root queryRoot 0 chartPermutation
    original_chart_checked ((1117210671143617495/576460752303423488:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group6568.Family00.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group6568.Family00.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group6568.Family00.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group6568.Family00.IntervalNormalized.original_directional_integral_bound
