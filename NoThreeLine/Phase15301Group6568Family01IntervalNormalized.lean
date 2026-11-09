import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock11
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock12
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock13
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock14
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock15
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock16
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock17
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock18
import NoThreeLine.Phase15301Group6568Family01IntervalNormalizedBlock19
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized
open AutoEnvelope Phase15301Family01

def remaining20 : List NormalizedBlock := []
theorem tail20 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining20=some 0 := by decide +kernel

def remaining19 : List NormalizedBlock := block19::remaining20
theorem tail19 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((245/256:ℚ)) remaining19=some ((1237904498705712561/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block19Expr 18446744073709551616
    ((245/256:ℚ)) (1) ((1237904498705712561/9223372036854775808:ℚ)) (0)
    block19Cuts remaining20 block19_normalization block19_checked tail20
  have hs : ((1237904498705712561/9223372036854775808:ℚ):ℚ)+(0)=((1237904498705712561/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining19,block19,hs] using h

def remaining18 : List NormalizedBlock := block18::remaining19
theorem tail18 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((231/256:ℚ)) remaining18=some ((3112839089296108193/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block18Expr 18446744073709551616
    ((231/256:ℚ)) ((245/256:ℚ)) ((117183411911899727/576460752303423488:ℚ)) ((1237904498705712561/9223372036854775808:ℚ))
    block18Cuts remaining19 block18_normalization block18_checked tail19
  have hs : ((117183411911899727/576460752303423488:ℚ):ℚ)+((1237904498705712561/9223372036854775808:ℚ))=((3112839089296108193/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining18,block18,hs] using h

def remaining17 : List NormalizedBlock := block17::remaining18
theorem tail17 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((219/256:ℚ)) remaining17=some ((4587932676174021871/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block17Expr 18446744073709551616
    ((219/256:ℚ)) ((231/256:ℚ)) ((737546793438956839/4611686018427387904:ℚ)) ((3112839089296108193/9223372036854775808:ℚ))
    block17Cuts remaining18 block17_normalization block17_checked tail18
  have hs : ((737546793438956839/4611686018427387904:ℚ):ℚ)+((3112839089296108193/9223372036854775808:ℚ))=((4587932676174021871/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining17,block17,hs] using h

def remaining16 : List NormalizedBlock := block16::remaining17
theorem tail16 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((207/256:ℚ)) remaining16=some ((6080465872959070991/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block16Expr 18446744073709551616
    ((207/256:ℚ)) ((219/256:ℚ)) ((46641662399532785/288230376151711744:ℚ)) ((4587932676174021871/9223372036854775808:ℚ))
    block16Cuts remaining17 block16_normalization block16_checked tail17
  have hs : ((46641662399532785/288230376151711744:ℚ):ℚ)+((4587932676174021871/9223372036854775808:ℚ))=((6080465872959070991/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining16,block16,hs] using h

def remaining15 : List NormalizedBlock := block15::remaining16
theorem tail15 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((383/512:ℚ)) remaining15=some ((8485900655601143461/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block15Expr 18446744073709551616
    ((383/512:ℚ)) ((207/256:ℚ)) ((1202717391321036235/4611686018427387904:ℚ)) ((6080465872959070991/9223372036854775808:ℚ))
    block15Cuts remaining16 block15_normalization block15_checked tail16
  have hs : ((1202717391321036235/4611686018427387904:ℚ):ℚ)+((6080465872959070991/9223372036854775808:ℚ))=((8485900655601143461/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining15,block15,hs] using h

def remaining14 : List NormalizedBlock := block14::remaining15
theorem tail14 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((11/16:ℚ)) remaining14=some ((11018617033883937607/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block14Expr 18446744073709551616
    ((11/16:ℚ)) ((383/512:ℚ)) ((1266358189141397073/4611686018427387904:ℚ)) ((8485900655601143461/9223372036854775808:ℚ))
    block14Cuts remaining15 block14_normalization block14_checked tail15
  have hs : ((1266358189141397073/4611686018427387904:ℚ):ℚ)+((8485900655601143461/9223372036854775808:ℚ))=((11018617033883937607/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining14,block14,hs] using h

def remaining13 : List NormalizedBlock := block13::remaining14
theorem tail13 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((5/8:ℚ)) remaining13=some ((26689221171395680231/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block13Expr 18446744073709551616
    ((5/8:ℚ)) ((11/16:ℚ)) ((4651987103627805017/18446744073709551616:ℚ)) ((11018617033883937607/9223372036854775808:ℚ))
    block13Cuts remaining14 block13_normalization block13_checked tail14
  have hs : ((4651987103627805017/18446744073709551616:ℚ):ℚ)+((11018617033883937607/9223372036854775808:ℚ))=((26689221171395680231/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining13,block13,hs] using h

def remaining12 : List NormalizedBlock := block12::remaining13
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((73/128:ℚ)) remaining12=some ((15593089043290711795/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block12Expr 18446744073709551616
    ((73/128:ℚ)) ((5/8:ℚ)) ((4496956915185743359/18446744073709551616:ℚ)) ((26689221171395680231/18446744073709551616:ℚ))
    block12Cuts remaining13 block12_normalization block12_checked tail13
  have hs : ((4496956915185743359/18446744073709551616:ℚ):ℚ)+((26689221171395680231/18446744073709551616:ℚ))=((15593089043290711795/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining12,block12,hs] using h

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((543/1024:ℚ)) remaining11=some ((17374992752076777737/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((543/1024:ℚ)) ((73/128:ℚ)) ((890951854393032971/4611686018427387904:ℚ)) ((15593089043290711795/9223372036854775808:ℚ))
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((890951854393032971/4611686018427387904:ℚ):ℚ)+((15593089043290711795/9223372036854775808:ℚ))=((17374992752076777737/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((243/512:ℚ)) remaining10=some ((19765018780820014945/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((243/512:ℚ)) ((543/1024:ℚ)) ((298753253592904651/1152921504606846976:ℚ)) ((17374992752076777737/9223372036854775808:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((298753253592904651/1152921504606846976:ℚ):ℚ)+((17374992752076777737/9223372036854775808:ℚ))=((19765018780820014945/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((431/1024:ℚ)) remaining09=some ((5498188367872938979/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((431/1024:ℚ)) ((243/512:ℚ)) ((2227734690671740971/9223372036854775808:ℚ)) ((19765018780820014945/9223372036854775808:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((2227734690671740971/9223372036854775808:ℚ):ℚ)+((19765018780820014945/9223372036854775808:ℚ))=((5498188367872938979/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((95/256:ℚ)) remaining08=some ((48537528804527462629/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((95/256:ℚ)) ((431/1024:ℚ)) ((4552021861543950797/18446744073709551616:ℚ)) ((5498188367872938979/2305843009213693952:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((4552021861543950797/18446744073709551616:ℚ):ℚ)+((5498188367872938979/2305843009213693952:ℚ))=((48537528804527462629/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((5/16:ℚ)) remaining07=some ((54051775182436003875/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((5/16:ℚ)) ((95/256:ℚ)) ((2757123188954270623/9223372036854775808:ℚ)) ((48537528804527462629/18446744073709551616:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((2757123188954270623/9223372036854775808:ℚ):ℚ)+((48537528804527462629/18446744073709551616:ℚ))=((54051775182436003875/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((17/64:ℚ)) remaining06=some ((58690417105267176555/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((17/64:ℚ)) ((5/16:ℚ)) ((579830240353896585/2305843009213693952:ℚ)) ((54051775182436003875/18446744073709551616:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((579830240353896585/2305843009213693952:ℚ):ℚ)+((54051775182436003875/18446744073709551616:ℚ))=((58690417105267176555/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((473/2048:ℚ)) remaining05=some ((979919230229472197/288230376151711744:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((473/2048:ℚ)) ((17/64:ℚ)) ((4024413629419044053/18446744073709551616:ℚ)) ((58690417105267176555/18446744073709551616:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((4024413629419044053/18446744073709551616:ℚ):ℚ)+((58690417105267176555/18446744073709551616:ℚ))=((979919230229472197/288230376151711744:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((199/1024:ℚ)) remaining04=some ((33663512098962930101/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((199/1024:ℚ)) ((473/2048:ℚ)) ((2306096731619819797/9223372036854775808:ℚ)) ((979919230229472197/288230376151711744:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((2306096731619819797/9223372036854775808:ℚ):ℚ)+((979919230229472197/288230376151711744:ℚ))=((33663512098962930101/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((77/512:ℚ)) remaining03=some ((4568858510488351083/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((77/512:ℚ)) ((199/1024:ℚ)) ((2887355984943878563/9223372036854775808:ℚ)) ((33663512098962930101/9223372036854775808:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((2887355984943878563/9223372036854775808:ℚ):ℚ)+((33663512098962930101/9223372036854775808:ℚ))=((4568858510488351083/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((7/64:ℚ)) remaining02=some ((39535692076102790877/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((7/64:ℚ)) ((77/512:ℚ)) ((2984823992195982213/9223372036854775808:ℚ)) ((4568858510488351083/1152921504606846976:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((2984823992195982213/9223372036854775808:ℚ):ℚ)+((4568858510488351083/1152921504606846976:ℚ))=((39535692076102790877/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((37/512:ℚ)) remaining01=some ((42565646785137121093/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((37/512:ℚ)) ((7/64:ℚ)) ((378744338629291277/1152921504606846976:ℚ)) ((39535692076102790877/9223372036854775808:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((378744338629291277/1152921504606846976:ℚ):ℚ)+((39535692076102790877/9223372036854775808:ℚ))=((42565646785137121093/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((48579803124198698459/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((37/512:ℚ)) ((3007078169530788683/4611686018427387904:ℚ)) ((42565646785137121093/9223372036854775808:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((3007078169530788683/4611686018427387904:ℚ):ℚ)+((42565646785137121093/9223372036854775808:ℚ))=((48579803124198698459/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((48579803124198698459/9223372036854775808:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((48579803124198698459/9223372036854775808:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((48579803124198698459/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group6568.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family01.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group6568.root.x0 : ℝ) Phase15301Group6568.root.x1)
    (hy : y∈Set.Icc (Phase15301Group6568.root.y0 : ℝ) Phase15301Group6568.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field0 x y u)^2)≤((48579803124198698459/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group6568.root queryRoot 1 chartPermutation
    original_chart_checked ((48579803124198698459/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized.original_directional_integral_bound
