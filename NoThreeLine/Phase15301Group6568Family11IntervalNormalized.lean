import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock11
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock12
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock13
import NoThreeLine.Phase15301Group6568Family11IntervalNormalizedBlock14
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group6568.Family11.IntervalNormalized
open AutoEnvelope Phase15301Family11

def remaining15 : List NormalizedBlock := []
theorem tail15 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining15=some 0 := by decide +kernel

def remaining14 : List NormalizedBlock := block14::remaining15
theorem tail14 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((237/256:ℚ)) remaining14=some ((5018251368387111105/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block14Expr 18446744073709551616
    ((237/256:ℚ)) (1) ((5018251368387111105/18446744073709551616:ℚ)) (0)
    block14Cuts remaining15 block14_normalization block14_checked tail15
  have hs : ((5018251368387111105/18446744073709551616:ℚ):ℚ)+(0)=((5018251368387111105/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining14,block14,hs] using h

def remaining13 : List NormalizedBlock := block13::remaining14
theorem tail13 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((221/256:ℚ)) remaining13=some ((8933585705963435415/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block13Expr 18446744073709551616
    ((221/256:ℚ)) ((237/256:ℚ)) ((1957667168788162155/9223372036854775808:ℚ)) ((5018251368387111105/18446744073709551616:ℚ))
    block13Cuts remaining14 block13_normalization block13_checked tail14
  have hs : ((1957667168788162155/9223372036854775808:ℚ):ℚ)+((5018251368387111105/18446744073709551616:ℚ))=((8933585705963435415/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining13,block13,hs] using h

def remaining12 : List NormalizedBlock := block12::remaining13
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((409/512:ℚ)) remaining12=some ((1621227428102918755/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block12Expr 18446744073709551616
    ((409/512:ℚ)) ((221/256:ℚ)) ((4036233718859914625/18446744073709551616:ℚ)) ((8933585705963435415/18446744073709551616:ℚ))
    block12Cuts remaining13 block12_normalization block12_checked tail13
  have hs : ((4036233718859914625/18446744073709551616:ℚ):ℚ)+((8933585705963435415/18446744073709551616:ℚ))=((1621227428102918755/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining12,block12,hs] using h

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((23/32:ℚ)) remaining11=some ((19678447370181233365/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((23/32:ℚ)) ((409/512:ℚ)) ((6708627945357883325/18446744073709551616:ℚ)) ((1621227428102918755/2305843009213693952:ℚ))
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((6708627945357883325/18446744073709551616:ℚ):ℚ)+((1621227428102918755/2305843009213693952:ℚ))=((19678447370181233365/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((163/256:ℚ)) remaining10=some ((26192037968969899859/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((163/256:ℚ)) ((23/32:ℚ)) ((3256795299394333247/9223372036854775808:ℚ)) ((19678447370181233365/18446744073709551616:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((3256795299394333247/9223372036854775808:ℚ):ℚ)+((19678447370181233365/18446744073709551616:ℚ))=((26192037968969899859/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((573/1024:ℚ)) remaining09=some ((32546704623456178347/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((573/1024:ℚ)) ((163/256:ℚ)) ((794333331810784811/2305843009213693952:ℚ)) ((26192037968969899859/18446744073709551616:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((794333331810784811/2305843009213693952:ℚ):ℚ)+((26192037968969899859/18446744073709551616:ℚ))=((32546704623456178347/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((31/64:ℚ)) remaining08=some ((19405990204951664173/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((31/64:ℚ)) ((573/1024:ℚ)) ((6265275786447149999/18446744073709551616:ℚ)) ((32546704623456178347/18446744073709551616:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((6265275786447149999/18446744073709551616:ℚ):ℚ)+((32546704623456178347/18446744073709551616:ℚ))=((19405990204951664173/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((27/64:ℚ)) remaining07=some ((44142257115896067049/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((27/64:ℚ)) ((31/64:ℚ)) ((5330276705992738703/18446744073709551616:ℚ)) ((19405990204951664173/9223372036854775808:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((5330276705992738703/18446744073709551616:ℚ):ℚ)+((19405990204951664173/9223372036854775808:ℚ))=((44142257115896067049/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((181/512:ℚ)) remaining06=some ((12541386161541904263/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((181/512:ℚ)) ((27/64:ℚ)) ((6023287530271550003/18446744073709551616:ℚ)) ((44142257115896067049/18446744073709551616:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((6023287530271550003/18446744073709551616:ℚ):ℚ)+((44142257115896067049/18446744073709551616:ℚ))=((12541386161541904263/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((39/128:ℚ)) remaining05=some ((54860207288682922829/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((39/128:ℚ)) ((181/512:ℚ)) ((4694662642515305777/18446744073709551616:ℚ)) ((12541386161541904263/4611686018427387904:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((4694662642515305777/18446744073709551616:ℚ):ℚ)+((12541386161541904263/4611686018427387904:ℚ))=((54860207288682922829/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((249/1024:ℚ)) remaining04=some ((60855872801447960877/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((249/1024:ℚ)) ((39/128:ℚ)) ((187364547273907439/576460752303423488:ℚ)) ((54860207288682922829/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((187364547273907439/576460752303423488:ℚ):ℚ)+((54860207288682922829/18446744073709551616:ℚ))=((60855872801447960877/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((197/1024:ℚ)) remaining03=some ((16774010752939260923/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((197/1024:ℚ)) ((249/1024:ℚ)) ((6240170210309082815/18446744073709551616:ℚ)) ((60855872801447960877/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((6240170210309082815/18446744073709551616:ℚ):ℚ)+((60855872801447960877/18446744073709551616:ℚ))=((16774010752939260923/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((9/64:ℚ)) remaining02=some ((73449677911693670947/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((9/64:ℚ)) ((197/1024:ℚ)) ((6353634899936627255/18446744073709551616:ℚ)) ((16774010752939260923/4611686018427387904:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((6353634899936627255/18446744073709551616:ℚ):ℚ)+((16774010752939260923/4611686018427387904:ℚ))=((73449677911693670947/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((5/64:ℚ)) remaining01=some ((82383904678989354653/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((5/64:ℚ)) ((9/64:ℚ)) ((4467113383647841853/9223372036854775808:ℚ)) ((73449677911693670947/18446744073709551616:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((4467113383647841853/9223372036854775808:ℚ):ℚ)+((73449677911693670947/18446744073709551616:ℚ))=((82383904678989354653/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((94407133796121929741/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((5/64:ℚ)) ((751451819820785943/1152921504606846976:ℚ)) ((82383904678989354653/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((751451819820785943/1152921504606846976:ℚ):ℚ)+((82383904678989354653/18446744073709551616:ℚ))=((94407133796121929741/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((94407133796121929741/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((94407133796121929741/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((94407133796121929741/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group6568.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family11.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group6568.root.x0 : ℝ) Phase15301Group6568.root.x1)
    (hy : y∈Set.Icc (Phase15301Group6568.root.y0 : ℝ) Phase15301Group6568.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field1 x y u)^2)≤((94407133796121929741/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group6568.root queryRoot 1 chartPermutation
    original_chart_checked ((94407133796121929741/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group6568.Family11.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group6568.Family11.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group6568.Family11.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group6568.Family11.IntervalNormalized.original_directional_integral_bound
