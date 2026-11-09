import NoThreeLine.Phase15301Group4750Family13IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group4750Family13IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group4750Family13IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group4750Family13IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group4750Family13IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group4750Family13IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group4750Family13IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group4750Family13IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group4750Family13IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group4750Family13IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group4750Family13IntervalNormalizedBlock10
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized
open AutoEnvelope Phase15301Family13

def remaining11 : List NormalizedBlock := []
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining11=some 0 := by decide +kernel

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((55/64:ℚ)) remaining10=some ((4228226460556207129/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((55/64:ℚ)) (1) ((4228226460556207129/9223372036854775808:ℚ)) (0)
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((4228226460556207129/9223372036854775808:ℚ):ℚ)+(0)=((4228226460556207129/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((99/128:ℚ)) remaining09=some ((6953717982676920601/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((99/128:ℚ)) ((55/64:ℚ)) ((10646451258284037/36028797018963968:ℚ)) ((4228226460556207129/9223372036854775808:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((10646451258284037/36028797018963968:ℚ):ℚ)+((4228226460556207129/9223372036854775808:ℚ))=((6953717982676920601/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((339/512:ℚ)) remaining08=some ((21735712340093429735/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((339/512:ℚ)) ((99/128:ℚ)) ((7828276374739588533/18446744073709551616:ℚ)) ((6953717982676920601/9223372036854775808:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((7828276374739588533/18446744073709551616:ℚ):ℚ)+((6953717982676920601/9223372036854775808:ℚ))=((21735712340093429735/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((141/256:ℚ)) remaining07=some ((7643017434550373021/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((141/256:ℚ)) ((339/512:ℚ)) ((8836357398108062349/18446744073709551616:ℚ)) ((21735712340093429735/18446744073709551616:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((8836357398108062349/18446744073709551616:ℚ):ℚ)+((21735712340093429735/18446744073709551616:ℚ))=((7643017434550373021/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((7/16:ℚ)) remaining06=some ((40531022194265603979/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((7/16:ℚ)) ((141/256:ℚ)) ((9958952456064111895/18446744073709551616:ℚ)) ((7643017434550373021/4611686018427387904:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((9958952456064111895/18446744073709551616:ℚ):ℚ)+((7643017434550373021/4611686018427387904:ℚ))=((40531022194265603979/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((183/512:ℚ)) remaining05=some ((24493423014296999925/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((183/512:ℚ)) ((7/16:ℚ)) ((8455823834328395871/18446744073709551616:ℚ)) ((40531022194265603979/18446744073709551616:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((8455823834328395871/18446744073709551616:ℚ):ℚ)+((40531022194265603979/18446744073709551616:ℚ))=((24493423014296999925/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((143/512:ℚ)) remaining04=some ((28613888159201284009/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((143/512:ℚ)) ((183/512:ℚ)) ((1030116286226071021/2305843009213693952:ℚ)) ((24493423014296999925/9223372036854775808:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((1030116286226071021/2305843009213693952:ℚ):ℚ)+((24493423014296999925/9223372036854775808:ℚ))=((28613888159201284009/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((109/512:ℚ)) remaining03=some ((64984979308014006691/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((109/512:ℚ)) ((143/512:ℚ)) ((7757202989611438673/18446744073709551616:ℚ)) ((28613888159201284009/9223372036854775808:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((7757202989611438673/18446744073709551616:ℚ):ℚ)+((28613888159201284009/9223372036854775808:ℚ))=((64984979308014006691/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((37/256:ℚ)) remaining02=some ((75100256773983961521/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((37/256:ℚ)) ((109/512:ℚ)) ((5057638732984977415/9223372036854775808:ℚ)) ((64984979308014006691/18446744073709551616:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((5057638732984977415/9223372036854775808:ℚ):ℚ)+((64984979308014006691/18446744073709551616:ℚ))=((75100256773983961521/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((23/256:ℚ)) remaining01=some ((86295164985991083247/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((23/256:ℚ)) ((37/256:ℚ)) ((5597454106003560863/9223372036854775808:ℚ)) ((75100256773983961521/18446744073709551616:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((5597454106003560863/9223372036854775808:ℚ):ℚ)+((75100256773983961521/18446744073709551616:ℚ))=((86295164985991083247/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((110180526273276571007/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((23/256:ℚ)) ((1492835080455342985/1152921504606846976:ℚ)) ((86295164985991083247/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((1492835080455342985/1152921504606846976:ℚ):ℚ)+((86295164985991083247/18446744073709551616:ℚ))=((110180526273276571007/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((110180526273276571007/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((110180526273276571007/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((110180526273276571007/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group4750.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family13.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group4750.root.x0 : ℝ) Phase15301Group4750.root.x1)
    (hy : y∈Set.Icc (Phase15301Group4750.root.y0 : ℝ) Phase15301Group4750.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field1 x y u)^2)≤((110180526273276571007/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group4750.root queryRoot 3 chartPermutation
    original_chart_checked ((110180526273276571007/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized.original_directional_integral_bound
