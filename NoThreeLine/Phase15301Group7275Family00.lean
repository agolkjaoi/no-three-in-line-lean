import NoThreeLine.Phase15301Group7275Family00Block00
import NoThreeLine.Phase15301Group7275Family00Block01
import NoThreeLine.Phase15301Group7275Family00Block02
import NoThreeLine.Phase15301Group7275Family00Block03
import NoThreeLine.Phase15301Group7275Family00Block04

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group7275.Family00
open AutoEnvelope Phase15301Family00

def remaining05 : List (ℚ × AutoTrace) := []
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining05=some 0 := by decide +kernel

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((15/32:ℚ)) remaining04=some ((1199545026334025033/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((15/32:ℚ)) block04 remaining05
    (1) ((1199545026334025033/18446744073709551616:ℚ)) (0) block04_checked tail05
  have hsum : ((1199545026334025033/18446744073709551616:ℚ) : ℚ)+(0)=((1199545026334025033/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((25/128:ℚ)) remaining03=some ((5342777835507799319/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((25/128:ℚ)) block03 remaining04
    ((15/32:ℚ)) ((2071616404586887143/9223372036854775808:ℚ)) ((1199545026334025033/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((2071616404586887143/9223372036854775808:ℚ) : ℚ)+((1199545026334025033/18446744073709551616:ℚ))=((5342777835507799319/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((15/128:ℚ)) remaining02=some ((15886484515039430229/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((15/128:ℚ)) block02 remaining03
    ((25/128:ℚ)) ((5271853339765815455/9223372036854775808:ℚ)) ((5342777835507799319/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((5271853339765815455/9223372036854775808:ℚ) : ℚ)+((5342777835507799319/18446744073709551616:ℚ))=((15886484515039430229/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((1/32:ℚ)) remaining01=some ((30087588958541195591/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1/32:ℚ)) block01 remaining02
    ((15/128:ℚ)) ((7100552221750882681/9223372036854775808:ℚ)) ((15886484515039430229/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((7100552221750882681/9223372036854775808:ℚ) : ℚ)+((15886484515039430229/18446744073709551616:ℚ))=((30087588958541195591/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((35841426820386785565/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((1/32:ℚ)) ((2876918930922794987/9223372036854775808:ℚ)) ((30087588958541195591/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((2876918930922794987/9223372036854775808:ℚ) : ℚ)+((30087588958541195591/18446744073709551616:ℚ))=((35841426820386785565/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((35841426820386785565/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((35841426820386785565/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((35841426820386785565/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((35841426820386785565/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group7275.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family00.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group7275.root.x0 : ℝ) Phase15301Group7275.root.x1)
    (hy : y∈Set.Icc (Phase15301Group7275.root.y0 : ℝ) Phase15301Group7275.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field0 x y u)^2)≤((35841426820386785565/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group7275.root queryRoot 0 chartPermutation
    original_chart_checked ((35841426820386785565/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group7275.Family00

#print axioms NoThreeLine.Phase15301Group7275.Family00.data_checked
#print axioms NoThreeLine.Phase15301Group7275.Family00.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Group7275.Family00.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group7275.Family00.original_directional_integral_bound
