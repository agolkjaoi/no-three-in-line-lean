import NoThreeLine.Phase15301Leaf75Family20Block00
import NoThreeLine.Phase15301Leaf75Family20Block01
import NoThreeLine.Phase15301Leaf75Family20Block02
import NoThreeLine.Phase15301Leaf75Family20Block03

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf75.Family20
open AutoEnvelope Phase15301Family20

def remaining04 : List (ℚ × AutoTrace) := []
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining04=some 0 := by decide +kernel

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((11/32:ℚ)) remaining03=some ((9468008582364943069/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((11/32:ℚ)) block03 remaining04
    (1) ((9468008582364943069/18446744073709551616:ℚ)) (0) block03_checked tail04
  have hsum : ((9468008582364943069/18446744073709551616:ℚ) : ℚ)+(0)=((9468008582364943069/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((21/128:ℚ)) remaining02=some ((24589538534514068849/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((21/128:ℚ)) block02 remaining03
    ((11/32:ℚ)) ((3780382488037281445/4611686018427387904:ℚ)) ((9468008582364943069/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((3780382488037281445/4611686018427387904:ℚ) : ℚ)+((9468008582364943069/18446744073709551616:ℚ))=((24589538534514068849/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((77/1024:ℚ)) remaining01=some ((9465263951348832409/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((77/1024:ℚ)) block01 remaining02
    ((21/128:ℚ)) ((13271517270881260787/18446744073709551616:ℚ)) ((24589538534514068849/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((13271517270881260787/18446744073709551616:ℚ) : ℚ)+((24589538534514068849/18446744073709551616:ℚ))=((9465263951348832409/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((46166406475420303873/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((77/1024:ℚ)) ((8305350670024974237/18446744073709551616:ℚ)) ((9465263951348832409/4611686018427387904:ℚ)) block00_checked tail01
  have hsum : ((8305350670024974237/18446744073709551616:ℚ) : ℚ)+((9465263951348832409/4611686018427387904:ℚ))=((46166406475420303873/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((46166406475420303873/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((46166406475420303873/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((46166406475420303873/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((46166406475420303873/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf75.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family20.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf75.root.x0 : ℝ) Phase15301Leaf75.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf75.root.y0 : ℝ) Phase15301Leaf75.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field2 x y u)^2)≤((46166406475420303873/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf75.root queryRoot 0 chartPermutation
    original_chart_checked ((46166406475420303873/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf75.Family20

#print axioms NoThreeLine.Phase15301Leaf75.Family20.data_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family20.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf75.Family20.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family20.original_directional_integral_bound
