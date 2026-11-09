import NoThreeLine.Phase15301Leaf79Family23Block00
import NoThreeLine.Phase15301Leaf79Family23Block01
import NoThreeLine.Phase15301Leaf79Family23Block02
import NoThreeLine.Phase15301Leaf79Family23Block03
import NoThreeLine.Phase15301Leaf79Family23Block04
import NoThreeLine.Phase15301Leaf79Family23Block05
import NoThreeLine.Phase15301Leaf79Family23Block06
import NoThreeLine.Phase15301Leaf79Family23Block07

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf79.Family23
open AutoEnvelope Phase15301Family23

def remaining08 : List (ℚ × AutoTrace) := []
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining08=some 0 := by decide +kernel

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((113/128:ℚ)) remaining07=some ((1758748586926805513/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((113/128:ℚ)) block07 remaining08
    (1) ((1758748586926805513/4611686018427387904:ℚ)) (0) block07_checked tail08
  have hsum : ((1758748586926805513/4611686018427387904:ℚ) : ℚ)+(0)=((1758748586926805513/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((89/128:ℚ)) remaining06=some ((18657120372031234935/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((89/128:ℚ)) block06 remaining07
    ((113/128:ℚ)) ((11622126024324012883/18446744073709551616:ℚ)) ((1758748586926805513/4611686018427387904:ℚ)) block06_checked tail07
  have hsum : ((11622126024324012883/18446744073709551616:ℚ) : ℚ)+((1758748586926805513/4611686018427387904:ℚ))=((18657120372031234935/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((281/512:ℚ)) remaining05=some ((29004877286439844651/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((281/512:ℚ)) block05 remaining06
    ((89/128:ℚ)) ((2586939228602152429/4611686018427387904:ℚ)) ((18657120372031234935/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((2586939228602152429/4611686018427387904:ℚ) : ℚ)+((18657120372031234935/18446744073709551616:ℚ))=((29004877286439844651/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((53/128:ℚ)) remaining04=some ((10077948509731568425/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((53/128:ℚ)) block04 remaining05
    ((281/512:ℚ)) ((11306916752486429049/18446744073709551616:ℚ)) ((29004877286439844651/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((11306916752486429049/18446744073709551616:ℚ) : ℚ)+((29004877286439844651/18446744073709551616:ℚ))=((10077948509731568425/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((37/128:ℚ)) remaining03=some ((50991386661954934147/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((37/128:ℚ)) block03 remaining04
    ((53/128:ℚ)) ((10679592623028660447/18446744073709551616:ℚ)) ((10077948509731568425/4611686018427387904:ℚ)) block03_checked tail04
  have hsum : ((10679592623028660447/18446744073709551616:ℚ) : ℚ)+((10077948509731568425/4611686018427387904:ℚ))=((50991386661954934147/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((21/128:ℚ)) remaining02=some ((32369120925038781725/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((21/128:ℚ)) block02 remaining03
    ((37/128:ℚ)) ((13746855188122629303/18446744073709551616:ℚ)) ((50991386661954934147/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((13746855188122629303/18446744073709551616:ℚ) : ℚ)+((50991386661954934147/18446744073709551616:ℚ))=((32369120925038781725/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((3/32:ℚ)) remaining01=some ((38465125185654197701/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3/32:ℚ)) block01 remaining02
    ((21/128:ℚ)) ((762000532576926997/1152921504606846976:ℚ)) ((32369120925038781725/9223372036854775808:ℚ)) block01_checked tail02
  have hsum : ((762000532576926997/1152921504606846976:ℚ) : ℚ)+((32369120925038781725/9223372036854775808:ℚ))=((38465125185654197701/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((50326738886216894357/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((3/32:ℚ)) ((741350856285168541/576460752303423488:ℚ)) ((38465125185654197701/9223372036854775808:ℚ)) block00_checked tail01
  have hsum : ((741350856285168541/576460752303423488:ℚ) : ℚ)+((38465125185654197701/9223372036854775808:ℚ))=((50326738886216894357/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((50326738886216894357/9223372036854775808:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((50326738886216894357/9223372036854775808:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((50326738886216894357/9223372036854775808:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((50326738886216894357/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf79.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family23.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf79.root.x0 : ℝ) Phase15301Leaf79.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf79.root.y0 : ℝ) Phase15301Leaf79.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field2 x y u)^2)≤((50326738886216894357/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf79.root queryRoot 3 chartPermutation
    original_chart_checked ((50326738886216894357/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf79.Family23

#print axioms NoThreeLine.Phase15301Leaf79.Family23.data_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family23.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf79.Family23.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family23.original_directional_integral_bound
