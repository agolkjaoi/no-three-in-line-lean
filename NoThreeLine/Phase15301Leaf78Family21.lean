import NoThreeLine.Phase15301Leaf78Family21Block00
import NoThreeLine.Phase15301Leaf78Family21Block01
import NoThreeLine.Phase15301Leaf78Family21Block02
import NoThreeLine.Phase15301Leaf78Family21Block03
import NoThreeLine.Phase15301Leaf78Family21Block04
import NoThreeLine.Phase15301Leaf78Family21Block05
import NoThreeLine.Phase15301Leaf78Family21Block06
import NoThreeLine.Phase15301Leaf78Family21Block07
import NoThreeLine.Phase15301Leaf78Family21Block08
import NoThreeLine.Phase15301Leaf78Family21Block09
import NoThreeLine.Phase15301Leaf78Family21Block10
import NoThreeLine.Phase15301Leaf78Family21Block11

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf78.Family21
open AutoEnvelope Phase15301Family21

def remaining12 : List (ℚ × AutoTrace) := []
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining12=some 0 := by decide +kernel

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((127/128:ℚ)) remaining11=some ((471696246221785641/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((127/128:ℚ)) block11 remaining12
    (1) ((471696246221785641/18446744073709551616:ℚ)) (0) block11_checked tail12
  have hsum : ((471696246221785641/18446744073709551616:ℚ) : ℚ)+(0)=((471696246221785641/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((7/8:ℚ)) remaining10=some ((494368187813745193/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((7/8:ℚ)) block10 remaining11
    ((127/128:ℚ)) ((7438194758798137447/18446744073709551616:ℚ)) ((471696246221785641/18446744073709551616:ℚ)) block10_checked tail11
  have hsum : ((7438194758798137447/18446744073709551616:ℚ) : ℚ)+((471696246221785641/18446744073709551616:ℚ))=((494368187813745193/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((101/128:ℚ)) remaining09=some ((13538497842757675523/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((101/128:ℚ)) block09 remaining10
    ((7/8:ℚ)) ((5628606837737752435/18446744073709551616:ℚ)) ((494368187813745193/1152921504606846976:ℚ)) block09_checked tail10
  have hsum : ((5628606837737752435/18446744073709551616:ℚ) : ℚ)+((494368187813745193/1152921504606846976:ℚ))=((13538497842757675523/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((353/512:ℚ)) remaining08=some ((5125085102373380723/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((353/512:ℚ)) block08 remaining09
    ((101/128:ℚ)) ((6961842566735847369/18446744073709551616:ℚ)) ((13538497842757675523/18446744073709551616:ℚ)) block08_checked tail09
  have hsum : ((6961842566735847369/18446744073709551616:ℚ) : ℚ)+((13538497842757675523/18446744073709551616:ℚ))=((5125085102373380723/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((149/256:ℚ)) remaining07=some ((29016494583792458081/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((149/256:ℚ)) block07 remaining08
    ((353/512:ℚ)) ((8516154174298935189/18446744073709551616:ℚ)) ((5125085102373380723/4611686018427387904:ℚ)) block07_checked tail08
  have hsum : ((8516154174298935189/18446744073709551616:ℚ) : ℚ)+((5125085102373380723/4611686018427387904:ℚ))=((29016494583792458081/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((505/1024:ℚ)) remaining06=some ((8879409782181954751/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((505/1024:ℚ)) block06 remaining07
    ((149/256:ℚ)) ((6501144544935360923/18446744073709551616:ℚ)) ((29016494583792458081/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((6501144544935360923/18446744073709551616:ℚ) : ℚ)+((29016494583792458081/18446744073709551616:ℚ))=((8879409782181954751/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((201/512:ℚ)) remaining05=some ((43483037963089185199/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((201/512:ℚ)) block05 remaining06
    ((505/1024:ℚ)) ((7965398834361366195/18446744073709551616:ℚ)) ((8879409782181954751/4611686018427387904:ℚ)) block05_checked tail06
  have hsum : ((7965398834361366195/18446744073709551616:ℚ) : ℚ)+((8879409782181954751/4611686018427387904:ℚ))=((43483037963089185199/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((5/16:ℚ)) remaining04=some ((49017116894536226277/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((5/16:ℚ)) block04 remaining05
    ((201/512:ℚ)) ((2767039465723520539/9223372036854775808:ℚ)) ((43483037963089185199/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((2767039465723520539/9223372036854775808:ℚ) : ℚ)+((43483037963089185199/18446744073709551616:ℚ))=((49017116894536226277/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((61/256:ℚ)) remaining03=some ((27150244051788299977/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((61/256:ℚ)) block03 remaining04
    ((5/16:ℚ)) ((5283371209040373677/18446744073709551616:ℚ)) ((49017116894536226277/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((5283371209040373677/18446744073709551616:ℚ) : ℚ)+((49017116894536226277/18446744073709551616:ℚ))=((27150244051788299977/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((81/512:ℚ)) remaining02=some ((29924586112302213875/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((81/512:ℚ)) block02 remaining03
    ((61/256:ℚ)) ((1387171030256956949/4611686018427387904:ℚ)) ((27150244051788299977/9223372036854775808:ℚ)) block02_checked tail03
  have hsum : ((1387171030256956949/4611686018427387904:ℚ) : ℚ)+((27150244051788299977/9223372036854775808:ℚ))=((29924586112302213875/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((3/32:ℚ)) remaining01=some ((32344906163133295223/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3/32:ℚ)) block01 remaining02
    ((81/512:ℚ)) ((605080012707770337/2305843009213693952:ℚ)) ((29924586112302213875/9223372036854775808:ℚ)) block01_checked tail02
  have hsum : ((605080012707770337/2305843009213693952:ℚ) : ℚ)+((29924586112302213875/9223372036854775808:ℚ))=((32344906163133295223/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((37028769007954637717/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((3/32:ℚ)) ((2341931422410671247/4611686018427387904:ℚ)) ((32344906163133295223/9223372036854775808:ℚ)) block00_checked tail01
  have hsum : ((2341931422410671247/4611686018427387904:ℚ) : ℚ)+((32344906163133295223/9223372036854775808:ℚ))=((37028769007954637717/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((37028769007954637717/9223372036854775808:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((37028769007954637717/9223372036854775808:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((37028769007954637717/9223372036854775808:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((37028769007954637717/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf78.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family21.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf78.root.x0 : ℝ) Phase15301Leaf78.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf78.root.y0 : ℝ) Phase15301Leaf78.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field2 x y u)^2)≤((37028769007954637717/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf78.root queryRoot 1 chartPermutation
    original_chart_checked ((37028769007954637717/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf78.Family21

#print axioms NoThreeLine.Phase15301Leaf78.Family21.data_checked
#print axioms NoThreeLine.Phase15301Leaf78.Family21.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf78.Family21.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf78.Family21.original_directional_integral_bound
