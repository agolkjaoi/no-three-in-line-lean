import NoThreeLine.Phase15301Group2225Family10IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group2225Family10IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group2225Family10IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group2225Family10IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group2225Family10IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group2225Family10IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group2225Family10IntervalNormalizedBlock06
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group2225.Family10.IntervalNormalized
open AutoEnvelope Phase15301Family10

def remaining07 : List NormalizedBlock := []
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining07=some 0 := by decide +kernel

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((15/32:ℚ)) remaining06=some ((606682339954100125/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((15/32:ℚ)) (1) ((606682339954100125/9223372036854775808:ℚ)) (0)
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((606682339954100125/9223372036854775808:ℚ):ℚ)+(0)=((606682339954100125/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((61/256:ℚ)) remaining05=some ((4710512802198848507/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((61/256:ℚ)) ((15/32:ℚ)) ((3497148122290648257/18446744073709551616:ℚ)) ((606682339954100125/9223372036854775808:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((3497148122290648257/18446744073709551616:ℚ):ℚ)+((606682339954100125/9223372036854775808:ℚ))=((4710512802198848507/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((81/512:ℚ)) remaining04=some ((10736764262102784173/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((81/512:ℚ)) ((61/256:ℚ)) ((3013125729951967833/9223372036854775808:ℚ)) ((4710512802198848507/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((3013125729951967833/9223372036854775808:ℚ):ℚ)+((4710512802198848507/18446744073709551616:ℚ))=((10736764262102784173/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((31/256:ℚ)) remaining03=some ((570176249052414271/576460752303423488:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((31/256:ℚ)) ((81/512:ℚ)) ((7508875707574472499/18446744073709551616:ℚ)) ((10736764262102784173/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((7508875707574472499/18446744073709551616:ℚ):ℚ)+((10736764262102784173/18446744073709551616:ℚ))=((570176249052414271/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((1/16:ℚ)) remaining02=some ((28493755118875310493/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((1/16:ℚ)) ((31/256:ℚ)) ((10248115149198053821/18446744073709551616:ℚ)) ((570176249052414271/576460752303423488:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((10248115149198053821/18446744073709551616:ℚ):ℚ)+((570176249052414271/576460752303423488:ℚ))=((28493755118875310493/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((3/256:ℚ)) remaining01=some ((9237496968207925811/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((3/256:ℚ)) ((1/16:ℚ)) ((8456232753956392751/18446744073709551616:ℚ)) ((28493755118875310493/18446744073709551616:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((8456232753956392751/18446744073709551616:ℚ):ℚ)+((28493755118875310493/18446744073709551616:ℚ))=((9237496968207925811/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((9753511036544643141/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((3/256:ℚ)) ((258007034168358665/2305843009213693952:ℚ)) ((9237496968207925811/4611686018427387904:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((258007034168358665/2305843009213693952:ℚ):ℚ)+((9237496968207925811/4611686018427387904:ℚ))=((9753511036544643141/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((9753511036544643141/4611686018427387904:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((9753511036544643141/4611686018427387904:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((9753511036544643141/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group2225.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family10.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group2225.root.x0 : ℝ) Phase15301Group2225.root.x1)
    (hy : y∈Set.Icc (Phase15301Group2225.root.y0 : ℝ) Phase15301Group2225.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field1 x y u)^2)≤((9753511036544643141/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group2225.root queryRoot 0 chartPermutation
    original_chart_checked ((9753511036544643141/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group2225.Family10.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group2225.Family10.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group2225.Family10.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group2225.Family10.IntervalNormalized.original_directional_integral_bound
