import NoThreeLine.Phase15301Leaf75Family21Block00
import NoThreeLine.Phase15301Leaf75Family21Block01
import NoThreeLine.Phase15301Leaf75Family21Block02
import NoThreeLine.Phase15301Leaf75Family21Block03
import NoThreeLine.Phase15301Leaf75Family21Block04
import NoThreeLine.Phase15301Leaf75Family21Block05
import NoThreeLine.Phase15301Leaf75Family21Block06
import NoThreeLine.Phase15301Leaf75Family21Block07
import NoThreeLine.Phase15301Leaf75Family21Block08
import NoThreeLine.Phase15301Leaf75Family21Block09
import NoThreeLine.Phase15301Leaf75Family21Block10
import NoThreeLine.Phase15301Leaf75Family21Block11

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf75.Family21
open AutoEnvelope Phase15301Family21

def remaining12 : List (ℚ × AutoTrace) := []
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining12=some 0 := by decide +kernel

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((235/256:ℚ)) remaining11=some ((2610036640722510473/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((235/256:ℚ)) block11 remaining12
    (1) ((2610036640722510473/9223372036854775808:ℚ)) (0) block11_checked tail12
  have hsum : ((2610036640722510473/9223372036854775808:ℚ) : ℚ)+(0)=((2610036640722510473/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((109/128:ℚ)) remaining10=some ((4640357248552319187/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((109/128:ℚ)) block10 remaining11
    ((235/256:ℚ)) ((1015160303914904357/4611686018427387904:ℚ)) ((2610036640722510473/9223372036854775808:ℚ)) block10_checked tail11
  have hsum : ((1015160303914904357/4611686018427387904:ℚ) : ℚ)+((2610036640722510473/9223372036854775808:ℚ))=((4640357248552319187/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((97/128:ℚ)) remaining09=some ((3957284966630400963/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((97/128:ℚ)) block09 remaining10
    ((109/128:ℚ)) ((3274212684708482739/9223372036854775808:ℚ)) ((4640357248552319187/9223372036854775808:ℚ)) block09_checked tail10
  have hsum : ((3274212684708482739/9223372036854775808:ℚ) : ℚ)+((4640357248552319187/9223372036854775808:ℚ))=((3957284966630400963/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((171/256:ℚ)) remaining08=some ((21991530922453789147/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((171/256:ℚ)) block08 remaining09
    ((97/128:ℚ)) ((6162391055932185295/18446744073709551616:ℚ)) ((3957284966630400963/4611686018427387904:ℚ)) block08_checked tail09
  have hsum : ((6162391055932185295/18446744073709551616:ℚ) : ℚ)+((3957284966630400963/4611686018427387904:ℚ))=((21991530922453789147/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((73/128:ℚ)) remaining07=some ((29937591246385562527/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((73/128:ℚ)) block07 remaining08
    ((171/256:ℚ)) ((1986515080982943345/4611686018427387904:ℚ)) ((21991530922453789147/18446744073709551616:ℚ)) block07_checked tail08
  have hsum : ((1986515080982943345/4611686018427387904:ℚ) : ℚ)+((21991530922453789147/18446744073709551616:ℚ))=((29937591246385562527/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((125/256:ℚ)) remaining06=some ((35915018217183272817/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((125/256:ℚ)) block06 remaining07
    ((73/128:ℚ)) ((2988713485398855145/9223372036854775808:ℚ)) ((29937591246385562527/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((2988713485398855145/9223372036854775808:ℚ) : ℚ)+((29937591246385562527/18446744073709551616:ℚ))=((35915018217183272817/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((101/256:ℚ)) remaining05=some ((43353380237002951065/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((101/256:ℚ)) block05 remaining06
    ((125/256:ℚ)) ((929795252477459781/2305843009213693952:ℚ)) ((35915018217183272817/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((929795252477459781/2305843009213693952:ℚ) : ℚ)+((35915018217183272817/18446744073709551616:ℚ))=((43353380237002951065/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((5/16:ℚ)) remaining04=some ((49022065426676222583/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((5/16:ℚ)) block04 remaining05
    ((101/256:ℚ)) ((2834342594836635759/9223372036854775808:ℚ)) ((43353380237002951065/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((2834342594836635759/9223372036854775808:ℚ) : ℚ)+((43353380237002951065/18446744073709551616:ℚ))=((49022065426676222583/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((31/128:ℚ)) remaining03=some ((844178565768079641/288230376151711744:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((31/128:ℚ)) block03 remaining04
    ((5/16:ℚ)) ((5005362782480874441/18446744073709551616:ℚ)) ((49022065426676222583/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((5005362782480874441/18446744073709551616:ℚ) : ℚ)+((49022065426676222583/18446744073709551616:ℚ))=((844178565768079641/288230376151711744:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((21/128:ℚ)) remaining02=some ((59445394488877367097/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((21/128:ℚ)) block02 remaining03
    ((31/128:ℚ)) ((5417966279720270073/18446744073709551616:ℚ)) ((844178565768079641/288230376151711744:ℚ)) block02_checked tail03
  have hsum : ((5417966279720270073/18446744073709551616:ℚ) : ℚ)+((844178565768079641/288230376151711744:ℚ))=((59445394488877367097/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((13/128:ℚ)) remaining01=some ((64086277638590611609/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((13/128:ℚ)) block01 remaining02
    ((21/128:ℚ)) ((145027598428538891/576460752303423488:ℚ)) ((59445394488877367097/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((145027598428538891/576460752303423488:ℚ) : ℚ)+((59445394488877367097/18446744073709551616:ℚ))=((64086277638590611609/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((18520962287132846551/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((13/128:ℚ)) ((9997571509940774595/18446744073709551616:ℚ)) ((64086277638590611609/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((9997571509940774595/18446744073709551616:ℚ) : ℚ)+((64086277638590611609/18446744073709551616:ℚ))=((18520962287132846551/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((18520962287132846551/4611686018427387904:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((18520962287132846551/4611686018427387904:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((18520962287132846551/4611686018427387904:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((18520962287132846551/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf75.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family21.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf75.root.x0 : ℝ) Phase15301Leaf75.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf75.root.y0 : ℝ) Phase15301Leaf75.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field2 x y u)^2)≤((18520962287132846551/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf75.root queryRoot 1 chartPermutation
    original_chart_checked ((18520962287132846551/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf75.Family21

#print axioms NoThreeLine.Phase15301Leaf75.Family21.data_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family21.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf75.Family21.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family21.original_directional_integral_bound
