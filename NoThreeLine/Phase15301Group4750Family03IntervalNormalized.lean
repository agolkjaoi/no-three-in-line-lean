import NoThreeLine.Phase15301Group4750Family03IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group4750Family03IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group4750Family03IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group4750Family03IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group4750Family03IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group4750Family03IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group4750Family03IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group4750Family03IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group4750Family03IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group4750Family03IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group4750Family03IntervalNormalizedBlock10
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group4750.Family03.IntervalNormalized
open AutoEnvelope Phase15301Family03

def remaining11 : List NormalizedBlock := []
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining11=some 0 := by decide +kernel

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((113/128:ℚ)) remaining10=some ((7118315584561381301/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((113/128:ℚ)) (1) ((7118315584561381301/18446744073709551616:ℚ)) (0)
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((7118315584561381301/18446744073709551616:ℚ):ℚ)+(0)=((7118315584561381301/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((25/32:ℚ)) remaining09=some ((446138410674207355/576460752303423488:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((25/32:ℚ)) ((113/128:ℚ)) ((7158113557013254059/18446744073709551616:ℚ)) ((7118315584561381301/18446744073709551616:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((7158113557013254059/18446744073709551616:ℚ):ℚ)+((7118315584561381301/18446744073709551616:ℚ))=((446138410674207355/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((339/512:ℚ)) remaining08=some ((5757851685823403283/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((339/512:ℚ)) ((25/32:ℚ)) ((2188744400429744443/4611686018427387904:ℚ)) ((446138410674207355/576460752303423488:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((2188744400429744443/4611686018427387904:ℚ):ℚ)+((446138410674207355/576460752303423488:ℚ))=((5757851685823403283/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((37/64:ℚ)) remaining07=some ((14981652081225785171/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((37/64:ℚ)) ((339/512:ℚ)) ((3465948709578978605/9223372036854775808:ℚ)) ((5757851685823403283/4611686018427387904:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((3465948709578978605/9223372036854775808:ℚ):ℚ)+((5757851685823403283/4611686018427387904:ℚ))=((14981652081225785171/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((117/256:ℚ)) remaining06=some ((2560966454197586091/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((117/256:ℚ)) ((37/64:ℚ)) ((5506079552354903557/9223372036854775808:ℚ)) ((14981652081225785171/9223372036854775808:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((5506079552354903557/9223372036854775808:ℚ):ℚ)+((14981652081225785171/9223372036854775808:ℚ))=((2560966454197586091/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((101/256:ℚ)) remaining05=some ((12023979428741171429/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((101/256:ℚ)) ((117/256:ℚ)) ((1780113611950827065/4611686018427387904:ℚ)) ((2560966454197586091/1152921504606846976:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((1780113611950827065/4611686018427387904:ℚ):ℚ)+((2560966454197586091/1152921504606846976:ℚ))=((12023979428741171429/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((39/128:ℚ)) remaining04=some ((58097742600710648483/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((39/128:ℚ)) ((101/256:ℚ)) ((10001824885745962767/18446744073709551616:ℚ)) ((12023979428741171429/4611686018427387904:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((10001824885745962767/18446744073709551616:ℚ):ℚ)+((12023979428741171429/4611686018427387904:ℚ))=((58097742600710648483/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((123/512:ℚ)) remaining03=some ((32799720328261441303/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((123/512:ℚ)) ((39/128:ℚ)) ((7501698055812234123/18446744073709551616:ℚ)) ((58097742600710648483/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((7501698055812234123/18446744073709551616:ℚ):ℚ)+((58097742600710648483/18446744073709551616:ℚ))=((32799720328261441303/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((21/128:ℚ)) remaining02=some ((19038190827986153075/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((21/128:ℚ)) ((123/512:ℚ)) ((5276661327710864847/9223372036854775808:ℚ)) ((32799720328261441303/9223372036854775808:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((5276661327710864847/9223372036854775808:ℚ):ℚ)+((32799720328261441303/9223372036854775808:ℚ))=((19038190827986153075/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((47/512:ℚ)) remaining01=some ((90202900078284514915/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((47/512:ℚ)) ((21/128:ℚ)) ((14050136766339902615/18446744073709551616:ℚ)) ((19038190827986153075/4611686018427387904:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((14050136766339902615/18446744073709551616:ℚ):ℚ)+((19038190827986153075/4611686018427387904:ℚ))=((90202900078284514915/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((27917248221507157333/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((47/512:ℚ)) ((21466092807744114417/18446744073709551616:ℚ)) ((90202900078284514915/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((21466092807744114417/18446744073709551616:ℚ):ℚ)+((90202900078284514915/18446744073709551616:ℚ))=((27917248221507157333/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((27917248221507157333/4611686018427387904:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((27917248221507157333/4611686018427387904:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((27917248221507157333/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group4750.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family03.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group4750.root.x0 : ℝ) Phase15301Group4750.root.x1)
    (hy : y∈Set.Icc (Phase15301Group4750.root.y0 : ℝ) Phase15301Group4750.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field0 x y u)^2)≤((27917248221507157333/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group4750.root queryRoot 3 chartPermutation
    original_chart_checked ((27917248221507157333/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group4750.Family03.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group4750.Family03.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group4750.Family03.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group4750.Family03.IntervalNormalized.original_directional_integral_bound
