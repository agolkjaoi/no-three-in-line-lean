import NoThreeLine.Phase15301Leaf74Family23Block00
import NoThreeLine.Phase15301Leaf74Family23Block01
import NoThreeLine.Phase15301Leaf74Family23Block02
import NoThreeLine.Phase15301Leaf74Family23Block03
import NoThreeLine.Phase15301Leaf74Family23Block04
import NoThreeLine.Phase15301Leaf74Family23Block05
import NoThreeLine.Phase15301Leaf74Family23Block06
import NoThreeLine.Phase15301Leaf74Family23Block07

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf74.Family23
open AutoEnvelope Phase15301Family23

def remaining08 : List (ℚ × AutoTrace) := []
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining08=some 0 := by decide +kernel

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((219/256:ℚ)) remaining07=some ((4360364803936249593/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((219/256:ℚ)) block07 remaining08
    (1) ((4360364803936249593/9223372036854775808:ℚ)) (0) block07_checked tail08
  have hsum : ((4360364803936249593/9223372036854775808:ℚ) : ℚ)+(0)=((4360364803936249593/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((353/512:ℚ)) remaining06=some ((9534265102892320093/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((353/512:ℚ)) block06 remaining07
    ((219/256:ℚ)) ((1293475074739017625/2305843009213693952:ℚ)) ((4360364803936249593/9223372036854775808:ℚ)) block06_checked tail07
  have hsum : ((1293475074739017625/2305843009213693952:ℚ) : ℚ)+((4360364803936249593/9223372036854775808:ℚ))=((9534265102892320093/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((69/128:ℚ)) remaining05=some ((29745225793680111211/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((69/128:ℚ)) block05 remaining06
    ((353/512:ℚ)) ((10676695587895471025/18446744073709551616:ℚ)) ((9534265102892320093/9223372036854775808:ℚ)) block05_checked tail06
  have hsum : ((10676695587895471025/18446744073709551616:ℚ) : ℚ)+((9534265102892320093/9223372036854775808:ℚ))=((29745225793680111211/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((105/256:ℚ)) remaining04=some ((40629899241898332183/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((105/256:ℚ)) block04 remaining05
    ((69/128:ℚ)) ((2721168362054555243/4611686018427387904:ℚ)) ((29745225793680111211/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((2721168362054555243/4611686018427387904:ℚ) : ℚ)+((29745225793680111211/18446744073709551616:ℚ))=((40629899241898332183/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((9/32:ℚ)) remaining03=some ((3232482398756567381/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((9/32:ℚ)) block03 remaining04
    ((105/256:ℚ)) ((11089819138206745913/18446744073709551616:ℚ)) ((40629899241898332183/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((11089819138206745913/18446744073709551616:ℚ) : ℚ)+((40629899241898332183/18446744073709551616:ℚ))=((3232482398756567381/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((41/256:ℚ)) remaining02=some ((32641419829205352141/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((41/256:ℚ)) block02 remaining03
    ((9/32:ℚ)) ((6781560639152813093/9223372036854775808:ℚ)) ((3232482398756567381/1152921504606846976:ℚ)) block02_checked tail03
  have hsum : ((6781560639152813093/9223372036854775808:ℚ) : ℚ)+((3232482398756567381/1152921504606846976:ℚ))=((32641419829205352141/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((25/256:ℚ)) remaining01=some ((19028317211950126025/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((25/256:ℚ)) block01 remaining02
    ((41/256:ℚ)) ((5415214594694899909/9223372036854775808:ℚ)) ((32641419829205352141/9223372036854775808:ℚ)) block01_checked tail02
  have hsum : ((5415214594694899909/9223372036854775808:ℚ) : ℚ)+((32641419829205352141/9223372036854775808:ℚ))=((19028317211950126025/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((25164304748452926501/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((25/256:ℚ)) ((1533996884125700119/1152921504606846976:ℚ)) ((19028317211950126025/4611686018427387904:ℚ)) block00_checked tail01
  have hsum : ((1533996884125700119/1152921504606846976:ℚ) : ℚ)+((19028317211950126025/4611686018427387904:ℚ))=((25164304748452926501/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((25164304748452926501/4611686018427387904:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((25164304748452926501/4611686018427387904:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((25164304748452926501/4611686018427387904:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((25164304748452926501/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf74.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family23.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf74.root.x0 : ℝ) Phase15301Leaf74.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf74.root.y0 : ℝ) Phase15301Leaf74.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field2 x y u)^2)≤((25164304748452926501/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf74.root queryRoot 3 chartPermutation
    original_chart_checked ((25164304748452926501/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf74.Family23

#print axioms NoThreeLine.Phase15301Leaf74.Family23.data_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family23.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf74.Family23.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family23.original_directional_integral_bound
