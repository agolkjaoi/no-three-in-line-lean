import NoThreeLine.Phase15301Group6568Family03IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group6568Family03IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group6568Family03IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group6568Family03IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group6568Family03IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group6568Family03IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group6568Family03IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group6568Family03IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group6568Family03IntervalNormalizedBlock08
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group6568.Family03.IntervalNormalized
open AutoEnvelope Phase15301Family03

def remaining09 : List NormalizedBlock := []
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining09=some 0 := by decide +kernel

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((115/128:ℚ)) remaining08=some ((6024019174520374177/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((115/128:ℚ)) (1) ((6024019174520374177/18446744073709551616:ℚ)) (0)
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((6024019174520374177/18446744073709551616:ℚ):ℚ)+(0)=((6024019174520374177/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((191/256:ℚ)) remaining07=some ((8346331069102295303/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((191/256:ℚ)) ((115/128:ℚ)) ((10668642963684216429/18446744073709551616:ℚ)) ((6024019174520374177/18446744073709551616:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((10668642963684216429/18446744073709551616:ℚ):ℚ)+((6024019174520374177/18446744073709551616:ℚ))=((8346331069102295303/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((79/128:ℚ)) remaining06=some ((13320010979521223169/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((79/128:ℚ)) ((191/256:ℚ)) ((2486839955209463933/4611686018427387904:ℚ)) ((8346331069102295303/9223372036854775808:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((2486839955209463933/4611686018427387904:ℚ):ℚ)+((8346331069102295303/9223372036854775808:ℚ))=((13320010979521223169/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((31/64:ℚ)) remaining05=some ((38114713488235997749/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((31/64:ℚ)) ((79/128:ℚ)) ((11474691529193551411/18446744073709551616:ℚ)) ((13320010979521223169/9223372036854775808:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((11474691529193551411/18446744073709551616:ℚ):ℚ)+((13320010979521223169/9223372036854775808:ℚ))=((38114713488235997749/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((101/256:ℚ)) remaining04=some ((47917013863912960289/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((101/256:ℚ)) ((31/64:ℚ)) ((2450575093919240635/4611686018427387904:ℚ)) ((38114713488235997749/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((2450575093919240635/4611686018427387904:ℚ):ℚ)+((38114713488235997749/18446744073709551616:ℚ))=((47917013863912960289/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((35/128:ℚ)) remaining03=some ((61522292169432515907/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((35/128:ℚ)) ((101/256:ℚ)) ((6802639152759777809/9223372036854775808:ℚ)) ((47917013863912960289/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((6802639152759777809/9223372036854775808:ℚ):ℚ)+((47917013863912960289/18446744073709551616:ℚ))=((61522292169432515907/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((23/128:ℚ)) remaining02=some ((36747399309096392821/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((23/128:ℚ)) ((35/128:ℚ)) ((11972506448760269735/18446744073709551616:ℚ)) ((61522292169432515907/18446744073709551616:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((11972506448760269735/18446744073709551616:ℚ):ℚ)+((61522292169432515907/18446744073709551616:ℚ))=((36747399309096392821/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((7/64:ℚ)) remaining01=some ((86064670484641929289/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((7/64:ℚ)) ((23/128:ℚ)) ((12569871866449143647/18446744073709551616:ℚ)) ((36747399309096392821/9223372036854775808:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((12569871866449143647/18446744073709551616:ℚ):ℚ)+((36747399309096392821/9223372036854775808:ℚ))=((86064670484641929289/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((55635065930274942445/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((7/64:ℚ)) ((25205461375907955601/18446744073709551616:ℚ)) ((86064670484641929289/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((25205461375907955601/18446744073709551616:ℚ):ℚ)+((86064670484641929289/18446744073709551616:ℚ))=((55635065930274942445/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((55635065930274942445/9223372036854775808:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((55635065930274942445/9223372036854775808:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((55635065930274942445/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group6568.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family03.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group6568.root.x0 : ℝ) Phase15301Group6568.root.x1)
    (hy : y∈Set.Icc (Phase15301Group6568.root.y0 : ℝ) Phase15301Group6568.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field0 x y u)^2)≤((55635065930274942445/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group6568.root queryRoot 3 chartPermutation
    original_chart_checked ((55635065930274942445/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group6568.Family03.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group6568.Family03.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group6568.Family03.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group6568.Family03.IntervalNormalized.original_directional_integral_bound
