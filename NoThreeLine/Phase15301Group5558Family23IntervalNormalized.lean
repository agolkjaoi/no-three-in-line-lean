import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group5558Family23IntervalNormalizedBlock11
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized
open AutoEnvelope Phase15301Family23

def remaining12 : List NormalizedBlock := []
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining12=some 0 := by decide +kernel

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((117/128:ℚ)) remaining11=some ((2578336394658187989/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((117/128:ℚ)) (1) ((2578336394658187989/9223372036854775808:ℚ)) (0)
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((2578336394658187989/9223372036854775808:ℚ):ℚ)+(0)=((2578336394658187989/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((209/256:ℚ)) remaining10=some ((11134473839753988911/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((209/256:ℚ)) ((117/128:ℚ)) ((5977801050437612933/18446744073709551616:ℚ)) ((2578336394658187989/9223372036854775808:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((5977801050437612933/18446744073709551616:ℚ):ℚ)+((2578336394658187989/9223372036854775808:ℚ))=((11134473839753988911/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((353/512:ℚ)) remaining09=some ((19088166480857627311/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((353/512:ℚ)) ((209/256:ℚ)) ((62138223758622175/144115188075855872:ℚ)) ((11134473839753988911/18446744073709551616:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((62138223758622175/144115188075855872:ℚ):ℚ)+((11134473839753988911/18446744073709551616:ℚ))=((19088166480857627311/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((75/128:ℚ)) remaining08=some ((6589204936907160829/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((75/128:ℚ)) ((353/512:ℚ)) ((7268653266771016005/18446744073709551616:ℚ)) ((19088166480857627311/18446744073709551616:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((7268653266771016005/18446744073709551616:ℚ):ℚ)+((19088166480857627311/18446744073709551616:ℚ))=((6589204936907160829/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((253/512:ℚ)) remaining07=some ((33483732859792432381/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((253/512:ℚ)) ((75/128:ℚ)) ((7126913112163789065/18446744073709551616:ℚ)) ((6589204936907160829/4611686018427387904:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((7126913112163789065/18446744073709551616:ℚ):ℚ)+((6589204936907160829/4611686018427387904:ℚ))=((33483732859792432381/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((101/256:ℚ)) remaining06=some ((20961431463764193261/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((101/256:ℚ)) ((253/512:ℚ)) ((8439130067735954141/18446744073709551616:ℚ)) ((33483732859792432381/18446744073709551616:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((8439130067735954141/18446744073709551616:ℚ):ℚ)+((33483732859792432381/18446744073709551616:ℚ))=((20961431463764193261/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((79/256:ℚ)) remaining05=some ((49243149949877568767/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((79/256:ℚ)) ((101/256:ℚ)) ((7320287022349182245/18446744073709551616:ℚ)) ((20961431463764193261/9223372036854775808:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((7320287022349182245/18446744073709551616:ℚ):ℚ)+((20961431463764193261/9223372036854775808:ℚ))=((49243149949877568767/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((15/64:ℚ)) remaining04=some ((14085614758031204047/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((15/64:ℚ)) ((79/256:ℚ)) ((7099309082247247421/18446744073709551616:ℚ)) ((49243149949877568767/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((7099309082247247421/18446744073709551616:ℚ):ℚ)+((49243149949877568767/18446744073709551616:ℚ))=((14085614758031204047/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((43/256:ℚ)) remaining03=some ((16062646233163038339/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((43/256:ℚ)) ((15/64:ℚ)) ((494257868782958573/1152921504606846976:ℚ)) ((14085614758031204047/4611686018427387904:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((494257868782958573/1152921504606846976:ℚ):ℚ)+((14085614758031204047/4611686018427387904:ℚ))=((16062646233163038339/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((65/512:ℚ)) remaining02=some ((35243814530308580779/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((65/512:ℚ)) ((43/256:ℚ)) ((3118522063982504101/9223372036854775808:ℚ)) ((16062646233163038339/4611686018427387904:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((3118522063982504101/9223372036854775808:ℚ):ℚ)+((16062646233163038339/4611686018427387904:ℚ))=((35243814530308580779/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((39/512:ℚ)) remaining01=some ((10098453753335602791/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((39/512:ℚ)) ((65/512:ℚ)) ((5150000483033830385/9223372036854775808:ℚ)) ((35243814530308580779/9223372036854775808:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((5150000483033830385/9223372036854775808:ℚ):ℚ)+((35243814530308580779/9223372036854775808:ℚ))=((10098453753335602791/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((50350343268524477125/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((39/512:ℚ)) ((9956528255182065961/9223372036854775808:ℚ)) ((10098453753335602791/2305843009213693952:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((9956528255182065961/9223372036854775808:ℚ):ℚ)+((10098453753335602791/2305843009213693952:ℚ))=((50350343268524477125/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((50350343268524477125/9223372036854775808:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((50350343268524477125/9223372036854775808:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((50350343268524477125/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group5558.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family23.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group5558.root.x0 : ℝ) Phase15301Group5558.root.x1)
    (hy : y∈Set.Icc (Phase15301Group5558.root.y0 : ℝ) Phase15301Group5558.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field2 x y u)^2)≤((50350343268524477125/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group5558.root queryRoot 3 chartPermutation
    original_chart_checked ((50350343268524477125/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized.original_directional_integral_bound
