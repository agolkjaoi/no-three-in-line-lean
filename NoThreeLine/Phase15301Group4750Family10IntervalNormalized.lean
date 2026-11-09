import NoThreeLine.Phase15301Group4750Family10IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group4750Family10IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group4750Family10IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group4750Family10IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group4750Family10IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group4750Family10IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group4750Family10IntervalNormalizedBlock06
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group4750.Family10.IntervalNormalized
open AutoEnvelope Phase15301Family10

def remaining07 : List NormalizedBlock := []
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining07=some 0 := by decide +kernel

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((33/64:ℚ)) remaining06=some ((511300491752181471/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((33/64:ℚ)) (1) ((511300491752181471/9223372036854775808:ℚ)) (0)
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((511300491752181471/9223372036854775808:ℚ):ℚ)+(0)=((511300491752181471/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((17/64:ℚ)) remaining05=some ((4013892518058963287/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((17/64:ℚ)) ((33/64:ℚ)) ((2991291534554600345/18446744073709551616:ℚ)) ((511300491752181471/9223372036854775808:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((2991291534554600345/18446744073709551616:ℚ):ℚ)+((511300491752181471/9223372036854775808:ℚ))=((4013892518058963287/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((11/64:ℚ)) remaining04=some ((1183748922329588173/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((11/64:ℚ)) ((17/64:ℚ)) ((5456098860577742097/18446744073709551616:ℚ)) ((4013892518058963287/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((5456098860577742097/18446744073709551616:ℚ):ℚ)+((4013892518058963287/18446744073709551616:ℚ))=((1183748922329588173/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((17/128:ℚ)) remaining03=some ((8125562747947721769/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((17/128:ℚ)) ((11/64:ℚ)) ((3390567058629369077/9223372036854775808:ℚ)) ((1183748922329588173/2305843009213693952:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((3390567058629369077/9223372036854775808:ℚ):ℚ)+((1183748922329588173/2305843009213693952:ℚ))=((8125562747947721769/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((77/1024:ℚ)) remaining02=some ((3358240080962750125/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((77/1024:ℚ)) ((17/128:ℚ)) ((5307397575903278731/9223372036854775808:ℚ)) ((8125562747947721769/9223372036854775808:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((5307397575903278731/9223372036854775808:ℚ):ℚ)+((8125562747947721769/9223372036854775808:ℚ))=((3358240080962750125/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((5/256:ℚ)) remaining01=some ((18021428818732210593/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((5/256:ℚ)) ((77/1024:ℚ)) ((4588468494881210093/9223372036854775808:ℚ)) ((3358240080962750125/2305843009213693952:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((4588468494881210093/9223372036854775808:ℚ):ℚ)+((3358240080962750125/2305843009213693952:ℚ))=((18021428818732210593/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((19700131387314316927/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((5/256:ℚ)) ((839351284291053167/4611686018427387904:ℚ)) ((18021428818732210593/9223372036854775808:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((839351284291053167/4611686018427387904:ℚ):ℚ)+((18021428818732210593/9223372036854775808:ℚ))=((19700131387314316927/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((19700131387314316927/9223372036854775808:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((19700131387314316927/9223372036854775808:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((19700131387314316927/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group4750.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family10.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group4750.root.x0 : ℝ) Phase15301Group4750.root.x1)
    (hy : y∈Set.Icc (Phase15301Group4750.root.y0 : ℝ) Phase15301Group4750.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field1 x y u)^2)≤((19700131387314316927/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group4750.root queryRoot 0 chartPermutation
    original_chart_checked ((19700131387314316927/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group4750.Family10.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group4750.Family10.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group4750.Family10.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group4750.Family10.IntervalNormalized.original_directional_integral_bound
