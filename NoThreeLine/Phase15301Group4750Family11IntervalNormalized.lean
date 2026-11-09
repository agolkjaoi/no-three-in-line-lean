import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock11
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock12
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock13
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock14
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock15
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock16
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock17
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock18
import NoThreeLine.Phase15301Group4750Family11IntervalNormalizedBlock19
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group4750.Family11.IntervalNormalized
open AutoEnvelope Phase15301Family11

def remaining20 : List NormalizedBlock := []
theorem tail20 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining20=some 0 := by decide +kernel

def remaining19 : List NormalizedBlock := block19::remaining20
theorem tail19 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((504/505:ℚ)) remaining19=some ((63906937854656537/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block19Expr 18446744073709551616
    ((504/505:ℚ)) (1) ((63906937854656537/9223372036854775808:ℚ)) (0)
    block19Cuts remaining20 block19_normalization block19_checked tail20
  have hs : ((63906937854656537/9223372036854775808:ℚ):ℚ)+(0)=((63906937854656537/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining19,block19,hs] using h

def remaining18 : List NormalizedBlock := block18::remaining19
theorem tail18 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((2347/2541:ℚ)) remaining18=some ((5172610720464837347/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block18Expr 18446744073709551616
    ((2347/2541:ℚ)) ((504/505:ℚ)) ((5044796844755524273/18446744073709551616:ℚ)) ((63906937854656537/9223372036854775808:ℚ))
    block18Cuts remaining19 block18_normalization block18_checked tail19
  have hs : ((5044796844755524273/18446744073709551616:ℚ):ℚ)+((63906937854656537/9223372036854775808:ℚ))=((5172610720464837347/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining18,block18,hs] using h

def remaining17 : List NormalizedBlock := block17::remaining18
theorem tail17 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((6657/7559:ℚ)) remaining17=some ((8008831380671315193/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block17Expr 18446744073709551616
    ((6657/7559:ℚ)) ((2347/2541:ℚ)) ((1418110330103238923/9223372036854775808:ℚ)) ((5172610720464837347/18446744073709551616:ℚ))
    block17Cuts remaining18 block17_normalization block17_checked tail18
  have hs : ((1418110330103238923/9223372036854775808:ℚ):ℚ)+((5172610720464837347/18446744073709551616:ℚ))=((8008831380671315193/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining17,block17,hs] using h

def remaining16 : List NormalizedBlock := block16::remaining17
theorem tail16 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((6531/7685:ℚ)) remaining16=some ((4844698545693776469/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block16Expr 18446744073709551616
    ((6531/7685:ℚ)) ((6657/7559:ℚ)) ((1680565710716237745/18446744073709551616:ℚ)) ((8008831380671315193/18446744073709551616:ℚ))
    block16Cuts remaining17 block16_normalization block16_checked tail17
  have hs : ((1680565710716237745/18446744073709551616:ℚ):ℚ)+((8008831380671315193/18446744073709551616:ℚ))=((4844698545693776469/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining16,block16,hs] using h

def remaining15 : List NormalizedBlock := block15::remaining16
theorem tail15 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((760/953:ℚ)) remaining15=some ((816818914338045561/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block15Expr 18446744073709551616
    ((760/953:ℚ)) ((6531/7685:ℚ)) ((1689852769010588019/9223372036854775808:ℚ)) ((4844698545693776469/9223372036854775808:ℚ))
    block15Cuts remaining16 block15_normalization block15_checked tail16
  have hs : ((1689852769010588019/9223372036854775808:ℚ):ℚ)+((4844698545693776469/9223372036854775808:ℚ))=((816818914338045561/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining15,block15,hs] using h

def remaining14 : List NormalizedBlock := block14::remaining15
theorem tail14 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((760/1017:ℚ)) remaining14=some ((8620574035770792299/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block14Expr 18446744073709551616
    ((760/1017:ℚ)) ((760/953:ℚ)) ((2086022721066427811/9223372036854775808:ℚ)) ((816818914338045561/1152921504606846976:ℚ))
    block14Cuts remaining15 block14_normalization block14_checked tail15
  have hs : ((2086022721066427811/9223372036854775808:ℚ):ℚ)+((816818914338045561/1152921504606846976:ℚ))=((8620574035770792299/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining14,block14,hs] using h

def remaining13 : List NormalizedBlock := block13::remaining14
theorem tail13 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((625/881:ℚ)) remaining13=some ((1276753450046195073/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block13Expr 18446744073709551616
    ((625/881:ℚ)) ((760/1017:ℚ)) ((1593453564598768285/9223372036854775808:ℚ)) ((8620574035770792299/9223372036854775808:ℚ))
    block13Cuts remaining14 block13_normalization block13_checked tail14
  have hs : ((1593453564598768285/9223372036854775808:ℚ):ℚ)+((8620574035770792299/9223372036854775808:ℚ))=((1276753450046195073/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining13,block13,hs] using h

def remaining12 : List NormalizedBlock := block12::remaining13
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((4033/6087:ℚ)) remaining12=some ((12106115551175834469/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block12Expr 18446744073709551616
    ((4033/6087:ℚ)) ((625/881:ℚ)) ((1892087950806273885/9223372036854775808:ℚ)) ((1276753450046195073/1152921504606846976:ℚ))
    block12Cuts remaining13 block12_normalization block12_checked tail13
  have hs : ((1892087950806273885/9223372036854775808:ℚ):ℚ)+((1276753450046195073/1152921504606846976:ℚ))=((12106115551175834469/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining12,block12,hs] using h

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((312/505:ℚ)) remaining11=some ((863763754114121385/576460752303423488:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((312/505:ℚ)) ((4033/6087:ℚ)) ((1714104514650107691/9223372036854775808:ℚ)) ((12106115551175834469/9223372036854775808:ℚ))
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((1714104514650107691/9223372036854775808:ℚ):ℚ)+((12106115551175834469/9223372036854775808:ℚ))=((863763754114121385/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((248/441:ℚ)) remaining10=some ((16142515131320888301/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((248/441:ℚ)) ((312/505:ℚ)) ((2322295065494946141/9223372036854775808:ℚ)) ((863763754114121385/576460752303423488:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((2322295065494946141/9223372036854775808:ℚ):ℚ)+((863763754114121385/576460752303423488:ℚ))=((16142515131320888301/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((25879845527/52317575065:ℚ)) remaining09=some ((18971707230850676207/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((25879845527/52317575065:ℚ)) ((248/441:ℚ)) ((1414596049764893953/4611686018427387904:ℚ)) ((16142515131320888301/9223372036854775808:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((1414596049764893953/4611686018427387904:ℚ):ℚ)+((16142515131320888301/9223372036854775808:ℚ))=((18971707230850676207/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((3523/7621:ℚ)) remaining08=some ((20336810567550828069/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((3523/7621:ℚ)) ((25879845527/52317575065:ℚ)) ((682551668350075931/4611686018427387904:ℚ)) ((18971707230850676207/9223372036854775808:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((682551668350075931/4611686018427387904:ℚ):ℚ)+((18971707230850676207/9223372036854775808:ℚ))=((20336810567550828069/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((251/635:ℚ)) remaining07=some ((23212522938192063839/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((251/635:ℚ)) ((3523/7621:ℚ)) ((1437856185320617885/4611686018427387904:ℚ)) ((20336810567550828069/9223372036854775808:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((1437856185320617885/4611686018427387904:ℚ):ℚ)+((20336810567550828069/9223372036854775808:ℚ))=((23212522938192063839/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((625/1777:ℚ)) remaining06=some ((50328082138242738481/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((625/1777:ℚ)) ((251/635:ℚ)) ((3903036261858610803/18446744073709551616:ℚ)) ((23212522938192063839/9223372036854775808:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((3903036261858610803/18446744073709551616:ℚ):ℚ)+((23212522938192063839/9223372036854775808:ℚ))=((50328082138242738481/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((56/185:ℚ)) remaining05=some ((3440857376533315207/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((56/185:ℚ)) ((625/1777:ℚ)) ((4725635886290304831/18446744073709551616:ℚ)) ((50328082138242738481/18446744073709551616:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((4725635886290304831/18446744073709551616:ℚ):ℚ)+((50328082138242738481/18446744073709551616:ℚ))=((3440857376533315207/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((248/1017:ℚ)) remaining04=some ((60743230929215870409/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((248/1017:ℚ)) ((56/185:ℚ)) ((5689512904682827097/18446744073709551616:ℚ)) ((3440857376533315207/1152921504606846976:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((5689512904682827097/18446744073709551616:ℚ):ℚ)+((3440857376533315207/1152921504606846976:ℚ))=((60743230929215870409/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((115922446797/559439161483:ℚ)) remaining03=some ((65115818451429691947/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((115922446797/559439161483:ℚ)) ((248/1017:ℚ)) ((2186293761106910769/9223372036854775808:ℚ)) ((60743230929215870409/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((2186293761106910769/9223372036854775808:ℚ):ℚ)+((60743230929215870409/18446744073709551616:ℚ))=((65115818451429691947/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((22116397301/140119763271:ℚ)) remaining02=some ((71274458049984077071/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((22116397301/140119763271:ℚ)) ((115922446797/559439161483:ℚ)) ((1539659899638596281/4611686018427387904:ℚ)) ((65115818451429691947/18446744073709551616:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((1539659899638596281/4611686018427387904:ℚ):ℚ)+((65115818451429691947/18446744073709551616:ℚ))=((71274458049984077071/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((113/1137:ℚ)) remaining01=some ((79093831859248866321/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((113/1137:ℚ)) ((22116397301/140119763271:ℚ)) ((3909686904632394625/9223372036854775808:ℚ)) ((71274458049984077071/18446744073709551616:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((3909686904632394625/9223372036854775808:ℚ):ℚ)+((71274458049984077071/18446744073709551616:ℚ))=((79093831859248866321/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((94306287538675315719/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((113/1137:ℚ)) ((7606227839713224699/9223372036854775808:ℚ)) ((79093831859248866321/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((7606227839713224699/9223372036854775808:ℚ):ℚ)+((79093831859248866321/18446744073709551616:ℚ))=((94306287538675315719/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((94306287538675315719/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((94306287538675315719/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((94306287538675315719/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group4750.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family11.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group4750.root.x0 : ℝ) Phase15301Group4750.root.x1)
    (hy : y∈Set.Icc (Phase15301Group4750.root.y0 : ℝ) Phase15301Group4750.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field1 x y u)^2)≤((94306287538675315719/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group4750.root queryRoot 1 chartPermutation
    original_chart_checked ((94306287538675315719/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group4750.Family11.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group4750.Family11.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group4750.Family11.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group4750.Family11.IntervalNormalized.original_directional_integral_bound
