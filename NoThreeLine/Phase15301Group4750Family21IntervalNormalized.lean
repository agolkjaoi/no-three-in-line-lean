import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock11
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock12
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock13
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock14
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock15
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock16
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock17
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock18
import NoThreeLine.Phase15301Group4750Family21IntervalNormalizedBlock19
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group4750.Family21.IntervalNormalized
open AutoEnvelope Phase15301Family21

def remaining20 : List NormalizedBlock := []
theorem tail20 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining20=some 0 := by decide +kernel

def remaining19 : List NormalizedBlock := block19::remaining20
theorem tail19 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((2499/2501:ℚ)) remaining19=some ((24236377274461317/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block19Expr 18446744073709551616
    ((2499/2501:ℚ)) (1) ((24236377274461317/9223372036854775808:ℚ)) (0)
    block19Cuts remaining20 block19_normalization block19_checked tail20
  have hs : ((24236377274461317/9223372036854775808:ℚ):ℚ)+(0)=((24236377274461317/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining19,block19,hs] using h

def remaining18 : List NormalizedBlock := block18::remaining19
theorem tail18 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((140443/144780:ℚ)) remaining18=some ((457852576217175059/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block18Expr 18446744073709551616
    ((140443/144780:ℚ)) ((2499/2501:ℚ)) ((891468775159888801/9223372036854775808:ℚ)) ((24236377274461317/9223372036854775808:ℚ))
    block18Cuts remaining19 block18_normalization block18_checked tail19
  have hs : ((891468775159888801/9223372036854775808:ℚ):ℚ)+((24236377274461317/9223372036854775808:ℚ))=((457852576217175059/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining18,block18,hs] using h

def remaining17 : List NormalizedBlock := block17::remaining18
theorem tail17 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((1265/1393:ℚ)) remaining17=some ((5869936570886668565/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block17Expr 18446744073709551616
    ((1265/1393:ℚ)) ((140443/144780:ℚ)) ((4038526266017968329/18446744073709551616:ℚ)) ((457852576217175059/4611686018427387904:ℚ))
    block17Cuts remaining18 block17_normalization block17_checked tail18
  have hs : ((4038526266017968329/18446744073709551616:ℚ):ℚ)+((457852576217175059/4611686018427387904:ℚ))=((5869936570886668565/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining17,block17,hs] using h

def remaining16 : List NormalizedBlock := block16::remaining17
theorem tail16 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((503/577:ℚ)) remaining16=some ((8113830821463794835/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block16Expr 18446744073709551616
    ((503/577:ℚ)) ((1265/1393:ℚ)) ((1121947125288563135/9223372036854775808:ℚ)) ((5869936570886668565/18446744073709551616:ℚ))
    block16Cuts remaining17 block16_normalization block16_checked tail17
  have hs : ((1121947125288563135/9223372036854775808:ℚ):ℚ)+((5869936570886668565/18446744073709551616:ℚ))=((8113830821463794835/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining16,block16,hs] using h

def remaining15 : List NormalizedBlock := block15::remaining16
theorem tail15 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((5059/6085:ℚ)) remaining15=some ((10550055442530061371/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block15Expr 18446744073709551616
    ((5059/6085:ℚ)) ((503/577:ℚ)) ((304528077633283317/2305843009213693952:ℚ)) ((8113830821463794835/18446744073709551616:ℚ))
    block15Cuts remaining16 block15_normalization block15_checked tail16
  have hs : ((304528077633283317/2305843009213693952:ℚ):ℚ)+((8113830821463794835/18446744073709551616:ℚ))=((10550055442530061371/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining15,block15,hs] using h

def remaining14 : List NormalizedBlock := block14::remaining15
theorem tail14 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((168/211:ℚ)) remaining14=some ((6508138260320634301/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block14Expr 18446744073709551616
    ((168/211:ℚ)) ((5059/6085:ℚ)) ((2466221078111207231/18446744073709551616:ℚ)) ((10550055442530061371/18446744073709551616:ℚ))
    block14Cuts remaining15 block14_normalization block14_checked tail15
  have hs : ((2466221078111207231/18446744073709551616:ℚ):ℚ)+((10550055442530061371/18446744073709551616:ℚ))=((6508138260320634301/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining14,block14,hs] using h

def remaining13 : List NormalizedBlock := block13::remaining14
theorem tail13 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((760/1017:ℚ)) remaining13=some ((16574790198985257525/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block13Expr 18446744073709551616
    ((760/1017:ℚ)) ((168/211:ℚ)) ((3558513678343988923/18446744073709551616:ℚ)) ((6508138260320634301/9223372036854775808:ℚ))
    block13Cuts remaining14 block13_normalization block13_checked tail14
  have hs : ((3558513678343988923/18446744073709551616:ℚ):ℚ)+((6508138260320634301/9223372036854775808:ℚ))=((16574790198985257525/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining13,block13,hs] using h

def remaining12 : List NormalizedBlock := block12::remaining13
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((568/825:ℚ)) remaining12=some ((20560638564909548495/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block12Expr 18446744073709551616
    ((568/825:ℚ)) ((760/1017:ℚ)) ((1992924182962145485/9223372036854775808:ℚ)) ((16574790198985257525/18446744073709551616:ℚ))
    block12Cuts remaining13 block12_normalization block12_checked tail13
  have hs : ((1992924182962145485/9223372036854775808:ℚ):ℚ)+((16574790198985257525/18446744073709551616:ℚ))=((20560638564909548495/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining12,block12,hs] using h

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((1137/1777:ℚ)) remaining11=some ((24129711654070343081/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((1137/1777:ℚ)) ((568/825:ℚ)) ((1784536544580397293/9223372036854775808:ℚ)) ((20560638564909548495/18446744073709551616:ℚ))
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((1784536544580397293/9223372036854775808:ℚ):ℚ)+((20560638564909548495/18446744073709551616:ℚ))=((24129711654070343081/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((568/953:ℚ)) remaining10=some ((6963396064432753767/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((568/953:ℚ)) ((1137/1777:ℚ)) ((3723872603660671987/18446744073709551616:ℚ)) ((24129711654070343081/18446744073709551616:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((3723872603660671987/18446744073709551616:ℚ):ℚ)+((24129711654070343081/18446744073709551616:ℚ))=((6963396064432753767/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((312/569:ℚ)) remaining09=some ((15767242477847259475/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((312/569:ℚ)) ((568/953:ℚ)) ((1840450348981751941/9223372036854775808:ℚ)) ((6963396064432753767/4611686018427387904:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((1840450348981751941/9223372036854775808:ℚ):ℚ)+((6963396064432753767/4611686018427387904:ℚ))=((15767242477847259475/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((104/211:ℚ)) remaining08=some ((35541474636400027193/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((104/211:ℚ)) ((312/569:ℚ)) ((4006989680705508243/18446744073709551616:ℚ)) ((15767242477847259475/9223372036854775808:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((4006989680705508243/18446744073709551616:ℚ):ℚ)+((15767242477847259475/9223372036854775808:ℚ))=((35541474636400027193/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((625/1393:ℚ)) remaining07=some ((39148107218504327441/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((625/1393:ℚ)) ((104/211:ℚ)) ((450829072763037531/2305843009213693952:ℚ)) ((35541474636400027193/18446744073709551616:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((450829072763037531/2305843009213693952:ℚ):ℚ)+((35541474636400027193/18446744073709551616:ℚ))=((39148107218504327441/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((241/625:ℚ)) remaining06=some ((43998137910073917659/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((241/625:ℚ)) ((625/1393:ℚ)) ((2425015345784795109/9223372036854775808:ℚ)) ((39148107218504327441/18446744073709551616:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((2425015345784795109/9223372036854775808:ℚ):ℚ)+((39148107218504327441/18446744073709551616:ℚ))=((43998137910073917659/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((497/1521:ℚ)) remaining05=some ((48079288412239272561/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((497/1521:ℚ)) ((241/625:ℚ)) ((2040575251082677451/9223372036854775808:ℚ)) ((43998137910073917659/18446744073709551616:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((2040575251082677451/9223372036854775808:ℚ):ℚ)+((43998137910073917659/18446744073709551616:ℚ))=((48079288412239272561/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((40/147:ℚ)) remaining04=some ((25956771688444921679/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((40/147:ℚ)) ((497/1521:ℚ)) ((3834254964650570797/18446744073709551616:ℚ)) ((48079288412239272561/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((3834254964650570797/18446744073709551616:ℚ):ℚ)+((48079288412239272561/18446744073709551616:ℚ))=((25956771688444921679/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((369/1649:ℚ)) remaining03=some ((55371547364057373101/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((369/1649:ℚ)) ((40/147:ℚ)) ((3458003987167529743/18446744073709551616:ℚ)) ((25956771688444921679/9223372036854775808:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((3458003987167529743/18446744073709551616:ℚ):ℚ)+((25956771688444921679/9223372036854775808:ℚ))=((55371547364057373101/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((241/1521:ℚ)) remaining02=some ((7483657248727893659/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((241/1521:ℚ)) ((369/1649:ℚ)) ((4497710625765776171/18446744073709551616:ℚ)) ((55371547364057373101/18446744073709551616:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((4497710625765776171/18446744073709551616:ℚ):ℚ)+((55371547364057373101/18446744073709551616:ℚ))=((7483657248727893659/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((56/505:ℚ)) remaining01=some ((31693627693109734073/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((56/505:ℚ)) ((241/1521:ℚ)) ((1758998698198159437/9223372036854775808:ℚ)) ((7483657248727893659/2305843009213693952:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((1758998698198159437/9223372036854775808:ℚ):ℚ)+((7483657248727893659/2305843009213693952:ℚ))=((31693627693109734073/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((74092655300493625469/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((56/505:ℚ)) ((10705399914274157323/18446744073709551616:ℚ)) ((31693627693109734073/9223372036854775808:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((10705399914274157323/18446744073709551616:ℚ):ℚ)+((31693627693109734073/9223372036854775808:ℚ))=((74092655300493625469/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((74092655300493625469/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((74092655300493625469/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((74092655300493625469/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group4750.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family21.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group4750.root.x0 : ℝ) Phase15301Group4750.root.x1)
    (hy : y∈Set.Icc (Phase15301Group4750.root.y0 : ℝ) Phase15301Group4750.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field2 x y u)^2)≤((74092655300493625469/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group4750.root queryRoot 1 chartPermutation
    original_chart_checked ((74092655300493625469/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group4750.Family21.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group4750.Family21.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group4750.Family21.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group4750.Family21.IntervalNormalized.original_directional_integral_bound
