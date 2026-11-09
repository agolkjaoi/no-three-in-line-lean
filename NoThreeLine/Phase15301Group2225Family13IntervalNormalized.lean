import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group2225Family13IntervalNormalizedBlock11
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group2225.Family13.IntervalNormalized
open AutoEnvelope Phase15301Family13

def remaining12 : List NormalizedBlock := []
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining12=some 0 := by decide +kernel

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((61/64:ℚ)) remaining11=some ((2973287101227981987/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((61/64:ℚ)) (1) ((2973287101227981987/18446744073709551616:ℚ)) (0)
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((2973287101227981987/18446744073709551616:ℚ):ℚ)+(0)=((2973287101227981987/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((103/128:ℚ)) remaining10=some ((5962318792294581813/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((103/128:ℚ)) ((61/64:ℚ)) ((8951350483361181639/18446744073709551616:ℚ)) ((2973287101227981987/18446744073709551616:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((8951350483361181639/18446744073709551616:ℚ):ℚ)+((2973287101227981987/18446744073709551616:ℚ))=((5962318792294581813/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((363/512:ℚ)) remaining09=some ((2300977482284501661/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((363/512:ℚ)) ((103/128:ℚ)) ((3241591136843424831/9223372036854775808:ℚ)) ((5962318792294581813/9223372036854775808:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((3241591136843424831/9223372036854775808:ℚ):ℚ)+((5962318792294581813/9223372036854775808:ℚ))=((2300977482284501661/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((39/64:ℚ)) remaining08=some ((25928194200015015805/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((39/64:ℚ)) ((363/512:ℚ)) ((7520374341739002517/18446744073709551616:ℚ)) ((2300977482284501661/2305843009213693952:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((7520374341739002517/18446744073709551616:ℚ):ℚ)+((2300977482284501661/2305843009213693952:ℚ))=((25928194200015015805/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((127/256:ℚ)) remaining07=some ((35346726418017896665/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((127/256:ℚ)) ((39/64:ℚ)) ((2354633054500720215/4611686018427387904:ℚ)) ((25928194200015015805/18446744073709551616:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((2354633054500720215/4611686018427387904:ℚ):ℚ)+((25928194200015015805/18446744073709551616:ℚ))=((35346726418017896665/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((53/128:ℚ)) remaining06=some ((43272595083599164981/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((53/128:ℚ)) ((127/256:ℚ)) ((1981467166395317079/4611686018427387904:ℚ)) ((35346726418017896665/18446744073709551616:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((1981467166395317079/4611686018427387904:ℚ):ℚ)+((35346726418017896665/18446744073709551616:ℚ))=((43272595083599164981/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((85/256:ℚ)) remaining05=some ((12965701102070607831/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((85/256:ℚ)) ((53/128:ℚ)) ((8590209324683266343/18446744073709551616:ℚ)) ((43272595083599164981/18446744073709551616:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((8590209324683266343/18446744073709551616:ℚ):ℚ)+((43272595083599164981/18446744073709551616:ℚ))=((12965701102070607831/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((137/512:ℚ)) remaining04=some ((58913412538332369595/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((137/512:ℚ)) ((85/256:ℚ)) ((7050608130049938271/18446744073709551616:ℚ)) ((12965701102070607831/4611686018427387904:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((7050608130049938271/18446744073709551616:ℚ):ℚ)+((12965701102070607831/4611686018427387904:ℚ))=((58913412538332369595/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((13/64:ℚ)) remaining03=some ((66777339130399241535/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((13/64:ℚ)) ((137/512:ℚ)) ((1965981648016717985/4611686018427387904:ℚ)) ((58913412538332369595/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((1965981648016717985/4611686018427387904:ℚ):ℚ)+((58913412538332369595/18446744073709551616:ℚ))=((66777339130399241535/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((71/512:ℚ)) remaining02=some ((38445588867755347489/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((71/512:ℚ)) ((13/64:ℚ)) ((10113838605111453443/18446744073709551616:ℚ)) ((66777339130399241535/18446744073709551616:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((10113838605111453443/18446744073709551616:ℚ):ℚ)+((66777339130399241535/18446744073709551616:ℚ))=((38445588867755347489/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((23/256:ℚ)) remaining01=some ((10926506050218698337/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((23/256:ℚ)) ((71/512:ℚ)) ((5260435333119445859/9223372036854775808:ℚ)) ((38445588867755347489/9223372036854775808:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((5260435333119445859/9223372036854775808:ℚ):ℚ)+((38445588867755347489/9223372036854775808:ℚ))=((10926506050218698337/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((111432344857270771431/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((23/256:ℚ)) ((24020296455521184735/18446744073709551616:ℚ)) ((10926506050218698337/2305843009213693952:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((24020296455521184735/18446744073709551616:ℚ):ℚ)+((10926506050218698337/2305843009213693952:ℚ))=((111432344857270771431/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((111432344857270771431/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((111432344857270771431/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((111432344857270771431/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group2225.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family13.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group2225.root.x0 : ℝ) Phase15301Group2225.root.x1)
    (hy : y∈Set.Icc (Phase15301Group2225.root.y0 : ℝ) Phase15301Group2225.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field1 x y u)^2)≤((111432344857270771431/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group2225.root queryRoot 3 chartPermutation
    original_chart_checked ((111432344857270771431/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group2225.Family13.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group2225.Family13.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group2225.Family13.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group2225.Family13.IntervalNormalized.original_directional_integral_bound
