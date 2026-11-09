import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock11
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock12
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock13
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock14
import NoThreeLine.Phase15301Group5558Family11IntervalNormalizedBlock15
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group5558.Family11.IntervalNormalized
open AutoEnvelope Phase15301Family11

def remaining16 : List NormalizedBlock := []
theorem tail16 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining16=some 0 := by decide +kernel

def remaining15 : List NormalizedBlock := block15::remaining16
theorem tail15 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((119/128:ℚ)) remaining15=some ((2369288235958294457/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block15Expr 18446744073709551616
    ((119/128:ℚ)) (1) ((2369288235958294457/9223372036854775808:ℚ)) (0)
    block15Cuts remaining16 block15_normalization block15_checked tail16
  have hs : ((2369288235958294457/9223372036854775808:ℚ):ℚ)+(0)=((2369288235958294457/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining15,block15,hs] using h

def remaining14 : List NormalizedBlock := block14::remaining15
theorem tail14 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((443/512:ℚ)) remaining14=some ((4428685052712752599/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block14Expr 18446744073709551616
    ((443/512:ℚ)) ((119/128:ℚ)) ((1029698408377229071/4611686018427387904:ℚ)) ((2369288235958294457/9223372036854775808:ℚ))
    block14Cuts remaining15 block14_normalization block14_checked tail15
  have hs : ((1029698408377229071/4611686018427387904:ℚ):ℚ)+((2369288235958294457/9223372036854775808:ℚ))=((4428685052712752599/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining14,block14,hs] using h

def remaining13 : List NormalizedBlock := block13::remaining14
theorem tail13 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((207/256:ℚ)) remaining13=some ((3059286019659802453/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block13Expr 18446744073709551616
    ((207/256:ℚ)) ((443/512:ℚ)) ((1689886986606852307/9223372036854775808:ℚ)) ((4428685052712752599/9223372036854775808:ℚ))
    block13Cuts remaining14 block13_normalization block13_checked tail14
  have hs : ((1689886986606852307/9223372036854775808:ℚ):ℚ)+((4428685052712752599/9223372036854775808:ℚ))=((3059286019659802453/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining13,block13,hs] using h

def remaining12 : List NormalizedBlock := block12::remaining13
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((383/512:ℚ)) remaining12=some ((8581321098667006445/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block12Expr 18446744073709551616
    ((383/512:ℚ)) ((207/256:ℚ)) ((2462749059347401539/9223372036854775808:ℚ)) ((3059286019659802453/4611686018427387904:ℚ))
    block12Cuts remaining13 block12_normalization block12_checked tail13
  have hs : ((2462749059347401539/9223372036854775808:ℚ):ℚ)+((3059286019659802453/4611686018427387904:ℚ))=((8581321098667006445/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining12,block12,hs] using h

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((351/512:ℚ)) remaining11=some ((5594232360909361557/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((351/512:ℚ)) ((383/512:ℚ)) ((2607143623151716669/9223372036854775808:ℚ)) ((8581321098667006445/9223372036854775808:ℚ))
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((2607143623151716669/9223372036854775808:ℚ):ℚ)+((8581321098667006445/9223372036854775808:ℚ))=((5594232360909361557/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((313/512:ℚ)) remaining10=some ((28133658771155272279/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((313/512:ℚ)) ((351/512:ℚ)) ((5756729327517826051/18446744073709551616:ℚ)) ((5594232360909361557/4611686018427387904:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((5756729327517826051/18446744073709551616:ℚ):ℚ)+((5594232360909361557/4611686018427387904:ℚ))=((28133658771155272279/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((35/64:ℚ)) remaining09=some ((8399997925806607135/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((35/64:ℚ)) ((313/512:ℚ)) ((5466332932071156261/18446744073709551616:ℚ)) ((28133658771155272279/18446744073709551616:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((5466332932071156261/18446744073709551616:ℚ):ℚ)+((28133658771155272279/18446744073709551616:ℚ))=((8399997925806607135/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((479/1024:ℚ)) remaining08=some ((156954527053350997/72057594037927936:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((479/1024:ℚ)) ((35/64:ℚ)) ((1645091805607856673/4611686018427387904:ℚ)) ((8399997925806607135/4611686018427387904:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((1645091805607856673/4611686018427387904:ℚ):ℚ)+((8399997925806607135/4611686018427387904:ℚ))=((156954527053350997/72057594037927936:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((105/256:ℚ)) remaining07=some ((45116976917569622105/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((105/256:ℚ)) ((479/1024:ℚ)) ((4936617991911766873/18446744073709551616:ℚ)) ((156954527053350997/72057594037927936:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((4936617991911766873/18446744073709551616:ℚ):ℚ)+((156954527053350997/72057594037927936:ℚ))=((45116976917569622105/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((87/256:ℚ)) remaining06=some ((25704892731589897533/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((87/256:ℚ)) ((105/256:ℚ)) ((6292808545610172961/18446744073709551616:ℚ)) ((45116976917569622105/18446744073709551616:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((6292808545610172961/18446744073709551616:ℚ):ℚ)+((45116976917569622105/18446744073709551616:ℚ))=((25704892731589897533/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((299/1024:ℚ)) remaining05=some ((56026529079717449651/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((299/1024:ℚ)) ((87/256:ℚ)) ((4616743616537654585/18446744073709551616:ℚ)) ((25704892731589897533/9223372036854775808:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((4616743616537654585/18446744073709551616:ℚ):ℚ)+((25704892731589897533/9223372036854775808:ℚ))=((56026529079717449651/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((231/1024:ℚ)) remaining04=some ((31394446394017406377/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((231/1024:ℚ)) ((299/1024:ℚ)) ((6762363708317363103/18446744073709551616:ℚ)) ((56026529079717449651/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((6762363708317363103/18446744073709551616:ℚ):ℚ)+((56026529079717449651/18446744073709551616:ℚ))=((31394446394017406377/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((89/512:ℚ)) remaining03=some ((69286771299958072505/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((89/512:ℚ)) ((231/1024:ℚ)) ((6497878511923259751/18446744073709551616:ℚ)) ((31394446394017406377/9223372036854775808:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((6497878511923259751/18446744073709551616:ℚ):ℚ)+((31394446394017406377/9223372036854775808:ℚ))=((69286771299958072505/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((33/256:ℚ)) remaining02=some ((37410015513348166927/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((33/256:ℚ)) ((89/512:ℚ)) ((5533259726738261349/18446744073709551616:ℚ)) ((69286771299958072505/18446744073709551616:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((5533259726738261349/18446744073709551616:ℚ):ℚ)+((69286771299958072505/18446744073709551616:ℚ))=((37410015513348166927/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((5/64:ℚ)) remaining01=some ((82230898687592176985/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((5/64:ℚ)) ((33/256:ℚ)) ((7410867660895843131/18446744073709551616:ℚ)) ((37410015513348166927/9223372036854775808:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((7410867660895843131/18446744073709551616:ℚ):ℚ)+((37410015513348166927/9223372036854775808:ℚ))=((82230898687592176985/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((47123238537909148997/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((5/64:ℚ)) ((12015578388226121009/18446744073709551616:ℚ)) ((82230898687592176985/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((12015578388226121009/18446744073709551616:ℚ):ℚ)+((82230898687592176985/18446744073709551616:ℚ))=((47123238537909148997/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((47123238537909148997/9223372036854775808:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((47123238537909148997/9223372036854775808:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((47123238537909148997/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group5558.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family11.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group5558.root.x0 : ℝ) Phase15301Group5558.root.x1)
    (hy : y∈Set.Icc (Phase15301Group5558.root.y0 : ℝ) Phase15301Group5558.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field1 x y u)^2)≤((47123238537909148997/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group5558.root queryRoot 1 chartPermutation
    original_chart_checked ((47123238537909148997/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group5558.Family11.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group5558.Family11.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group5558.Family11.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group5558.Family11.IntervalNormalized.original_directional_integral_bound
