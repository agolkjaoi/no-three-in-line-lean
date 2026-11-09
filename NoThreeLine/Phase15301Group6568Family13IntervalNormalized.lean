import NoThreeLine.Phase15301Group6568Family13IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group6568Family13IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group6568Family13IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group6568Family13IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group6568Family13IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group6568Family13IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group6568Family13IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group6568Family13IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group6568Family13IntervalNormalizedBlock08
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group6568.Family13.IntervalNormalized
open AutoEnvelope Phase15301Family13

def remaining09 : List NormalizedBlock := []
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining09=some 0 := by decide +kernel

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((117/128:ℚ)) remaining08=some ((1326913716113787263/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((117/128:ℚ)) (1) ((1326913716113787263/4611686018427387904:ℚ)) (0)
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((1326913716113787263/4611686018427387904:ℚ):ℚ)+(0)=((1326913716113787263/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((197/256:ℚ)) remaining07=some ((14154627179358369869/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((197/256:ℚ)) ((117/128:ℚ)) ((8846972314903220817/18446744073709551616:ℚ)) ((1326913716113787263/4611686018427387904:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((8846972314903220817/18446744073709551616:ℚ):ℚ)+((1326913716113787263/4611686018427387904:ℚ))=((14154627179358369869/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((5/8:ℚ)) remaining06=some ((24514734067787915661/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((5/8:ℚ)) ((197/256:ℚ)) ((161876670131711653/288230376151711744:ℚ)) ((14154627179358369869/18446744073709551616:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((161876670131711653/288230376151711744:ℚ):ℚ)+((14154627179358369869/18446744073709551616:ℚ))=((24514734067787915661/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((31/64:ℚ)) remaining05=some ((563249645567821763/288230376151711744:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((31/64:ℚ)) ((5/8:ℚ)) ((11533243248552677171/18446744073709551616:ℚ)) ((24514734067787915661/18446744073709551616:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((11533243248552677171/18446744073709551616:ℚ):ℚ)+((24514734067787915661/18446744073709551616:ℚ))=((563249645567821763/288230376151711744:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((97/256:ℚ)) remaining04=some ((46620579424896108585/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((97/256:ℚ)) ((31/64:ℚ)) ((10572602108555515753/18446744073709551616:ℚ)) ((563249645567821763/288230376151711744:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((10572602108555515753/18446744073709551616:ℚ):ℚ)+((563249645567821763/288230376151711744:ℚ))=((46620579424896108585/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((17/64:ℚ)) remaining03=some ((58616647362334582951/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((17/64:ℚ)) ((97/256:ℚ)) ((5998033968719237183/9223372036854775808:ℚ)) ((46620579424896108585/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((5998033968719237183/9223372036854775808:ℚ):ℚ)+((46620579424896108585/18446744073709551616:ℚ))=((58616647362334582951/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((177/1024:ℚ)) remaining02=some ((70250706882568691391/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((177/1024:ℚ)) ((17/64:ℚ)) ((1454257440029263555/2305843009213693952:ℚ)) ((58616647362334582951/18446744073709551616:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((1454257440029263555/2305843009213693952:ℚ):ℚ)+((58616647362334582951/18446744073709551616:ℚ))=((70250706882568691391/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((13/128:ℚ)) remaining01=some ((2598411329688813101/576460752303423488:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((13/128:ℚ)) ((177/1024:ℚ)) ((12898455667473327841/18446744073709551616:ℚ)) ((70250706882568691391/18446744073709551616:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((12898455667473327841/18446744073709551616:ℚ):ℚ)+((70250706882568691391/18446744073709551616:ℚ))=((2598411329688813101/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((109722716431852833137/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((13/128:ℚ)) ((26573553881810813905/18446744073709551616:ℚ)) ((2598411329688813101/576460752303423488:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((26573553881810813905/18446744073709551616:ℚ):ℚ)+((2598411329688813101/576460752303423488:ℚ))=((109722716431852833137/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((109722716431852833137/18446744073709551616:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((109722716431852833137/18446744073709551616:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((109722716431852833137/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group6568.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family13.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group6568.root.x0 : ℝ) Phase15301Group6568.root.x1)
    (hy : y∈Set.Icc (Phase15301Group6568.root.y0 : ℝ) Phase15301Group6568.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field1 x y u)^2)≤((109722716431852833137/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group6568.root queryRoot 3 chartPermutation
    original_chart_checked ((109722716431852833137/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group6568.Family13.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group6568.Family13.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group6568.Family13.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group6568.Family13.IntervalNormalized.original_directional_integral_bound
