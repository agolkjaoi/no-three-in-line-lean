import NoThreeLine.Phase15301Leaf74Family00Block00
import NoThreeLine.Phase15301Leaf74Family00Block01
import NoThreeLine.Phase15301Leaf74Family00Block02
import NoThreeLine.Phase15301Leaf74Family00Block03

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf74.Family00
open AutoEnvelope Phase15301Family00

def remaining04 : List (ℚ × AutoTrace) := []
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining04=some 0 := by decide +kernel

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((15/32:ℚ)) remaining03=some ((1201420673455964939/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((15/32:ℚ)) block03 remaining04
    (1) ((1201420673455964939/18446744073709551616:ℚ)) (0) block03_checked tail04
  have hsum : ((1201420673455964939/18446744073709551616:ℚ) : ℚ)+(0)=((1201420673455964939/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((21/128:ℚ)) remaining02=some ((7802584416615179911/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((21/128:ℚ)) block02 remaining03
    ((15/32:ℚ)) ((1650290935789803743/4611686018427387904:ℚ)) ((1201420673455964939/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((1650290935789803743/4611686018427387904:ℚ) : ℚ)+((1201420673455964939/18446744073709551616:ℚ))=((7802584416615179911/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((9/128:ℚ)) remaining01=some ((5883823574281307521/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((9/128:ℚ)) block01 remaining02
    ((21/128:ℚ)) ((15732709880510050173/18446744073709551616:ℚ)) ((7802584416615179911/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((15732709880510050173/18446744073709551616:ℚ) : ℚ)+((7802584416615179911/18446744073709551616:ℚ))=((5883823574281307521/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((35849469942056758185/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((9/128:ℚ)) ((12314175644931528101/18446744073709551616:ℚ)) ((5883823574281307521/4611686018427387904:ℚ)) block00_checked tail01
  have hsum : ((12314175644931528101/18446744073709551616:ℚ) : ℚ)+((5883823574281307521/4611686018427387904:ℚ))=((35849469942056758185/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((35849469942056758185/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((35849469942056758185/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((35849469942056758185/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((35849469942056758185/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf74.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family00.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf74.root.x0 : ℝ) Phase15301Leaf74.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf74.root.y0 : ℝ) Phase15301Leaf74.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field0 x y u)^2)≤((35849469942056758185/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf74.root queryRoot 0 chartPermutation
    original_chart_checked ((35849469942056758185/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf74.Family00

#print axioms NoThreeLine.Phase15301Leaf74.Family00.data_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family00.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf74.Family00.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family00.original_directional_integral_bound
