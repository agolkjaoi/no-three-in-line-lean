import NoThreeLine.Phase15301Leaf75Family03Block00
import NoThreeLine.Phase15301Leaf75Family03Block01
import NoThreeLine.Phase15301Leaf75Family03Block02
import NoThreeLine.Phase15301Leaf75Family03Block03
import NoThreeLine.Phase15301Leaf75Family03Block04
import NoThreeLine.Phase15301Leaf75Family03Block05
import NoThreeLine.Phase15301Leaf75Family03Block06

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf75.Family03
open AutoEnvelope Phase15301Family03

def remaining07 : List (ℚ × AutoTrace) := []
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining07=some 0 := by decide +kernel

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((117/128:ℚ)) remaining06=some ((626197292035456129/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((117/128:ℚ)) block06 remaining07
    (1) ((626197292035456129/2305843009213693952:ℚ)) (0) block06_checked tail07
  have hsum : ((626197292035456129/2305843009213693952:ℚ) : ℚ)+(0)=((626197292035456129/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((95/128:ℚ)) remaining05=some ((8489620753364732831/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((95/128:ℚ)) block05 remaining06
    ((117/128:ℚ)) ((5984831585222908315/9223372036854775808:ℚ)) ((626197292035456129/2305843009213693952:ℚ)) block05_checked tail06
  have hsum : ((5984831585222908315/9223372036854775808:ℚ) : ℚ)+((626197292035456129/2305843009213693952:ℚ))=((8489620753364732831/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((35/64:ℚ)) remaining04=some ((16246176692295654541/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((35/64:ℚ)) block04 remaining05
    ((95/128:ℚ)) ((3878277969465460855/4611686018427387904:ℚ)) ((8489620753364732831/9223372036854775808:ℚ)) block04_checked tail05
  have hsum : ((3878277969465460855/4611686018427387904:ℚ) : ℚ)+((8489620753364732831/9223372036854775808:ℚ))=((16246176692295654541/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((25/64:ℚ)) remaining03=some ((24189394833327457545/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((25/64:ℚ)) block03 remaining04
    ((35/64:ℚ)) ((1985804535257950751/2305843009213693952:ℚ)) ((16246176692295654541/9223372036854775808:ℚ)) block03_checked tail04
  have hsum : ((1985804535257950751/2305843009213693952:ℚ) : ℚ)+((16246176692295654541/9223372036854775808:ℚ))=((24189394833327457545/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((15/64:ℚ)) remaining02=some ((66114598586028384375/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((15/64:ℚ)) block02 remaining03
    ((25/64:ℚ)) ((17735808919373469285/18446744073709551616:ℚ)) ((24189394833327457545/9223372036854775808:ℚ)) block02_checked tail03
  have hsum : ((17735808919373469285/18446744073709551616:ℚ) : ℚ)+((24189394833327457545/9223372036854775808:ℚ))=((66114598586028384375/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((1/8:ℚ)) remaining01=some ((20729818833422119513/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1/8:ℚ)) block01 remaining02
    ((15/64:ℚ)) ((16804676747660093677/18446744073709551616:ℚ)) ((66114598586028384375/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((16804676747660093677/18446744073709551616:ℚ) : ℚ)+((66114598586028384375/18446744073709551616:ℚ))=((20729818833422119513/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((111233461182456988873/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((1/8:ℚ)) ((28314185848768510821/18446744073709551616:ℚ)) ((20729818833422119513/4611686018427387904:ℚ)) block00_checked tail01
  have hsum : ((28314185848768510821/18446744073709551616:ℚ) : ℚ)+((20729818833422119513/4611686018427387904:ℚ))=((111233461182456988873/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((111233461182456988873/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((111233461182456988873/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((111233461182456988873/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((111233461182456988873/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf75.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family03.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf75.root.x0 : ℝ) Phase15301Leaf75.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf75.root.y0 : ℝ) Phase15301Leaf75.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field0 x y u)^2)≤((111233461182456988873/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf75.root queryRoot 3 chartPermutation
    original_chart_checked ((111233461182456988873/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf75.Family03

#print axioms NoThreeLine.Phase15301Leaf75.Family03.data_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family03.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf75.Family03.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family03.original_directional_integral_bound
