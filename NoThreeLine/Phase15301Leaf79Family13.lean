import NoThreeLine.Phase15301Leaf79Family13Block00
import NoThreeLine.Phase15301Leaf79Family13Block01
import NoThreeLine.Phase15301Leaf79Family13Block02
import NoThreeLine.Phase15301Leaf79Family13Block03
import NoThreeLine.Phase15301Leaf79Family13Block04
import NoThreeLine.Phase15301Leaf79Family13Block05
import NoThreeLine.Phase15301Leaf79Family13Block06

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf79.Family13
open AutoEnvelope Phase15301Family13

def remaining07 : List (ℚ × AutoTrace) := []
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining07=some 0 := by decide +kernel

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((115/128:ℚ)) remaining06=some ((193844017015123359/576460752303423488:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((115/128:ℚ)) block06 remaining07
    (1) ((193844017015123359/576460752303423488:ℚ)) (0) block06_checked tail07
  have hsum : ((193844017015123359/576460752303423488:ℚ) : ℚ)+(0)=((193844017015123359/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((23/32:ℚ)) remaining05=some ((8790020306866083303/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((23/32:ℚ)) block05 remaining06
    ((115/128:ℚ)) ((5688516034624109559/9223372036854775808:ℚ)) ((193844017015123359/576460752303423488:ℚ)) block05_checked tail06
  have hsum : ((5688516034624109559/9223372036854775808:ℚ) : ℚ)+((193844017015123359/576460752303423488:ℚ))=((8790020306866083303/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((127/256:ℚ)) remaining04=some ((35043963772916196881/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((127/256:ℚ)) block04 remaining05
    ((23/32:ℚ)) ((17463923159184030275/18446744073709551616:ℚ)) ((8790020306866083303/9223372036854775808:ℚ)) block04_checked tail05
  have hsum : ((17463923159184030275/18446744073709551616:ℚ) : ℚ)+((8790020306866083303/9223372036854775808:ℚ))=((35043963772916196881/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((45/128:ℚ)) remaining03=some ((24714395011536942663/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((45/128:ℚ)) block03 remaining04
    ((127/256:ℚ)) ((14384826250157688445/18446744073709551616:ℚ)) ((35043963772916196881/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((14384826250157688445/18446744073709551616:ℚ) : ℚ)+((35043963772916196881/18446744073709551616:ℚ))=((24714395011536942663/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((53/256:ℚ)) remaining02=some ((65540758884871594393/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((53/256:ℚ)) block02 remaining03
    ((45/128:ℚ)) ((16111968861797709067/18446744073709551616:ℚ)) ((24714395011536942663/9223372036854775808:ℚ)) block02_checked tail03
  have hsum : ((16111968861797709067/18446744073709551616:ℚ) : ℚ)+((24714395011536942663/9223372036854775808:ℚ))=((65540758884871594393/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((1/8:ℚ)) remaining01=some ((19582755232421409643/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1/8:ℚ)) block01 remaining02
    ((53/256:ℚ)) ((12790262044814044179/18446744073709551616:ℚ)) ((65540758884871594393/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((12790262044814044179/18446744073709551616:ℚ) : ℚ)+((65540758884871594393/18446744073709551616:ℚ))=((19582755232421409643/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((54831772322602335571/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((1/8:ℚ)) ((15666261857759516285/9223372036854775808:ℚ)) ((19582755232421409643/4611686018427387904:ℚ)) block00_checked tail01
  have hsum : ((15666261857759516285/9223372036854775808:ℚ) : ℚ)+((19582755232421409643/4611686018427387904:ℚ))=((54831772322602335571/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((54831772322602335571/9223372036854775808:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((54831772322602335571/9223372036854775808:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((54831772322602335571/9223372036854775808:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((54831772322602335571/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf79.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family13.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf79.root.x0 : ℝ) Phase15301Leaf79.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf79.root.y0 : ℝ) Phase15301Leaf79.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field1 x y u)^2)≤((54831772322602335571/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf79.root queryRoot 3 chartPermutation
    original_chart_checked ((54831772322602335571/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf79.Family13

#print axioms NoThreeLine.Phase15301Leaf79.Family13.data_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family13.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf79.Family13.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family13.original_directional_integral_bound
