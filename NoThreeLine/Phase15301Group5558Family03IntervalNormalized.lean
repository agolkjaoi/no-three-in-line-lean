import NoThreeLine.Phase15301Group5558Family03IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group5558Family03IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group5558Family03IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group5558Family03IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group5558Family03IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group5558Family03IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group5558Family03IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group5558Family03IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group5558Family03IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group5558Family03IntervalNormalizedBlock09
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group5558.Family03.IntervalNormalized
open AutoEnvelope Phase15301Family03

def remaining10 : List NormalizedBlock := []
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining10=some 0 := by decide +kernel

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((57/64:ℚ)) remaining09=some ((1644480907003342099/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((57/64:ℚ)) (1) ((1644480907003342099/4611686018427387904:ℚ)) (0)
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((1644480907003342099/4611686018427387904:ℚ):ℚ)+(0)=((1644480907003342099/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((25/32:ℚ)) remaining08=some ((14258648197835446663/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((25/32:ℚ)) ((57/64:ℚ)) ((7680724569822078267/18446744073709551616:ℚ)) ((1644480907003342099/4611686018427387904:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((7680724569822078267/18446744073709551616:ℚ):ℚ)+((1644480907003342099/4611686018427387904:ℚ))=((14258648197835446663/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((83/128:ℚ)) remaining07=some ((6026863925603191967/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((83/128:ℚ)) ((25/32:ℚ)) ((9848807504577321205/18446744073709551616:ℚ)) ((14258648197835446663/18446744073709551616:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((9848807504577321205/18446744073709551616:ℚ):ℚ)+((14258648197835446663/18446744073709551616:ℚ))=((6026863925603191967/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((35/64:ℚ)) remaining06=some ((32561173073932264853/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((35/64:ℚ)) ((83/128:ℚ)) ((8453717371519496985/18446744073709551616:ℚ)) ((6026863925603191967/4611686018427387904:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((8453717371519496985/18446744073709551616:ℚ):ℚ)+((6026863925603191967/4611686018427387904:ℚ))=((32561173073932264853/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((27/64:ℚ)) remaining05=some ((44780526671579080145/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((27/64:ℚ)) ((35/64:ℚ)) ((3054838399411703823/4611686018427387904:ℚ)) ((32561173073932264853/18446744073709551616:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((3054838399411703823/4611686018427387904:ℚ):ℚ)+((32561173073932264853/18446744073709551616:ℚ))=((44780526671579080145/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((83/256:ℚ)) remaining04=some ((13972422583965673003/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((83/256:ℚ)) ((27/64:ℚ)) ((11109163664283611867/18446744073709551616:ℚ)) ((44780526671579080145/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((11109163664283611867/18446744073709551616:ℚ):ℚ)+((44780526671579080145/18446744073709551616:ℚ))=((13972422583965673003/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((59/256:ℚ)) remaining03=some ((66707051330201773283/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((59/256:ℚ)) ((83/256:ℚ)) ((10817360994339081271/18446744073709551616:ℚ)) ((13972422583965673003/4611686018427387904:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((10817360994339081271/18446744073709551616:ℚ):ℚ)+((13972422583965673003/4611686018427387904:ℚ))=((66707051330201773283/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((21/128:ℚ)) remaining02=some ((76038244614729873645/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((21/128:ℚ)) ((59/256:ℚ)) ((4665596642264050181/9223372036854775808:ℚ)) ((66707051330201773283/18446744073709551616:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((4665596642264050181/9223372036854775808:ℚ):ℚ)+((66707051330201773283/18446744073709551616:ℚ))=((76038244614729873645/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((3/32:ℚ)) remaining01=some ((11198356238256219649/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((3/32:ℚ)) ((21/128:ℚ)) ((13548605291319883547/18446744073709551616:ℚ)) ((76038244614729873645/18446744073709551616:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((13548605291319883547/18446744073709551616:ℚ):ℚ)+((76038244614729873645/18446744073709551616:ℚ))=((11198356238256219649/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((27868904114011513503/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((3/32:ℚ)) ((5472191637499074205/4611686018427387904:ℚ)) ((11198356238256219649/2305843009213693952:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((5472191637499074205/4611686018427387904:ℚ):ℚ)+((11198356238256219649/2305843009213693952:ℚ))=((27868904114011513503/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((27868904114011513503/4611686018427387904:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((27868904114011513503/4611686018427387904:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((27868904114011513503/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group5558.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family03.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group5558.root.x0 : ℝ) Phase15301Group5558.root.x1)
    (hy : y∈Set.Icc (Phase15301Group5558.root.y0 : ℝ) Phase15301Group5558.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field0 x y u)^2)≤((27868904114011513503/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group5558.root queryRoot 3 chartPermutation
    original_chart_checked ((27868904114011513503/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group5558.Family03.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group5558.Family03.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group5558.Family03.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group5558.Family03.IntervalNormalized.original_directional_integral_bound
