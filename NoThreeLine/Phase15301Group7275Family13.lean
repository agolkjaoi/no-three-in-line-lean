import NoThreeLine.Phase15301Group7275Family13Block00
import NoThreeLine.Phase15301Group7275Family13Block01
import NoThreeLine.Phase15301Group7275Family13Block02
import NoThreeLine.Phase15301Group7275Family13Block03
import NoThreeLine.Phase15301Group7275Family13Block04
import NoThreeLine.Phase15301Group7275Family13Block05
import NoThreeLine.Phase15301Group7275Family13Block06
import NoThreeLine.Phase15301Group7275Family13Block07
import NoThreeLine.Phase15301Group7275Family13Block08

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group7275.Family13
open AutoEnvelope Phase15301Family13

def remaining09 : List (ℚ × AutoTrace) := []
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining09=some 0 := by decide +kernel

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((511/512:ℚ)) remaining08=some ((62997124466905809/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((511/512:ℚ)) block08 remaining09
    (1) ((62997124466905809/9223372036854775808:ℚ)) (0) block08_checked tail09
  have hsum : ((62997124466905809/9223372036854775808:ℚ) : ℚ)+(0)=((62997124466905809/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((13/16:ℚ)) remaining07=some ((11350234182784840439/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((13/16:ℚ)) block07 remaining08
    ((511/512:ℚ)) ((11224239933851028821/18446744073709551616:ℚ)) ((62997124466905809/9223372036854775808:ℚ)) block07_checked tail08
  have hsum : ((11224239933851028821/18446744073709551616:ℚ) : ℚ)+((62997124466905809/9223372036854775808:ℚ))=((11350234182784840439/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((83/128:ℚ)) remaining06=some ((1419865823822283459/1152921504606846976:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((83/128:ℚ)) block06 remaining07
    ((13/16:ℚ)) ((11367618998371694905/18446744073709551616:ℚ)) ((11350234182784840439/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((11367618998371694905/18446744073709551616:ℚ) : ℚ)+((11350234182784840439/18446744073709551616:ℚ))=((1419865823822283459/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((125/256:ℚ)) remaining05=some ((35713255810012530723/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((125/256:ℚ)) block05 remaining06
    ((83/128:ℚ)) ((12995402628855995379/18446744073709551616:ℚ)) ((1419865823822283459/1152921504606846976:ℚ)) block05_checked tail06
  have hsum : ((12995402628855995379/18446744073709551616:ℚ) : ℚ)+((1419865823822283459/1152921504606846976:ℚ))=((35713255810012530723/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((25/64:ℚ)) remaining04=some ((45381572904377768795/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((25/64:ℚ)) block04 remaining05
    ((125/256:ℚ)) ((1208539636795654759/2305843009213693952:ℚ)) ((35713255810012530723/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((1208539636795654759/2305843009213693952:ℚ) : ℚ)+((35713255810012530723/18446744073709551616:ℚ))=((45381572904377768795/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((71/256:ℚ)) remaining03=some ((57281432959410311759/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((71/256:ℚ)) block03 remaining04
    ((25/64:ℚ)) ((2974965013758135741/4611686018427387904:ℚ)) ((45381572904377768795/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((2974965013758135741/4611686018427387904:ℚ) : ℚ)+((45381572904377768795/18446744073709551616:ℚ))=((57281432959410311759/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((177/1024:ℚ)) remaining02=some ((35125024787432547477/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((177/1024:ℚ)) block02 remaining03
    ((71/256:ℚ)) ((12968616615454783195/18446744073709551616:ℚ)) ((57281432959410311759/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((12968616615454783195/18446744073709551616:ℚ) : ℚ)+((57281432959410311759/18446744073709551616:ℚ))=((35125024787432547477/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((13/128:ℚ)) remaining01=some ((83137177942333103533/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((13/128:ℚ)) block01 remaining02
    ((177/1024:ℚ)) ((12887128367468008579/18446744073709551616:ℚ)) ((35125024787432547477/9223372036854775808:ℚ)) block01_checked tail02
  have hsum : ((12887128367468008579/18446744073709551616:ℚ) : ℚ)+((35125024787432547477/9223372036854775808:ℚ))=((83137177942333103533/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((27424292479525245277/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((13/128:ℚ)) ((26559991975767877575/18446744073709551616:ℚ)) ((83137177942333103533/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((26559991975767877575/18446744073709551616:ℚ) : ℚ)+((83137177942333103533/18446744073709551616:ℚ))=((27424292479525245277/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((27424292479525245277/4611686018427387904:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((27424292479525245277/4611686018427387904:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((27424292479525245277/4611686018427387904:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((27424292479525245277/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group7275.root queryRoot 3 chartPermutation=true := by
  have h := Phase15301Family13.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group7275.root.x0 : ℝ) Phase15301Group7275.root.x1)
    (hy : y∈Set.Icc (Phase15301Group7275.root.y0 : ℝ) Phase15301Group7275.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 3 Phase15301Original.field1 x y u)^2)≤((27424292479525245277/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Group7275.root queryRoot 3 chartPermutation
    original_chart_checked ((27424292479525245277/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group7275.Family13

#print axioms NoThreeLine.Phase15301Group7275.Family13.data_checked
#print axioms NoThreeLine.Phase15301Group7275.Family13.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Group7275.Family13.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group7275.Family13.original_directional_integral_bound
