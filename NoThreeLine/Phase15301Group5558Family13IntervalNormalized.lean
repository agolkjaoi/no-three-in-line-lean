import NoThreeLine.Phase15301Group5558Family13IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group5558Family13IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group5558Family13IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group5558Family13IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group5558Family13IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group5558Family13IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group5558Family13IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group5558Family13IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group5558Family13IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group5558Family13IntervalNormalizedBlock09
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized
open AutoEnvelope Phase15301Family13

def remaining10 : List NormalizedBlock := []
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining10=some 0 := by decide +kernel

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((111/128:ℚ)) remaining09=some ((499709634234433095/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((111/128:ℚ)) (1) ((499709634234433095/1152921504606846976:ℚ)) (0)
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((499709634234433095/1152921504606846976:ℚ):ℚ)+(0)=((499709634234433095/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((93/128:ℚ)) remaining08=some ((17049778740588255121/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((93/128:ℚ)) ((111/128:ℚ)) ((9054424592837325601/18446744073709551616:ℚ)) ((499709634234433095/1152921504606846976:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((9054424592837325601/18446744073709551616:ℚ):ℚ)+((499709634234433095/1152921504606846976:ℚ))=((17049778740588255121/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((157/256:ℚ)) remaining07=some ((12727455602703830115/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((157/256:ℚ)) ((93/128:ℚ)) ((8405132464819405109/18446744073709551616:ℚ)) ((17049778740588255121/18446744073709551616:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((8405132464819405109/18446744073709551616:ℚ):ℚ)+((17049778740588255121/18446744073709551616:ℚ))=((12727455602703830115/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((253/512:ℚ)) remaining06=some ((35267390678114998359/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((253/512:ℚ)) ((157/256:ℚ)) ((9812479472707338129/18446744073709551616:ℚ)) ((12727455602703830115/9223372036854775808:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((9812479472707338129/18446744073709551616:ℚ):ℚ)+((12727455602703830115/9223372036854775808:ℚ))=((35267390678114998359/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((13/32:ℚ)) remaining05=some ((5471582849762318639/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((13/32:ℚ)) ((253/512:ℚ)) ((8505272119983550753/18446744073709551616:ℚ)) ((35267390678114998359/18446744073709551616:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((8505272119983550753/18446744073709551616:ℚ):ℚ)+((35267390678114998359/18446744073709551616:ℚ))=((5471582849762318639/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((77/256:ℚ)) remaining04=some ((54775304755958139793/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((77/256:ℚ)) ((13/32:ℚ)) ((11002641957859590681/18446744073709551616:ℚ)) ((5471582849762318639/2305843009213693952:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((11002641957859590681/18446744073709551616:ℚ):ℚ)+((5471582849762318639/2305843009213693952:ℚ))=((54775304755958139793/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((57/256:ℚ)) remaining03=some ((63637700021821067073/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((57/256:ℚ)) ((77/256:ℚ)) ((553899704116432955/1152921504606846976:ℚ)) ((54775304755958139793/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((553899704116432955/1152921504606846976:ℚ):ℚ)+((54775304755958139793/18446744073709551616:ℚ))=((63637700021821067073/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((81/512:ℚ)) remaining02=some ((18163200276712273351/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((81/512:ℚ)) ((57/256:ℚ)) ((9015101085028026331/18446744073709551616:ℚ)) ((63637700021821067073/18446744073709551616:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((9015101085028026331/18446744073709551616:ℚ):ℚ)+((63637700021821067073/18446744073709551616:ℚ))=((18163200276712273351/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((3/32:ℚ)) remaining01=some ((85133325323465602557/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((3/32:ℚ)) ((81/512:ℚ)) ((12480524216616509153/18446744073709551616:ℚ)) ((18163200276712273351/4611686018427387904:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((12480524216616509153/18446744073709551616:ℚ):ℚ)+((18163200276712273351/4611686018427387904:ℚ))=((85133325323465602557/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((109937067399581875967/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((3/32:ℚ)) ((12401871038058136705/9223372036854775808:ℚ)) ((85133325323465602557/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((12401871038058136705/9223372036854775808:ℚ):ℚ)+((85133325323465602557/18446744073709551616:ℚ))=((109937067399581875967/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((109937067399581875967/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((109937067399581875967/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((109937067399581875967/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group5558.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family13.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group5558.root.x0 : ℝ) Phase15301Group5558.root.x1)
    (hy : y∈Set.Icc (Phase15301Group5558.root.y0 : ℝ) Phase15301Group5558.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field1 x y u)^2)≤((109937067399581875967/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group5558.root queryRoot 3 chartPermutation
    original_chart_checked ((109937067399581875967/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized.original_directional_integral_bound
