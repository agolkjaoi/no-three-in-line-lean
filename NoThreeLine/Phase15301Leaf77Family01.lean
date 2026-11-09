import NoThreeLine.Phase15301Leaf77Family01Block00
import NoThreeLine.Phase15301Leaf77Family01Block01
import NoThreeLine.Phase15301Leaf77Family01Block02
import NoThreeLine.Phase15301Leaf77Family01Block03
import NoThreeLine.Phase15301Leaf77Family01Block04
import NoThreeLine.Phase15301Leaf77Family01Block05
import NoThreeLine.Phase15301Leaf77Family01Block06
import NoThreeLine.Phase15301Leaf77Family01Block07
import NoThreeLine.Phase15301Leaf77Family01Block08
import NoThreeLine.Phase15301Leaf77Family01Block09
import NoThreeLine.Phase15301Leaf77Family01Block10
import NoThreeLine.Phase15301Leaf77Family01Block11
import NoThreeLine.Phase15301Leaf77Family01Block12
import NoThreeLine.Phase15301Leaf77Family01Block13
import NoThreeLine.Phase15301Leaf77Family01Block14
import NoThreeLine.Phase15301Leaf77Family01Block15
import NoThreeLine.Phase15301Leaf77Family01Block16
import NoThreeLine.Phase15301Leaf77Family01Block17

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided Phase15301Family01

def remaining18 : List (ℚ × BoundTrace) := []
theorem tail18 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining18=some 0 := by decide +kernel

def remaining17 : List (ℚ × BoundTrace) := block17++remaining18
theorem tail17 : checkUpperPartition gatheredExpr 18446744073709551616 ((26386/28417:ℚ)) remaining17=some ((1089750928412886277/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((26386/28417:ℚ)) block17 remaining18
    (1) ((1089750928412886277/4611686018427387904:ℚ)) (0) block17_checked tail18
  have hsum : ((1089750928412886277/4611686018427387904:ℚ) : ℚ)+(0)=((1089750928412886277/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining17,hsum] using h

def remaining16 : List (ℚ × BoundTrace) := block16++remaining17
theorem tail16 : checkUpperPartition gatheredExpr 18446744073709551616 ((18193/20226:ℚ)) remaining16=some ((3205388436703139473/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((18193/20226:ℚ)) block16 remaining17
    ((26386/28417:ℚ)) ((1025886579877366919/9223372036854775808:ℚ)) ((1089750928412886277/4611686018427387904:ℚ)) block16_checked tail17
  have hsum : ((1025886579877366919/9223372036854775808:ℚ) : ℚ)+((1089750928412886277/4611686018427387904:ℚ))=((3205388436703139473/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining16,hsum] using h

def remaining15 : List (ℚ × BoundTrace) := block15++remaining16
theorem tail15 : checkUpperPartition gatheredExpr 18446744073709551616 ((1742/2031:ℚ)) remaining15=some ((9036402113788740375/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1742/2031:ℚ)) block15 remaining16
    ((18193/20226:ℚ)) ((2625625240382461429/18446744073709551616:ℚ)) ((3205388436703139473/9223372036854775808:ℚ)) block15_checked tail16
  have hsum : ((2625625240382461429/18446744073709551616:ℚ) : ℚ)+((3205388436703139473/9223372036854775808:ℚ))=((9036402113788740375/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining15,hsum] using h

def remaining14 : List (ℚ × BoundTrace) := block14++remaining15
theorem tail14 : checkUpperPartition gatheredExpr 18446744073709551616 ((24338/30465:ℚ)) remaining14=some ((12833451519792582103/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((24338/30465:ℚ)) block14 remaining15
    ((1742/2031:ℚ)) ((59328896968810027/288230376151711744:ℚ)) ((9036402113788740375/18446744073709551616:ℚ)) block14_checked tail15
  have hsum : ((59328896968810027/288230376151711744:ℚ) : ℚ)+((9036402113788740375/18446744073709551616:ℚ))=((12833451519792582103/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining14,hsum] using h

def remaining13 : List (ℚ × BoundTrace) := block13++remaining14
theorem tail13 : checkUpperPartition gatheredExpr 18446744073709551616 ((97349/130055:ℚ)) remaining13=some ((16888269457359890045/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((97349/130055:ℚ)) block13 remaining14
    ((24338/30465:ℚ)) ((2027408968783653971/9223372036854775808:ℚ)) ((12833451519792582103/18446744073709551616:ℚ)) block13_checked tail14
  have hsum : ((2027408968783653971/9223372036854775808:ℚ) : ℚ)+((12833451519792582103/18446744073709551616:ℚ))=((16888269457359890045/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining13,hsum] using h

def remaining12 : List (ℚ × BoundTrace) := block12++remaining13
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 ((10001/14082:ℚ)) remaining12=some ((10078364568630975193/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((10001/14082:ℚ)) block12 remaining13
    ((97349/130055:ℚ)) ((3268459679902060341/18446744073709551616:ℚ)) ((16888269457359890045/18446744073709551616:ℚ)) block12_checked tail13
  have hsum : ((3268459679902060341/18446744073709551616:ℚ) : ℚ)+((16888269457359890045/18446744073709551616:ℚ))=((10078364568630975193/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining12,hsum] using h

def remaining11 : List (ℚ × BoundTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((203/310:ℚ)) remaining11=some ((12223874645617435331/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((203/310:ℚ)) block11 remaining12
    ((10001/14082:ℚ)) ((1072755038493230069/4611686018427387904:ℚ)) ((10078364568630975193/9223372036854775808:ℚ)) block11_checked tail12
  have hsum : ((1072755038493230069/4611686018427387904:ℚ) : ℚ)+((10078364568630975193/9223372036854775808:ℚ))=((12223874645617435331/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × BoundTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((14098/24321:ℚ)) remaining10=some ((15161568886528389995/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((14098/24321:ℚ)) block10 remaining11
    ((203/310:ℚ)) ((367211780113869333/1152921504606846976:ℚ)) ((12223874645617435331/9223372036854775808:ℚ)) block10_checked tail11
  have hsum : ((367211780113869333/1152921504606846976:ℚ) : ℚ)+((12223874645617435331/9223372036854775808:ℚ))=((15161568886528389995/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × BoundTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((4699/8790:ℚ)) remaining09=some ((17166204731181485355/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((4699/8790:ℚ)) block09 remaining10
    ((14098/24321:ℚ)) ((31322435072704615/144115188075855872:ℚ)) ((15161568886528389995/9223372036854775808:ℚ)) block09_checked tail10
  have hsum : ((31322435072704615/144115188075855872:ℚ) : ℚ)+((15161568886528389995/9223372036854775808:ℚ))=((17166204731181485355/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × BoundTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((551/1134:ℚ)) remaining08=some ((38534151385411680169/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((551/1134:ℚ)) block08 remaining09
    ((4699/8790:ℚ)) ((4201741923048709459/18446744073709551616:ℚ)) ((17166204731181485355/9223372036854775808:ℚ)) block08_checked tail09
  have hsum : ((4201741923048709459/18446744073709551616:ℚ) : ℚ)+((17166204731181485355/9223372036854775808:ℚ))=((38534151385411680169/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × BoundTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((3334/8107:ℚ)) remaining07=some ((5596036721111581929/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3334/8107:ℚ)) block07 remaining08
    ((551/1134:ℚ)) ((6234142383480975263/18446744073709551616:ℚ)) ((38534151385411680169/18446744073709551616:ℚ)) block07_checked tail08
  have hsum : ((6234142383480975263/18446744073709551616:ℚ) : ℚ)+((38534151385411680169/18446744073709551616:ℚ))=((5596036721111581929/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × BoundTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((1817/4963:ℚ)) remaining06=some ((1530710429771173597/576460752303423488:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1817/4963:ℚ)) block06 remaining07
    ((3334/8107:ℚ)) ((526804997973112459/2305843009213693952:ℚ)) ((5596036721111581929/2305843009213693952:ℚ)) block06_checked tail07
  have hsum : ((526804997973112459/2305843009213693952:ℚ) : ℚ)+((5596036721111581929/2305843009213693952:ℚ))=((1530710429771173597/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × BoundTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((1809/5890:ℚ)) remaining05=some ((13634256424725751697/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1809/5890:ℚ)) block05 remaining06
    ((1817/4963:ℚ)) ((1388572986556362921/4611686018427387904:ℚ)) ((1530710429771173597/576460752303423488:ℚ)) block05_checked tail06
  have hsum : ((1388572986556362921/4611686018427387904:ℚ) : ℚ)+((1530710429771173597/576460752303423488:ℚ))=((13634256424725751697/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × BoundTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((5906/24321:ℚ)) remaining04=some ((7651505093605490201/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((5906/24321:ℚ)) block04 remaining05
    ((1809/5890:ℚ)) ((1668753762485228705/4611686018427387904:ℚ)) ((13634256424725751697/4611686018427387904:ℚ)) block04_checked tail05
  have hsum : ((1668753762485228705/4611686018427387904:ℚ) : ℚ)+((13634256424725751697/4611686018427387904:ℚ))=((7651505093605490201/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × BoundTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((567681682711/2928348192736:ℚ)) remaining03=some ((67303924172108143069/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((567681682711/2928348192736:ℚ)) block03 remaining04
    ((5906/24321:ℚ)) ((6091883423264221461/18446744073709551616:ℚ)) ((7651505093605490201/2305843009213693952:ℚ)) block03_checked tail04
  have hsum : ((6091883423264221461/18446744073709551616:ℚ) : ℚ)+((7651505093605490201/2305843009213693952:ℚ))=((67303924172108143069/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × BoundTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((86995626943/578712734170:ℚ)) remaining02=some ((36506638304367708403/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((86995626943/578712734170:ℚ)) block02 remaining03
    ((567681682711/2928348192736:ℚ)) ((5709352436627273737/18446744073709551616:ℚ)) ((67303924172108143069/18446744073709551616:ℚ)) block02_checked tail03
  have hsum : ((5709352436627273737/18446744073709551616:ℚ) : ℚ)+((67303924172108143069/18446744073709551616:ℚ))=((36506638304367708403/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × BoundTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((1809/18178:ℚ)) remaining01=some ((80570816467059291451/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1809/18178:ℚ)) block01 remaining02
    ((86995626943/578712734170:ℚ)) ((7557539858323874645/18446744073709551616:ℚ)) ((36506638304367708403/9223372036854775808:ℚ)) block01_checked tail02
  have hsum : ((7557539858323874645/18446744073709551616:ℚ) : ℚ)+((36506638304367708403/9223372036854775808:ℚ))=((80570816467059291451/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × BoundTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((48514889751449448431/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((1809/18178:ℚ)) ((16458963035839605411/18446744073709551616:ℚ)) ((80570816467059291451/18446744073709551616:ℚ)) block00_checked tail01
  have hsum : ((16458963035839605411/18446744073709551616:ℚ) : ℚ)+((80570816467059291451/18446744073709551616:ℚ))=((48514889751449448431/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((48514889751449448431/9223372036854775808:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((48514889751449448431/9223372036854775808:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((48514889751449448431/9223372036854775808:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((48514889751449448431/9223372036854775808:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf77.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family01.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Leaf77.root.x0 : ℝ) Phase15301Leaf77.root.x1)
    (hy : y∈Set.Icc (Phase15301Leaf77.root.y0 : ℝ) Phase15301Leaf77.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field0 x y u)^2)≤((48514889751449448431/9223372036854775808:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Leaf77.root queryRoot 1 chartPermutation
    original_chart_checked ((48514889751449448431/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Leaf77.Family01

#print axioms NoThreeLine.Phase15301Leaf77.Family01.data_checked
#print axioms NoThreeLine.Phase15301Leaf77.Family01.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Leaf77.Family01.upper_partition_checked
#print axioms NoThreeLine.Phase15301Leaf77.Family01.original_directional_integral_bound
