import NoThreeLine.Phase15301Leaf78Family23Block00
import NoThreeLine.Phase15301Leaf78Family23Block01
import NoThreeLine.Phase15301Leaf78Family23Block02
import NoThreeLine.Phase15301Leaf78Family23Block03
import NoThreeLine.Phase15301Leaf78Family23Block04
import NoThreeLine.Phase15301Leaf78Family23Block05
import NoThreeLine.Phase15301Leaf78Family23Block06
import NoThreeLine.Phase15301Leaf78Family23Block07

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf78.Family23
open AutoEnvelope Phase15301Family23

def remaining08 : List (ℚ × AutoTrace) := []
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining08=some 0 := by decide +kernel

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((27/32:ℚ)) remaining07=some ((9454244190138328055/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((27/32:ℚ)) block07 remaining08
    (1) ((9454244190138328055/18446744073709551616:ℚ)) (0) block07_checked tail08
  have hsum : ((9454244190138328055/18446744073709551616:ℚ) : ℚ)+(0)=((9454244190138328055/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((85/128:ℚ)) remaining06=some ((5221329169686042757/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((85/128:ℚ)) block06 remaining07
    ((27/32:ℚ)) ((11431072488605842973/18446744073709551616:ℚ)) ((9454244190138328055/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((11431072488605842973/18446744073709551616:ℚ) : ℚ)+((9454244190138328055/18446744073709551616:ℚ))=((5221329169686042757/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((17/32:ℚ)) remaining05=some ((15179765635472355547/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((17/32:ℚ)) block05 remaining06
    ((85/128:ℚ)) ((4737107296100270033/9223372036854775808:ℚ)) ((5221329169686042757/4611686018427387904:ℚ)) block05_checked tail06
  have hsum : ((4737107296100270033/9223372036854775808:ℚ) : ℚ)+((5221329169686042757/4611686018427387904:ℚ))=((15179765635472355547/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((101/256:ℚ)) remaining04=some ((10475059618556855751/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((101/256:ℚ)) block04 remaining05
    ((17/32:ℚ)) ((5770353601641355955/9223372036854775808:ℚ)) ((15179765635472355547/9223372036854775808:ℚ)) block04_checked tail05
  have hsum : ((5770353601641355955/9223372036854775808:ℚ) : ℚ)+((15179765635472355547/9223372036854775808:ℚ))=((10475059618556855751/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((69/256:ℚ)) remaining03=some ((26406723144532710339/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((69/256:ℚ)) block03 remaining04
    ((101/256:ℚ)) ((5456603907418998837/9223372036854775808:ℚ)) ((10475059618556855751/4611686018427387904:ℚ)) block03_checked tail04
  have hsum : ((5456603907418998837/9223372036854775808:ℚ) : ℚ)+((10475059618556855751/4611686018427387904:ℚ))=((26406723144532710339/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((81/512:ℚ)) remaining02=some ((65555529749003325707/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((81/512:ℚ)) block02 remaining03
    ((69/256:ℚ)) ((12742083459937905029/18446744073709551616:ℚ)) ((26406723144532710339/9223372036854775808:ℚ)) block02_checked tail03
  have hsum : ((12742083459937905029/18446744073709551616:ℚ) : ℚ)+((26406723144532710339/9223372036854775808:ℚ))=((65555529749003325707/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((3/32:ℚ)) remaining01=some ((76929767442229217575/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3/32:ℚ)) block01 remaining02
    ((81/512:ℚ)) ((2843559423306472967/4611686018427387904:ℚ)) ((65555529749003325707/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((2843559423306472967/4611686018427387904:ℚ) : ℚ)+((65555529749003325707/18446744073709551616:ℚ))=((76929767442229217575/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((100652867953720561101/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((3/32:ℚ)) ((11861550255745671763/9223372036854775808:ℚ)) ((76929767442229217575/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((11861550255745671763/9223372036854775808:ℚ) : ℚ)+((76929767442229217575/18446744073709551616:ℚ))=((100652867953720561101/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((100652867953720561101/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((100652867953720561101/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((100652867953720561101/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((100652867953720561101/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf78.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family23.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf78.root.x0 : ℝ) Phase15301Leaf78.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf78.root.y0 : ℝ) Phase15301Leaf78.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field2 x y u)^2)≤((100652867953720561101/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Leaf78.root queryRoot 3 chartPermutation
    original_chart_checked ((100652867953720561101/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf78.Family23

#print axioms NoThreeLine.Phase15301Leaf78.Family23.data_checked
#print axioms NoThreeLine.Phase15301Leaf78.Family23.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf78.Family23.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf78.Family23.original_directional_integral_bound
