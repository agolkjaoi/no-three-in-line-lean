import NoThreeLine.Phase15301Group7275Family23Block00
import NoThreeLine.Phase15301Group7275Family23Block01
import NoThreeLine.Phase15301Group7275Family23Block02
import NoThreeLine.Phase15301Group7275Family23Block03
import NoThreeLine.Phase15301Group7275Family23Block04
import NoThreeLine.Phase15301Group7275Family23Block05
import NoThreeLine.Phase15301Group7275Family23Block06
import NoThreeLine.Phase15301Group7275Family23Block07
import NoThreeLine.Phase15301Group7275Family23Block08
import NoThreeLine.Phase15301Group7275Family23Block09

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group7275.Family23
open AutoEnvelope Phase15301Family23

def remaining10 : List (ℚ × AutoTrace) := []
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining10=some 0 := by decide +kernel

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((31/32:ℚ)) remaining09=some ((1885990445318912313/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((31/32:ℚ)) block09 remaining10
    (1) ((1885990445318912313/18446744073709551616:ℚ)) (0) block09_checked tail10
  have hsum : ((1885990445318912313/18446744073709551616:ℚ) : ℚ)+(0)=((1885990445318912313/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((101/128:ℚ)) remaining08=some ((3193056226682074563/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((101/128:ℚ)) block08 remaining09
    ((31/32:ℚ)) ((10886234461409385939/18446744073709551616:ℚ)) ((1885990445318912313/18446744073709551616:ℚ)) block08_checked tail09
  have hsum : ((10886234461409385939/18446744073709551616:ℚ) : ℚ)+((1885990445318912313/18446744073709551616:ℚ))=((3193056226682074563/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((21/32:ℚ)) remaining07=some ((5362166378562548743/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((21/32:ℚ)) block07 remaining08
    ((101/128:ℚ)) ((542277537970118545/1152921504606846976:ℚ)) ((3193056226682074563/4611686018427387904:ℚ)) block07_checked tail08
  have hsum : ((542277537970118545/1152921504606846976:ℚ) : ℚ)+((3193056226682074563/4611686018427387904:ℚ))=((5362166378562548743/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((273/512:ℚ)) remaining06=some ((30205674415945846421/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((273/512:ℚ)) block06 remaining07
    ((21/32:ℚ)) ((8757008901695651449/18446744073709551616:ℚ)) ((5362166378562548743/4611686018427387904:ℚ)) block06_checked tail07
  have hsum : ((8757008901695651449/18446744073709551616:ℚ) : ℚ)+((5362166378562548743/4611686018427387904:ℚ))=((30205674415945846421/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((217/512:ℚ)) remaining05=some ((39514030267505604369/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((217/512:ℚ)) block05 remaining06
    ((273/512:ℚ)) ((2327088962889939487/4611686018427387904:ℚ)) ((30205674415945846421/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((2327088962889939487/4611686018427387904:ℚ) : ℚ)+((30205674415945846421/18446744073709551616:ℚ))=((39514030267505604369/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((43/128:ℚ)) remaining04=some ((46825192824397162743/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((43/128:ℚ)) block04 remaining05
    ((217/512:ℚ)) ((3655581278445779187/9223372036854775808:ℚ)) ((39514030267505604369/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((3655581278445779187/9223372036854775808:ℚ) : ℚ)+((39514030267505604369/18446744073709551616:ℚ))=((46825192824397162743/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((29/128:ℚ)) remaining03=some ((57133482833774492575/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((29/128:ℚ)) block03 remaining04
    ((43/128:ℚ)) ((1288536251172166229/2305843009213693952:ℚ)) ((46825192824397162743/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((1288536251172166229/2305843009213693952:ℚ) : ℚ)+((46825192824397162743/18446744073709551616:ℚ))=((57133482833774492575/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((75/512:ℚ)) remaining02=some ((67232815277394630907/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((75/512:ℚ)) block02 remaining03
    ((29/128:ℚ)) ((2524833110905034583/4611686018427387904:ℚ)) ((57133482833774492575/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((2524833110905034583/4611686018427387904:ℚ) : ℚ)+((57133482833774492575/18446744073709551616:ℚ))=((67232815277394630907/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((91/1024:ℚ)) remaining01=some ((77967286893544925779/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((91/1024:ℚ)) block01 remaining02
    ((75/512:ℚ)) ((1341808952018786859/2305843009213693952:ℚ)) ((67232815277394630907/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((1341808952018786859/2305843009213693952:ℚ) : ℚ)+((67232815277394630907/18446744073709551616:ℚ))=((77967286893544925779/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((100664344634481829089/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((91/1024:ℚ)) ((11348528870468451655/9223372036854775808:ℚ)) ((77967286893544925779/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((11348528870468451655/9223372036854775808:ℚ) : ℚ)+((77967286893544925779/18446744073709551616:ℚ))=((100664344634481829089/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((100664344634481829089/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((100664344634481829089/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((100664344634481829089/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((100664344634481829089/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group7275.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family23.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group7275.root.x0 : ℝ) Phase15301Group7275.root.x1)
    (hy : y∈Set.Icc (Phase15301Group7275.root.y0 : ℝ) Phase15301Group7275.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field2 x y u)^2)≤((100664344634481829089/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group7275.root queryRoot 3 chartPermutation
    original_chart_checked ((100664344634481829089/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group7275.Family23

#print axioms NoThreeLine.Phase15301Group7275.Family23.data_checked
#print axioms NoThreeLine.Phase15301Group7275.Family23.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Group7275.Family23.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group7275.Family23.original_directional_integral_bound
