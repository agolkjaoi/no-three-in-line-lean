import NoThreeLine.Phase15301Leaf78Family20Block00
import NoThreeLine.Phase15301Leaf78Family20Block01
import NoThreeLine.Phase15301Leaf78Family20Block02
import NoThreeLine.Phase15301Leaf78Family20Block03
import NoThreeLine.Phase15301Leaf78Family20Block04

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf78.Family20
open AutoEnvelope Phase15301Family20

def remaining05 : List (ℚ × AutoTrace) := []
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining05=some 0 := by decide +kernel

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((21/32:ℚ)) remaining04=some ((2670033823888064561/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((21/32:ℚ)) block04 remaining05
    (1) ((2670033823888064561/18446744073709551616:ℚ)) (0) block04_checked tail05
  have hsum : ((2670033823888064561/18446744073709551616:ℚ) : ℚ)+(0)=((2670033823888064561/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((69/256:ℚ)) remaining03=some ((13676389502937686213/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((69/256:ℚ)) block03 remaining04
    ((21/32:ℚ)) ((2751588919762405413/4611686018427387904:ℚ)) ((2670033823888064561/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((2751588919762405413/4611686018427387904:ℚ) : ℚ)+((2670033823888064561/18446744073709551616:ℚ))=((13676389502937686213/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((73/512:ℚ)) remaining02=some ((13851287691135734151/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((73/512:ℚ)) block02 remaining03
    ((69/256:ℚ)) ((14026185879333782089/18446744073709551616:ℚ)) ((13676389502937686213/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((14026185879333782089/18446744073709551616:ℚ) : ℚ)+((13676389502937686213/18446744073709551616:ℚ))=((13851287691135734151/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((19/256:ℚ)) remaining01=some ((9497635508189042473/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((19/256:ℚ)) block01 remaining02
    ((73/512:ℚ)) ((5143983325242350795/9223372036854775808:ℚ)) ((13851287691135734151/9223372036854775808:ℚ)) block01_checked tail02
  have hsum : ((5143983325242350795/9223372036854775808:ℚ) : ℚ)+((13851287691135734151/9223372036854775808:ℚ))=((9497635508189042473/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((46181478410141476253/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((19/256:ℚ)) ((8190936377385306361/18446744073709551616:ℚ)) ((9497635508189042473/4611686018427387904:ℚ)) block00_checked tail01
  have hsum : ((8190936377385306361/18446744073709551616:ℚ) : ℚ)+((9497635508189042473/4611686018427387904:ℚ))=((46181478410141476253/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((46181478410141476253/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((46181478410141476253/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((46181478410141476253/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((46181478410141476253/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf78.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family20.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf78.root.x0 : ℝ) Phase15301Leaf78.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf78.root.y0 : ℝ) Phase15301Leaf78.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field2 x y u)^2)≤((46181478410141476253/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf78.root queryRoot 0 chartPermutation
    original_chart_checked ((46181478410141476253/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf78.Family20

#print axioms NoThreeLine.Phase15301Leaf78.Family20.data_checked
#print axioms NoThreeLine.Phase15301Leaf78.Family20.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf78.Family20.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf78.Family20.original_directional_integral_bound
