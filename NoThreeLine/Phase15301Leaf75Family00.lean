import NoThreeLine.Phase15301Leaf75Family00Block00
import NoThreeLine.Phase15301Leaf75Family00Block01
import NoThreeLine.Phase15301Leaf75Family00Block02
import NoThreeLine.Phase15301Leaf75Family00Block03

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf75.Family00
open AutoEnvelope Phase15301Family00

def remaining04 : List (ℚ × AutoTrace) := []
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining04=some 0 := by decide +kernel

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((1/2:ℚ)) remaining03=some ((527806883604211987/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1/2:ℚ)) block03 remaining04
    (1) ((527806883604211987/9223372036854775808:ℚ)) (0) block03_checked tail04
  have hsum : ((527806883604211987/9223372036854775808:ℚ) : ℚ)+(0)=((527806883604211987/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((11/64:ℚ)) remaining02=some ((876163850944847723/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((11/64:ℚ)) block02 remaining03
    ((1/2:ℚ)) ((2976848520175178905/9223372036854775808:ℚ)) ((527806883604211987/9223372036854775808:ℚ)) block02_checked tail03
  have hsum : ((2976848520175178905/9223372036854775808:ℚ) : ℚ)+((527806883604211987/9223372036854775808:ℚ))=((876163850944847723/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((19/256:ℚ)) remaining01=some ((22922214863588366369/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((19/256:ℚ)) block01 remaining02
    ((11/64:ℚ)) ((15912904056029584585/18446744073709551616:ℚ)) ((876163850944847723/2305843009213693952:ℚ)) block01_checked tail02
  have hsum : ((15912904056029584585/18446744073709551616:ℚ) : ℚ)+((876163850944847723/2305843009213693952:ℚ))=((22922214863588366369/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((8957766258583755611/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((19/256:ℚ)) ((12908850170746656075/18446744073709551616:ℚ)) ((22922214863588366369/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((12908850170746656075/18446744073709551616:ℚ) : ℚ)+((22922214863588366369/18446744073709551616:ℚ))=((8957766258583755611/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((8957766258583755611/4611686018427387904:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((8957766258583755611/4611686018427387904:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((8957766258583755611/4611686018427387904:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((8957766258583755611/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf75.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family00.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf75.root.x0 : ℝ) Phase15301Leaf75.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf75.root.y0 : ℝ) Phase15301Leaf75.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field0 x y u)^2)≤((8957766258583755611/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf75.root queryRoot 0 chartPermutation
    original_chart_checked ((8957766258583755611/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf75.Family00

#print axioms NoThreeLine.Phase15301Leaf75.Family00.data_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family00.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf75.Family00.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family00.original_directional_integral_bound
