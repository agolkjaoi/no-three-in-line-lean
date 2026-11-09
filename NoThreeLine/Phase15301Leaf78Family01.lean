import NoThreeLine.Phase15301Leaf78Family01Block00
import NoThreeLine.Phase15301Leaf78Family01Block01
import NoThreeLine.Phase15301Leaf78Family01Block02
import NoThreeLine.Phase15301Leaf78Family01Block03
import NoThreeLine.Phase15301Leaf78Family01Block04
import NoThreeLine.Phase15301Leaf78Family01Block05
import NoThreeLine.Phase15301Leaf78Family01Block06
import NoThreeLine.Phase15301Leaf78Family01Block07
import NoThreeLine.Phase15301Leaf78Family01Block08
import NoThreeLine.Phase15301Leaf78Family01Block09
import NoThreeLine.Phase15301Leaf78Family01Block10
import NoThreeLine.Phase15301Leaf78Family01Block11
import NoThreeLine.Phase15301Leaf78Family01Block12

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf78.Family01
open AutoEnvelope Phase15301Family01

def remaining13 : List (ℚ × AutoTrace) := []
theorem tail13 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining13=some 0 := by decide +kernel

def remaining12 : List (ℚ × AutoTrace) := block12++remaining13
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 ((115/128:ℚ)) remaining12=some ((6482184713878300251/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((115/128:ℚ)) block12 remaining13
    (1) ((6482184713878300251/18446744073709551616:ℚ)) (0) block12_checked tail13
  have hsum : ((6482184713878300251/18446744073709551616:ℚ) : ℚ)+(0)=((6482184713878300251/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining12,hsum] using h

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((851/1024:ℚ)) remaining11=some ((2657449077842865201/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((851/1024:ℚ)) block11 remaining12
    ((115/128:ℚ)) ((4147611597493160553/18446744073709551616:ℚ)) ((6482184713878300251/18446744073709551616:ℚ)) block11_checked tail12
  have hsum : ((4147611597493160553/18446744073709551616:ℚ) : ℚ)+((6482184713878300251/18446744073709551616:ℚ))=((2657449077842865201/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((193/256:ℚ)) remaining10=some ((16425603126129408749/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((193/256:ℚ)) block10 remaining11
    ((851/1024:ℚ)) ((5795806814757947945/18446744073709551616:ℚ)) ((2657449077842865201/4611686018427387904:ℚ)) block10_checked tail11
  have hsum : ((5795806814757947945/18446744073709551616:ℚ) : ℚ)+((2657449077842865201/4611686018427387904:ℚ))=((16425603126129408749/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((43/64:ℚ)) remaining09=some ((11600620448216424293/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((43/64:ℚ)) block09 remaining10
    ((193/256:ℚ)) ((6775637770303439837/18446744073709551616:ℚ)) ((16425603126129408749/18446744073709551616:ℚ)) block09_checked tail10
  have hsum : ((6775637770303439837/18446744073709551616:ℚ) : ℚ)+((16425603126129408749/18446744073709551616:ℚ))=((11600620448216424293/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((19/32:ℚ)) remaining08=some ((29135399161359049185/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((19/32:ℚ)) block08 remaining09
    ((43/64:ℚ)) ((5934158264926200599/18446744073709551616:ℚ)) ((11600620448216424293/9223372036854775808:ℚ)) block08_checked tail09
  have hsum : ((5934158264926200599/18446744073709551616:ℚ) : ℚ)+((11600620448216424293/9223372036854775808:ℚ))=((29135399161359049185/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((135/256:ℚ)) remaining07=some ((34959170376558853739/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((135/256:ℚ)) block07 remaining08
    ((19/32:ℚ)) ((2911885607599902277/9223372036854775808:ℚ)) ((29135399161359049185/18446744073709551616:ℚ)) block07_checked tail08
  have hsum : ((2911885607599902277/9223372036854775808:ℚ) : ℚ)+((29135399161359049185/18446744073709551616:ℚ))=((34959170376558853739/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((27/64:ℚ)) remaining06=some ((21935407786443330969/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((27/64:ℚ)) block06 remaining07
    ((135/256:ℚ)) ((8911645196327808199/18446744073709551616:ℚ)) ((34959170376558853739/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((8911645196327808199/18446744073709551616:ℚ) : ℚ)+((34959170376558853739/18446744073709551616:ℚ))=((21935407786443330969/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((11/32:ℚ)) remaining05=some ((1596725227586018135/576460752303423488:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((11/32:ℚ)) block05 remaining06
    ((27/64:ℚ)) ((3612195854932959191/9223372036854775808:ℚ)) ((21935407786443330969/9223372036854775808:ℚ)) block05_checked tail06
  have hsum : ((3612195854932959191/9223372036854775808:ℚ) : ℚ)+((21935407786443330969/9223372036854775808:ℚ))=((1596725227586018135/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((67/256:ℚ)) remaining04=some ((7383063600109186119/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((67/256:ℚ)) block04 remaining05
    ((11/32:ℚ)) ((996162689765113579/2305843009213693952:ℚ)) ((1596725227586018135/576460752303423488:ℚ)) block04_checked tail05
  have hsum : ((996162689765113579/2305843009213693952:ℚ) : ℚ)+((1596725227586018135/576460752303423488:ℚ))=((7383063600109186119/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((53/256:ℚ)) remaining03=some ((32807706783139499785/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((53/256:ℚ)) block03 remaining04
    ((67/256:ℚ)) ((3275452382702755309/9223372036854775808:ℚ)) ((7383063600109186119/2305843009213693952:ℚ)) block03_checked tail04
  have hsum : ((3275452382702755309/9223372036854775808:ℚ) : ℚ)+((7383063600109186119/2305843009213693952:ℚ))=((32807706783139499785/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((35/256:ℚ)) remaining02=some ((74874137244676070379/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((35/256:ℚ)) block02 remaining03
    ((53/256:ℚ)) ((9258723678397070809/18446744073709551616:ℚ)) ((32807706783139499785/9223372036854775808:ℚ)) block02_checked tail03
  have hsum : ((9258723678397070809/18446744073709551616:ℚ) : ℚ)+((32807706783139499785/9223372036854775808:ℚ))=((74874137244676070379/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((3/32:ℚ)) remaining01=some ((40765326232916657595/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3/32:ℚ)) block01 remaining02
    ((35/256:ℚ)) ((6656515221157244811/18446744073709551616:ℚ)) ((74874137244676070379/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((6656515221157244811/18446744073709551616:ℚ) : ℚ)+((74874137244676070379/18446744073709551616:ℚ))=((40765326232916657595/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((97025855266507923133/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((3/32:ℚ)) ((15495202800674607943/18446744073709551616:ℚ)) ((40765326232916657595/9223372036854775808:ℚ)) block00_checked tail01
  have hsum : ((15495202800674607943/18446744073709551616:ℚ) : ℚ)+((40765326232916657595/9223372036854775808:ℚ))=((97025855266507923133/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((97025855266507923133/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((97025855266507923133/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((97025855266507923133/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((97025855266507923133/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf78.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family01.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf78.root.x0 : ℝ) Phase15301Leaf78.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf78.root.y0 : ℝ) Phase15301Leaf78.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field0 x y u)^2)≤((97025855266507923133/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf78.root queryRoot 1 chartPermutation
    original_chart_checked ((97025855266507923133/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf78.Family01

#print axioms NoThreeLine.Phase15301Leaf78.Family01.data_checked
#print axioms NoThreeLine.Phase15301Leaf78.Family01.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf78.Family01.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf78.Family01.original_directional_integral_bound
