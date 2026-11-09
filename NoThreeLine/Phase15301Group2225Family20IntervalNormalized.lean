import NoThreeLine.Phase15301Group2225Family20IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group2225Family20IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group2225Family20IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group2225Family20IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group2225Family20IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group2225Family20IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group2225Family20IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group2225Family20IntervalNormalizedBlock07
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group2225.Family20.IntervalNormalized
open AutoEnvelope Phase15301Family20

def remaining08 : List NormalizedBlock := []
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining08=some 0 := by decide +kernel

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((17/32:ℚ)) remaining07=some ((2111994823344793917/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((17/32:ℚ)) (1) ((2111994823344793917/9223372036854775808:ℚ)) (0)
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((2111994823344793917/9223372036854775808:ℚ):ℚ)+(0)=((2111994823344793917/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((5/16:ℚ)) remaining06=some ((1329843419493686695/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((5/16:ℚ)) ((17/32:ℚ)) ((3207378854629952863/9223372036854775808:ℚ)) ((2111994823344793917/9223372036854775808:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((3207378854629952863/9223372036854775808:ℚ):ℚ)+((2111994823344793917/9223372036854775808:ℚ))=((1329843419493686695/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((53/256:ℚ)) remaining05=some ((9384138016100392409/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((53/256:ℚ)) ((5/16:ℚ)) ((4064764338125645629/9223372036854775808:ℚ)) ((1329843419493686695/2305843009213693952:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((4064764338125645629/9223372036854775808:ℚ):ℚ)+((1329843419493686695/2305843009213693952:ℚ))=((9384138016100392409/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((19/128:ℚ)) remaining04=some ((820399493405595167/576460752303423488:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((19/128:ℚ)) ((53/256:ℚ)) ((3742253878389130263/9223372036854775808:ℚ)) ((9384138016100392409/9223372036854775808:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((3742253878389130263/9223372036854775808:ℚ):ℚ)+((9384138016100392409/9223372036854775808:ℚ))=((820399493405595167/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((55/512:ℚ)) remaining03=some ((16548250896165776475/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((55/512:ℚ)) ((19/128:ℚ)) ((3421859001676253803/9223372036854775808:ℚ)) ((820399493405595167/576460752303423488:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((3421859001676253803/9223372036854775808:ℚ):ℚ)+((820399493405595167/576460752303423488:ℚ))=((16548250896165776475/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((37/512:ℚ)) remaining02=some ((37973368280285223189/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((37/512:ℚ)) ((55/512:ℚ)) ((4876866487953670239/18446744073709551616:ℚ)) ((16548250896165776475/9223372036854775808:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((4876866487953670239/18446744073709551616:ℚ):ℚ)+((16548250896165776475/9223372036854775808:ℚ))=((37973368280285223189/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((1/64:ℚ)) remaining01=some ((11111883936720887311/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((1/64:ℚ)) ((37/512:ℚ)) ((6474167466598326055/18446744073709551616:ℚ)) ((37973368280285223189/18446744073709551616:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((6474167466598326055/18446744073709551616:ℚ):ℚ)+((37973368280285223189/18446744073709551616:ℚ))=((11111883936720887311/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((5772411229934191325/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((1/64:ℚ)) ((432938523147495339/4611686018427387904:ℚ)) ((11111883936720887311/4611686018427387904:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((432938523147495339/4611686018427387904:ℚ):ℚ)+((11111883936720887311/4611686018427387904:ℚ))=((5772411229934191325/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((5772411229934191325/2305843009213693952:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((5772411229934191325/2305843009213693952:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((5772411229934191325/2305843009213693952:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group2225.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family20.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group2225.root.x0 : ℝ) Phase15301Group2225.root.x1)
    (hy : y∈Set.Icc (Phase15301Group2225.root.y0 : ℝ) Phase15301Group2225.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field2 x y u)^2)≤((5772411229934191325/2305843009213693952:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group2225.root queryRoot 0 chartPermutation
    original_chart_checked ((5772411229934191325/2305843009213693952:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group2225.Family20.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group2225.Family20.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group2225.Family20.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group2225.Family20.IntervalNormalized.original_directional_integral_bound
