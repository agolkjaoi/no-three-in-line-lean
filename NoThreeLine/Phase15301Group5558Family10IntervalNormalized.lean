import NoThreeLine.Phase15301Group5558Family10IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group5558Family10IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group5558Family10IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group5558Family10IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group5558Family10IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group5558Family10IntervalNormalizedBlock05
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group5558.Family10.IntervalNormalized
open AutoEnvelope Phase15301Family10

def remaining06 : List NormalizedBlock := []
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining06=some 0 := by decide +kernel

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((3/8:ℚ)) remaining05=some ((2050026141636344621/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((3/8:ℚ)) (1) ((2050026141636344621/18446744073709551616:ℚ)) (0)
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((2050026141636344621/18446744073709551616:ℚ):ℚ)+(0)=((2050026141636344621/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((25/128:ℚ)) remaining04=some ((3641729635889792583/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((25/128:ℚ)) ((3/8:ℚ)) ((5233433130143240545/18446744073709551616:ℚ)) ((2050026141636344621/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((5233433130143240545/18446744073709551616:ℚ):ℚ)+((2050026141636344621/18446744073709551616:ℚ))=((3641729635889792583/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((137/1024:ℚ)) remaining03=some ((8024196167442544491/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((137/1024:ℚ)) ((25/128:ℚ)) ((1095616632888187977/2305843009213693952:ℚ)) ((3641729635889792583/9223372036854775808:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((1095616632888187977/2305843009213693952:ℚ):ℚ)+((3641729635889792583/9223372036854775808:ℚ))=((8024196167442544491/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((77/1024:ℚ)) remaining02=some ((26865728445230916543/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((77/1024:ℚ)) ((137/1024:ℚ)) ((10817336110345827561/18446744073709551616:ℚ)) ((8024196167442544491/9223372036854775808:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((10817336110345827561/18446744073709551616:ℚ):ℚ)+((8024196167442544491/9223372036854775808:ℚ))=((26865728445230916543/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((19/1024:ℚ)) remaining01=some ((18108696140589434031/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((19/1024:ℚ)) ((77/1024:ℚ)) ((9351663835947951519/18446744073709551616:ℚ)) ((26865728445230916543/18446744073709551616:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((9351663835947951519/18446744073709551616:ℚ):ℚ)+((26865728445230916543/18446744073709551616:ℚ))=((18108696140589434031/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((39386457568693544365/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((19/1024:ℚ)) ((3169065287514676303/18446744073709551616:ℚ)) ((18108696140589434031/9223372036854775808:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((3169065287514676303/18446744073709551616:ℚ):ℚ)+((18108696140589434031/9223372036854775808:ℚ))=((39386457568693544365/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((39386457568693544365/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((39386457568693544365/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((39386457568693544365/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group5558.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family10.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group5558.root.x0 : ℝ) Phase15301Group5558.root.x1)
    (hy : y∈Set.Icc (Phase15301Group5558.root.y0 : ℝ) Phase15301Group5558.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field1 x y u)^2)≤((39386457568693544365/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group5558.root queryRoot 0 chartPermutation
    original_chart_checked ((39386457568693544365/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group5558.Family10.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group5558.Family10.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group5558.Family10.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group5558.Family10.IntervalNormalized.original_directional_integral_bound
