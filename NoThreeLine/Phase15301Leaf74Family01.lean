import NoThreeLine.Phase15301Leaf74Family01Block00
import NoThreeLine.Phase15301Leaf74Family01Block01
import NoThreeLine.Phase15301Leaf74Family01Block02
import NoThreeLine.Phase15301Leaf74Family01Block03
import NoThreeLine.Phase15301Leaf74Family01Block04
import NoThreeLine.Phase15301Leaf74Family01Block05
import NoThreeLine.Phase15301Leaf74Family01Block06
import NoThreeLine.Phase15301Leaf74Family01Block07
import NoThreeLine.Phase15301Leaf74Family01Block08
import NoThreeLine.Phase15301Leaf74Family01Block09
import NoThreeLine.Phase15301Leaf74Family01Block10
import NoThreeLine.Phase15301Leaf74Family01Block11
import NoThreeLine.Phase15301Leaf74Family01Block12
import NoThreeLine.Phase15301Leaf74Family01Block13
import NoThreeLine.Phase15301Leaf74Family01Block14

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf74.Family01
open AutoEnvelope Phase15301Family01

def remaining15 : List (ℚ × AutoTrace) := []
theorem tail15 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining15=some 0 := by decide +kernel

def remaining14 : List (ℚ × AutoTrace) := block14++remaining15
theorem tail14 : checkUpperPartition gatheredExpr 18446744073709551616 ((475/512:ℚ)) remaining14=some ((4416612296527961367/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((475/512:ℚ)) block14 remaining15
    (1) ((4416612296527961367/18446744073709551616:ℚ)) (0) block14_checked tail15
  have hsum : ((4416612296527961367/18446744073709551616:ℚ) : ℚ)+(0)=((4416612296527961367/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining14,hsum] using h

def remaining13 : List (ℚ × AutoTrace) := block13++remaining14
theorem tail13 : checkUpperPartition gatheredExpr 18446744073709551616 ((7/8:ℚ)) remaining13=some ((4010090304185144039/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((7/8:ℚ)) block13 remaining14
    ((475/512:ℚ)) ((3603568311842326711/18446744073709551616:ℚ)) ((4416612296527961367/18446744073709551616:ℚ)) block13_checked tail14
  have hsum : ((3603568311842326711/18446744073709551616:ℚ) : ℚ)+((4416612296527961367/18446744073709551616:ℚ))=((4010090304185144039/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining13,hsum] using h

def remaining12 : List (ℚ × AutoTrace) := block12++remaining13
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 ((105/128:ℚ)) remaining12=some ((11334370148327620763/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((105/128:ℚ)) block12 remaining13
    ((7/8:ℚ)) ((3314189539957332685/18446744073709551616:ℚ)) ((4010090304185144039/9223372036854775808:ℚ)) block12_checked tail13
  have hsum : ((3314189539957332685/18446744073709551616:ℚ) : ℚ)+((4010090304185144039/9223372036854775808:ℚ))=((11334370148327620763/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining12,hsum] using h

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((767/1024:ℚ)) remaining11=some ((8426203531993444077/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((767/1024:ℚ)) block11 remaining12
    ((105/128:ℚ)) ((5518036915659267391/18446744073709551616:ℚ)) ((11334370148327620763/18446744073709551616:ℚ)) block11_checked tail12
  have hsum : ((5518036915659267391/18446744073709551616:ℚ) : ℚ)+((11334370148327620763/18446744073709551616:ℚ))=((8426203531993444077/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((175/256:ℚ)) remaining10=some ((11156670519545789173/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((175/256:ℚ)) block10 remaining11
    ((767/1024:ℚ)) ((341308373444043137/1152921504606846976:ℚ)) ((8426203531993444077/9223372036854775808:ℚ)) block10_checked tail11
  have hsum : ((341308373444043137/1152921504606846976:ℚ) : ℚ)+((8426203531993444077/9223372036854775808:ℚ))=((11156670519545789173/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((313/512:ℚ)) remaining09=some ((27720145897473296525/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((313/512:ℚ)) block09 remaining10
    ((175/256:ℚ)) ((5406804858381718179/18446744073709551616:ℚ)) ((11156670519545789173/9223372036854775808:ℚ)) block09_checked tail10
  have hsum : ((5406804858381718179/18446744073709551616:ℚ) : ℚ)+((11156670519545789173/9223372036854775808:ℚ))=((27720145897473296525/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((281/512:ℚ)) remaining08=some ((33076922929413991881/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((281/512:ℚ)) block08 remaining09
    ((313/512:ℚ)) ((1339194257985173839/4611686018427387904:ℚ)) ((27720145897473296525/18446744073709551616:ℚ)) block08_checked tail09
  have hsum : ((1339194257985173839/4611686018427387904:ℚ) : ℚ)+((27720145897473296525/18446744073709551616:ℚ))=((33076922929413991881/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((31/64:ℚ)) remaining07=some ((19334851801492977633/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((31/64:ℚ)) block07 remaining08
    ((281/512:ℚ)) ((5592780673571963385/18446744073709551616:ℚ)) ((33076922929413991881/18446744073709551616:ℚ)) block07_checked tail08
  have hsum : ((5592780673571963385/18446744073709551616:ℚ) : ℚ)+((33076922929413991881/18446744073709551616:ℚ))=((19334851801492977633/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((203/512:ℚ)) remaining06=some ((23039385244473202089/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((203/512:ℚ)) block06 remaining07
    ((31/64:ℚ)) ((463066680372528057/1152921504606846976:ℚ)) ((19334851801492977633/9223372036854775808:ℚ)) block06_checked tail07
  have hsum : ((463066680372528057/1152921504606846976:ℚ) : ℚ)+((19334851801492977633/9223372036854775808:ℚ))=((23039385244473202089/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((165/512:ℚ)) remaining05=some ((53111287057857469875/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((165/512:ℚ)) block05 remaining06
    ((203/512:ℚ)) ((7032516568911065697/18446744073709551616:ℚ)) ((23039385244473202089/9223372036854775808:ℚ)) block05_checked tail06
  have hsum : ((7032516568911065697/18446744073709551616:ℚ) : ℚ)+((23039385244473202089/9223372036854775808:ℚ))=((53111287057857469875/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((267/1024:ℚ)) remaining04=some ((14795292932940762649/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((267/1024:ℚ)) block04 remaining05
    ((165/512:ℚ)) ((6069884673905580721/18446744073709551616:ℚ)) ((53111287057857469875/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((6069884673905580721/18446744073709551616:ℚ) : ℚ)+((53111287057857469875/18446744073709551616:ℚ))=((14795292932940762649/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((199/1024:ℚ)) remaining03=some ((4203880694505515025/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((199/1024:ℚ)) block03 remaining04
    ((267/1024:ℚ)) ((2020229845081297451/4611686018427387904:ℚ)) ((14795292932940762649/4611686018427387904:ℚ)) block03_checked tail04
  have hsum : ((2020229845081297451/4611686018427387904:ℚ) : ℚ)+((14795292932940762649/4611686018427387904:ℚ))=((4203880694505515025/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((139/1024:ℚ)) remaining02=some ((75027505722744748815/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((139/1024:ℚ)) block02 remaining03
    ((199/1024:ℚ)) ((7765414610656508415/18446744073709551616:ℚ)) ((4203880694505515025/1152921504606846976:ℚ)) block02_checked tail03
  have hsum : ((7765414610656508415/18446744073709551616:ℚ) : ℚ)+((4203880694505515025/1152921504606846976:ℚ))=((75027505722744748815/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((23/256:ℚ)) remaining01=some ((82198873064384081757/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((23/256:ℚ)) block01 remaining02
    ((139/1024:ℚ)) ((3585683670819666471/9223372036854775808:ℚ)) ((75027505722744748815/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((3585683670819666471/9223372036854775808:ℚ) : ℚ)+((75027505722744748815/18446744073709551616:ℚ))=((82198873064384081757/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((97052935401432935357/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((23/256:ℚ)) ((464189448032776675/576460752303423488:ℚ)) ((82198873064384081757/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((464189448032776675/576460752303423488:ℚ) : ℚ)+((82198873064384081757/18446744073709551616:ℚ))=((97052935401432935357/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((97052935401432935357/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((97052935401432935357/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((97052935401432935357/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((97052935401432935357/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf74.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family01.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf74.root.x0 : ℝ) Phase15301Leaf74.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf74.root.y0 : ℝ) Phase15301Leaf74.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field0 x y u)^2)≤((97052935401432935357/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf74.root queryRoot 1 chartPermutation
    original_chart_checked ((97052935401432935357/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf74.Family01

#print axioms NoThreeLine.Phase15301Leaf74.Family01.data_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family01.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf74.Family01.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family01.original_directional_integral_bound
