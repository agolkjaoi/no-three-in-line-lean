import NoThreeLine.Phase15301Leaf75Family01Block00
import NoThreeLine.Phase15301Leaf75Family01Block01
import NoThreeLine.Phase15301Leaf75Family01Block02
import NoThreeLine.Phase15301Leaf75Family01Block03
import NoThreeLine.Phase15301Leaf75Family01Block04
import NoThreeLine.Phase15301Leaf75Family01Block05
import NoThreeLine.Phase15301Leaf75Family01Block06
import NoThreeLine.Phase15301Leaf75Family01Block07
import NoThreeLine.Phase15301Leaf75Family01Block08
import NoThreeLine.Phase15301Leaf75Family01Block09
import NoThreeLine.Phase15301Leaf75Family01Block10
import NoThreeLine.Phase15301Leaf75Family01Block11
import NoThreeLine.Phase15301Leaf75Family01Block12
import NoThreeLine.Phase15301Leaf75Family01Block13
import NoThreeLine.Phase15301Leaf75Family01Block14
import NoThreeLine.Phase15301Leaf75Family01Block15
import NoThreeLine.Phase15301Leaf75Family01Block16

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf75.Family01
open AutoEnvelope Phase15301Family01

def remaining17 : List (ℚ × AutoTrace) := []
theorem tail17 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining17=some 0 := by decide +kernel

def remaining16 : List (ℚ × AutoTrace) := block16++remaining17
theorem tail16 : checkUpperPartition gatheredExpr 18446744073709551616 ((475/512:ℚ)) remaining16=some ((276113375070388615/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((475/512:ℚ)) block16 remaining17
    (1) ((276113375070388615/1152921504606846976:ℚ)) (0) block16_checked tail17
  have hsum : ((276113375070388615/1152921504606846976:ℚ) : ℚ)+(0)=((276113375070388615/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining16,hsum] using h

def remaining15 : List (ℚ × AutoTrace) := block15++remaining16
theorem tail15 : checkUpperPartition gatheredExpr 18446744073709551616 ((903/1024:ℚ)) remaining15=some ((3797126035377035317/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((903/1024:ℚ)) block15 remaining16
    ((475/512:ℚ)) ((1588219034813926397/9223372036854775808:ℚ)) ((276113375070388615/1152921504606846976:ℚ)) block15_checked tail16
  have hsum : ((1588219034813926397/9223372036854775808:ℚ) : ℚ)+((276113375070388615/1152921504606846976:ℚ))=((3797126035377035317/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining15,hsum] using h

def remaining14 : List (ℚ × AutoTrace) := block14++remaining15
theorem tail14 : checkUpperPartition gatheredExpr 18446744073709551616 ((853/1024:ℚ)) remaining14=some ((5255440804238735995/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((853/1024:ℚ)) block14 remaining15
    ((903/1024:ℚ)) ((729157384430850339/4611686018427387904:ℚ)) ((3797126035377035317/9223372036854775808:ℚ)) block14_checked tail15
  have hsum : ((729157384430850339/4611686018427387904:ℚ) : ℚ)+((3797126035377035317/9223372036854775808:ℚ))=((5255440804238735995/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining14,hsum] using h

def remaining13 : List (ℚ × AutoTrace) := block13++remaining14
theorem tail13 : checkUpperPartition gatheredExpr 18446744073709551616 ((199/256:ℚ)) remaining13=some ((3623647797181767223/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((199/256:ℚ)) block13 remaining14
    ((853/1024:ℚ)) ((1991854790124798451/9223372036854775808:ℚ)) ((5255440804238735995/9223372036854775808:ℚ)) block13_checked tail14
  have hsum : ((1991854790124798451/9223372036854775808:ℚ) : ℚ)+((5255440804238735995/9223372036854775808:ℚ))=((3623647797181767223/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining13,hsum] using h

def remaining12 : List (ℚ × AutoTrace) := block12++remaining13
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 ((185/256:ℚ)) remaining12=some ((2390334312445580985/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((185/256:ℚ)) block12 remaining13
    ((199/256:ℚ)) ((1157020827709394747/4611686018427387904:ℚ)) ((3623647797181767223/4611686018427387904:ℚ)) block12_checked tail13
  have hsum : ((1157020827709394747/4611686018427387904:ℚ) : ℚ)+((3623647797181767223/4611686018427387904:ℚ))=((2390334312445580985/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining12,hsum] using h

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((167/256:ℚ)) remaining11=some ((3079564833625279749/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((167/256:ℚ)) block11 remaining12
    ((185/256:ℚ)) ((172307630294924691/576460752303423488:ℚ)) ((2390334312445580985/2305843009213693952:ℚ)) block11_checked tail12
  have hsum : ((172307630294924691/576460752303423488:ℚ) : ℚ)+((2390334312445580985/2305843009213693952:ℚ))=((3079564833625279749/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((151/256:ℚ)) remaining10=some ((29467919378674770047/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((151/256:ℚ)) block10 remaining11
    ((167/256:ℚ)) ((4831400709672532055/18446744073709551616:ℚ)) ((3079564833625279749/2305843009213693952:ℚ)) block10_checked tail11
  have hsum : ((4831400709672532055/18446744073709551616:ℚ) : ℚ)+((3079564833625279749/2305843009213693952:ℚ))=((29467919378674770047/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((547/1024:ℚ)) remaining09=some ((34376950777010058351/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((547/1024:ℚ)) block09 remaining10
    ((151/256:ℚ)) ((306814462395955519/1152921504606846976:ℚ)) ((29467919378674770047/18446744073709551616:ℚ)) block09_checked tail10
  have hsum : ((306814462395955519/1152921504606846976:ℚ) : ℚ)+((29467919378674770047/18446744073709551616:ℚ))=((34376950777010058351/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((15/32:ℚ)) remaining08=some ((19995517566108063393/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((15/32:ℚ)) block08 remaining09
    ((547/1024:ℚ)) ((5614084355206068435/18446744073709551616:ℚ)) ((34376950777010058351/18446744073709551616:ℚ)) block08_checked tail09
  have hsum : ((5614084355206068435/18446744073709551616:ℚ) : ℚ)+((34376950777010058351/18446744073709551616:ℚ))=((19995517566108063393/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((203/512:ℚ)) remaining07=some ((2879928662345180825/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((203/512:ℚ)) block07 remaining08
    ((15/32:ℚ)) ((3043911732653383207/9223372036854775808:ℚ)) ((19995517566108063393/9223372036854775808:ℚ)) block07_checked tail08
  have hsum : ((3043911732653383207/9223372036854775808:ℚ) : ℚ)+((19995517566108063393/9223372036854775808:ℚ))=((2879928662345180825/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((167/512:ℚ)) remaining06=some ((52743556371074644839/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((167/512:ℚ)) block06 remaining07
    ((203/512:ℚ)) ((6664697773551751639/18446744073709551616:ℚ)) ((2879928662345180825/1152921504606846976:ℚ)) block06_checked tail07
  have hsum : ((6664697773551751639/18446744073709551616:ℚ) : ℚ)+((2879928662345180825/1152921504606846976:ℚ))=((52743556371074644839/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((71/256:ℚ)) remaining05=some ((57433217059399316115/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((71/256:ℚ)) block05 remaining06
    ((167/512:ℚ)) ((1172415172081167819/4611686018427387904:ℚ)) ((52743556371074644839/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((1172415172081167819/4611686018427387904:ℚ) : ℚ)+((52743556371074644839/18446744073709551616:ℚ))=((57433217059399316115/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((15/64:ℚ)) remaining04=some ((15560589138672272715/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((15/64:ℚ)) block04 remaining05
    ((71/256:ℚ)) ((4809139495289774745/18446744073709551616:ℚ)) ((57433217059399316115/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((4809139495289774745/18446744073709551616:ℚ) : ℚ)+((57433217059399316115/18446744073709551616:ℚ))=((15560589138672272715/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((47/256:ℚ)) remaining03=some ((34322143409556643093/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((47/256:ℚ)) block03 remaining04
    ((15/64:ℚ)) ((3200965132212097663/9223372036854775808:ℚ)) ((15560589138672272715/4611686018427387904:ℚ)) block03_checked tail04
  have hsum : ((3200965132212097663/9223372036854775808:ℚ) : ℚ)+((15560589138672272715/4611686018427387904:ℚ))=((34322143409556643093/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((67/512:ℚ)) remaining02=some ((75710212363966568735/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((67/512:ℚ)) block02 remaining03
    ((47/256:ℚ)) ((7065925544853282549/18446744073709551616:ℚ)) ((34322143409556643093/9223372036854775808:ℚ)) block02_checked tail03
  have hsum : ((7065925544853282549/18446744073709551616:ℚ) : ℚ)+((34322143409556643093/9223372036854775808:ℚ))=((75710212363966568735/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((47/512:ℚ)) remaining01=some ((20471621793927051065/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((47/512:ℚ)) block01 remaining02
    ((67/512:ℚ)) ((6176274811741635525/18446744073709551616:ℚ)) ((75710212363966568735/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((6176274811741635525/18446744073709551616:ℚ) : ℚ)+((75710212363966568735/18446744073709551616:ℚ))=((20471621793927051065/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((48530640642377124317/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((47/512:ℚ)) ((7587397054523022187/9223372036854775808:ℚ)) ((20471621793927051065/4611686018427387904:ℚ)) block00_checked tail01
  have hsum : ((7587397054523022187/9223372036854775808:ℚ) : ℚ)+((20471621793927051065/4611686018427387904:ℚ))=((48530640642377124317/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((48530640642377124317/9223372036854775808:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((48530640642377124317/9223372036854775808:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((48530640642377124317/9223372036854775808:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((48530640642377124317/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf75.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family01.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf75.root.x0 : ℝ) Phase15301Leaf75.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf75.root.y0 : ℝ) Phase15301Leaf75.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field0 x y u)^2)≤((48530640642377124317/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf75.root queryRoot 1 chartPermutation
    original_chart_checked ((48530640642377124317/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf75.Family01

#print axioms NoThreeLine.Phase15301Leaf75.Family01.data_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family01.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf75.Family01.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family01.original_directional_integral_bound
