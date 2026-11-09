import NoThreeLine.Phase15301Group6568Family20IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group6568Family20IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group6568Family20IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group6568Family20IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group6568Family20IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group6568Family20IntervalNormalizedBlock05
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group6568.Family20.IntervalNormalized
open AutoEnvelope Phase15301Family20

def remaining06 : List NormalizedBlock := []
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining06=some 0 := by decide +kernel

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((17/32:ℚ)) remaining05=some ((1084385311878990001/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((17/32:ℚ)) (1) ((1084385311878990001/4611686018427387904:ℚ)) (0)
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((1084385311878990001/4611686018427387904:ℚ):ℚ)+(0)=((1084385311878990001/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((73/256:ℚ)) remaining04=some ((12539594771670943871/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((73/256:ℚ)) ((17/32:ℚ)) ((8202053524154983867/18446744073709551616:ℚ)) ((1084385311878990001/4611686018427387904:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((8202053524154983867/18446744073709551616:ℚ):ℚ)+((1084385311878990001/4611686018427387904:ℚ))=((12539594771670943871/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((23/128:ℚ)) remaining03=some ((5627638984484220315/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((23/128:ℚ)) ((73/256:ℚ)) ((9970961166265937389/18446744073709551616:ℚ)) ((12539594771670943871/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((9970961166265937389/18446744073709551616:ℚ):ℚ)+((12539594771670943871/18446744073709551616:ℚ))=((5627638984484220315/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((13/128:ℚ)) remaining02=some ((34216035436658260187/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((13/128:ℚ)) ((23/128:ℚ)) ((11705479498721378927/18446744073709551616:ℚ)) ((5627638984484220315/4611686018427387904:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((11705479498721378927/18446744073709551616:ℚ):ℚ)+((5627638984484220315/4611686018427387904:ℚ))=((34216035436658260187/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((15/512:ℚ)) remaining01=some ((21496824430350632969/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((15/512:ℚ)) ((13/128:ℚ)) ((8777613424043005751/18446744073709551616:ℚ)) ((34216035436658260187/18446744073709551616:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((8777613424043005751/18446744073709551616:ℚ):ℚ)+((34216035436658260187/18446744073709551616:ℚ))=((21496824430350632969/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((46133574256683362875/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((15/512:ℚ)) ((3139925395982096937/18446744073709551616:ℚ)) ((21496824430350632969/9223372036854775808:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((3139925395982096937/18446744073709551616:ℚ):ℚ)+((21496824430350632969/9223372036854775808:ℚ))=((46133574256683362875/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((46133574256683362875/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((46133574256683362875/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((46133574256683362875/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group6568.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family20.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group6568.root.x0 : ℝ) Phase15301Group6568.root.x1)
    (hy : y∈Set.Icc (Phase15301Group6568.root.y0 : ℝ) Phase15301Group6568.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field2 x y u)^2)≤((46133574256683362875/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group6568.root queryRoot 0 chartPermutation
    original_chart_checked ((46133574256683362875/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group6568.Family20.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group6568.Family20.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group6568.Family20.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group6568.Family20.IntervalNormalized.original_directional_integral_bound
