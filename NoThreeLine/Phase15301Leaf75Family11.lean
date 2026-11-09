import NoThreeLine.Phase15301Leaf75Family11Block00
import NoThreeLine.Phase15301Leaf75Family11Block01
import NoThreeLine.Phase15301Leaf75Family11Block02
import NoThreeLine.Phase15301Leaf75Family11Block03
import NoThreeLine.Phase15301Leaf75Family11Block04
import NoThreeLine.Phase15301Leaf75Family11Block05
import NoThreeLine.Phase15301Leaf75Family11Block06
import NoThreeLine.Phase15301Leaf75Family11Block07
import NoThreeLine.Phase15301Leaf75Family11Block08
import NoThreeLine.Phase15301Leaf75Family11Block09
import NoThreeLine.Phase15301Leaf75Family11Block10

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf75.Family11
open AutoEnvelope Phase15301Family11

def remaining11 : List (ℚ × AutoTrace) := []
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining11=some 0 := by decide +kernel

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((29/32:ℚ)) remaining10=some ((6382982039551453353/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((29/32:ℚ)) block10 remaining11
    (1) ((6382982039551453353/18446744073709551616:ℚ)) (0) block10_checked tail11
  have hsum : ((6382982039551453353/18446744073709551616:ℚ) : ℚ)+(0)=((6382982039551453353/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((209/256:ℚ)) remaining09=some ((11685400110317055849/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((209/256:ℚ)) block09 remaining10
    ((29/32:ℚ)) ((82850282355712539/288230376151711744:ℚ)) ((6382982039551453353/18446744073709551616:ℚ)) block09_checked tail10
  have hsum : ((82850282355712539/288230376151711744:ℚ) : ℚ)+((6382982039551453353/18446744073709551616:ℚ))=((11685400110317055849/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((365/512:ℚ)) remaining08=some ((10070677775681173657/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((365/512:ℚ)) block08 remaining09
    ((209/256:ℚ)) ((8455955441045291465/18446744073709551616:ℚ)) ((11685400110317055849/18446744073709551616:ℚ)) block08_checked tail09
  have hsum : ((8455955441045291465/18446744073709551616:ℚ) : ℚ)+((11685400110317055849/18446744073709551616:ℚ))=((10070677775681173657/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((77/128:ℚ)) remaining07=some ((28933406162013299727/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((77/128:ℚ)) block07 remaining08
    ((365/512:ℚ)) ((8792050610650952413/18446744073709551616:ℚ)) ((10070677775681173657/9223372036854775808:ℚ)) block07_checked tail08
  have hsum : ((8792050610650952413/18446744073709551616:ℚ) : ℚ)+((10070677775681173657/9223372036854775808:ℚ))=((28933406162013299727/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((33/64:ℚ)) remaining06=some ((36196669161130788885/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((33/64:ℚ)) block06 remaining07
    ((77/128:ℚ)) ((3631631499558744579/9223372036854775808:ℚ)) ((28933406162013299727/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((3631631499558744579/9223372036854775808:ℚ) : ℚ)+((28933406162013299727/18446744073709551616:ℚ))=((36196669161130788885/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((105/256:ℚ)) remaining05=some ((45118396093181950847/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((105/256:ℚ)) block05 remaining06
    ((33/64:ℚ)) ((4460863466025580981/9223372036854775808:ℚ)) ((36196669161130788885/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((4460863466025580981/9223372036854775808:ℚ) : ℚ)+((36196669161130788885/18446744073709551616:ℚ))=((45118396093181950847/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((39/128:ℚ)) remaining04=some ((54836353051738311637/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((39/128:ℚ)) block04 remaining05
    ((105/256:ℚ)) ((4858978479278180395/9223372036854775808:ℚ)) ((45118396093181950847/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((4858978479278180395/9223372036854775808:ℚ) : ℚ)+((45118396093181950847/18446744073709551616:ℚ))=((54836353051738311637/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((59/256:ℚ)) remaining03=some ((1945239542684548537/576460752303423488:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((59/256:ℚ)) block03 remaining04
    ((39/128:ℚ)) ((7411312314167241547/18446744073709551616:ℚ)) ((54836353051738311637/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((7411312314167241547/18446744073709551616:ℚ) : ℚ)+((54836353051738311637/18446744073709551616:ℚ))=((1945239542684548537/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((41/256:ℚ)) remaining02=some ((35493786636834699437/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((41/256:ℚ)) block02 remaining03
    ((59/256:ℚ)) ((4369953953881922845/9223372036854775808:ℚ)) ((1945239542684548537/576460752303423488:ℚ)) block02_checked tail03
  have hsum : ((4369953953881922845/9223372036854775808:ℚ) : ℚ)+((1945239542684548537/576460752303423488:ℚ))=((35493786636834699437/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((13/128:ℚ)) remaining01=some ((78778082457325817397/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((13/128:ℚ)) block01 remaining02
    ((41/256:ℚ)) ((7790509183656418523/18446744073709551616:ℚ)) ((35493786636834699437/9223372036854775808:ℚ)) block01_checked tail02
  have hsum : ((7790509183656418523/18446744073709551616:ℚ) : ℚ)+((35493786636834699437/9223372036854775808:ℚ))=((78778082457325817397/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((94313887005744789603/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((13/128:ℚ)) ((7767902274209486103/9223372036854775808:ℚ)) ((78778082457325817397/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((7767902274209486103/9223372036854775808:ℚ) : ℚ)+((78778082457325817397/18446744073709551616:ℚ))=((94313887005744789603/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((94313887005744789603/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((94313887005744789603/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((94313887005744789603/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((94313887005744789603/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf75.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family11.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf75.root.x0 : ℝ) Phase15301Leaf75.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf75.root.y0 : ℝ) Phase15301Leaf75.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field1 x y u)^2)≤((94313887005744789603/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf75.root queryRoot 1 chartPermutation
    original_chart_checked ((94313887005744789603/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf75.Family11

#print axioms NoThreeLine.Phase15301Leaf75.Family11.data_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family11.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf75.Family11.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family11.original_directional_integral_bound
