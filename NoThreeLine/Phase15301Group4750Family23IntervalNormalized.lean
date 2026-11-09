import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock11
import NoThreeLine.Phase15301Group4750Family23IntervalNormalizedBlock12
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized
open AutoEnvelope Phase15301Family23

def remaining13 : List NormalizedBlock := []
theorem tail13 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining13=some 0 := by decide +kernel

def remaining12 : List NormalizedBlock := block12::remaining13
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((59/64:ℚ)) remaining12=some ((4690802335349947809/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block12Expr 18446744073709551616
    ((59/64:ℚ)) (1) ((4690802335349947809/18446744073709551616:ℚ)) (0)
    block12Cuts remaining13 block12_normalization block12_checked tail13
  have hs : ((4690802335349947809/18446744073709551616:ℚ):ℚ)+(0)=((4690802335349947809/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining12,block12,hs] using h

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((213/256:ℚ)) remaining11=some ((10185721203933264037/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((213/256:ℚ)) ((59/64:ℚ)) ((1373729717145829057/4611686018427387904:ℚ)) ((4690802335349947809/18446744073709551616:ℚ))
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((1373729717145829057/4611686018427387904:ℚ):ℚ)+((4690802335349947809/18446744073709551616:ℚ))=((10185721203933264037/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((23/32:ℚ)) remaining10=some ((17085152305240194989/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((23/32:ℚ)) ((213/256:ℚ)) ((862428887663366369/2305843009213693952:ℚ)) ((10185721203933264037/18446744073709551616:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((862428887663366369/2305843009213693952:ℚ):ℚ)+((10185721203933264037/18446744073709551616:ℚ))=((17085152305240194989/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((157/256:ℚ)) remaining09=some ((12249712249766900709/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((157/256:ℚ)) ((23/32:ℚ)) ((7414272194293606429/18446744073709551616:ℚ)) ((17085152305240194989/18446744073709551616:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((7414272194293606429/18446744073709551616:ℚ):ℚ)+((17085152305240194989/18446744073709551616:ℚ))=((12249712249766900709/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((273/512:ℚ)) remaining08=some ((30248167574779384321/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((273/512:ℚ)) ((157/256:ℚ)) ((5748743075245582903/18446744073709551616:ℚ)) ((12249712249766900709/9223372036854775808:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((5748743075245582903/18446744073709551616:ℚ):ℚ)+((12249712249766900709/9223372036854775808:ℚ))=((30248167574779384321/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((111/256:ℚ)) remaining07=some ((19372924986481210185/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((111/256:ℚ)) ((273/512:ℚ)) ((8497682398183036049/18446744073709551616:ℚ)) ((30248167574779384321/18446744073709551616:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((8497682398183036049/18446744073709551616:ℚ):ℚ)+((30248167574779384321/18446744073709551616:ℚ))=((19372924986481210185/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((365/1024:ℚ)) remaining06=some ((5642168260636253899/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((365/1024:ℚ)) ((111/256:ℚ)) ((3195748056063805411/9223372036854775808:ℚ)) ((19372924986481210185/9223372036854775808:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((3195748056063805411/9223372036854775808:ℚ):ℚ)+((19372924986481210185/9223372036854775808:ℚ))=((5642168260636253899/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((71/256:ℚ)) remaining05=some ((52142463413581003433/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((71/256:ℚ)) ((365/1024:ℚ)) ((7005117328490972241/18446744073709551616:ℚ)) ((5642168260636253899/2305843009213693952:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((7005117328490972241/18446744073709551616:ℚ):ℚ)+((5642168260636253899/2305843009213693952:ℚ))=((52142463413581003433/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((107/512:ℚ)) remaining04=some ((7390642535817767475/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((107/512:ℚ)) ((71/256:ℚ)) ((6982676872961136367/18446744073709551616:ℚ)) ((52142463413581003433/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((6982676872961136367/18446744073709551616:ℚ):ℚ)+((52142463413581003433/18446744073709551616:ℚ))=((7390642535817767475/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((151/1024:ℚ)) remaining03=some ((16794987697183679743/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((151/1024:ℚ)) ((107/512:ℚ)) ((2013702625548144793/4611686018427387904:ℚ)) ((7390642535817767475/2305843009213693952:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((2013702625548144793/4611686018427387904:ℚ):ℚ)+((7390642535817767475/2305843009213693952:ℚ))=((16794987697183679743/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((57/512:ℚ)) remaining02=some ((9183807924173499355/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((57/512:ℚ)) ((151/1024:ℚ)) ((1572628151163318967/4611686018427387904:ℚ)) ((16794987697183679743/4611686018427387904:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((1572628151163318967/4611686018427387904:ℚ):ℚ)+((16794987697183679743/4611686018427387904:ℚ))=((9183807924173499355/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((19/256:ℚ)) remaining01=some ((81296318008695045025/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((19/256:ℚ)) ((57/512:ℚ)) ((7825854615307050185/18446744073709551616:ℚ)) ((9183807924173499355/2305843009213693952:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((7825854615307050185/18446744073709551616:ℚ):ℚ)+((9183807924173499355/2305843009213693952:ℚ))=((81296318008695045025/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((25187819593939730369/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((19/256:ℚ)) ((19454960367063876451/18446744073709551616:ℚ)) ((81296318008695045025/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((19454960367063876451/18446744073709551616:ℚ):ℚ)+((81296318008695045025/18446744073709551616:ℚ))=((25187819593939730369/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((25187819593939730369/4611686018427387904:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((25187819593939730369/4611686018427387904:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((25187819593939730369/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group4750.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family23.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group4750.root.x0 : ℝ) Phase15301Group4750.root.x1)
    (hy : y∈Set.Icc (Phase15301Group4750.root.y0 : ℝ) Phase15301Group4750.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field2 x y u)^2)≤((25187819593939730369/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Group4750.root queryRoot 3 chartPermutation
    original_chart_checked ((25187819593939730369/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized.original_directional_integral_bound
