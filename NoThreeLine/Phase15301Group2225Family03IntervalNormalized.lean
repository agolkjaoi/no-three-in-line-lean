import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group2225Family03IntervalNormalizedBlock11
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized
open AutoEnvelope Phase15301Family03

def remaining12 : List NormalizedBlock := []
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining12=some 0 := by decide +kernel

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((255/256:ℚ)) remaining11=some ((52814604489130641/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((255/256:ℚ)) (1) ((52814604489130641/4611686018427387904:ℚ)) (0)
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((52814604489130641/4611686018427387904:ℚ):ℚ)+(0)=((52814604489130641/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((217/256:ℚ)) remaining10=some ((9597899644284121869/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((217/256:ℚ)) ((255/256:ℚ)) ((9386641226327599305/18446744073709551616:ℚ)) ((52814604489130641/4611686018427387904:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((9386641226327599305/18446744073709551616:ℚ):ℚ)+((52814604489130641/4611686018427387904:ℚ))=((9597899644284121869/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((49/64:ℚ)) remaining09=some ((15425371710419007771/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((49/64:ℚ)) ((217/256:ℚ)) ((2913736033067442951/9223372036854775808:ℚ)) ((9597899644284121869/18446744073709551616:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((2913736033067442951/9223372036854775808:ℚ):ℚ)+((9597899644284121869/18446744073709551616:ℚ))=((15425371710419007771/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((21/32:ℚ)) remaining08=some ((11790591378831184949/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((21/32:ℚ)) ((49/64:ℚ)) ((8155811047243362127/18446744073709551616:ℚ)) ((15425371710419007771/18446744073709551616:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((8155811047243362127/18446744073709551616:ℚ):ℚ)+((15425371710419007771/18446744073709551616:ℚ))=((11790591378831184949/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((9/16:ℚ)) remaining07=some ((7840619234790483607/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((9/16:ℚ)) ((21/32:ℚ)) ((3890647090749782265/9223372036854775808:ℚ)) ((11790591378831184949/9223372036854775808:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((3890647090749782265/9223372036854775808:ℚ):ℚ)+((11790591378831184949/9223372036854775808:ℚ))=((7840619234790483607/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((115/256:ℚ)) remaining06=some ((10495129566632462429/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((115/256:ℚ)) ((9/16:ℚ)) ((1327255165920989411/2305843009213693952:ℚ)) ((7840619234790483607/4611686018427387904:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((1327255165920989411/2305843009213693952:ℚ):ℚ)+((7840619234790483607/4611686018427387904:ℚ))=((10495129566632462429/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((201/512:ℚ)) remaining05=some ((48563159261376501727/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((201/512:ℚ)) ((115/256:ℚ)) ((6582640994846652011/18446744073709551616:ℚ)) ((10495129566632462429/4611686018427387904:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((6582640994846652011/18446744073709551616:ℚ):ℚ)+((10495129566632462429/4611686018427387904:ℚ))=((48563159261376501727/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((37/128:ℚ)) remaining04=some ((60132358082129411835/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((37/128:ℚ)) ((201/512:ℚ)) ((2892299705188227527/4611686018427387904:ℚ)) ((48563159261376501727/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((2892299705188227527/4611686018427387904:ℚ):ℚ)+((48563159261376501727/18446744073709551616:ℚ))=((60132358082129411835/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((29/128:ℚ)) remaining03=some ((67594875204247725251/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((29/128:ℚ)) ((37/128:ℚ)) ((932814640264789177/2305843009213693952:ℚ)) ((60132358082129411835/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((932814640264789177/2305843009213693952:ℚ):ℚ)+((60132358082129411835/18446744073709551616:ℚ))=((67594875204247725251/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((41/256:ℚ)) remaining02=some ((9670107285055737297/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((41/256:ℚ)) ((29/128:ℚ)) ((9765983076198173125/18446744073709551616:ℚ)) ((67594875204247725251/18446744073709551616:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((9765983076198173125/18446744073709551616:ℚ):ℚ)+((67594875204247725251/18446744073709551616:ℚ))=((9670107285055737297/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((3/32:ℚ)) remaining01=some ((90619343662302804243/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((3/32:ℚ)) ((41/256:ℚ)) ((13258485381856905867/18446744073709551616:ℚ)) ((9670107285055737297/2305843009213693952:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((13258485381856905867/18446744073709551616:ℚ):ℚ)+((9670107285055737297/2305843009213693952:ℚ))=((90619343662302804243/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((112620541424004428567/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((3/32:ℚ)) ((5500299440425406081/4611686018427387904:ℚ)) ((90619343662302804243/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((5500299440425406081/4611686018427387904:ℚ):ℚ)+((90619343662302804243/18446744073709551616:ℚ))=((112620541424004428567/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((112620541424004428567/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((112620541424004428567/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((112620541424004428567/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group2225.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family03.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group2225.root.x0 : ℝ) Phase15301Group2225.root.x1)
    (hy : y∈Set.Icc (Phase15301Group2225.root.y0 : ℝ) Phase15301Group2225.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field0 x y u)^2)≤((112620541424004428567/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group2225.root queryRoot 3 chartPermutation
    original_chart_checked ((112620541424004428567/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized.original_directional_integral_bound
