import NoThreeLine.Phase15301Leaf78Family11Block00
import NoThreeLine.Phase15301Leaf78Family11Block01
import NoThreeLine.Phase15301Leaf78Family11Block02
import NoThreeLine.Phase15301Leaf78Family11Block03
import NoThreeLine.Phase15301Leaf78Family11Block04
import NoThreeLine.Phase15301Leaf78Family11Block05
import NoThreeLine.Phase15301Leaf78Family11Block06
import NoThreeLine.Phase15301Leaf78Family11Block07
import NoThreeLine.Phase15301Leaf78Family11Block08
import NoThreeLine.Phase15301Leaf78Family11Block09
import NoThreeLine.Phase15301Leaf78Family11Block10
import NoThreeLine.Phase15301Leaf78Family11Block11
import NoThreeLine.Phase15301Leaf78Family11Block12

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf78.Family11
open AutoEnvelope Phase15301Family11

def remaining13 : List (ℚ × AutoTrace) := []
theorem tail13 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining13=some 0 := by decide +kernel

def remaining12 : List (ℚ × AutoTrace) := block12++remaining13
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 ((507/512:ℚ)) remaining12=some ((157062456762001751/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((507/512:ℚ)) block12 remaining13
    (1) ((157062456762001751/4611686018427387904:ℚ)) (0) block12_checked tail13
  have hsum : ((157062456762001751/4611686018427387904:ℚ) : ℚ)+(0)=((157062456762001751/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining12,hsum] using h

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((895/1024:ℚ)) remaining11=some ((2090247646889262577/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((895/1024:ℚ)) block11 remaining12
    ((507/512:ℚ)) ((966592595063630413/2305843009213693952:ℚ)) ((157062456762001751/4611686018427387904:ℚ)) block11_checked tail12
  have hsum : ((966592595063630413/2305843009213693952:ℚ) : ℚ)+((157062456762001751/4611686018427387904:ℚ))=((2090247646889262577/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((101/128:ℚ)) remaining10=some ((13713034030280405911/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((101/128:ℚ)) block10 remaining11
    ((895/1024:ℚ)) ((5352043442723355603/18446744073709551616:ℚ)) ((2090247646889262577/4611686018427387904:ℚ)) block10_checked tail11
  have hsum : ((5352043442723355603/18446744073709551616:ℚ) : ℚ)+((2090247646889262577/4611686018427387904:ℚ))=((13713034030280405911/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((45/64:ℚ)) remaining09=some ((20943040860959274543/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((45/64:ℚ)) block09 remaining10
    ((101/128:ℚ)) ((903750853834858579/2305843009213693952:ℚ)) ((13713034030280405911/18446744073709551616:ℚ)) block09_checked tail10
  have hsum : ((903750853834858579/2305843009213693952:ℚ) : ℚ)+((13713034030280405911/18446744073709551616:ℚ))=((20943040860959274543/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((317/512:ℚ)) remaining08=some ((27515809546753254309/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((317/512:ℚ)) block08 remaining09
    ((45/64:ℚ)) ((3286384342896989883/9223372036854775808:ℚ)) ((20943040860959274543/18446744073709551616:ℚ)) block08_checked tail09
  have hsum : ((3286384342896989883/9223372036854775808:ℚ) : ℚ)+((20943040860959274543/18446744073709551616:ℚ))=((27515809546753254309/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((277/512:ℚ)) remaining07=some ((34095529395353762033/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((277/512:ℚ)) block07 remaining08
    ((317/512:ℚ)) ((1644929962150126931/4611686018427387904:ℚ)) ((27515809546753254309/18446744073709551616:ℚ)) block07_checked tail08
  have hsum : ((1644929962150126931/4611686018427387904:ℚ) : ℚ)+((27515809546753254309/18446744073709551616:ℚ))=((34095529395353762033/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((115/256:ℚ)) remaining06=some ((41771477925772767905/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((115/256:ℚ)) block06 remaining07
    ((277/512:ℚ)) ((479746783151187867/1152921504606846976:ℚ)) ((34095529395353762033/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((479746783151187867/1152921504606846976:ℚ) : ℚ)+((34095529395353762033/18446744073709551616:ℚ))=((41771477925772767905/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((45/128:ℚ)) remaining05=some ((25156031515785179631/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((45/128:ℚ)) block05 remaining06
    ((115/256:ℚ)) ((8540585105797591357/18446744073709551616:ℚ)) ((41771477925772767905/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((8540585105797591357/18446744073709551616:ℚ) : ℚ)+((41771477925772767905/18446744073709551616:ℚ))=((25156031515785179631/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((35/128:ℚ)) remaining04=some ((14429169330578167161/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((35/128:ℚ)) block04 remaining05
    ((45/128:ℚ)) ((3702307145371154691/9223372036854775808:ℚ)) ((25156031515785179631/9223372036854775808:ℚ)) block04_checked tail05
  have hsum : ((3702307145371154691/9223372036854775808:ℚ) : ℚ)+((25156031515785179631/9223372036854775808:ℚ))=((14429169330578167161/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((27/128:ℚ)) remaining03=some ((8076437302572762517/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((27/128:ℚ)) block03 remaining04
    ((35/128:ℚ)) ((1723705274567357873/4611686018427387904:ℚ)) ((14429169330578167161/4611686018427387904:ℚ)) block03_checked tail04
  have hsum : ((1723705274567357873/4611686018427387904:ℚ) : ℚ)+((14429169330578167161/4611686018427387904:ℚ))=((8076437302572762517/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((9/64:ℚ)) remaining02=some ((36676699915790432943/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((9/64:ℚ)) block02 remaining03
    ((27/128:ℚ)) ((4370950705499382875/9223372036854775808:ℚ)) ((8076437302572762517/2305843009213693952:ℚ)) block02_checked tail03
  have hsum : ((4370950705499382875/9223372036854775808:ℚ) : ℚ)+((8076437302572762517/2305843009213693952:ℚ))=((36676699915790432943/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((23/256:ℚ)) remaining01=some ((80502903568889890251/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((23/256:ℚ)) block01 remaining02
    ((9/64:ℚ)) ((7149503737309024365/18446744073709551616:ℚ)) ((36676699915790432943/9223372036854775808:ℚ)) block01_checked tail02
  have hsum : ((7149503737309024365/18446744073709551616:ℚ) : ℚ)+((36676699915790432943/9223372036854775808:ℚ))=((80502903568889890251/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((94274984438319394903/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((23/256:ℚ)) ((3443020217357376163/4611686018427387904:ℚ)) ((80502903568889890251/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((3443020217357376163/4611686018427387904:ℚ) : ℚ)+((80502903568889890251/18446744073709551616:ℚ))=((94274984438319394903/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((94274984438319394903/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((94274984438319394903/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((94274984438319394903/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((94274984438319394903/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf78.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family11.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf78.root.x0 : ℝ) Phase15301Leaf78.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf78.root.y0 : ℝ) Phase15301Leaf78.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field1 x y u)^2)≤((94274984438319394903/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf78.root queryRoot 1 chartPermutation
    original_chart_checked ((94274984438319394903/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf78.Family11

#print axioms NoThreeLine.Phase15301Leaf78.Family11.data_checked
#print axioms NoThreeLine.Phase15301Leaf78.Family11.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf78.Family11.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf78.Family11.original_directional_integral_bound
