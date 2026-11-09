import NoThreeLine.Phase15301Group7275Family11Block00
import NoThreeLine.Phase15301Group7275Family11Block01
import NoThreeLine.Phase15301Group7275Family11Block02
import NoThreeLine.Phase15301Group7275Family11Block03
import NoThreeLine.Phase15301Group7275Family11Block04
import NoThreeLine.Phase15301Group7275Family11Block05
import NoThreeLine.Phase15301Group7275Family11Block06
import NoThreeLine.Phase15301Group7275Family11Block07
import NoThreeLine.Phase15301Group7275Family11Block08
import NoThreeLine.Phase15301Group7275Family11Block09
import NoThreeLine.Phase15301Group7275Family11Block10
import NoThreeLine.Phase15301Group7275Family11Block11
import NoThreeLine.Phase15301Group7275Family11Block12
import NoThreeLine.Phase15301Group7275Family11Block13
import NoThreeLine.Phase15301Group7275Family11Block14
import NoThreeLine.Phase15301Group7275Family11Block15
import NoThreeLine.Phase15301Group7275Family11Block16
import NoThreeLine.Phase15301Group7275Family11Block17
import NoThreeLine.Phase15301Group7275Family11Block18

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope Phase15301Family11

def remaining19 : List (ℚ × AutoTrace) := []
theorem tail19 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining19=some 0 := by decide +kernel

def remaining18 : List (ℚ × AutoTrace) := block18++remaining19
theorem tail18 : checkUpperPartition gatheredExpr 18446744073709551616 ((3299/3552:ℚ)) remaining18=some ((600585653152178063/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3299/3552:ℚ)) block18 remaining19
    (1) ((600585653152178063/2305843009213693952:ℚ)) (0) block18_checked tail19
  have hsum : ((600585653152178063/2305843009213693952:ℚ) : ℚ)+(0)=((600585653152178063/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining18,hsum] using h

def remaining17 : List (ℚ × AutoTrace) := block17++remaining18
theorem tail17 : checkUpperPartition gatheredExpr 18446744073709551616 ((18197/20227:ℚ)) remaining17=some ((6818976345456066817/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((18197/20227:ℚ)) block17 remaining18
    ((3299/3552:ℚ)) ((2014291120238642313/18446744073709551616:ℚ)) ((600585653152178063/2305843009213693952:ℚ)) block17_checked tail18
  have hsum : ((2014291120238642313/18446744073709551616:ℚ) : ℚ)+((600585653152178063/2305843009213693952:ℚ))=((6818976345456066817/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining17,hsum] using h

def remaining16 : List (ℚ × AutoTrace) := block16++remaining17
theorem tail16 : checkUpperPartition gatheredExpr 18446744073709551616 ((6597/7681:ℚ)) remaining16=some ((9174141439171849163/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((6597/7681:ℚ)) block16 remaining17
    ((18197/20227:ℚ)) ((1177582546857891173/9223372036854775808:ℚ)) ((6818976345456066817/18446744073709551616:ℚ)) block16_checked tail17
  have hsum : ((1177582546857891173/9223372036854775808:ℚ) : ℚ)+((6818976345456066817/18446744073709551616:ℚ))=((9174141439171849163/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining16,hsum] using h

def remaining15 : List (ℚ × AutoTrace) := block15++remaining16
theorem tail15 : checkUpperPartition gatheredExpr 18446744073709551616 ((2275/2784:ℚ)) remaining15=some ((1454447541032248365/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((2275/2784:ℚ)) block15 remaining16
    ((6597/7681:ℚ)) ((2461438889086137757/18446744073709551616:ℚ)) ((9174141439171849163/18446744073709551616:ℚ)) block15_checked tail16
  have hsum : ((2461438889086137757/18446744073709551616:ℚ) : ℚ)+((9174141439171849163/18446744073709551616:ℚ))=((1454447541032248365/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining15,hsum] using h

def remaining14 : List (ℚ × AutoTrace) := block14++remaining15
theorem tail14 : checkUpperPartition gatheredExpr 18446744073709551616 ((5061/6593:ℚ)) remaining14=some ((15507113777022388129/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((5061/6593:ℚ)) block14 remaining15
    ((2275/2784:ℚ)) ((3871533448764401209/18446744073709551616:ℚ)) ((1454447541032248365/2305843009213693952:ℚ)) block14_checked tail15
  have hsum : ((3871533448764401209/18446744073709551616:ℚ) : ℚ)+((1454447541032248365/2305843009213693952:ℚ))=((15507113777022388129/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining14,hsum] using h

def remaining13 : List (ℚ × AutoTrace) := block13++remaining14
theorem tail13 : checkUpperPartition gatheredExpr 18446744073709551616 ((26680806295/36791760881:ℚ)) remaining13=some ((2389724139687748239/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((26680806295/36791760881:ℚ)) block13 remaining14
    ((5061/6593:ℚ)) ((3610679340479597783/18446744073709551616:ℚ)) ((15507113777022388129/18446744073709551616:ℚ)) block13_checked tail14
  have hsum : ((3610679340479597783/18446744073709551616:ℚ) : ℚ)+((15507113777022388129/18446744073709551616:ℚ))=((2389724139687748239/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining13,hsum] using h

def remaining12 : List (ℚ × AutoTrace) := block12++remaining13
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 ((41796483/61910464:ℚ)) remaining12=some ((5805896912168476785/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((41796483/61910464:ℚ)) block12 remaining13
    ((26680806295/36791760881:ℚ)) ((1026448632792980307/4611686018427387904:ℚ)) ((2389724139687748239/2305843009213693952:ℚ)) block12_checked tail13
  have hsum : ((1026448632792980307/4611686018427387904:ℚ) : ℚ)+((2389724139687748239/2305843009213693952:ℚ))=((5805896912168476785/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining12,hsum] using h

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((2531/4064:ℚ)) remaining11=some ((27241484011755831781/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((2531/4064:ℚ)) block11 remaining12
    ((41796483/61910464:ℚ)) ((4017896363081924641/18446744073709551616:ℚ)) ((5805896912168476785/4611686018427387904:ℚ)) block11_checked tail12
  have hsum : ((4017896363081924641/18446744073709551616:ℚ) : ℚ)+((5805896912168476785/4611686018427387904:ℚ))=((27241484011755831781/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((5383/9473:ℚ)) remaining10=some ((31767486390350073707/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((5383/9473:ℚ)) block10 remaining11
    ((2531/4064:ℚ)) ((2263001189297120963/9223372036854775808:ℚ)) ((27241484011755831781/18446744073709551616:ℚ)) block10_checked tail11
  have hsum : ((2263001189297120963/9223372036854775808:ℚ) : ℚ)+((27241484011755831781/18446744073709551616:ℚ))=((31767486390350073707/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((367/739:ℚ)) remaining09=some ((37768372471950112981/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((367/739:ℚ)) block09 remaining10
    ((5383/9473:ℚ)) ((3000443040800019637/9223372036854775808:ℚ)) ((31767486390350073707/18446744073709551616:ℚ)) block09_checked tail10
  have hsum : ((3000443040800019637/9223372036854775808:ℚ) : ℚ)+((31767486390350073707/18446744073709551616:ℚ))=((37768372471950112981/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((227/480:ℚ)) remaining08=some ((19876360061680759961/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((227/480:ℚ)) block08 remaining09
    ((367/739:ℚ)) ((1984347651411406941/18446744073709551616:ℚ)) ((37768372471950112981/18446744073709551616:ℚ)) block08_checked tail09
  have hsum : ((1984347651411406941/18446744073709551616:ℚ) : ℚ)+((37768372471950112981/18446744073709551616:ℚ))=((19876360061680759961/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((3013/7105:ℚ)) remaining07=some ((43931264016021274897/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3013/7105:ℚ)) block07 remaining08
    ((227/480:ℚ)) ((4178543892659754975/18446744073709551616:ℚ)) ((19876360061680759961/9223372036854775808:ℚ)) block07_checked tail08
  have hsum : ((4178543892659754975/18446744073709551616:ℚ) : ℚ)+((19876360061680759961/9223372036854775808:ℚ))=((43931264016021274897/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((3013/8129:ℚ)) remaining06=some ((24297172120689267341/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3013/8129:ℚ)) block06 remaining07
    ((3013/7105:ℚ)) ((4663080225357259785/18446744073709551616:ℚ)) ((43931264016021274897/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((4663080225357259785/18446744073709551616:ℚ) : ℚ)+((43931264016021274897/18446744073709551616:ℚ))=((24297172120689267341/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((227/736:ℚ)) remaining05=some ((13619590244067429895/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((227/736:ℚ)) block05 remaining06
    ((3013/8129:ℚ)) ((2942008367445592449/9223372036854775808:ℚ)) ((24297172120689267341/9223372036854775808:ℚ)) block05_checked tail06
  have hsum : ((2942008367445592449/9223372036854775808:ℚ) : ℚ)+((24297172120689267341/9223372036854775808:ℚ))=((13619590244067429895/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((5220737/20636992:ℚ)) remaining04=some ((29878059762897165481/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((5220737/20636992:ℚ)) block04 remaining05
    ((227/736:ℚ)) ((2638879274762305691/9223372036854775808:ℚ)) ((13619590244067429895/4611686018427387904:ℚ)) block04_checked tail05
  have hsum : ((2638879274762305691/9223372036854775808:ℚ) : ℚ)+((13619590244067429895/4611686018427387904:ℚ))=((29878059762897165481/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((483/2272:ℚ)) remaining03=some ((4026876087746080099/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((483/2272:ℚ)) block03 remaining04
    ((5220737/20636992:ℚ)) ((2336948939071475311/9223372036854775808:ℚ)) ((29878059762897165481/9223372036854775808:ℚ)) block03_checked tail04
  have hsum : ((2336948939071475311/9223372036854775808:ℚ) : ℚ)+((29878059762897165481/9223372036854775808:ℚ))=((4026876087746080099/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((3863/24321:ℚ)) remaining02=some ((35575962738919425805/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3863/24321:ℚ)) block02 remaining03
    ((483/2272:ℚ)) ((3360954036950785013/9223372036854775808:ℚ)) ((4026876087746080099/1152921504606846976:ℚ)) block02_checked tail03
  have hsum : ((3360954036950785013/9223372036854775808:ℚ) : ℚ)+((4026876087746080099/1152921504606846976:ℚ))=((35575962738919425805/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((227/2272:ℚ)) remaining01=some ((79028902775872162123/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((227/2272:ℚ)) block01 remaining02
    ((3863/24321:ℚ)) ((7876977298033310513/18446744073709551616:ℚ)) ((35575962738919425805/9223372036854775808:ℚ)) block01_checked tail02
  have hsum : ((7876977298033310513/18446744073709551616:ℚ) : ℚ)+((35575962738919425805/9223372036854775808:ℚ))=((79028902775872162123/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((47159105596637006005/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((227/2272:ℚ)) ((15289308417401849887/18446744073709551616:ℚ)) ((79028902775872162123/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((15289308417401849887/18446744073709551616:ℚ) : ℚ)+((79028902775872162123/18446744073709551616:ℚ))=((47159105596637006005/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((47159105596637006005/9223372036854775808:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((47159105596637006005/9223372036854775808:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((47159105596637006005/9223372036854775808:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((47159105596637006005/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group7275.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family11.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group7275.root.x0 : ℝ) Phase15301Group7275.root.x1)
    (hy : y∈Set.Icc (Phase15301Group7275.root.y0 : ℝ) Phase15301Group7275.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field1 x y u)^2)≤((47159105596637006005/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group7275.root queryRoot 1 chartPermutation
    original_chart_checked ((47159105596637006005/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group7275.Family11

#print axioms NoThreeLine.Phase15301Group7275.Family11.data_checked
#print axioms NoThreeLine.Phase15301Group7275.Family11.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Group7275.Family11.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group7275.Family11.original_directional_integral_bound
