import NoThreeLine.Phase15301Group7275Family01Block00
import NoThreeLine.Phase15301Group7275Family01Block01
import NoThreeLine.Phase15301Group7275Family01Block02
import NoThreeLine.Phase15301Group7275Family01Block03
import NoThreeLine.Phase15301Group7275Family01Block04
import NoThreeLine.Phase15301Group7275Family01Block05
import NoThreeLine.Phase15301Group7275Family01Block06
import NoThreeLine.Phase15301Group7275Family01Block07
import NoThreeLine.Phase15301Group7275Family01Block08
import NoThreeLine.Phase15301Group7275Family01Block09
import NoThreeLine.Phase15301Group7275Family01Block10
import NoThreeLine.Phase15301Group7275Family01Block11
import NoThreeLine.Phase15301Group7275Family01Block12
import NoThreeLine.Phase15301Group7275Family01Block13
import NoThreeLine.Phase15301Group7275Family01Block14
import NoThreeLine.Phase15301Group7275Family01Block15
import NoThreeLine.Phase15301Group7275Family01Block16
import NoThreeLine.Phase15301Group7275Family01Block17

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope Phase15301Family01

def remaining18 : List (ℚ × AutoTrace) := []
theorem tail18 : checkUpperPartition gatheredExpr 18446744073709551616 1 remaining18=some 0 := by decide +kernel

def remaining17 : List (ℚ × AutoTrace) := block17++remaining18
theorem tail17 : checkUpperPartition gatheredExpr 18446744073709551616 ((7045/7617:ℚ)) remaining17=some ((2309275299271306623/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((7045/7617:ℚ)) block17 remaining18
    (1) ((2309275299271306623/9223372036854775808:ℚ)) (0) block17_checked tail18
  have hsum : ((2309275299271306623/9223372036854775808:ℚ) : ℚ)+(0)=((2309275299271306623/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining17,hsum] using h

def remaining16 : List (ℚ × AutoTrace) := block16++remaining17
theorem tail16 : checkUpperPartition gatheredExpr 18446744073709551616 ((3331/3776:ℚ)) remaining16=some ((7575028119825958471/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3331/3776:ℚ)) block16 remaining17
    ((7045/7617:ℚ)) ((2956477521283345225/18446744073709551616:ℚ)) ((2309275299271306623/9223372036854775808:ℚ)) block16_checked tail17
  have hsum : ((2956477521283345225/18446744073709551616:ℚ) : ℚ)+((2309275299271306623/9223372036854775808:ℚ))=((7575028119825958471/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining16,hsum] using h

def remaining15 : List (ℚ × AutoTrace) := block15++remaining16
theorem tail15 : checkUpperPartition gatheredExpr 18446744073709551616 ((3013/3521:ℚ)) remaining15=some ((9153984124191412057/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3013/3521:ℚ)) block15 remaining16
    ((3331/3776:ℚ)) ((789478002182726793/9223372036854775808:ℚ)) ((7575028119825958471/18446744073709551616:ℚ)) block15_checked tail16
  have hsum : ((789478002182726793/9223372036854775808:ℚ) : ℚ)+((7575028119825958471/18446744073709551616:ℚ))=((9153984124191412057/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining15,hsum] using h

def remaining14 : List (ℚ × AutoTrace) := block14++remaining15
theorem tail14 : checkUpperPartition gatheredExpr 18446744073709551616 ((2019/2528:ℚ)) remaining14=some ((12858145727322052111/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((2019/2528:ℚ)) block14 remaining15
    ((3013/3521:ℚ)) ((1852080801565320027/9223372036854775808:ℚ)) ((9153984124191412057/18446744073709551616:ℚ)) block14_checked tail15
  have hsum : ((1852080801565320027/9223372036854775808:ℚ) : ℚ)+((9153984124191412057/18446744073709551616:ℚ))=((12858145727322052111/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining14,hsum] using h

def remaining13 : List (ℚ × AutoTrace) := block13++remaining14
theorem tail13 : checkUpperPartition gatheredExpr 18446744073709551616 ((18197/24323:ℚ)) remaining13=some ((2116661774919045013/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((18197/24323:ℚ)) block13 remaining14
    ((2019/2528:ℚ)) ((4075148472030307993/18446744073709551616:ℚ)) ((12858145727322052111/18446744073709551616:ℚ)) block13_checked tail14
  have hsum : ((4075148472030307993/18446744073709551616:ℚ) : ℚ)+((12858145727322052111/18446744073709551616:ℚ))=((2116661774919045013/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining13,hsum] using h

def remaining12 : List (ℚ × AutoTrace) := block12++remaining13
theorem tail12 : checkUpperPartition gatheredExpr 18446744073709551616 ((3525/5057:ℚ)) remaining12=some ((10623570686688023063/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((3525/5057:ℚ)) block12 remaining13
    ((18197/24323:ℚ)) ((2156923587011843011/9223372036854775808:ℚ)) ((2116661774919045013/2305843009213693952:ℚ)) block12_checked tail13
  have hsum : ((2156923587011843011/9223372036854775808:ℚ) : ℚ)+((2116661774919045013/2305843009213693952:ℚ))=((10623570686688023063/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining12,hsum] using h

def remaining11 : List (ℚ × AutoTrace) := block11++remaining12
theorem tail11 : checkUpperPartition gatheredExpr 18446744073709551616 ((1763/2784:ℚ)) remaining11=some ((13022957383439289511/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1763/2784:ℚ)) block11 remaining12
    ((3525/5057:ℚ)) ((149961668546954153/576460752303423488:ℚ)) ((10623570686688023063/9223372036854775808:ℚ)) block11_checked tail12
  have hsum : ((149961668546954153/576460752303423488:ℚ) : ℚ)+((10623570686688023063/9223372036854775808:ℚ))=((13022957383439289511/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining11,hsum] using h

def remaining10 : List (ℚ × AutoTrace) := block10++remaining11
theorem tail10 : checkUpperPartition gatheredExpr 18446744073709551616 ((1175/2027:ℚ)) remaining10=some ((7583908915318021189/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1175/2027:ℚ)) block10 remaining11
    ((1763/2784:ℚ)) ((2144860447196752867/9223372036854775808:ℚ)) ((13022957383439289511/9223372036854775808:ℚ)) block10_checked tail11
  have hsum : ((2144860447196752867/9223372036854775808:ℚ) : ℚ)+((13022957383439289511/9223372036854775808:ℚ))=((7583908915318021189/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining10,hsum] using h

def remaining09 : List (ℚ × AutoTrace) := block09++remaining10
theorem tail09 : checkUpperPartition gatheredExpr 18446744073709551616 ((2019/4064:ℚ)) remaining09=some ((18805542443965981279/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((2019/4064:ℚ)) block09 remaining10
    ((1175/2027:ℚ)) ((3637724613329938901/9223372036854775808:ℚ)) ((7583908915318021189/4611686018427387904:ℚ)) block09_checked tail10
  have hsum : ((3637724613329938901/9223372036854775808:ℚ) : ℚ)+((7583908915318021189/4611686018427387904:ℚ))=((18805542443965981279/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining09,hsum] using h

def remaining08 : List (ℚ × AutoTrace) := block08++remaining09
theorem tail08 : checkUpperPartition gatheredExpr 18446744073709551616 ((259/549:ℚ)) remaining08=some ((39743848283249189587/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((259/549:ℚ)) block08 remaining09
    ((2019/4064:ℚ)) ((2132763395317227029/18446744073709551616:ℚ)) ((18805542443965981279/9223372036854775808:ℚ)) block08_checked tail09
  have hsum : ((2132763395317227029/18446744073709551616:ℚ) : ℚ)+((18805542443965981279/9223372036854775808:ℚ))=((39743848283249189587/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,hsum] using h

def remaining07 : List (ℚ × AutoTrace) := block07++remaining08
theorem tail07 : checkUpperPartition gatheredExpr 18446744073709551616 ((1507/3808:ℚ)) remaining07=some ((5769255431873769443/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1507/3808:ℚ)) block07 remaining08
    ((259/549:ℚ)) ((6410195171740965957/18446744073709551616:ℚ)) ((39743848283249189587/18446744073709551616:ℚ)) block07_checked tail08
  have hsum : ((6410195171740965957/18446744073709551616:ℚ) : ℚ)+((39743848283249189587/18446744073709551616:ℚ))=((5769255431873769443/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining07,hsum] using h

def remaining06 : List (ℚ × AutoTrace) := block06++remaining07
theorem tail06 : checkUpperPartition gatheredExpr 18446744073709551616 ((995/2784:ℚ)) remaining06=some ((49827789555338986795/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((995/2784:ℚ)) block06 remaining07
    ((1507/3808:ℚ)) ((3673746100348831251/18446744073709551616:ℚ)) ((5769255431873769443/2305843009213693952:ℚ)) block06_checked tail07
  have hsum : ((3673746100348831251/18446744073709551616:ℚ) : ℚ)+((5769255431873769443/2305843009213693952:ℚ))=((49827789555338986795/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining06,hsum] using h

def remaining05 : List (ℚ × AutoTrace) := block05++remaining06
theorem tail05 : checkUpperPartition gatheredExpr 18446744073709551616 ((1989/6593:ℚ)) remaining05=some ((27535633073853915715/9223372036854775808:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1989/6593:ℚ)) block05 remaining06
    ((995/2784:ℚ)) ((5243476592368844635/18446744073709551616:ℚ)) ((49827789555338986795/18446744073709551616:ℚ)) block05_checked tail06
  have hsum : ((5243476592368844635/18446744073709551616:ℚ) : ℚ)+((49827789555338986795/18446744073709551616:ℚ))=((27535633073853915715/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining05,hsum] using h

def remaining04 : List (ℚ × AutoTrace) := block04++remaining05
theorem tail04 : checkUpperPartition gatheredExpr 18446744073709551616 ((1477/6081:ℚ)) remaining04=some ((61229096910288569601/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1477/6081:ℚ)) block04 remaining05
    ((1989/6593:ℚ)) ((6157830762580738171/18446744073709551616:ℚ)) ((27535633073853915715/9223372036854775808:ℚ)) block04_checked tail05
  have hsum : ((6157830762580738171/18446744073709551616:ℚ) : ℚ)+((27535633073853915715/9223372036854775808:ℚ))=((61229096910288569601/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining04,hsum] using h

def remaining03 : List (ℚ × AutoTrace) := block03++remaining04
theorem tail03 : checkUpperPartition gatheredExpr 18446744073709551616 ((1477/7617:ℚ)) remaining03=some ((16831142878004877765/4611686018427387904:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((1477/7617:ℚ)) block03 remaining04
    ((1477/6081:ℚ)) ((6095474601730941459/18446744073709551616:ℚ)) ((61229096910288569601/18446744073709551616:ℚ)) block03_checked tail04
  have hsum : ((6095474601730941459/18446744073709551616:ℚ) : ℚ)+((61229096910288569601/18446744073709551616:ℚ))=((16831142878004877765/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,hsum] using h

def remaining02 : List (ℚ × AutoTrace) := block02++remaining03
theorem tail02 : checkUpperPartition gatheredExpr 18446744073709551616 ((151/1003:ℚ)) remaining02=some ((73013186869376247397/18446744073709551616:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((151/1003:ℚ)) block02 remaining03
    ((1477/7617:ℚ)) ((5688615357356736337/18446744073709551616:ℚ)) ((16831142878004877765/4611686018427387904:ℚ)) block02_checked tail03
  have hsum : ((5688615357356736337/18446744073709551616:ℚ) : ℚ)+((16831142878004877765/4611686018427387904:ℚ))=((73013186869376247397/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining02,hsum] using h

def remaining01 : List (ℚ × AutoTrace) := block01++remaining02
theorem tail01 : checkUpperPartition gatheredExpr 18446744073709551616 ((151/1515:ℚ)) remaining01=some ((10072741891276585251/2305843009213693952:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 ((151/1515:ℚ)) block01 remaining02
    ((151/1003:ℚ)) ((7568748260836434611/18446744073709551616:ℚ)) ((73013186869376247397/18446744073709551616:ℚ)) block01_checked tail02
  have hsum : ((7568748260836434611/18446744073709551616:ℚ) : ℚ)+((73013186869376247397/18446744073709551616:ℚ))=((10072741891276585251/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining01,hsum] using h

def remaining00 : List (ℚ × AutoTrace) := block00++remaining01
theorem tail00 : checkUpperPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((1516680605534252103/288230376151711744:ℚ)) := by
  have h := checkUpperBlock_append gatheredExpr 18446744073709551616 (0) block00 remaining01
    ((151/1515:ℚ)) ((2060702952997431573/2305843009213693952:ℚ)) ((10072741891276585251/2305843009213693952:ℚ)) block00_checked tail01
  have hsum : ((2060702952997431573/2305843009213693952:ℚ) : ℚ)+((10072741891276585251/2305843009213693952:ℚ))=((1516680605534252103/288230376151711744:ℚ)) := by norm_num
  simpa only [remaining00,hsum] using h
theorem upper_partition_checked :
    checkUpperUnitIntegral gatheredExpr 18446744073709551616 upperCuts=some ((1516680605534252103/288230376151711744:ℚ)) := by
  change checkUpperUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((1516680605534252103/288230376151711744:ℚ))
  simpa only [checkUpperUnitIntegral,show 0<(18446744073709551616 : ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0 : ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0 : ℝ) queryRoot.y1) :
    (∫ u in (0 : ℝ)..1,(actualChord rectangles weights x y u)^2)≤((1516680605534252103/288230376151711744:ℚ) : ℝ) :=
  upper_gathered_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 upperCuts ((1516680605534252103/288230376151711744:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy

theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group7275.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family01.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group7275.root.x0 : ℝ) Phase15301Group7275.root.x1)
    (hy : y∈Set.Icc (Phase15301Group7275.root.y0 : ℝ) Phase15301Group7275.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field0 x y u)^2)≤((1516680605534252103/288230376151711744:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group7275.root queryRoot 1 chartPermutation
    original_chart_checked ((1516680605534252103/288230376151711744:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group7275.Family01

#print axioms NoThreeLine.Phase15301Group7275.Family01.data_checked
#print axioms NoThreeLine.Phase15301Group7275.Family01.expression_from_actual_field
#print axioms NoThreeLine.Phase15301Group7275.Family01.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group7275.Family01.original_directional_integral_bound
