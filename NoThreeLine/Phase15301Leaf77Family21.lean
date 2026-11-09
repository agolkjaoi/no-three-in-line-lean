import NoThreeLine.Phase15301Leaf77Family21Block00
import NoThreeLine.Phase15301Leaf77Family21Block01
import NoThreeLine.Phase15301Leaf77Family21Block02
import NoThreeLine.Phase15301Leaf77Family21Block03
import NoThreeLine.Phase15301Leaf77Family21Block04
import NoThreeLine.Phase15301Leaf77Family21Block05
import NoThreeLine.Phase15301Leaf77Family21Block06
import NoThreeLine.Phase15301Leaf77Family21Block07
import NoThreeLine.Phase15301Leaf77Family21Block08
import NoThreeLine.Phase15301Leaf77Family21Block09
import NoThreeLine.Phase15301Leaf77Family21Block10
import NoThreeLine.Phase15301Leaf77Family21Block11

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf77.Family21
open AutoEnvelope Phase15301Family21

def remaining12 : List (ℚ × AutoTrace) := []
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining12=some 0 := by decide +kernel

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((15/16:ℚ)) remaining11=some ((979803104096880051/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((15/16:ℚ)) block11 remaining12
    (1) ((979803104096880051/4611686018427387904:ℚ)) (0) block11_checked tail12
  have hsum : ((979803104096880051/4611686018427387904:ℚ) : ℚ)+(0)=((979803104096880051/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((111/128:ℚ)) remaining10=some ((4184629262366936633/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((111/128:ℚ)) block10 remaining11
    ((15/16:ℚ)) ((2225023054173176531/9223372036854775808:ℚ)) ((979803104096880051/4611686018427387904:ℚ)) block10_checked tail11
  have hsum : ((2225023054173176531/9223372036854775808:ℚ) : ℚ)+((979803104096880051/4611686018427387904:ℚ))=((4184629262366936633/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((99/128:ℚ)) remaining09=some ((14688930100630018301/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((99/128:ℚ)) block09 remaining10
    ((111/128:ℚ)) ((6319671575896145035/18446744073709551616:ℚ)) ((4184629262366936633/9223372036854775808:ℚ)) block09_checked tail10
  have hsum : ((6319671575896145035/18446744073709551616:ℚ) : ℚ)+((4184629262366936633/9223372036854775808:ℚ))=((14688930100630018301/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((87/128:ℚ)) remaining08=some ((21161284078751524083/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((87/128:ℚ)) block08 remaining09
    ((99/128:ℚ)) ((3236176989060752891/9223372036854775808:ℚ)) ((14688930100630018301/18446744073709551616:ℚ)) block08_checked tail09
  have hsum : ((3236176989060752891/9223372036854775808:ℚ) : ℚ)+((14688930100630018301/18446744073709551616:ℚ))=((21161284078751524083/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((151/256:ℚ)) remaining07=some ((28382074662892869049/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((151/256:ℚ)) block07 remaining08
    ((87/128:ℚ)) ((3610395292070672483/9223372036854775808:ℚ)) ((21161284078751524083/18446744073709551616:ℚ)) block07_checked tail08
  have hsum : ((3610395292070672483/9223372036854775808:ℚ) : ℚ)+((21161284078751524083/18446744073709551616:ℚ))=((28382074662892869049/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((127/256:ℚ)) remaining06=some ((8821727212073494233/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((127/256:ℚ)) block06 remaining07
    ((151/256:ℚ)) ((6904834185401107883/18446744073709551616:ℚ)) ((28382074662892869049/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((6904834185401107883/18446744073709551616:ℚ) : ℚ)+((28382074662892869049/18446744073709551616:ℚ))=((8821727212073494233/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((405/1024:ℚ)) remaining05=some ((338090842735089113/144115188075855872:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((405/1024:ℚ)) block05 remaining06
    ((127/256:ℚ)) ((1997179755449357383/4611686018427387904:ℚ)) ((8821727212073494233/4611686018427387904:ℚ)) block05_checked tail06
  have hsum : ((1997179755449357383/4611686018427387904:ℚ) : ℚ)+((8821727212073494233/4611686018427387904:ℚ))=((338090842735089113/144115188075855872:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((41/128:ℚ)) remaining04=some ((1515147640963577539/576460752303423488:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((41/128:ℚ)) block04 remaining05
    ((405/1024:ℚ)) ((162784270023221087/576460752303423488:ℚ)) ((338090842735089113/144115188075855872:ℚ)) block04_checked tail05
  have hsum : ((162784270023221087/576460752303423488:ℚ) : ℚ)+((338090842735089113/144115188075855872:ℚ))=((1515147640963577539/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((31/128:ℚ)) remaining03=some ((13504316759402510365/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((31/128:ℚ)) block03 remaining04
    ((41/128:ℚ)) ((1383135631693890053/4611686018427387904:ℚ)) ((1515147640963577539/576460752303423488:ℚ)) block03_checked tail04
  have hsum : ((1383135631693890053/4611686018427387904:ℚ) : ℚ)+((1515147640963577539/576460752303423488:ℚ))=((13504316759402510365/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((41/256:ℚ)) remaining02=some ((59709770162794290313/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((41/256:ℚ)) block02 remaining03
    ((31/128:ℚ)) ((5692503125184248853/18446744073709551616:ℚ)) ((13504316759402510365/4611686018427387904:ℚ)) block02_checked tail03
  have hsum : ((5692503125184248853/18446744073709551616:ℚ) : ℚ)+((13504316759402510365/4611686018427387904:ℚ))=((59709770162794290313/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((51/512:ℚ)) remaining01=some ((4013927748686397355/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((51/512:ℚ)) block01 remaining02
    ((41/256:ℚ)) ((4513073816188067367/18446744073709551616:ℚ)) ((59709770162794290313/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((4513073816188067367/18446744073709551616:ℚ) : ℚ)+((59709770162794290313/18446744073709551616:ℚ))=((4013927748686397355/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((37029767477067491943/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((51/512:ℚ)) ((4918345487576313103/9223372036854775808:ℚ)) ((4013927748686397355/1152921504606846976:ℚ)) block00_checked tail01
  have hsum : ((4918345487576313103/9223372036854775808:ℚ) : ℚ)+((4013927748686397355/1152921504606846976:ℚ))=((37029767477067491943/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((37029767477067491943/9223372036854775808:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((37029767477067491943/9223372036854775808:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((37029767477067491943/9223372036854775808:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((37029767477067491943/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf77.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family21.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf77.root.x0 : ℝ) Phase15301Leaf77.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf77.root.y0 : ℝ) Phase15301Leaf77.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field2 x y u)^2)≤((37029767477067491943/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf77.root queryRoot 1 chartPermutation
    original_chart_checked ((37029767477067491943/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf77.Family21

#print axioms NoThreeLine.Phase15301Leaf77.Family21.data_checked
#print axioms NoThreeLine.Phase15301Leaf77.Family21.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf77.Family21.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf77.Family21.original_directional_integral_bound
