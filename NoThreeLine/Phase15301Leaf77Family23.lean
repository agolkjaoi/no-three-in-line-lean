import NoThreeLine.Phase15301Leaf77Family23Block00
import NoThreeLine.Phase15301Leaf77Family23Block01
import NoThreeLine.Phase15301Leaf77Family23Block02
import NoThreeLine.Phase15301Leaf77Family23Block03
import NoThreeLine.Phase15301Leaf77Family23Block04
import NoThreeLine.Phase15301Leaf77Family23Block05
import NoThreeLine.Phase15301Leaf77Family23Block06

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf77.Family23
open AutoEnvelope Phase15301Family23

def remaining07 : List (ℚ × AutoTrace) := []
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining07=some 0 := by decide +kernel

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((53/64:ℚ)) remaining06=some ((10421511855996171321/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((53/64:ℚ)) block06 remaining07
    (1) ((10421511855996171321/18446744073709551616:ℚ)) (0) block06_checked tail07
  have hsum : ((10421511855996171321/18446744073709551616:ℚ) : ℚ)+(0)=((10421511855996171321/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((79/128:ℚ)) remaining05=some ((24197999064372750143/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((79/128:ℚ)) block05 remaining06
    ((53/64:ℚ)) ((6888243604188289411/9223372036854775808:ℚ)) ((10421511855996171321/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((6888243604188289411/9223372036854775808:ℚ) : ℚ)+((10421511855996171321/18446744073709551616:ℚ))=((24197999064372750143/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((117/256:ℚ)) remaining04=some ((4586083552717651271/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((117/256:ℚ)) block04 remaining05
    ((79/128:ℚ)) ((12490669357368460025/18446744073709551616:ℚ)) ((24197999064372750143/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((12490669357368460025/18446744073709551616:ℚ) : ℚ)+((24197999064372750143/18446744073709551616:ℚ))=((4586083552717651271/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((41/128:ℚ)) remaining03=some ((24090003815536747585/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((41/128:ℚ)) block03 remaining04
    ((117/256:ℚ)) ((5745669604666142501/9223372036854775808:ℚ)) ((4586083552717651271/2305843009213693952:ℚ)) block03_checked tail04
  have hsum : ((5745669604666142501/9223372036854775808:ℚ) : ℚ)+((4586083552717651271/2305843009213693952:ℚ))=((24090003815536747585/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((23/128:ℚ)) remaining02=some ((7830568547839008179/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((23/128:ℚ)) block02 remaining03
    ((41/128:ℚ)) ((7232270375819285131/9223372036854775808:ℚ)) ((24090003815536747585/9223372036854775808:ℚ)) block02_checked tail03
  have hsum : ((7232270375819285131/9223372036854775808:ℚ) : ℚ)+((24090003815536747585/9223372036854775808:ℚ))=((7830568547839008179/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((13/128:ℚ)) remaining01=some ((75306437997363177403/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((13/128:ℚ)) block01 remaining02
    ((23/128:ℚ)) ((12661889614651111971/18446744073709551616:ℚ)) ((7830568547839008179/2305843009213693952:ℚ)) block01_checked tail02
  have hsum : ((12661889614651111971/18446744073709551616:ℚ) : ℚ)+((7830568547839008179/2305843009213693952:ℚ))=((75306437997363177403/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((25164730905151647835/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((13/128:ℚ)) ((25352485623243413937/18446744073709551616:ℚ)) ((75306437997363177403/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((25352485623243413937/18446744073709551616:ℚ) : ℚ)+((75306437997363177403/18446744073709551616:ℚ))=((25164730905151647835/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((25164730905151647835/4611686018427387904:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((25164730905151647835/4611686018427387904:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((25164730905151647835/4611686018427387904:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((25164730905151647835/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf77.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family23.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf77.root.x0 : ℝ) Phase15301Leaf77.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf77.root.y0 : ℝ) Phase15301Leaf77.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field2 x y u)^2)≤((25164730905151647835/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf77.root queryRoot 3 chartPermutation
    original_chart_checked ((25164730905151647835/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf77.Family23

#print axioms NoThreeLine.Phase15301Leaf77.Family23.data_checked
#print axioms NoThreeLine.Phase15301Leaf77.Family23.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf77.Family23.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf77.Family23.original_directional_integral_bound
