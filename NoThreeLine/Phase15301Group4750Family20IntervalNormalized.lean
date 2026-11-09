import NoThreeLine.Phase15301Group4750Family20IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group4750Family20IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group4750Family20IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group4750Family20IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group4750Family20IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group4750Family20IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group4750Family20IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group4750Family20IntervalNormalizedBlock07
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized
open AutoEnvelope Phase15301Family20

def remaining08 : List NormalizedBlock := []
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining08=some 0 := by decide +kernel

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((5/8:ℚ)) remaining07=some ((94867922972096183/576460752303423488:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((5/8:ℚ)) (1) ((94867922972096183/576460752303423488:ℚ)) (0)
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((94867922972096183/576460752303423488:ℚ):ℚ)+(0)=((94867922972096183/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((23/64:ℚ)) remaining06=some ((8861278177402275277/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((23/64:ℚ)) ((5/8:ℚ)) ((5825504642295197421/18446744073709551616:ℚ)) ((94867922972096183/576460752303423488:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((5825504642295197421/18446744073709551616:ℚ):ℚ)+((94867922972096183/576460752303423488:ℚ))=((8861278177402275277/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((245/1024:ℚ)) remaining05=some ((2013727883828794377/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((245/1024:ℚ)) ((23/64:ℚ)) ((7248544893228079739/18446744073709551616:ℚ)) ((8861278177402275277/18446744073709551616:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((7248544893228079739/18446744073709551616:ℚ):ℚ)+((8861278177402275277/18446744073709551616:ℚ))=((2013727883828794377/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((43/256:ℚ)) remaining04=some ((24187777468478909725/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((43/256:ℚ)) ((245/1024:ℚ)) ((8077954397848554709/18446744073709551616:ℚ)) ((2013727883828794377/2305843009213693952:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((8077954397848554709/18446744073709551616:ℚ):ℚ)+((2013727883828794377/2305843009213693952:ℚ))=((24187777468478909725/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((31/256:ℚ)) remaining03=some ((15713102308778541287/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((31/256:ℚ)) ((43/256:ℚ)) ((7238427149078172849/18446744073709551616:ℚ)) ((24187777468478909725/18446744073709551616:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((7238427149078172849/18446744073709551616:ℚ):ℚ)+((24187777468478909725/18446744073709551616:ℚ))=((15713102308778541287/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((37/512:ℚ)) remaining02=some ((19144463574784361455/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((37/512:ℚ)) ((31/256:ℚ)) ((428920158250727521/1152921504606846976:ℚ)) ((15713102308778541287/9223372036854775808:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((428920158250727521/1152921504606846976:ℚ):ℚ)+((15713102308778541287/9223372036854775808:ℚ))=((19144463574784361455/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((9/512:ℚ)) remaining01=some ((44367464674745839873/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((9/512:ℚ)) ((37/512:ℚ)) ((6078537525177116963/18446744073709551616:ℚ)) ((19144463574784361455/9223372036854775808:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((6078537525177116963/18446744073709551616:ℚ):ℚ)+((19144463574784361455/9223372036854775808:ℚ))=((44367464674745839873/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((11570522306401593469/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((9/512:ℚ)) ((1914624550860534003/18446744073709551616:ℚ)) ((44367464674745839873/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((1914624550860534003/18446744073709551616:ℚ):ℚ)+((44367464674745839873/18446744073709551616:ℚ))=((11570522306401593469/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((11570522306401593469/4611686018427387904:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((11570522306401593469/4611686018427387904:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((11570522306401593469/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group4750.root queryRoot 0 chartPermutation=true := by
  have h := Phase15301Family20.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group4750.root.x0 : ℝ) Phase15301Group4750.root.x1)
    (hy : y∈Set.Icc (Phase15301Group4750.root.y0 : ℝ) Phase15301Group4750.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 0 Phase15301Original.field2 x y u)^2)≤((11570522306401593469/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group4750.root queryRoot 0 chartPermutation
    original_chart_checked ((11570522306401593469/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized.original_directional_integral_bound
