import NoThreeLine.Phase15301Leaf79Family21Block00
import NoThreeLine.Phase15301Leaf79Family21Block01
import NoThreeLine.Phase15301Leaf79Family21Block02
import NoThreeLine.Phase15301Leaf79Family21Block03
import NoThreeLine.Phase15301Leaf79Family21Block04
import NoThreeLine.Phase15301Leaf79Family21Block05
import NoThreeLine.Phase15301Leaf79Family21Block06
import NoThreeLine.Phase15301Leaf79Family21Block07
import NoThreeLine.Phase15301Leaf79Family21Block08
import NoThreeLine.Phase15301Leaf79Family21Block09
import NoThreeLine.Phase15301Leaf79Family21Block10
import NoThreeLine.Phase15301Leaf79Family21Block11

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf79.Family21
open AutoEnvelope Phase15301Family21

def remaining12 : List (ℚ × AutoTrace) := []
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining12=some 0 := by decide +kernel

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((31/32:ℚ)) remaining11=some ((477737066256464011/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((31/32:ℚ)) block11 remaining12
    (1) ((477737066256464011/4611686018427387904:ℚ)) (0) block11_checked tail12
  have hsum : ((477737066256464011/4611686018427387904:ℚ) : ℚ)+(0)=((477737066256464011/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((223/256:ℚ)) remaining10=some ((8140272756408311589/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((223/256:ℚ)) block10 remaining11
    ((31/32:ℚ)) ((6229324491382455545/18446744073709551616:ℚ)) ((477737066256464011/4611686018427387904:ℚ)) block10_checked tail11
  have hsum : ((6229324491382455545/18446744073709551616:ℚ) : ℚ)+((477737066256464011/4611686018427387904:ℚ))=((8140272756408311589/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((25/32:ℚ)) remaining09=some ((7057019040793414099/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((25/32:ℚ)) block09 remaining10
    ((223/256:ℚ)) ((5973765325178516609/18446744073709551616:ℚ)) ((8140272756408311589/18446744073709551616:ℚ)) block09_checked tail10
  have hsum : ((5973765325178516609/18446744073709551616:ℚ) : ℚ)+((8140272756408311589/18446744073709551616:ℚ))=((7057019040793414099/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((87/128:ℚ)) remaining08=some ((1322625226423527575/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((87/128:ℚ)) block08 remaining09
    ((25/32:ℚ)) ((3523982770594806501/9223372036854775808:ℚ)) ((7057019040793414099/9223372036854775808:ℚ)) block08_checked tail09
  have hsum : ((3523982770594806501/9223372036854775808:ℚ) : ℚ)+((7057019040793414099/9223372036854775808:ℚ))=((1322625226423527575/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((151/256:ℚ)) remaining07=some ((7095809451051990131/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((151/256:ℚ)) block07 remaining08
    ((87/128:ℚ)) ((1805308545357879831/4611686018427387904:ℚ)) ((1322625226423527575/1152921504606846976:ℚ)) block07_checked tail08
  have hsum : ((1805308545357879831/4611686018427387904:ℚ) : ℚ)+((1322625226423527575/1152921504606846976:ℚ))=((7095809451051990131/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((127/256:ℚ)) remaining06=some ((2205500715572987109/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((127/256:ℚ)) block06 remaining07
    ((151/256:ℚ)) ((1726193411239958305/4611686018427387904:ℚ)) ((7095809451051990131/4611686018427387904:ℚ)) block06_checked tail07
  have hsum : ((1726193411239958305/4611686018427387904:ℚ) : ℚ)+((7095809451051990131/4611686018427387904:ℚ))=((2205500715572987109/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((405/1024:ℚ)) remaining05=some ((43276529127310825421/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((405/1024:ℚ)) block05 remaining06
    ((127/256:ℚ)) ((7988517678143031677/18446744073709551616:ℚ)) ((2205500715572987109/1152921504606846976:ℚ)) block05_checked tail06
  have hsum : ((7988517678143031677/18446744073709551616:ℚ) : ℚ)+((2205500715572987109/1152921504606846976:ℚ))=((43276529127310825421/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((41/128:ℚ)) remaining04=some ((24242713218556857675/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((41/128:ℚ)) block04 remaining05
    ((405/1024:ℚ)) ((5208897309802889929/18446744073709551616:ℚ)) ((43276529127310825421/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((5208897309802889929/18446744073709551616:ℚ) : ℚ)+((43276529127310825421/18446744073709551616:ℚ))=((24242713218556857675/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((31/128:ℚ)) remaining03=some ((13504533874255870571/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((31/128:ℚ)) block03 remaining04
    ((41/128:ℚ)) ((2766354529954883467/9223372036854775808:ℚ)) ((24242713218556857675/9223372036854775808:ℚ)) block03_checked tail04
  have hsum : ((2766354529954883467/9223372036854775808:ℚ) : ℚ)+((24242713218556857675/9223372036854775808:ℚ))=((13504533874255870571/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((41/256:ℚ)) remaining02=some ((14927671219120338225/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((41/256:ℚ)) block02 remaining03
    ((31/128:ℚ)) ((711568672432233827/2305843009213693952:ℚ)) ((13504533874255870571/4611686018427387904:ℚ)) block02_checked tail03
  have hsum : ((711568672432233827/2305843009213693952:ℚ) : ℚ)+((13504533874255870571/4611686018427387904:ℚ))=((14927671219120338225/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((51/512:ℚ)) remaining01=some ((16055964493068914247/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((51/512:ℚ)) block01 remaining02
    ((41/256:ℚ)) ((564146636974288011/2305843009213693952:ℚ)) ((14927671219120338225/4611686018427387904:ℚ)) block01_checked tail02
  have hsum : ((564146636974288011/2305843009213693952:ℚ) : ℚ)+((14927671219120338225/4611686018427387904:ℚ))=((16055964493068914247/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((4628789772879226207/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((51/512:ℚ)) ((2459194598447990581/4611686018427387904:ℚ)) ((16055964493068914247/4611686018427387904:ℚ)) block00_checked tail01
  have hsum : ((2459194598447990581/4611686018427387904:ℚ) : ℚ)+((16055964493068914247/4611686018427387904:ℚ))=((4628789772879226207/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((4628789772879226207/1152921504606846976:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((4628789772879226207/1152921504606846976:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((4628789772879226207/1152921504606846976:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((4628789772879226207/1152921504606846976:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf79.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family21.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf79.root.x0 : ℝ) Phase15301Leaf79.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf79.root.y0 : ℝ) Phase15301Leaf79.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field2 x y u)^2)≤((4628789772879226207/1152921504606846976:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf79.root queryRoot 1 chartPermutation
    original_chart_checked ((4628789772879226207/1152921504606846976:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf79.Family21

#print axioms NoThreeLine.Phase15301Leaf79.Family21.data_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family21.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf79.Family21.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family21.original_directional_integral_bound
