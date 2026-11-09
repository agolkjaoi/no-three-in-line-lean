import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock11
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock12
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock13
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock14
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock15
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock16
import NoThreeLine.Phase15301Group5558Family01IntervalNormalizedBlock17
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group5558.Family01.IntervalNormalized
open AutoEnvelope Phase15301Family01

def remaining18 : List NormalizedBlock := []
theorem tail18 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining18=some 0 := by decide +kernel

def remaining17 : List NormalizedBlock := block17::remaining18
theorem tail17 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((31/32:ℚ)) remaining17=some ((218590445497560745/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block17Expr 18446744073709551616
    ((31/32:ℚ)) (1) ((218590445497560745/2305843009213693952:ℚ)) (0)
    block17Cuts remaining18 block17_normalization block17_checked tail18
  have hs : ((218590445497560745/2305843009213693952:ℚ):ℚ)+(0)=((218590445497560745/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining17,block17,hs] using h

def remaining16 : List NormalizedBlock := block16::remaining17
theorem tail16 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((115/128:ℚ)) remaining16=some ((6468604934183107973/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block16Expr 18446744073709551616
    ((115/128:ℚ)) ((31/32:ℚ)) ((4719881370202622013/18446744073709551616:ℚ)) ((218590445497560745/2305843009213693952:ℚ))
    block16Cuts remaining17 block16_normalization block16_checked tail17
  have hs : ((4719881370202622013/18446744073709551616:ℚ):ℚ)+((218590445497560745/2305843009213693952:ℚ))=((6468604934183107973/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining16,block16,hs] using h

def remaining15 : List NormalizedBlock := block15::remaining16
theorem tail15 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((439/512:ℚ)) remaining15=some ((9048580071514098347/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block15Expr 18446744073709551616
    ((439/512:ℚ)) ((115/128:ℚ)) ((1289987568665495187/9223372036854775808:ℚ)) ((6468604934183107973/18446744073709551616:ℚ))
    block15Cuts remaining16 block15_normalization block15_checked tail16
  have hs : ((1289987568665495187/9223372036854775808:ℚ):ℚ)+((6468604934183107973/18446744073709551616:ℚ))=((9048580071514098347/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining15,block15,hs] using h

def remaining14 : List NormalizedBlock := block14::remaining15
theorem tail14 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((205/256:ℚ)) remaining14=some ((12680066471934358829/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block14Expr 18446744073709551616
    ((205/256:ℚ)) ((439/512:ℚ)) ((1815743200210130241/9223372036854775808:ℚ)) ((9048580071514098347/18446744073709551616:ℚ))
    block14Cuts remaining15 block14_normalization block14_checked tail15
  have hs : ((1815743200210130241/9223372036854775808:ℚ):ℚ)+((9048580071514098347/18446744073709551616:ℚ))=((12680066471934358829/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining14,block14,hs] using h

def remaining13 : List NormalizedBlock := block13::remaining14
theorem tail13 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((383/512:ℚ)) remaining13=some ((8452361538020294865/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block13Expr 18446744073709551616
    ((383/512:ℚ)) ((205/256:ℚ)) ((4224656604106230901/18446744073709551616:ℚ)) ((12680066471934358829/18446744073709551616:ℚ))
    block13Cuts remaining14 block13_normalization block13_checked tail14
  have hs : ((4224656604106230901/18446744073709551616:ℚ):ℚ)+((12680066471934358829/18446744073709551616:ℚ))=((8452361538020294865/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining13,block13,hs] using h

def remaining12 : List NormalizedBlock := block12::remaining13
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((713/1024:ℚ)) remaining12=some ((5321102917313045135/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block12Expr 18446744073709551616
    ((713/1024:ℚ)) ((383/512:ℚ)) ((2189844296605795405/9223372036854775808:ℚ)) ((8452361538020294865/9223372036854775808:ℚ))
    block12Cuts remaining13 block12_normalization block12_checked tail13
  have hs : ((2189844296605795405/9223372036854775808:ℚ):ℚ)+((8452361538020294865/9223372036854775808:ℚ))=((5321102917313045135/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining12,block12,hs] using h

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((163/256:ℚ)) remaining11=some ((25779160359939465683/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((163/256:ℚ)) ((713/1024:ℚ)) ((4494748690687285143/18446744073709551616:ℚ)) ((5321102917313045135/4611686018427387904:ℚ))
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((4494748690687285143/18446744073709551616:ℚ):ℚ)+((5321102917313045135/4611686018427387904:ℚ))=((25779160359939465683/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((593/1024:ℚ)) remaining10=some ((30364919828876425211/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((593/1024:ℚ)) ((163/256:ℚ)) ((573219933617119941/2305843009213693952:ℚ)) ((25779160359939465683/18446744073709551616:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((573219933617119941/2305843009213693952:ℚ):ℚ)+((25779160359939465683/18446744073709551616:ℚ))=((30364919828876425211/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((273/512:ℚ)) remaining09=some ((34448704877144125865/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((273/512:ℚ)) ((593/1024:ℚ)) ((2041892524133850327/9223372036854775808:ℚ)) ((30364919828876425211/18446744073709551616:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((2041892524133850327/9223372036854775808:ℚ):ℚ)+((30364919828876425211/18446744073709551616:ℚ))=((34448704877144125865/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((233/512:ℚ)) remaining08=some ((41133283333970659873/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((233/512:ℚ)) ((273/512:ℚ)) ((835572307103316751/2305843009213693952:ℚ)) ((34448704877144125865/18446744073709551616:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((835572307103316751/2305843009213693952:ℚ):ℚ)+((34448704877144125865/18446744073709551616:ℚ))=((41133283333970659873/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((101/256:ℚ)) remaining07=some ((46266335918366063807/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((101/256:ℚ)) ((233/512:ℚ)) ((2566526292197701967/9223372036854775808:ℚ)) ((41133283333970659873/18446744073709551616:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((2566526292197701967/9223372036854775808:ℚ):ℚ)+((41133283333970659873/18446744073709551616:ℚ))=((46266335918366063807/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((89/256:ℚ)) remaining06=some ((6343704737488870315/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((89/256:ℚ)) ((101/256:ℚ)) ((4483301981544898713/18446744073709551616:ℚ)) ((46266335918366063807/18446744073709551616:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((4483301981544898713/18446744073709551616:ℚ):ℚ)+((46266335918366063807/18446744073709551616:ℚ))=((6343704737488870315/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((73/256:ℚ)) remaining05=some ((3542691248123455039/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((73/256:ℚ)) ((89/256:ℚ)) ((741677758758039763/2305843009213693952:ℚ)) ((6343704737488870315/2305843009213693952:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((741677758758039763/2305843009213693952:ℚ):ℚ)+((6343704737488870315/2305843009213693952:ℚ))=((3542691248123455039/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((121/512:ℚ)) remaining04=some ((61995038946090878723/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((121/512:ℚ)) ((73/256:ℚ)) ((5311978976115598099/18446744073709551616:ℚ)) ((3542691248123455039/1152921504606846976:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((5311978976115598099/18446744073709551616:ℚ):ℚ)+((3542691248123455039/1152921504606846976:ℚ))=((61995038946090878723/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((185/1024:ℚ)) remaining03=some ((17250132692820073409/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((185/1024:ℚ)) ((121/512:ℚ)) ((7005491825189414913/18446744073709551616:ℚ)) ((61995038946090878723/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((7005491825189414913/18446744073709551616:ℚ):ℚ)+((61995038946090878723/18446744073709551616:ℚ))=((17250132692820073409/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((131/1024:ℚ)) remaining02=some ((19022530112231126797/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((131/1024:ℚ)) ((185/1024:ℚ)) ((443099354852763347/1152921504606846976:ℚ)) ((17250132692820073409/4611686018427387904:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((443099354852763347/1152921504606846976:ℚ):ℚ)+((17250132692820073409/4611686018427387904:ℚ))=((19022530112231126797/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((165/2048:ℚ)) remaining01=some ((41826502366446066179/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((165/2048:ℚ)) ((131/1024:ℚ)) ((3781442141983812585/9223372036854775808:ℚ)) ((19022530112231126797/4611686018427387904:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((3781442141983812585/9223372036854775808:ℚ):ℚ)+((19022530112231126797/4611686018427387904:ℚ))=((41826502366446066179/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((97009660336298163715/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((165/2048:ℚ)) ((13356655603406031357/18446744073709551616:ℚ)) ((41826502366446066179/9223372036854775808:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((13356655603406031357/18446744073709551616:ℚ):ℚ)+((41826502366446066179/9223372036854775808:ℚ))=((97009660336298163715/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((97009660336298163715/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((97009660336298163715/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((97009660336298163715/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group5558.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family01.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group5558.root.x0 : ℝ) Phase15301Group5558.root.x1)
    (hy : y∈Set.Icc (Phase15301Group5558.root.y0 : ℝ) Phase15301Group5558.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field0 x y u)^2)≤((97009660336298163715/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group5558.root queryRoot 1 chartPermutation
    original_chart_checked ((97009660336298163715/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group5558.Family01.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group5558.Family01.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group5558.Family01.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group5558.Family01.IntervalNormalized.original_directional_integral_bound
