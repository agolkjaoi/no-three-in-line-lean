import NoThreeLine.Phase15301Leaf75Family23Block00
import NoThreeLine.Phase15301Leaf75Family23Block01
import NoThreeLine.Phase15301Leaf75Family23Block02
import NoThreeLine.Phase15301Leaf75Family23Block03
import NoThreeLine.Phase15301Leaf75Family23Block04
import NoThreeLine.Phase15301Leaf75Family23Block05
import NoThreeLine.Phase15301Leaf75Family23Block06
import NoThreeLine.Phase15301Leaf75Family23Block07

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf75.Family23
open AutoEnvelope Phase15301Family23

def remaining08 : List (ℚ × AutoTrace) := []
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining08=some 0 := by decide +kernel

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((63/64:ℚ)) remaining07=some ((472435119608118147/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((63/64:ℚ)) block07 remaining08
    (1) ((472435119608118147/9223372036854775808:ℚ)) (0) block07_checked tail08
  have hsum : ((472435119608118147/9223372036854775808:ℚ) : ℚ)+(0)=((472435119608118147/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((99/128:ℚ)) remaining06=some ((3423650578300230743/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((99/128:ℚ)) block06 remaining07
    ((63/64:ℚ)) ((6374866036992343339/9223372036854775808:ℚ)) ((472435119608118147/9223372036854775808:ℚ)) block06_checked tail07
  have hsum : ((6374866036992343339/9223372036854775808:ℚ) : ℚ)+((472435119608118147/9223372036854775808:ℚ))=((3423650578300230743/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((75/128:ℚ)) remaining05=some ((26341178683052368591/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((75/128:ℚ)) block05 remaining06
    ((99/128:ℚ)) ((12646576369851445619/18446744073709551616:ℚ)) ((3423650578300230743/4611686018427387904:ℚ)) block05_checked tail06
  have hsum : ((12646576369851445619/18446744073709551616:ℚ) : ℚ)+((3423650578300230743/4611686018427387904:ℚ))=((26341178683052368591/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((55/128:ℚ)) remaining04=some ((39026593580878005749/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((55/128:ℚ)) block04 remaining05
    ((75/128:ℚ)) ((6342707448912818579/9223372036854775808:ℚ)) ((26341178683052368591/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((6342707448912818579/9223372036854775808:ℚ) : ℚ)+((26341178683052368591/18446744073709551616:ℚ))=((39026593580878005749/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((75/256:ℚ)) remaining03=some ((50631252916084660637/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((75/256:ℚ)) block03 remaining04
    ((55/128:ℚ)) ((1450582416900831861/2305843009213693952:ℚ)) ((39026593580878005749/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((1450582416900831861/2305843009213693952:ℚ) : ℚ)+((39026593580878005749/18446744073709551616:ℚ))=((50631252916084660637/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((21/128:ℚ)) remaining02=some ((16185583016572760331/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((21/128:ℚ)) block02 remaining03
    ((75/256:ℚ)) ((14111079150206380687/18446744073709551616:ℚ)) ((50631252916084660637/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((14111079150206380687/18446744073709551616:ℚ) : ℚ)+((50631252916084660637/18446744073709551616:ℚ))=((16185583016572760331/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((101/1024:ℚ)) remaining01=some ((37955533036517936441/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((101/1024:ℚ)) block01 remaining02
    ((21/128:ℚ)) ((5584367003372415779/9223372036854775808:ℚ)) ((16185583016572760331/4611686018427387904:ℚ)) block01_checked tail02
  have hsum : ((5584367003372415779/9223372036854775808:ℚ) : ℚ)+((16185583016572760331/4611686018427387904:ℚ))=((37955533036517936441/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((50329925480913955761/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((101/1024:ℚ)) ((1546799055549502415/1152921504606846976:ℚ)) ((37955533036517936441/9223372036854775808:ℚ)) block00_checked tail01
  have hsum : ((1546799055549502415/1152921504606846976:ℚ) : ℚ)+((37955533036517936441/9223372036854775808:ℚ))=((50329925480913955761/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((50329925480913955761/9223372036854775808:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((50329925480913955761/9223372036854775808:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((50329925480913955761/9223372036854775808:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((50329925480913955761/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf75.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family23.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf75.root.x0 : ℝ) Phase15301Leaf75.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf75.root.y0 : ℝ) Phase15301Leaf75.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field2 x y u)^2)≤((50329925480913955761/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf75.root queryRoot 3 chartPermutation
    original_chart_checked ((50329925480913955761/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf75.Family23

#print axioms NoThreeLine.Phase15301Leaf75.Family23.data_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family23.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf75.Family23.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf75.Family23.original_directional_integral_bound
