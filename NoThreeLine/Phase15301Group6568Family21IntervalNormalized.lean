import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock11
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock12
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock13
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock14
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock15
import NoThreeLine.Phase15301Group6568Family21IntervalNormalizedBlock16
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group6568.Family21.IntervalNormalized
open AutoEnvelope Phase15301Family21

def remaining17 : List NormalizedBlock := []
theorem tail17 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining17=some 0 := by decide +kernel

def remaining16 : List NormalizedBlock := block16::remaining17
theorem tail16 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((951/1024:ℚ)) remaining16=some ((2250836242353495973/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block16Expr 18446744073709551616
    ((951/1024:ℚ)) (1) ((2250836242353495973/9223372036854775808:ℚ)) (0)
    block16Cuts remaining17 block16_normalization block16_checked tail17
  have hs : ((2250836242353495973/9223372036854775808:ℚ):ℚ)+(0)=((2250836242353495973/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining16,block16,hs] using h

def remaining15 : List NormalizedBlock := block15::remaining16
theorem tail15 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((895/1024:ℚ)) remaining15=some ((7963343555744033457/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block15Expr 18446744073709551616
    ((895/1024:ℚ)) ((951/1024:ℚ)) ((3461671071037041511/18446744073709551616:ℚ)) ((2250836242353495973/9223372036854775808:ℚ))
    block15Cuts remaining16 block15_normalization block15_checked tail16
  have hs : ((3461671071037041511/18446744073709551616:ℚ):ℚ)+((2250836242353495973/9223372036854775808:ℚ))=((7963343555744033457/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining15,block15,hs] using h

def remaining14 : List NormalizedBlock := block14::remaining15
theorem tail14 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((53/64:ℚ)) remaining14=some ((10759478611169202917/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block14Expr 18446744073709551616
    ((53/64:ℚ)) ((895/1024:ℚ)) ((699033763856292365/4611686018427387904:ℚ)) ((7963343555744033457/18446744073709551616:ℚ))
    block14Cuts remaining15 block14_normalization block14_checked tail15
  have hs : ((699033763856292365/4611686018427387904:ℚ):ℚ)+((7963343555744033457/18446744073709551616:ℚ))=((10759478611169202917/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining14,block14,hs] using h

def remaining13 : List NormalizedBlock := block13::remaining14
theorem tail13 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((393/512:ℚ)) remaining13=some ((15133097203439099731/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block13Expr 18446744073709551616
    ((393/512:ℚ)) ((53/64:ℚ)) ((2186809296134948407/9223372036854775808:ℚ)) ((10759478611169202917/18446744073709551616:ℚ))
    block13Cuts remaining14 block13_normalization block13_checked tail14
  have hs : ((2186809296134948407/9223372036854775808:ℚ):ℚ)+((10759478611169202917/18446744073709551616:ℚ))=((15133097203439099731/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining13,block13,hs] using h

def remaining12 : List NormalizedBlock := block12::remaining13
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((357/512:ℚ)) remaining12=some ((10000436644990520837/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block12Expr 18446744073709551616
    ((357/512:ℚ)) ((393/512:ℚ)) ((4867776086541941943/18446744073709551616:ℚ)) ((15133097203439099731/18446744073709551616:ℚ))
    block12Cuts remaining13 block12_normalization block12_checked tail13
  have hs : ((4867776086541941943/18446744073709551616:ℚ):ℚ)+((15133097203439099731/18446744073709551616:ℚ))=((10000436644990520837/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining12,block12,hs] using h

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((325/512:ℚ)) remaining11=some ((12302591365449039291/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((325/512:ℚ)) ((357/512:ℚ)) ((1151077360229259227/4611686018427387904:ℚ)) ((10000436644990520837/9223372036854775808:ℚ))
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((1151077360229259227/4611686018427387904:ℚ):ℚ)+((10000436644990520837/9223372036854775808:ℚ))=((12302591365449039291/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((9/16:ℚ)) remaining10=some ((30548051252557753559/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((9/16:ℚ)) ((325/512:ℚ)) ((5942868521659674977/18446744073709551616:ℚ)) ((12302591365449039291/9223372036854775808:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((5942868521659674977/18446744073709551616:ℚ):ℚ)+((12302591365449039291/9223372036854775808:ℚ))=((30548051252557753559/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((127/256:ℚ)) remaining09=some ((4416583024419782521/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((127/256:ℚ)) ((9/16:ℚ)) ((4784612942800506609/18446744073709551616:ℚ)) ((30548051252557753559/18446744073709551616:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((4784612942800506609/18446744073709551616:ℚ):ℚ)+((30548051252557753559/18446744073709551616:ℚ))=((4416583024419782521/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((113/256:ℚ)) remaining08=some ((4973221885435680357/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((113/256:ℚ)) ((127/256:ℚ)) ((139159715253974459/576460752303423488:ℚ)) ((4416583024419782521/2305843009213693952:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((139159715253974459/576460752303423488:ℚ):ℚ)+((4416583024419782521/2305843009213693952:ℚ))=((4973221885435680357/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((403/1024:ℚ)) remaining07=some ((43452864765188757345/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((403/1024:ℚ)) ((113/256:ℚ)) ((3667089681703314489/18446744073709551616:ℚ)) ((4973221885435680357/2305843009213693952:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((3667089681703314489/18446744073709551616:ℚ):ℚ)+((4973221885435680357/2305843009213693952:ℚ))=((43452864765188757345/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((43/128:ℚ)) remaining06=some ((47442977447186633727/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((43/128:ℚ)) ((403/1024:ℚ)) ((1995056340998938191/9223372036854775808:ℚ)) ((43452864765188757345/18446744073709551616:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((1995056340998938191/9223372036854775808:ℚ):ℚ)+((43452864765188757345/18446744073709551616:ℚ))=((47442977447186633727/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((73/256:ℚ)) remaining05=some ((25481417214478895809/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((73/256:ℚ)) ((43/128:ℚ)) ((3519856981771157891/18446744073709551616:ℚ)) ((47442977447186633727/18446744073709551616:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((3519856981771157891/18446744073709551616:ℚ):ℚ)+((47442977447186633727/18446744073709551616:ℚ))=((25481417214478895809/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((61/256:ℚ)) remaining04=some ((13586606160917830309/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((61/256:ℚ)) ((73/256:ℚ)) ((1691795107356764809/9223372036854775808:ℚ)) ((25481417214478895809/9223372036854775808:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((1691795107356764809/9223372036854775808:ℚ):ℚ)+((25481417214478895809/9223372036854775808:ℚ))=((13586606160917830309/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((187/1024:ℚ)) remaining03=some ((29099330414687643319/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((187/1024:ℚ)) ((61/256:ℚ)) ((1926118092851982701/9223372036854775808:ℚ)) ((13586606160917830309/4611686018427387904:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((1926118092851982701/9223372036854775808:ℚ):ℚ)+((13586606160917830309/4611686018427387904:ℚ))=((29099330414687643319/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((33/256:ℚ)) remaining02=some ((62092185702108501225/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((33/256:ℚ)) ((187/1024:ℚ)) ((3893524872733214587/18446744073709551616:ℚ)) ((29099330414687643319/9223372036854775808:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((3893524872733214587/18446744073709551616:ℚ):ℚ)+((29099330414687643319/9223372036854775808:ℚ))=((62092185702108501225/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((43/512:ℚ)) remaining01=some ((32789814044120996155/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((43/512:ℚ)) ((33/256:ℚ)) ((3487442386133491085/18446744073709551616:ℚ)) ((62092185702108501225/18446744073709551616:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((3487442386133491085/18446744073709551616:ℚ):ℚ)+((62092185702108501225/18446744073709551616:ℚ))=((32789814044120996155/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((74156879017674652773/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((43/512:ℚ)) ((8577250929432660463/18446744073709551616:ℚ)) ((32789814044120996155/9223372036854775808:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((8577250929432660463/18446744073709551616:ℚ):ℚ)+((32789814044120996155/9223372036854775808:ℚ))=((74156879017674652773/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((74156879017674652773/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((74156879017674652773/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((74156879017674652773/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group6568.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family21.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group6568.root.x0 : ℝ) Phase15301Group6568.root.x1)
    (hy : y∈Set.Icc (Phase15301Group6568.root.y0 : ℝ) Phase15301Group6568.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field2 x y u)^2)≤((74156879017674652773/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group6568.root queryRoot 1 chartPermutation
    original_chart_checked ((74156879017674652773/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group6568.Family21.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group6568.Family21.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group6568.Family21.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group6568.Family21.IntervalNormalized.original_directional_integral_bound
