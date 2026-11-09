import NoThreeLine.Phase15301Leaf79Family03Block00
import NoThreeLine.Phase15301Leaf79Family03Block01
import NoThreeLine.Phase15301Leaf79Family03Block02
import NoThreeLine.Phase15301Leaf79Family03Block03
import NoThreeLine.Phase15301Leaf79Family03Block04
import NoThreeLine.Phase15301Leaf79Family03Block05
import NoThreeLine.Phase15301Leaf79Family03Block06

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf79.Family03
open AutoEnvelope Phase15301Family03

def remaining07 : List (ℚ × AutoTrace) := []
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining07=some 0 := by decide +kernel

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((127/128:ℚ)) remaining06=some ((419268063657997019/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((127/128:ℚ)) block06 remaining07
    (1) ((419268063657997019/18446744073709551616:ℚ)) (0) block06_checked tail07
  have hsum : ((419268063657997019/18446744073709551616:ℚ) : ℚ)+(0)=((419268063657997019/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((49/64:ℚ)) remaining05=some ((15314908502198770075/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((49/64:ℚ)) block05 remaining06
    ((127/128:ℚ)) ((232744381852199579/288230376151711744:ℚ)) ((419268063657997019/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((232744381852199579/288230376151711744:ℚ) : ℚ)+((419268063657997019/18446744073709551616:ℚ))=((15314908502198770075/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((9/16:ℚ)) remaining04=some ((1948427734588625759/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((9/16:ℚ)) block04 remaining05
    ((49/64:ℚ)) ((15859935251219242069/18446744073709551616:ℚ)) ((15314908502198770075/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((15859935251219242069/18446744073709551616:ℚ) : ℚ)+((15314908502198770075/18446744073709551616:ℚ))=((1948427734588625759/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((25/64:ℚ)) remaining03=some ((48388839632417053121/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((25/64:ℚ)) block03 remaining04
    ((9/16:ℚ)) ((17213995878999040977/18446744073709551616:ℚ)) ((1948427734588625759/1152921504606846976:ℚ)) block03_checked tail04
  have hsum : ((17213995878999040977/18446744073709551616:ℚ) : ℚ)+((1948427734588625759/1152921504606846976:ℚ))=((48388839632417053121/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((15/64:ℚ)) remaining02=some ((66123480692583775443/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((15/64:ℚ)) block02 remaining03
    ((25/64:ℚ)) ((8867320530083361161/9223372036854775808:ℚ)) ((48388839632417053121/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((8867320530083361161/9223372036854775808:ℚ) : ℚ)+((48388839632417053121/18446744073709551616:ℚ))=((66123480692583775443/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((1/8:ℚ)) remaining01=some ((82927549140687893473/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1/8:ℚ)) block01 remaining02
    ((15/64:ℚ)) ((8402034224052059015/9223372036854775808:ℚ)) ((66123480692583775443/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((8402034224052059015/9223372036854775808:ℚ) : ℚ)+((66123480692583775443/18446744073709551616:ℚ))=((82927549140687893473/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((55619614299309691289/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((1/8:ℚ)) ((28311679457931489105/18446744073709551616:ℚ)) ((82927549140687893473/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((28311679457931489105/18446744073709551616:ℚ) : ℚ)+((82927549140687893473/18446744073709551616:ℚ))=((55619614299309691289/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((55619614299309691289/9223372036854775808:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((55619614299309691289/9223372036854775808:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((55619614299309691289/9223372036854775808:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((55619614299309691289/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf79.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family03.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf79.root.x0 : ℝ) Phase15301Leaf79.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf79.root.y0 : ℝ) Phase15301Leaf79.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field0 x y u)^2)≤((55619614299309691289/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf79.root queryRoot 3 chartPermutation
    original_chart_checked ((55619614299309691289/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf79.Family03

#print axioms NoThreeLine.Phase15301Leaf79.Family03.data_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family03.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf79.Family03.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family03.original_directional_integral_bound
