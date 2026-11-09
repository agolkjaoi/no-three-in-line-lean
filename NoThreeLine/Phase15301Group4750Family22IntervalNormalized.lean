import NoThreeLine.Phase15301Group4750Family22IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group4750Family22IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group4750Family22IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group4750Family22IntervalNormalizedBlock03
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group4750.Family22.IntervalNormalized
open AutoEnvelope Phase15301Family22

def remaining04 : List NormalizedBlock := []
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining04=some 0 := by decide +kernel

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((45/64:ℚ)) remaining03=some ((99542068180671863/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((45/64:ℚ)) (1) ((99542068180671863/1152921504606846976:ℚ)) (0)
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((99542068180671863/1152921504606846976:ℚ):ℚ)+(0)=((99542068180671863/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((5/64:ℚ)) remaining02=some ((612395704299760721/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((5/64:ℚ)) ((45/64:ℚ)) ((413311567938416995/2305843009213693952:ℚ)) ((99542068180671863/1152921504606846976:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((413311567938416995/2305843009213693952:ℚ):ℚ)+((99542068180671863/1152921504606846976:ℚ))=((612395704299760721/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((33/2048:ℚ)) remaining01=some ((425582390826319693/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((33/2048:ℚ)) ((5/64:ℚ)) ((238769077352878665/2305843009213693952:ℚ)) ((612395704299760721/2305843009213693952:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((238769077352878665/2305843009213693952:ℚ):ℚ)+((612395704299760721/2305843009213693952:ℚ))=((425582390826319693/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((5165382373752732963/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((33/2048:ℚ)) ((1760723247142175419/9223372036854775808:ℚ)) ((425582390826319693/1152921504606846976:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((1760723247142175419/9223372036854775808:ℚ):ℚ)+((425582390826319693/1152921504606846976:ℚ))=((5165382373752732963/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((5165382373752732963/9223372036854775808:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((5165382373752732963/9223372036854775808:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((5165382373752732963/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group4750.root queryRoot 2 chartPermutation=true := by
  have h := Phase15301Family22.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group4750.root.x0 : ℝ) Phase15301Group4750.root.x1)
    (hy : y∈Set.Icc (Phase15301Group4750.root.y0 : ℝ) Phase15301Group4750.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 2 Phase15301Original.field2 x y u)^2)≤((5165382373752732963/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group4750.root queryRoot 2 chartPermutation
    original_chart_checked ((5165382373752732963/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group4750.Family22.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group4750.Family22.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group4750.Family22.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group4750.Family22.IntervalNormalized.original_directional_integral_bound
