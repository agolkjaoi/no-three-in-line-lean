import NoThreeLine.Phase15301Leaf77Family03Block00
import NoThreeLine.Phase15301Leaf77Family03Block01
import NoThreeLine.Phase15301Leaf77Family03Block02
import NoThreeLine.Phase15301Leaf77Family03Block03
import NoThreeLine.Phase15301Leaf77Family03Block04
import NoThreeLine.Phase15301Leaf77Family03Block05

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf77.Family03
open AutoEnvelope Phase15301Family03

def remaining06 : List (ℚ × AutoTrace) := []
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining06=some 0 := by decide +kernel

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((7/8:ℚ)) remaining05=some ((7611405865835516887/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((7/8:ℚ)) block05 remaining06
    (1) ((7611405865835516887/18446744073709551616:ℚ)) (0) block05_checked tail06
  have hsum : ((7611405865835516887/18446744073709551616:ℚ) : ℚ)+(0)=((7611405865835516887/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((169/256:ℚ)) remaining04=some ((23113126748989210173/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((169/256:ℚ)) block04 remaining05
    ((7/8:ℚ)) ((7750860441576846643/9223372036854775808:ℚ)) ((7611405865835516887/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((7750860441576846643/9223372036854775808:ℚ) : ℚ)+((7611405865835516887/18446744073709551616:ℚ))=((23113126748989210173/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((115/256:ℚ)) remaining03=some ((10415025355274836199/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((115/256:ℚ)) block03 remaining04
    ((169/256:ℚ)) ((18546974672110134623/18446744073709551616:ℚ)) ((23113126748989210173/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((18546974672110134623/18446744073709551616:ℚ) : ℚ)+((23113126748989210173/18446744073709551616:ℚ))=((10415025355274836199/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((9/32:ℚ)) remaining02=some ((30311619226253527349/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((9/32:ℚ)) block02 remaining03
    ((115/256:ℚ)) ((9481568515703854951/9223372036854775808:ℚ)) ((10415025355274836199/4611686018427387904:ℚ)) block02_checked tail03
  have hsum : ((9481568515703854951/9223372036854775808:ℚ) : ℚ)+((10415025355274836199/4611686018427387904:ℚ))=((30311619226253527349/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((37/256:ℚ)) remaining01=some ((79266666093762354129/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((37/256:ℚ)) block01 remaining02
    ((9/32:ℚ)) ((18643427641255299431/18446744073709551616:ℚ)) ((30311619226253527349/9223372036854775808:ℚ)) block01_checked tail02
  have hsum : ((18643427641255299431/18446744073709551616:ℚ) : ℚ)+((30311619226253527349/9223372036854775808:ℚ))=((79266666093762354129/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((13907050190967102225/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((37/256:ℚ)) ((31989735433974463671/18446744073709551616:ℚ)) ((79266666093762354129/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((31989735433974463671/18446744073709551616:ℚ) : ℚ)+((79266666093762354129/18446744073709551616:ℚ))=((13907050190967102225/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((13907050190967102225/2305843009213693952:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((13907050190967102225/2305843009213693952:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((13907050190967102225/2305843009213693952:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((13907050190967102225/2305843009213693952:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf77.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family03.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf77.root.x0 : ℝ) Phase15301Leaf77.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf77.root.y0 : ℝ) Phase15301Leaf77.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field0 x y u)^2)≤((13907050190967102225/2305843009213693952:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf77.root queryRoot 3 chartPermutation
    original_chart_checked ((13907050190967102225/2305843009213693952:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf77.Family03

#print axioms NoThreeLine.Phase15301Leaf77.Family03.data_checked
#print axioms NoThreeLine.Phase15301Leaf77.Family03.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf77.Family03.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf77.Family03.original_directional_integral_bound
