import NoThreeLine.Phase15301Leaf79Family11Block00
import NoThreeLine.Phase15301Leaf79Family11Block01
import NoThreeLine.Phase15301Leaf79Family11Block02
import NoThreeLine.Phase15301Leaf79Family11Block03
import NoThreeLine.Phase15301Leaf79Family11Block04
import NoThreeLine.Phase15301Leaf79Family11Block05
import NoThreeLine.Phase15301Leaf79Family11Block06
import NoThreeLine.Phase15301Leaf79Family11Block07
import NoThreeLine.Phase15301Leaf79Family11Block08
import NoThreeLine.Phase15301Leaf79Family11Block09
import NoThreeLine.Phase15301Leaf79Family11Block10

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf79.Family11
open AutoEnvelope Phase15301Family11

def remaining11 : List (ℚ × AutoTrace) := []
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining11=some 0 := by decide +kernel

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((7/8:ℚ)) remaining10=some ((4153315847277699371/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((7/8:ℚ)) block10 remaining11
    (1) ((4153315847277699371/9223372036854775808:ℚ)) (0) block10_checked tail11
  have hsum : ((4153315847277699371/9223372036854775808:ℚ) : ℚ)+(0)=((4153315847277699371/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((51/64:ℚ)) remaining09=some ((3275517300645353381/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((51/64:ℚ)) block09 remaining10
    ((7/8:ℚ)) ((2397718754013007391/9223372036854775808:ℚ)) ((4153315847277699371/9223372036854775808:ℚ)) block09_checked tail10
  have hsum : ((2397718754013007391/9223372036854775808:ℚ) : ℚ)+((4153315847277699371/9223372036854775808:ℚ))=((3275517300645353381/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((89/128:ℚ)) remaining08=some ((21587063364597831297/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((89/128:ℚ)) block08 remaining09
    ((51/64:ℚ)) ((8484994162016417773/18446744073709551616:ℚ)) ((3275517300645353381/4611686018427387904:ℚ)) block08_checked tail09
  have hsum : ((8484994162016417773/18446744073709551616:ℚ) : ℚ)+((3275517300645353381/4611686018427387904:ℚ))=((21587063364597831297/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((153/256:ℚ)) remaining07=some ((14625860486964018343/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((153/256:ℚ)) block07 remaining08
    ((89/128:ℚ)) ((7664657609330205389/18446744073709551616:ℚ)) ((21587063364597831297/18446744073709551616:ℚ)) block07_checked tail08
  have hsum : ((7664657609330205389/18446744073709551616:ℚ) : ℚ)+((21587063364597831297/18446744073709551616:ℚ))=((14625860486964018343/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((127/256:ℚ)) remaining06=some ((37802582311196799163/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((127/256:ℚ)) block06 remaining07
    ((153/256:ℚ)) ((8550861337268762477/18446744073709551616:ℚ)) ((14625860486964018343/9223372036854775808:ℚ)) block06_checked tail07
  have hsum : ((8550861337268762477/18446744073709551616:ℚ) : ℚ)+((14625860486964018343/9223372036854775808:ℚ))=((37802582311196799163/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((105/256:ℚ)) remaining05=some ((45111359281236744593/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((105/256:ℚ)) block05 remaining06
    ((127/256:ℚ)) ((3654388485019972715/9223372036854775808:ℚ)) ((37802582311196799163/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((3654388485019972715/9223372036854775808:ℚ) : ℚ)+((37802582311196799163/18446744073709551616:ℚ))=((45111359281236744593/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((157/512:ℚ)) remaining04=some ((27320973932458125005/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((157/512:ℚ)) block04 remaining05
    ((105/256:ℚ)) ((9530588583679505417/18446744073709551616:ℚ)) ((45111359281236744593/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((9530588583679505417/18446744073709551616:ℚ) : ℚ)+((45111359281236744593/18446744073709551616:ℚ))=((27320973932458125005/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((59/256:ℚ)) remaining03=some ((62227474581228451149/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((59/256:ℚ)) block03 remaining04
    ((157/512:ℚ)) ((7585526716312201139/18446744073709551616:ℚ)) ((27320973932458125005/9223372036854775808:ℚ)) block03_checked tail04
  have hsum : ((7585526716312201139/18446744073709551616:ℚ) : ℚ)+((27320973932458125005/9223372036854775808:ℚ))=((62227474581228451149/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((21/128:ℚ)) remaining02=some ((17621330745157098347/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((21/128:ℚ)) block02 remaining03
    ((59/256:ℚ)) ((8257848399399942239/18446744073709551616:ℚ)) ((62227474581228451149/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((8257848399399942239/18446744073709551616:ℚ) : ℚ)+((62227474581228451149/18446744073709551616:ℚ))=((17621330745157098347/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((27/256:ℚ)) remaining01=some ((19541939343147957933/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((27/256:ℚ)) block01 remaining02
    ((21/128:ℚ)) ((960304298995429793/2305843009213693952:ℚ)) ((17621330745157098347/4611686018427387904:ℚ)) block01_checked tail02
  have hsum : ((960304298995429793/2305843009213693952:ℚ) : ℚ)+((17621330745157098347/4611686018427387904:ℚ))=((19541939343147957933/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((94280806331654810643/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((27/256:ℚ)) ((16113048959062978911/18446744073709551616:ℚ)) ((19541939343147957933/4611686018427387904:ℚ)) block00_checked tail01
  have hsum : ((16113048959062978911/18446744073709551616:ℚ) : ℚ)+((19541939343147957933/4611686018427387904:ℚ))=((94280806331654810643/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((94280806331654810643/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((94280806331654810643/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((94280806331654810643/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((94280806331654810643/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf79.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family11.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf79.root.x0 : ℝ) Phase15301Leaf79.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf79.root.y0 : ℝ) Phase15301Leaf79.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field1 x y u)^2)≤((94280806331654810643/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf79.root queryRoot 1 chartPermutation
    original_chart_checked ((94280806331654810643/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf79.Family11

#print axioms NoThreeLine.Phase15301Leaf79.Family11.data_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family11.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf79.Family11.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family11.original_directional_integral_bound
