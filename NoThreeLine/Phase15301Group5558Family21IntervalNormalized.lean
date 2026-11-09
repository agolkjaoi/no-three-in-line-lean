import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock11
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock12
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock13
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock14
import NoThreeLine.Phase15301Group5558Family21IntervalNormalizedBlock15
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group5558.Family21.IntervalNormalized
open AutoEnvelope Phase15301Family21

def remaining16 : List NormalizedBlock := []
theorem tail16 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining16=some 0 := by decide +kernel

def remaining15 : List NormalizedBlock := block15::remaining16
theorem tail15 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((121/128:ℚ)) remaining15=some ((3407317309456457223/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block15Expr 18446744073709551616
    ((121/128:ℚ)) (1) ((3407317309456457223/18446744073709551616:ℚ)) (0)
    block15Cuts remaining16 block15_normalization block15_checked tail16
  have hs : ((3407317309456457223/18446744073709551616:ℚ):ℚ)+(0)=((3407317309456457223/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining15,block15,hs] using h

def remaining14 : List NormalizedBlock := block14::remaining15
theorem tail14 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((1789/2048:ℚ)) remaining14=some ((8003937023084694187/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block14Expr 18446744073709551616
    ((1789/2048:ℚ)) ((121/128:ℚ)) ((1149154928407059241/4611686018427387904:ℚ)) ((3407317309456457223/18446744073709551616:ℚ))
    block14Cuts remaining15 block14_normalization block14_checked tail15
  have hs : ((1149154928407059241/4611686018427387904:ℚ):ℚ)+((3407317309456457223/18446744073709551616:ℚ))=((8003937023084694187/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining14,block14,hs] using h

def remaining13 : List NormalizedBlock := block13::remaining14
theorem tail13 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((105/128:ℚ)) remaining13=some ((11286772170759427957/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block13Expr 18446744073709551616
    ((105/128:ℚ)) ((1789/2048:ℚ)) ((1641417573837366885/9223372036854775808:ℚ)) ((8003937023084694187/18446744073709551616:ℚ))
    block13Cuts remaining14 block13_normalization block13_checked tail14
  have hs : ((1641417573837366885/9223372036854775808:ℚ):ℚ)+((8003937023084694187/18446744073709551616:ℚ))=((11286772170759427957/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining13,block13,hs] using h

def remaining12 : List NormalizedBlock := block12::remaining13
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((197/256:ℚ)) remaining12=some ((1871109026918796793/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block12Expr 18446744073709551616
    ((197/256:ℚ)) ((105/128:ℚ)) ((3682100044590946387/18446744073709551616:ℚ)) ((11286772170759427957/18446744073709551616:ℚ))
    block12Cuts remaining13 block12_normalization block12_checked tail13
  have hs : ((3682100044590946387/18446744073709551616:ℚ):ℚ)+((11286772170759427957/18446744073709551616:ℚ))=((1871109026918796793/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining12,block12,hs] using h

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((89/128:ℚ)) remaining11=some ((10051419246461502541/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((89/128:ℚ)) ((197/256:ℚ)) ((2566983138786315369/9223372036854775808:ℚ)) ((1871109026918796793/2305843009213693952:ℚ))
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((2566983138786315369/9223372036854775808:ℚ):ℚ)+((1871109026918796793/2305843009213693952:ℚ))=((10051419246461502541/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((323/512:ℚ)) remaining10=some ((24870117871854337523/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((323/512:ℚ)) ((89/128:ℚ)) ((4767279378931332441/18446744073709551616:ℚ)) ((10051419246461502541/9223372036854775808:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((4767279378931332441/18446744073709551616:ℚ):ℚ)+((10051419246461502541/9223372036854775808:ℚ))=((24870117871854337523/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((289/512:ℚ)) remaining09=some ((15178405229638853509/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((289/512:ℚ)) ((323/512:ℚ)) ((5486692587423369495/18446744073709551616:ℚ)) ((24870117871854337523/18446744073709551616:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((5486692587423369495/18446744073709551616:ℚ):ℚ)+((24870117871854337523/18446744073709551616:ℚ))=((15178405229638853509/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((507/1024:ℚ)) remaining08=some ((8837195562536239019/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((507/1024:ℚ)) ((289/512:ℚ)) ((2495985895433624529/9223372036854775808:ℚ)) ((15178405229638853509/9223372036854775808:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((2495985895433624529/9223372036854775808:ℚ):ℚ)+((15178405229638853509/9223372036854775808:ℚ))=((8837195562536239019/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((223/512:ℚ)) remaining07=some ((10048990655806311563/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((223/512:ℚ)) ((507/1024:ℚ)) ((37868596664689767/144115188075855872:ℚ)) ((8837195562536239019/4611686018427387904:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((37868596664689767/144115188075855872:ℚ):ℚ)+((8837195562536239019/4611686018427387904:ℚ))=((10048990655806311563/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((95/256:ℚ)) remaining06=some ((44996451403184189653/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((95/256:ℚ)) ((223/512:ℚ)) ((4800488779958943401/18446744073709551616:ℚ)) ((10048990655806311563/4611686018427387904:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((4800488779958943401/18446744073709551616:ℚ):ℚ)+((10048990655806311563/4611686018427387904:ℚ))=((44996451403184189653/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((163/512:ℚ)) remaining05=some ((12157203319568775947/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((163/512:ℚ)) ((95/256:ℚ)) ((3632361875090914135/18446744073709551616:ℚ)) ((44996451403184189653/18446744073709551616:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((3632361875090914135/18446744073709551616:ℚ):ℚ)+((44996451403184189653/18446744073709551616:ℚ))=((12157203319568775947/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((67/256:ℚ)) remaining04=some ((52625626628195792583/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((67/256:ℚ)) ((163/512:ℚ)) ((3996813349920688795/18446744073709551616:ℚ)) ((12157203319568775947/4611686018427387904:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((3996813349920688795/18446744073709551616:ℚ):ℚ)+((12157203319568775947/4611686018427387904:ℚ))=((52625626628195792583/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((99/512:ℚ)) remaining03=some ((28718889482925279137/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((99/512:ℚ)) ((67/256:ℚ)) ((4812152337654765691/18446744073709551616:ℚ)) ((52625626628195792583/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((4812152337654765691/18446744073709551616:ℚ):ℚ)+((52625626628195792583/18446744073709551616:ℚ))=((28718889482925279137/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((69/512:ℚ)) remaining02=some ((30801184833516360091/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((69/512:ℚ)) ((99/512:ℚ)) ((1041147675295540477/4611686018427387904:ℚ)) ((28718889482925279137/9223372036854775808:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((1041147675295540477/4611686018427387904:ℚ):ℚ)+((28718889482925279137/9223372036854775808:ℚ))=((30801184833516360091/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((21/256:ℚ)) remaining01=some ((16414792913431748647/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((21/256:ℚ)) ((69/512:ℚ)) ((2028400993347137203/9223372036854775808:ℚ)) ((30801184833516360091/9223372036854775808:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((2028400993347137203/9223372036854775808:ℚ):ℚ)+((30801184833516360091/9223372036854775808:ℚ))=((16414792913431748647/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((18510775045784573947/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((21/256:ℚ)) ((523995533088206325/1152921504606846976:ℚ)) ((16414792913431748647/4611686018427387904:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((523995533088206325/1152921504606846976:ℚ):ℚ)+((16414792913431748647/4611686018427387904:ℚ))=((18510775045784573947/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((18510775045784573947/4611686018427387904:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((18510775045784573947/4611686018427387904:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((18510775045784573947/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group5558.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family21.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group5558.root.x0 : ℝ) Phase15301Group5558.root.x1)
    (hy : y∈Set.Icc (Phase15301Group5558.root.y0 : ℝ) Phase15301Group5558.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field2 x y u)^2)≤((18510775045784573947/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group5558.root queryRoot 1 chartPermutation
    original_chart_checked ((18510775045784573947/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group5558.Family21.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group5558.Family21.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group5558.Family21.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group5558.Family21.IntervalNormalized.original_directional_integral_bound
