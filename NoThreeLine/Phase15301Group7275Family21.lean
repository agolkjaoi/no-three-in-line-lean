import NoThreeLine.Phase15301Group7275Family21Block00
import NoThreeLine.Phase15301Group7275Family21Block01
import NoThreeLine.Phase15301Group7275Family21Block02
import NoThreeLine.Phase15301Group7275Family21Block03
import NoThreeLine.Phase15301Group7275Family21Block04
import NoThreeLine.Phase15301Group7275Family21Block05
import NoThreeLine.Phase15301Group7275Family21Block06
import NoThreeLine.Phase15301Group7275Family21Block07
import NoThreeLine.Phase15301Group7275Family21Block08
import NoThreeLine.Phase15301Group7275Family21Block09
import NoThreeLine.Phase15301Group7275Family21Block10
import NoThreeLine.Phase15301Group7275Family21Block11
import NoThreeLine.Phase15301Group7275Family21Block12
import NoThreeLine.Phase15301Group7275Family21Block13
import NoThreeLine.Phase15301Group7275Family21Block14
import NoThreeLine.Phase15301Group7275Family21Block15
import NoThreeLine.Phase15301Group7275Family21Block16
import NoThreeLine.Phase15301Group7275Family21Block17
import NoThreeLine.Phase15301Group7275Family21Block18

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope Phase15301Family21

def remaining19 : List (ℚ × AutoTrace) := []
theorem tail19 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining19=some 0 := by decide +kernel

def remaining18 : List (ℚ × AutoTrace) := block18++remaining19
theorem tail18 : checkUpperPartition gatheredExpr 18446744073709551616 ((1409/1421:ℚ)) remaining18=some ((509783458226464441/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1409/1421:ℚ)) block18 remaining19
    (1) ((509783458226464441/18446744073709551616:ℚ)) (0) block18_checked tail19
  have hsum : ((509783458226464441/18446744073709551616:ℚ) : ℚ)+(0)=((509783458226464441/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining18,hsum] using h

def remaining17 : List (ℚ × AutoTrace) := block17++remaining18
theorem tail17 : checkUpperPartition gatheredExpr 18446744073709551616 ((5573/6081:ℚ)) remaining17=some ((5320635278534039985/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((5573/6081:ℚ)) block17 remaining18
    ((1409/1421:ℚ)) ((601356477538446943/2305843009213693952:ℚ)) ((509783458226464441/18446744073709551616:ℚ)) block17_checked tail18
  have hsum : ((601356477538446943/2305843009213693952:ℚ) : ℚ)+((509783458226464441/18446744073709551616:ℚ))=((5320635278534039985/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining17,hsum] using h

def remaining16 : List (ℚ × AutoTrace) := block16++remaining17
theorem tail16 : checkUpperPartition gatheredExpr 18446744073709551616 ((14103/16129:ℚ)) remaining16=some ((3972758252442186577/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((14103/16129:ℚ)) block16 remaining17
    ((5573/6081:ℚ)) ((2624881226350333169/18446744073709551616:ℚ)) ((5320635278534039985/18446744073709551616:ℚ)) block16_checked tail17
  have hsum : ((2624881226350333169/18446744073709551616:ℚ) : ℚ)+((5320635278534039985/18446744073709551616:ℚ))=((3972758252442186577/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining16,hsum] using h

def remaining15 : List (ℚ × AutoTrace) := block15++remaining16
theorem tail15 : checkUpperPartition gatheredExpr 18446744073709551616 ((2787/3296:ℚ)) remaining15=some ((2411429272938740097/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((2787/3296:ℚ)) block15 remaining16
    ((14103/16129:ℚ)) ((850100293435293617/9223372036854775808:ℚ)) ((3972758252442186577/9223372036854775808:ℚ)) block15_checked tail16
  have hsum : ((850100293435293617/9223372036854775808:ℚ) : ℚ)+((3972758252442186577/9223372036854775808:ℚ))=((2411429272938740097/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining15,hsum] using h

def remaining14 : List (ℚ × AutoTrace) := block14++remaining15
theorem tail14 : checkUpperPartition gatheredExpr 18446744073709551616 ((2019/2528:ℚ)) remaining14=some ((12839109029642818873/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((2019/2528:ℚ)) block14 remaining15
    ((2787/3296:ℚ)) ((3193391937887858485/18446744073709551616:ℚ)) ((2411429272938740097/4611686018427387904:ℚ)) block14_checked tail15
  have hsum : ((3193391937887858485/18446744073709551616:ℚ) : ℚ)+((2411429272938740097/4611686018427387904:ℚ))=((12839109029642818873/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining14,hsum] using h

def remaining13 : List (ℚ × AutoTrace) := block13++remaining14
theorem tail13 : checkUpperPartition gatheredExpr 18446744073709551616 ((24341/32515:ℚ)) remaining13=some ((4121698937202727529/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((24341/32515:ℚ)) block13 remaining14
    ((2019/2528:ℚ)) ((3647686719168091243/18446744073709551616:ℚ)) ((12839109029642818873/18446744073709551616:ℚ)) block13_checked tail14
  have hsum : ((3647686719168091243/18446744073709551616:ℚ) : ℚ)+((12839109029642818873/18446744073709551616:ℚ))=((4121698937202727529/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining13,hsum] using h

def remaining12 : List (ℚ × AutoTrace) := block12++remaining13
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 ((1763/2528:ℚ)) remaining12=some ((19980050173291383787/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1763/2528:ℚ)) block12 remaining13
    ((24341/32515:ℚ)) ((3493254424480473671/18446744073709551616:ℚ)) ((4121698937202727529/4611686018427387904:ℚ)) block12_checked tail13
  have hsum : ((3493254424480473671/18446744073709551616:ℚ) : ℚ)+((4121698937202727529/4611686018427387904:ℚ))=((19980050173291383787/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining12,hsum] using h

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((3863/5889:ℚ)) remaining11=some ((11438839226108771969/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3863/5889:ℚ)) block11 remaining12
    ((1763/2528:ℚ)) ((2897628278926160151/18446744073709551616:ℚ)) ((19980050173291383787/18446744073709551616:ℚ)) block11_checked tail12
  have hsum : ((2897628278926160151/18446744073709551616:ℚ) : ℚ)+((19980050173291383787/18446744073709551616:ℚ))=((11438839226108771969/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((4037/6593:ℚ)) remaining10=some ((26491404474633126465/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((4037/6593:ℚ)) block10 remaining11
    ((3863/5889:ℚ)) ((3613726022415582527/18446744073709551616:ℚ)) ((11438839226108771969/9223372036854775808:ℚ)) block10_checked tail11
  have hsum : ((3613726022415582527/18446744073709551616:ℚ) : ℚ)+((11438839226108771969/9223372036854775808:ℚ))=((26491404474633126465/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((1989/3521:ℚ)) remaining09=some ((118537775825273347/72057594037927936:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1989/3521:ℚ)) block09 remaining10
    ((4037/6593:ℚ)) ((3854266136636850367/18446744073709551616:ℚ)) ((26491404474633126465/18446744073709551616:ℚ)) block09_checked tail10
  have hsum : ((3854266136636850367/18446744073709551616:ℚ) : ℚ)+((26491404474633126465/18446744073709551616:ℚ))=((118537775825273347/72057594037927936:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((10007/20225:ℚ)) remaining08=some ((8850839825345858559/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((10007/20225:ℚ)) block08 remaining09
    ((1989/3521:ℚ)) ((1264422172528364351/4611686018427387904:ℚ)) ((118537775825273347/72057594037927936:ℚ)) block08_checked tail09
  have hsum : ((1264422172528364351/4611686018427387904:ℚ) : ℚ)+((118537775825273347/72057594037927936:ℚ))=((8850839825345858559/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((12053/26371:ℚ)) remaining07=some ((38469142047835864079/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((12053/26371:ℚ)) block07 remaining08
    ((10007/20225:ℚ)) ((3065782746452429843/18446744073709551616:ℚ)) ((8850839825345858559/4611686018427387904:ℚ)) block07_checked tail08
  have hsum : ((3065782746452429843/18446744073709551616:ℚ) : ℚ)+((8850839825345858559/4611686018427387904:ℚ))=((38469142047835864079/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((995/2528:ℚ)) remaining06=some ((2713952243824275527/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((995/2528:ℚ)) block06 remaining07
    ((12053/26371:ℚ)) ((4954093853352544353/18446744073709551616:ℚ)) ((38469142047835864079/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((4954093853352544353/18446744073709551616:ℚ) : ℚ)+((38469142047835864079/18446744073709551616:ℚ))=((2713952243824275527/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((10005/30467:ℚ)) remaining05=some ((47941703375063246829/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((10005/30467:ℚ)) block05 remaining06
    ((995/2528:ℚ)) ((4518467473874838397/18446744073709551616:ℚ)) ((2713952243824275527/1152921504606846976:ℚ)) block05_checked tail06
  have hsum : ((4518467473874838397/18446744073709551616:ℚ) : ℚ)+((2713952243824275527/1152921504606846976:ℚ))=((47941703375063246829/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((1989/7105:ℚ)) remaining04=some ((12829711243236984225/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1989/7105:ℚ)) block04 remaining05
    ((10005/30467:ℚ)) ((3377141597884690071/18446744073709551616:ℚ)) ((47941703375063246829/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((3377141597884690071/18446744073709551616:ℚ) : ℚ)+((47941703375063246829/18446744073709551616:ℚ))=((12829711243236984225/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((1813/7939:ℚ)) remaining03=some ((13756457243635784213/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1813/7939:ℚ)) block03 remaining04
    ((1989/7105:ℚ)) ((231686500099699997/1152921504606846976:ℚ)) ((12829711243236984225/4611686018427387904:ℚ)) block03_checked tail04
  have hsum : ((231686500099699997/1152921504606846976:ℚ) : ℚ)+((12829711243236984225/4611686018427387904:ℚ))=((13756457243635784213/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((217607095415/1255492999051:ℚ)) remaining02=some ((14699606975701656449/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((217607095415/1255492999051:ℚ)) block02 remaining03
    ((1813/7939:ℚ)) ((235787433016468059/1152921504606846976:ℚ)) ((13756457243635784213/4611686018427387904:ℚ)) block02_checked tail03
  have hsum : ((235787433016468059/1152921504606846976:ℚ) : ℚ)+((13756457243635784213/4611686018427387904:ℚ))=((14699606975701656449/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((1815/16129:ℚ)) remaining01=some ((7906002585669317947/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1815/16129:ℚ)) block01 remaining02
    ((217607095415/1255492999051:ℚ)) ((1112398195636979445/4611686018427387904:ℚ)) ((14699606975701656449/4611686018427387904:ℚ)) block01_checked tail02
  have hsum : ((1112398195636979445/4611686018427387904:ℚ) : ℚ)+((14699606975701656449/4611686018427387904:ℚ))=((7906002585669317947/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((74090929208027927603/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((1815/16129:ℚ)) ((10842908522673384027/18446744073709551616:ℚ)) ((7906002585669317947/2305843009213693952:ℚ)) block00_checked tail01
  have hsum : ((10842908522673384027/18446744073709551616:ℚ) : ℚ)+((7906002585669317947/2305843009213693952:ℚ))=((74090929208027927603/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((74090929208027927603/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((74090929208027927603/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((74090929208027927603/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((74090929208027927603/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group7275.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family21.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group7275.root.x0 : ℝ) Phase15301Group7275.root.x1)
    (hy : y∈Set.Icc (Phase15301Group7275.root.y0 : ℝ) Phase15301Group7275.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field2 x y u)^2)≤((74090929208027927603/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group7275.root queryRoot 1 chartPermutation
    original_chart_checked ((74090929208027927603/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group7275.Family21

#print axioms NoThreeLine.Phase15301Group7275.Family21.data_checked
#print axioms NoThreeLine.Phase15301Group7275.Family21.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Group7275.Family21.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group7275.Family21.original_directional_integral_bound
