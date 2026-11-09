import NoThreeLine.Phase15301Leaf77Family11Block00
import NoThreeLine.Phase15301Leaf77Family11Block01
import NoThreeLine.Phase15301Leaf77Family11Block02
import NoThreeLine.Phase15301Leaf77Family11Block03
import NoThreeLine.Phase15301Leaf77Family11Block04
import NoThreeLine.Phase15301Leaf77Family11Block05
import NoThreeLine.Phase15301Leaf77Family11Block06
import NoThreeLine.Phase15301Leaf77Family11Block07
import NoThreeLine.Phase15301Leaf77Family11Block08
import NoThreeLine.Phase15301Leaf77Family11Block09
import NoThreeLine.Phase15301Leaf77Family11Block10

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf77.Family11
open AutoEnvelope Phase15301Family11

def remaining11 : List (ℚ × AutoTrace) := []
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining11=some 0 := by decide +kernel

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((237/256:ℚ)) remaining10=some ((1254935839015830261/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((237/256:ℚ)) block10 remaining11
    (1) ((1254935839015830261/4611686018427387904:ℚ)) (0) block10_checked tail11
  have hsum : ((1254935839015830261/4611686018427387904:ℚ) : ℚ)+(0)=((1254935839015830261/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((107/128:ℚ)) remaining09=some ((5222138276987840883/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((107/128:ℚ)) block09 remaining10
    ((237/256:ℚ)) ((2712266598956180361/9223372036854775808:ℚ)) ((1254935839015830261/4611686018427387904:ℚ)) block09_checked tail10
  have hsum : ((2712266598956180361/9223372036854775808:ℚ) : ℚ)+((1254935839015830261/4611686018427387904:ℚ))=((5222138276987840883/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((187/256:ℚ)) remaining08=some ((2333421602750865389/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((187/256:ℚ)) block08 remaining09
    ((107/128:ℚ)) ((4111548134015620673/9223372036854775808:ℚ)) ((5222138276987840883/9223372036854775808:ℚ)) block08_checked tail09
  have hsum : ((4111548134015620673/9223372036854775808:ℚ) : ℚ)+((5222138276987840883/9223372036854775808:ℚ))=((2333421602750865389/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((317/512:ℚ)) remaining07=some ((13758748062129546013/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((317/512:ℚ)) block07 remaining08
    ((187/256:ℚ)) ((4425061651126084457/9223372036854775808:ℚ)) ((2333421602750865389/2305843009213693952:ℚ)) block07_checked tail08
  have hsum : ((4425061651126084457/9223372036854775808:ℚ) : ℚ)+((2333421602750865389/2305843009213693952:ℚ))=((13758748062129546013/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((135/256:ℚ)) remaining06=some ((35227776440325253721/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((135/256:ℚ)) block06 remaining07
    ((317/512:ℚ)) ((7710280316066161695/18446744073709551616:ℚ)) ((13758748062129546013/9223372036854775808:ℚ)) block06_checked tail07
  have hsum : ((7710280316066161695/18446744073709551616:ℚ) : ℚ)+((13758748062129546013/9223372036854775808:ℚ))=((35227776440325253721/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((211/512:ℚ)) remaining05=some ((44945114861336512535/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((211/512:ℚ)) block05 remaining06
    ((135/256:ℚ)) ((4858669210505629407/9223372036854775808:ℚ)) ((35227776440325253721/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((4858669210505629407/9223372036854775808:ℚ) : ℚ)+((35227776440325253721/18446744073709551616:ℚ))=((44945114861336512535/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((157/512:ℚ)) remaining04=some ((54642779454149115131/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((157/512:ℚ)) block04 remaining05
    ((211/512:ℚ)) ((2424416148203150649/4611686018427387904:ℚ)) ((44945114861336512535/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((2424416148203150649/4611686018427387904:ℚ) : ℚ)+((44945114861336512535/18446744073709551616:ℚ))=((54642779454149115131/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((59/256:ℚ)) remaining03=some ((62227774333515713921/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((59/256:ℚ)) block03 remaining04
    ((157/512:ℚ)) ((3792497439683299395/9223372036854775808:ℚ)) ((54642779454149115131/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((3792497439683299395/9223372036854775808:ℚ) : ℚ)+((54642779454149115131/18446744073709551616:ℚ))=((62227774333515713921/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((21/128:ℚ)) remaining02=some ((70485512108304079153/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((21/128:ℚ)) block02 remaining03
    ((59/256:ℚ)) ((516108610924272827/1152921504606846976:ℚ)) ((62227774333515713921/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((516108610924272827/1152921504606846976:ℚ) : ℚ)+((62227774333515713921/18446744073709551616:ℚ))=((70485512108304079153/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((27/256:ℚ)) remaining01=some ((78167797860421636459/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((27/256:ℚ)) block01 remaining02
    ((21/128:ℚ)) ((3841142876058778653/9223372036854775808:ℚ)) ((70485512108304079153/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((3841142876058778653/9223372036854775808:ℚ) : ℚ)+((70485512108304079153/18446744073709551616:ℚ))=((78167797860421636459/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((94280823522397334403/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((27/256:ℚ)) ((2014128207746962243/2305843009213693952:ℚ)) ((78167797860421636459/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((2014128207746962243/2305843009213693952:ℚ) : ℚ)+((78167797860421636459/18446744073709551616:ℚ))=((94280823522397334403/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((94280823522397334403/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((94280823522397334403/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((94280823522397334403/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((94280823522397334403/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf77.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family11.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf77.root.x0 : ℝ) Phase15301Leaf77.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf77.root.y0 : ℝ) Phase15301Leaf77.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field1 x y u)^2)≤((94280823522397334403/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf77.root queryRoot 1 chartPermutation
    original_chart_checked ((94280823522397334403/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf77.Family11

#print axioms NoThreeLine.Phase15301Leaf77.Family11.data_checked
#print axioms NoThreeLine.Phase15301Leaf77.Family11.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf77.Family11.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf77.Family11.original_directional_integral_bound
