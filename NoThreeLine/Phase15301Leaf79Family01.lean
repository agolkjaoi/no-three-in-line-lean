import NoThreeLine.Phase15301Leaf79Family01Block00
import NoThreeLine.Phase15301Leaf79Family01Block01
import NoThreeLine.Phase15301Leaf79Family01Block02
import NoThreeLine.Phase15301Leaf79Family01Block03
import NoThreeLine.Phase15301Leaf79Family01Block04
import NoThreeLine.Phase15301Leaf79Family01Block05
import NoThreeLine.Phase15301Leaf79Family01Block06
import NoThreeLine.Phase15301Leaf79Family01Block07
import NoThreeLine.Phase15301Leaf79Family01Block08
import NoThreeLine.Phase15301Leaf79Family01Block09
import NoThreeLine.Phase15301Leaf79Family01Block10
import NoThreeLine.Phase15301Leaf79Family01Block11
import NoThreeLine.Phase15301Leaf79Family01Block12
import NoThreeLine.Phase15301Leaf79Family01Block13

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf79.Family01
open AutoEnvelope Phase15301Family01

def remaining14 : List (ℚ × AutoTrace) := []
theorem tail14 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining14=some 0 := by decide +kernel

def remaining13 : List (ℚ × AutoTrace) := block13++remaining14
theorem tail13 : checkUpperPartition gatheredExpr 18446744073709551616 ((125/128:ℚ)) remaining13=some ((1294728238742378507/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((125/128:ℚ)) block13 remaining14
    (1) ((1294728238742378507/18446744073709551616:ℚ)) (0) block13_checked tail14
  have hsum : ((1294728238742378507/18446744073709551616:ℚ) : ℚ)+(0)=((1294728238742378507/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining13,hsum] using h

def remaining12 : List (ℚ × AutoTrace) := block12++remaining13
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 ((225/256:ℚ)) remaining12=some ((3888637270728006141/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((225/256:ℚ)) block12 remaining13
    ((125/128:ℚ)) ((6482546302713633775/18446744073709551616:ℚ)) ((1294728238742378507/18446744073709551616:ℚ)) block12_checked tail13
  have hsum : ((6482546302713633775/18446744073709551616:ℚ) : ℚ)+((1294728238742378507/18446744073709551616:ℚ))=((3888637270728006141/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining12,hsum] using h

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((209/256:ℚ)) remaining11=some ((11595871796675208277/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((209/256:ℚ)) block11 remaining12
    ((225/256:ℚ)) ((3818597255219195995/18446744073709551616:ℚ)) ((3888637270728006141/9223372036854775808:ℚ)) block11_checked tail12
  have hsum : ((3818597255219195995/18446744073709551616:ℚ) : ℚ)+((3888637270728006141/9223372036854775808:ℚ))=((11595871796675208277/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((381/512:ℚ)) remaining10=some ((17269631543745837561/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((381/512:ℚ)) block10 remaining11
    ((209/256:ℚ)) ((1418439936767657321/4611686018427387904:ℚ)) ((11595871796675208277/18446744073709551616:ℚ)) block10_checked tail11
  have hsum : ((1418439936767657321/4611686018427387904:ℚ) : ℚ)+((11595871796675208277/18446744073709551616:ℚ))=((17269631543745837561/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((339/512:ℚ)) remaining09=some ((186871219605853647/144115188075855872:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((339/512:ℚ)) block09 remaining10
    ((381/512:ℚ)) ((6649884565803429255/18446744073709551616:ℚ)) ((17269631543745837561/18446744073709551616:ℚ)) block09_checked tail10
  have hsum : ((6649884565803429255/18446744073709551616:ℚ) : ℚ)+((17269631543745837561/18446744073709551616:ℚ))=((186871219605853647/144115188075855872:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((151/256:ℚ)) remaining08=some ((29460120668709629101/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((151/256:ℚ)) block08 remaining09
    ((339/512:ℚ)) ((5540604559160362285/18446744073709551616:ℚ)) ((186871219605853647/144115188075855872:ℚ)) block08_checked tail09
  have hsum : ((5540604559160362285/18446744073709551616:ℚ) : ℚ)+((186871219605853647/144115188075855872:ℚ))=((29460120668709629101/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((67/128:ℚ)) remaining07=some ((35296850348157167265/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((67/128:ℚ)) block07 remaining08
    ((151/256:ℚ)) ((1459182419861884541/4611686018427387904:ℚ)) ((29460120668709629101/18446744073709551616:ℚ)) block07_checked tail08
  have hsum : ((1459182419861884541/4611686018427387904:ℚ) : ℚ)+((29460120668709629101/18446744073709551616:ℚ))=((35296850348157167265/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((217/512:ℚ)) remaining06=some ((43706991827340371323/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((217/512:ℚ)) block06 remaining07
    ((67/128:ℚ)) ((4205070739591602029/9223372036854775808:ℚ)) ((35296850348157167265/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((4205070739591602029/9223372036854775808:ℚ) : ℚ)+((35296850348157167265/18446744073709551616:ℚ))=((43706991827340371323/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((181/512:ℚ)) remaining05=some ((196033794906929729/72057594037927936:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((181/512:ℚ)) block05 remaining06
    ((217/512:ℚ)) ((6477659668833639301/18446744073709551616:ℚ)) ((43706991827340371323/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((6477659668833639301/18446744073709551616:ℚ) : ℚ)+((43706991827340371323/18446744073709551616:ℚ))=((196033794906929729/72057594037927936:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((17/64:ℚ)) remaining04=some ((58640745468195241521/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((17/64:ℚ)) block04 remaining05
    ((181/512:ℚ)) ((8456093972021230897/18446744073709551616:ℚ)) ((196033794906929729/72057594037927936:ℚ)) block04_checked tail05
  have hsum : ((8456093972021230897/18446744073709551616:ℚ) : ℚ)+((196033794906929729/72057594037927936:ℚ))=((58640745468195241521/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((109/512:ℚ)) remaining03=some ((32433665592389511701/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((109/512:ℚ)) block03 remaining04
    ((17/64:ℚ)) ((6226585716583781881/18446744073709551616:ℚ)) ((58640745468195241521/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((6226585716583781881/18446744073709551616:ℚ) : ℚ)+((58640745468195241521/18446744073709551616:ℚ))=((32433665592389511701/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((9/64:ℚ)) remaining02=some ((74342938818834440087/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((9/64:ℚ)) block02 remaining03
    ((109/512:ℚ)) ((9475607634055416685/18446744073709551616:ℚ)) ((32433665592389511701/9223372036854775808:ℚ)) block02_checked tail03
  have hsum : ((9475607634055416685/18446744073709551616:ℚ) : ℚ)+((32433665592389511701/9223372036854775808:ℚ))=((74342938818834440087/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((3/32:ℚ)) remaining01=some ((81534819416437033609/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3/32:ℚ)) block01 remaining02
    ((9/64:ℚ)) ((3595940298801296761/9223372036854775808:ℚ)) ((74342938818834440087/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((3595940298801296761/9223372036854775808:ℚ) : ℚ)+((74342938818834440087/18446744073709551616:ℚ))=((81534819416437033609/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((24257510815552554627/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((3/32:ℚ)) ((15495223845773184899/18446744073709551616:ℚ)) ((81534819416437033609/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((15495223845773184899/18446744073709551616:ℚ) : ℚ)+((81534819416437033609/18446744073709551616:ℚ))=((24257510815552554627/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((24257510815552554627/4611686018427387904:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((24257510815552554627/4611686018427387904:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((24257510815552554627/4611686018427387904:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((24257510815552554627/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf79.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family01.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf79.root.x0 : ℝ) Phase15301Leaf79.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf79.root.y0 : ℝ) Phase15301Leaf79.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field0 x y u)^2)≤((24257510815552554627/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf79.root queryRoot 1 chartPermutation
    original_chart_checked ((24257510815552554627/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf79.Family01

#print axioms NoThreeLine.Phase15301Leaf79.Family01.data_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family01.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf79.Family01.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf79.Family01.original_directional_integral_bound
