import NoThreeLine.Phase15301Leaf75Family13Block00
import NoThreeLine.Phase15301Leaf75Family13Block01
import NoThreeLine.Phase15301Leaf75Family13Block02
import NoThreeLine.Phase15301Leaf75Family13Block03
import NoThreeLine.Phase15301Leaf75Family13Block04
import NoThreeLine.Phase15301Leaf75Family13Block05
import NoThreeLine.Phase15301Leaf75Family13Block06

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf75.Family13
open AutoEnvelope Phase15301Family13

def remaining07 : List (ℚ × AutoTrace) := []
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining07=some 0 := by decide +kernel

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((29/32:ℚ)) remaining06=some ((359647396790067477/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((29/32:ℚ)) block06 remaining07
    (1) ((359647396790067477/1152921504606846976:ℚ)) (0) block06_checked tail07
  have hsum : ((359647396790067477/1152921504606846976:ℚ) : ℚ)+(0)=((359647396790067477/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((93/128:ℚ)) remaining05=some ((2129440435589444771/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((93/128:ℚ)) block05 remaining06
    ((29/32:ℚ)) ((1410145642009309817/2305843009213693952:ℚ)) ((359647396790067477/1152921504606846976:ℚ)) block05_checked tail06
  have hsum : ((1410145642009309817/2305843009213693952:ℚ) : ℚ)+((359647396790067477/1152921504606846976:ℚ))=((2129440435589444771/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((127/256:ℚ)) remaining04=some ((2190094261408086385/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((127/256:ℚ)) block04 remaining05
    ((93/128:ℚ)) ((2250748087226727999/2305843009213693952:ℚ)) ((2129440435589444771/2305843009213693952:ℚ)) block04_checked tail05
  have hsum : ((2250748087226727999/2305843009213693952:ℚ) : ℚ)+((2129440435589444771/2305843009213693952:ℚ))=((2190094261408086385/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((45/128:ℚ)) remaining03=some ((49425427062419622875/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((45/128:ℚ)) block03 remaining04
    ((127/256:ℚ)) ((14383918879890240715/18446744073709551616:ℚ)) ((2190094261408086385/1152921504606846976:ℚ)) block03_checked tail04
  have hsum : ((14383918879890240715/18446744073709551616:ℚ) : ℚ)+((2190094261408086385/1152921504606846976:ℚ))=((49425427062419622875/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((53/256:ℚ)) remaining02=some ((65537318747399670393/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((53/256:ℚ)) block02 remaining03
    ((45/128:ℚ)) ((8055945842490023759/9223372036854775808:ℚ)) ((49425427062419622875/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((8055945842490023759/9223372036854775808:ℚ) : ℚ)+((49425427062419622875/18446744073709551616:ℚ))=((65537318747399670393/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((1/8:ℚ)) remaining01=some ((78328375818023335541/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1/8:ℚ)) block01 remaining02
    ((53/256:ℚ)) ((3197764267655916287/4611686018427387904:ℚ)) ((65537318747399670393/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((3197764267655916287/4611686018427387904:ℚ) : ℚ)+((65537318747399670393/18446744073709551616:ℚ))=((78328375818023335541/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((54832329982279439833/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((1/8:ℚ)) ((31336284146535544125/18446744073709551616:ℚ)) ((78328375818023335541/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((31336284146535544125/18446744073709551616:ℚ) : ℚ)+((78328375818023335541/18446744073709551616:ℚ))=((54832329982279439833/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((54832329982279439833/9223372036854775808:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((54832329982279439833/9223372036854775808:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((54832329982279439833/9223372036854775808:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((54832329982279439833/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf75.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family13.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf75.root.x0 : ℝ) Phase15301Leaf75.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf75.root.y0 : ℝ) Phase15301Leaf75.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field1 x y u)^2)≤((54832329982279439833/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf75.root queryRoot 3 chartPermutation
    original_chart_checked ((54832329982279439833/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf75.Family13

#print axioms NoThreeLine.Phase15301Leaf75.Family13.data_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family13.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf75.Family13.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family13.original_directional_integral_bound
