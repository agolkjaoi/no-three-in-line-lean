import NoThreeLine.Phase15301Leaf74Family11Block00
import NoThreeLine.Phase15301Leaf74Family11Block01
import NoThreeLine.Phase15301Leaf74Family11Block02
import NoThreeLine.Phase15301Leaf74Family11Block03
import NoThreeLine.Phase15301Leaf74Family11Block04
import NoThreeLine.Phase15301Leaf74Family11Block05
import NoThreeLine.Phase15301Leaf74Family11Block06
import NoThreeLine.Phase15301Leaf74Family11Block07
import NoThreeLine.Phase15301Leaf74Family11Block08
import NoThreeLine.Phase15301Leaf74Family11Block09
import NoThreeLine.Phase15301Leaf74Family11Block10
import NoThreeLine.Phase15301Leaf74Family11Block11

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf74.Family11
open AutoEnvelope Phase15301Family11

def remaining12 : List (ℚ × AutoTrace) := []
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining12=some 0 := by decide +kernel

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((945/1024:ℚ)) remaining11=some ((5229685611617875767/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((945/1024:ℚ)) block11 remaining12
    (1) ((5229685611617875767/18446744073709551616:ℚ)) (0) block11_checked tail12
  have hsum : ((5229685611617875767/18446744073709551616:ℚ) : ℚ)+(0)=((5229685611617875767/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((217/256:ℚ)) remaining10=some ((152766343185631069/288230376151711744:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((217/256:ℚ)) block10 remaining11
    ((945/1024:ℚ)) ((4547360352262512649/18446744073709551616:ℚ)) ((5229685611617875767/18446744073709551616:ℚ)) block10_checked tail11
  have hsum : ((4547360352262512649/18446744073709551616:ℚ) : ℚ)+((5229685611617875767/18446744073709551616:ℚ))=((152766343185631069/288230376151711744:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((193/256:ℚ)) remaining09=some ((16674877154652994293/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((193/256:ℚ)) block09 remaining10
    ((217/256:ℚ)) ((6897831190772605877/18446744073709551616:ℚ)) ((152766343185631069/288230376151711744:ℚ)) block09_checked tail10
  have hsum : ((6897831190772605877/18446744073709551616:ℚ) : ℚ)+((152766343185631069/288230376151711744:ℚ))=((16674877154652994293/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((679/1024:ℚ)) remaining08=some ((12078330965875436553/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((679/1024:ℚ)) block08 remaining09
    ((193/256:ℚ)) ((7481784777097878813/18446744073709551616:ℚ)) ((16674877154652994293/18446744073709551616:ℚ)) block08_checked tail09
  have hsum : ((7481784777097878813/18446744073709551616:ℚ) : ℚ)+((16674877154652994293/18446744073709551616:ℚ))=((12078330965875436553/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((291/512:ℚ)) remaining07=some ((31753326942090025651/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((291/512:ℚ)) block07 remaining08
    ((679/1024:ℚ)) ((7596665010339152545/18446744073709551616:ℚ)) ((12078330965875436553/9223372036854775808:ℚ)) block07_checked tail08
  have hsum : ((7596665010339152545/18446744073709551616:ℚ) : ℚ)+((12078330965875436553/9223372036854775808:ℚ))=((31753326942090025651/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((249/512:ℚ)) remaining06=some ((38619621174694839885/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((249/512:ℚ)) block06 remaining07
    ((291/512:ℚ)) ((3433147116302407117/9223372036854775808:ℚ)) ((31753326942090025651/18446744073709551616:ℚ)) block06_checked tail07
  have hsum : ((3433147116302407117/9223372036854775808:ℚ) : ℚ)+((31753326942090025651/18446744073709551616:ℚ))=((38619621174694839885/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((95/256:ℚ)) remaining05=some ((48552761783047428895/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((95/256:ℚ)) block05 remaining06
    ((249/512:ℚ)) ((4966570304176294505/9223372036854775808:ℚ)) ((38619621174694839885/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((4966570304176294505/9223372036854775808:ℚ) : ℚ)+((38619621174694839885/18446744073709551616:ℚ))=((48552761783047428895/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((19/64:ℚ)) remaining04=some ((27785873112328093473/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((19/64:ℚ)) block04 remaining05
    ((95/256:ℚ)) ((7018984441608758051/18446744073709551616:ℚ)) ((48552761783047428895/18446744073709551616:ℚ)) block04_checked tail05
  have hsum : ((7018984441608758051/18446744073709551616:ℚ) : ℚ)+((48552761783047428895/18446744073709551616:ℚ))=((27785873112328093473/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((57/256:ℚ)) remaining03=some ((31587747227168404127/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((57/256:ℚ)) block03 remaining04
    ((19/64:ℚ)) ((1900937057420155327/4611686018427387904:ℚ)) ((27785873112328093473/9223372036854775808:ℚ)) block03_checked tail04
  have hsum : ((1900937057420155327/4611686018427387904:ℚ) : ℚ)+((27785873112328093473/9223372036854775808:ℚ))=((31587747227168404127/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((81/512:ℚ)) remaining02=some ((71220981179684267259/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((81/512:ℚ)) block02 remaining03
    ((57/256:ℚ)) ((8045486725347459005/18446744073709551616:ℚ)) ((31587747227168404127/9223372036854775808:ℚ)) block02_checked tail03
  have hsum : ((8045486725347459005/18446744073709551616:ℚ) : ℚ)+((31587747227168404127/9223372036854775808:ℚ))=((71220981179684267259/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((13/128:ℚ)) remaining01=some ((78768202534537883219/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((13/128:ℚ)) block01 remaining02
    ((81/512:ℚ)) ((943402669356701995/2305843009213693952:ℚ)) ((71220981179684267259/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((943402669356701995/2305843009213693952:ℚ) : ℚ)+((71220981179684267259/18446744073709551616:ℚ))=((78768202534537883219/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((94303543202608936729/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((13/128:ℚ)) ((7767670334035526755/9223372036854775808:ℚ)) ((78768202534537883219/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((7767670334035526755/9223372036854775808:ℚ) : ℚ)+((78768202534537883219/18446744073709551616:ℚ))=((94303543202608936729/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((94303543202608936729/18446744073709551616:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((94303543202608936729/18446744073709551616:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((94303543202608936729/18446744073709551616:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((94303543202608936729/18446744073709551616:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf74.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family11.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf74.root.x0 : ℝ) Phase15301Leaf74.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf74.root.y0 : ℝ) Phase15301Leaf74.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field1 x y u)^2)≤((94303543202608936729/18446744073709551616:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Leaf74.root queryRoot 1 chartPermutation
    original_chart_checked ((94303543202608936729/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf74.Family11

#print axioms NoThreeLine.Phase15301Leaf74.Family11.data_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family11.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf74.Family11.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family11.original_directional_integral_bound
