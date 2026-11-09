import NoThreeLine.Phase15301Leaf74Family21Block00
import NoThreeLine.Phase15301Leaf74Family21Block01
import NoThreeLine.Phase15301Leaf74Family21Block02
import NoThreeLine.Phase15301Leaf74Family21Block03
import NoThreeLine.Phase15301Leaf74Family21Block04
import NoThreeLine.Phase15301Leaf74Family21Block05
import NoThreeLine.Phase15301Leaf74Family21Block06
import NoThreeLine.Phase15301Leaf74Family21Block07
import NoThreeLine.Phase15301Leaf74Family21Block08
import NoThreeLine.Phase15301Leaf74Family21Block09
import NoThreeLine.Phase15301Leaf74Family21Block10
import NoThreeLine.Phase15301Leaf74Family21Block11

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf74.Family21
open AutoEnvelope Phase15301Family21

def remaining12 : List (ℚ × AutoTrace) := []
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining12=some 0 := by decide +kernel

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((59/64:ℚ)) remaining11=some ((4960691524199841551/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((59/64:ℚ)) block11 remaining12
    (1) ((4960691524199841551/18446744073709551616:ℚ)) (0) block11_checked tail12
  have hsum : ((4960691524199841551/18446744073709551616:ℚ) : ℚ)+(0)=((4960691524199841551/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((219/256:ℚ)) remaining10=some ((9049460928674448833/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((219/256:ℚ)) block10 remaining11
    ((59/64:ℚ)) ((2044384702237303641/9223372036854775808:ℚ)) ((4960691524199841551/18446744073709551616:ℚ)) block10_checked tail11
  have hsum : ((2044384702237303641/9223372036854775808:ℚ) : ℚ)+((4960691524199841551/18446744073709551616:ℚ))=((9049460928674448833/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((49/64:ℚ)) remaining09=some ((15263736542088364893/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((49/64:ℚ)) block09 remaining10
    ((219/256:ℚ)) ((1553568903353479015/4611686018427387904:ℚ)) ((9049460928674448833/18446744073709551616:ℚ)) block09_checked tail10
  have hsum : ((1553568903353479015/4611686018427387904:ℚ) : ℚ)+((9049460928674448833/18446744073709551616:ℚ))=((15263736542088364893/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((171/256:ℚ)) remaining08=some ((10994799288259677643/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((171/256:ℚ)) block08 remaining09
    ((49/64:ℚ)) ((6725862034430990393/18446744073709551616:ℚ)) ((15263736542088364893/18446744073709551616:ℚ)) block08_checked tail09
  have hsum : ((6725862034430990393/18446744073709551616:ℚ) : ℚ)+((15263736542088364893/18446744073709551616:ℚ))=((10994799288259677643/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((73/128:ℚ)) remaining07=some ((29935434935364986245/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((73/128:ℚ)) block07 remaining08
    ((171/256:ℚ)) ((7945836358845630959/18446744073709551616:ℚ)) ((10994799288259677643/9223372036854775808:ℚ)) block07_checked tail08
  have hsum : ((7945836358845630959/18446744073709551616:ℚ) : ℚ)+((10994799288259677643/9223372036854775808:ℚ))=((29935434935364986245/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((125/256:ℚ)) remaining06=some ((35912183072762638113/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((125/256:ℚ)) block06 remaining07
    ((73/128:ℚ)) ((1494187034349412967/4611686018427387904:ℚ)) ((29935434935364986245/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((1494187034349412967/4611686018427387904:ℚ) : ℚ)+((29935434935364986245/18446744073709551616:ℚ))=((35912183072762638113/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((201/512:ℚ)) remaining05=some ((43489258032513623721/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((201/512:ℚ)) block05 remaining06
    ((125/256:ℚ)) ((947134369968873201/2305843009213693952:ℚ)) ((35912183072762638113/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((947134369968873201/2305843009213693952:ℚ) : ℚ)+((35912183072762638113/18446744073709551616:ℚ))=((43489258032513623721/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((79/256:ℚ)) remaining04=some ((12321438825386815635/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((79/256:ℚ)) block04 remaining05
    ((201/512:ℚ)) ((5796497269033638819/18446744073709551616:ℚ)) ((43489258032513623721/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((5796497269033638819/18446744073709551616:ℚ) : ℚ)+((43489258032513623721/18446744073709551616:ℚ))=((12321438825386815635/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((31/128:ℚ)) remaining03=some ((54025687354213197035/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((31/128:ℚ)) block03 remaining04
    ((79/256:ℚ)) ((4739932052665934495/18446744073709551616:ℚ)) ((12321438825386815635/4611686018427387904:ℚ)) block03_checked tail04
  have hsum : ((4739932052665934495/18446744073709551616:ℚ) : ℚ)+((12321438825386815635/4611686018427387904:ℚ))=((54025687354213197035/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((21/128:ℚ)) remaining02=some ((59443076885533951075/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((21/128:ℚ)) block02 remaining03
    ((31/128:ℚ)) ((677173691415094255/2305843009213693952:ℚ)) ((54025687354213197035/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((677173691415094255/2305843009213693952:ℚ) : ℚ)+((54025687354213197035/18446744073709551616:ℚ))=((59443076885533951075/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((13/128:ℚ)) remaining01=some ((64082387519619805515/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((13/128:ℚ)) block01 remaining02
    ((21/128:ℚ)) ((579913829260731805/2305843009213693952:ℚ)) ((59443076885533951075/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((579913829260731805/2305843009213693952:ℚ) : ℚ)+((59443076885533951075/18446744073709551616:ℚ))=((64082387519619805515/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((74077582606503861445/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((13/128:ℚ)) ((4997597543442027965/9223372036854775808:ℚ)) ((64082387519619805515/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((4997597543442027965/9223372036854775808:ℚ) : ℚ)+((64082387519619805515/18446744073709551616:ℚ))=((74077582606503861445/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((74077582606503861445/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((74077582606503861445/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((74077582606503861445/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((74077582606503861445/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf74.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family21.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf74.root.x0 : ℝ) Phase15301Leaf74.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf74.root.y0 : ℝ) Phase15301Leaf74.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field2 x y u)^2)≤((74077582606503861445/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf74.root queryRoot 1 chartPermutation
    original_chart_checked ((74077582606503861445/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf74.Family21

#print axioms NoThreeLine.Phase15301Leaf74.Family21.data_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family21.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf74.Family21.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family21.original_directional_integral_bound
