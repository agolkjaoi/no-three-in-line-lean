import NoThreeLine.Phase15301Group7275Family20Block00
import NoThreeLine.Phase15301Group7275Family20Block01
import NoThreeLine.Phase15301Group7275Family20Block02
import NoThreeLine.Phase15301Group7275Family20Block03
import NoThreeLine.Phase15301Group7275Family20Block04
import NoThreeLine.Phase15301Group7275Family20Block05

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group7275.Family20
open AutoEnvelope Phase15301Family20

def remaining06 : List (ℚ × AutoTrace) := []
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining06=some 0 := by decide +kernel

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((3/4:ℚ)) remaining05=some ((1736080793631051931/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3/4:ℚ)) block05 remaining06
    (1) ((1736080793631051931/18446744073709551616:ℚ)) (0) block05_checked tail06
  have hsum : ((1736080793631051931/18446744073709551616:ℚ) : ℚ)+(0)=((1736080793631051931/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((21/64:ℚ)) remaining04=some ((5092976020549142577/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((21/64:ℚ)) block04 remaining05
    ((3/4:ℚ)) ((8449871247467233223/18446744073709551616:ℚ)) ((1736080793631051931/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((8449871247467233223/18446744073709551616:ℚ) : ℚ)+((1736080793631051931/18446744073709551616:ℚ))=((5092976020549142577/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((49/256:ℚ)) remaining03=some ((21126731909079355495/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((49/256:ℚ)) block03 remaining04
    ((21/64:ℚ)) ((10940779867981070341/18446744073709551616:ℚ)) ((5092976020549142577/9223372036854775808:ℚ)) block03_checked tail04
  have hsum : ((10940779867981070341/18446744073709551616:ℚ) : ℚ)+((5092976020549142577/9223372036854775808:ℚ))=((21126731909079355495/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((29/256:ℚ)) remaining02=some ((16274237014212316353/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((29/256:ℚ)) block02 remaining03
    ((49/256:ℚ)) ((11421742119345277211/18446744073709551616:ℚ)) ((21126731909079355495/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((11421742119345277211/18446744073709551616:ℚ) : ℚ)+((21126731909079355495/18446744073709551616:ℚ))=((16274237014212316353/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((5/128:ℚ)) remaining01=some ((20986494425857428839/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((5/128:ℚ)) block01 remaining02
    ((29/256:ℚ)) ((2356128705822556243/4611686018427387904:ℚ)) ((16274237014212316353/9223372036854775808:ℚ)) block01_checked tail02
  have hsum : ((2356128705822556243/4611686018427387904:ℚ) : ℚ)+((16274237014212316353/9223372036854775808:ℚ))=((20986494425857428839/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((11542085799624312035/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((5/128:ℚ)) ((2097677173391195231/9223372036854775808:ℚ)) ((20986494425857428839/9223372036854775808:ℚ)) block00_checked tail01
  have hsum : ((2097677173391195231/9223372036854775808:ℚ) : ℚ)+((20986494425857428839/9223372036854775808:ℚ))=((11542085799624312035/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((11542085799624312035/4611686018427387904:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((11542085799624312035/4611686018427387904:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((11542085799624312035/4611686018427387904:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((11542085799624312035/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group7275.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family20.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group7275.root.x0 : ℝ) Phase15301Group7275.root.x1)
    (hy : y∈Set.Icc (Phase15301Group7275.root.y0 : ℝ) Phase15301Group7275.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field2 x y u)^2)≤((11542085799624312035/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group7275.root queryRoot 0 chartPermutation
    original_chart_checked ((11542085799624312035/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group7275.Family20

#print axioms NoThreeLine.Phase15301Group7275.Family20.data_checked
#print axioms NoThreeLine.Phase15301Group7275.Family20.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Group7275.Family20.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group7275.Family20.original_directional_integral_bound
