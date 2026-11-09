import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock00
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock01
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock02
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock03
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock04
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock05
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock06
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock07
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock08
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock09
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock10
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock11
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock12
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock13
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock14
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock15
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock16
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock17
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock18
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock19
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock20
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock21
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock22
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock23
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock24
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock25
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock26
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock27
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock28
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock29
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock30
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock31
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock32
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock33
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock34
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock35
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock36
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock37
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock38
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock39
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock40
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock41
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock42
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock43
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock44
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock45
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock46
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock47
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock48
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock49
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock50
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock51
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock52
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock53
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock54
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock55
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock56
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock57
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock58
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock59
import NoThreeLine.Phase15301Group4750Family01IntervalNormalizedBlock60
import NoThreeLine.BenchmarkNormalizedCertificate

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope Phase15301Family01

def remaining61 : List NormalizedBlock := []
theorem tail61 : checkNormalizedPartition gatheredExpr 18446744073709551616 1 remaining61=some 0 := by decide +kernel

def remaining60 : List NormalizedBlock := block60::remaining61
theorem tail60 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((7105/7111:ℚ)) remaining60=some ((45119129550408219/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block60Expr 18446744073709551616
    ((7105/7111:ℚ)) (1) ((45119129550408219/18446744073709551616:ℚ)) (0)
    block60Cuts remaining61 block60_normalization block60_checked tail61
  have hs : ((45119129550408219/18446744073709551616:ℚ):ℚ)+(0)=((45119129550408219/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining60,block60,hs] using h

def remaining59 : List NormalizedBlock := block59::remaining60
theorem tail59 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((184/185:ℚ)) remaining59=some ((289875186243592325/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block59Expr 18446744073709551616
    ((184/185:ℚ)) ((7105/7111:ℚ)) ((122378028346592053/9223372036854775808:ℚ)) ((45119129550408219/18446744073709551616:ℚ))
    block59Cuts remaining60 block59_normalization block59_checked tail60
  have hs : ((122378028346592053/9223372036854775808:ℚ):ℚ)+((45119129550408219/18446744073709551616:ℚ))=((289875186243592325/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining59,block59,hs] using h

def remaining58 : List NormalizedBlock := block58::remaining59
theorem tail58 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((247/256:ℚ)) remaining58=some ((991419091767007847/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block58Expr 18446744073709551616
    ((247/256:ℚ)) ((184/185:ℚ)) ((1692962997290423369/18446744073709551616:ℚ)) ((289875186243592325/18446744073709551616:ℚ))
    block58Cuts remaining59 block58_normalization block58_checked tail59
  have hs : ((1692962997290423369/18446744073709551616:ℚ):ℚ)+((289875186243592325/18446744073709551616:ℚ))=((991419091767007847/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining58,block58,hs] using h

def remaining57 : List NormalizedBlock := block57::remaining58
theorem tail57 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((951/1024:ℚ)) remaining57=some ((4332788040557022493/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block57Expr 18446744073709551616
    ((951/1024:ℚ)) ((247/256:ℚ)) ((2349949857023006799/18446744073709551616:ℚ)) ((991419091767007847/9223372036854775808:ℚ))
    block57Cuts remaining58 block57_normalization block57_checked tail58
  have hs : ((2349949857023006799/18446744073709551616:ℚ):ℚ)+((991419091767007847/9223372036854775808:ℚ))=((4332788040557022493/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining57,block57,hs] using h

def remaining56 : List NormalizedBlock := block56::remaining57
theorem tail56 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((1521/1649:ℚ)) remaining56=some ((4780605577025221163/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block56Expr 18446744073709551616
    ((1521/1649:ℚ)) ((951/1024:ℚ)) ((223908768234099335/9223372036854775808:ℚ)) ((4332788040557022493/18446744073709551616:ℚ))
    block56Cuts remaining57 block56_normalization block56_checked tail57
  have hs : ((223908768234099335/9223372036854775808:ℚ):ℚ)+((4332788040557022493/18446744073709551616:ℚ))=((4780605577025221163/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining56,block56,hs] using h

def remaining55 : List NormalizedBlock := block55::remaining56
theorem tail55 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((117/128:ℚ)) remaining55=some ((5373235755552715673/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block55Expr 18446744073709551616
    ((117/128:ℚ)) ((1521/1649:ℚ)) ((296315089263747255/9223372036854775808:ℚ)) ((4780605577025221163/18446744073709551616:ℚ))
    block55Cuts remaining56 block55_normalization block55_checked tail56
  have hs : ((296315089263747255/9223372036854775808:ℚ):ℚ)+((4780605577025221163/18446744073709551616:ℚ))=((5373235755552715673/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining55,block55,hs] using h

def remaining54 : List NormalizedBlock := block54::remaining55
theorem tail54 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((459/512:ℚ)) remaining54=some ((6603695022330097795/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block54Expr 18446744073709551616
    ((459/512:ℚ)) ((117/128:ℚ)) ((615229633388691061/9223372036854775808:ℚ)) ((5373235755552715673/18446744073709551616:ℚ))
    block54Cuts remaining55 block54_normalization block54_checked tail55
  have hs : ((615229633388691061/9223372036854775808:ℚ):ℚ)+((5373235755552715673/18446744073709551616:ℚ))=((6603695022330097795/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining54,block54,hs] using h

def remaining53 : List NormalizedBlock := block53::remaining54
theorem tail53 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((451/512:ℚ)) remaining53=some ((7646671128176000311/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block53Expr 18446744073709551616
    ((451/512:ℚ)) ((459/512:ℚ)) ((260744026461475629/4611686018427387904:ℚ)) ((6603695022330097795/18446744073709551616:ℚ))
    block53Cuts remaining54 block53_normalization block53_checked tail54
  have hs : ((260744026461475629/4611686018427387904:ℚ):ℚ)+((6603695022330097795/18446744073709551616:ℚ))=((7646671128176000311/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining53,block53,hs] using h

def remaining52 : List NormalizedBlock := block52::remaining53
theorem tail52 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((443/512:ℚ)) remaining52=some ((4300182339132903039/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block52Expr 18446744073709551616
    ((443/512:ℚ)) ((451/512:ℚ)) ((953693550089805767/18446744073709551616:ℚ)) ((7646671128176000311/18446744073709551616:ℚ))
    block52Cuts remaining53 block52_normalization block52_checked tail53
  have hs : ((953693550089805767/18446744073709551616:ℚ):ℚ)+((7646671128176000311/18446744073709551616:ℚ))=((4300182339132903039/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining52,block52,hs] using h

def remaining51 : List NormalizedBlock := block51::remaining52
theorem tail51 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((219/256:ℚ)) remaining51=some ((4583215311927665015/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block51Expr 18446744073709551616
    ((219/256:ℚ)) ((443/512:ℚ)) ((35379121599345247/1152921504606846976:ℚ)) ((4300182339132903039/9223372036854775808:ℚ))
    block51Cuts remaining52 block51_normalization block51_checked tail52
  have hs : ((35379121599345247/1152921504606846976:ℚ):ℚ)+((4300182339132903039/9223372036854775808:ℚ))=((4583215311927665015/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining51,block51,hs] using h

def remaining50 : List NormalizedBlock := block50::remaining51
theorem tail50 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((865/1024:ℚ)) remaining50=some ((9794028775624177679/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block50Expr 18446744073709551616
    ((865/1024:ℚ)) ((219/256:ℚ)) ((627598151768847649/18446744073709551616:ℚ)) ((4583215311927665015/9223372036854775808:ℚ))
    block50Cuts remaining51 block50_normalization block50_checked tail51
  have hs : ((627598151768847649/18446744073709551616:ℚ):ℚ)+((4583215311927665015/9223372036854775808:ℚ))=((9794028775624177679/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining50,block50,hs] using h

def remaining49 : List NormalizedBlock := block49::remaining50
theorem tail49 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((847/1024:ℚ)) remaining49=some ((10876450318395764427/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block49Expr 18446744073709551616
    ((847/1024:ℚ)) ((865/1024:ℚ)) ((270605385692896687/4611686018427387904:ℚ)) ((9794028775624177679/18446744073709551616:ℚ))
    block49Cuts remaining50 block49_normalization block49_checked tail50
  have hs : ((270605385692896687/4611686018427387904:ℚ):ℚ)+((9794028775624177679/18446744073709551616:ℚ))=((10876450318395764427/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining49,block49,hs] using h

def remaining48 : List NormalizedBlock := block48::remaining49
theorem tail48 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((415/512:ℚ)) remaining48=some ((2998291929879721881/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block48Expr 18446744073709551616
    ((415/512:ℚ)) ((847/1024:ℚ)) ((1116717401123123097/18446744073709551616:ℚ)) ((10876450318395764427/18446744073709551616:ℚ))
    block48Cuts remaining49 block48_normalization block48_checked tail49
  have hs : ((1116717401123123097/18446744073709551616:ℚ):ℚ)+((10876450318395764427/18446744073709551616:ℚ))=((2998291929879721881/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining48,block48,hs] using h

def remaining47 : List NormalizedBlock := block47::remaining48
theorem tail47 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((1987/2501:ℚ)) remaining47=some ((13147938611048217553/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block47Expr 18446744073709551616
    ((1987/2501:ℚ)) ((415/512:ℚ)) ((1154770891529330029/18446744073709551616:ℚ)) ((2998291929879721881/4611686018427387904:ℚ))
    block47Cuts remaining48 block47_normalization block47_checked tail48
  have hs : ((1154770891529330029/18446744073709551616:ℚ):ℚ)+((2998291929879721881/4611686018427387904:ℚ))=((13147938611048217553/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining47,block47,hs] using h

def remaining46 : List NormalizedBlock := block46::remaining47
theorem tail46 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((397/512:ℚ)) remaining46=some ((114294565865111361/144115188075855872:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block46Expr 18446744073709551616
    ((397/512:ℚ)) ((1987/2501:ℚ)) ((1481765819686036655/18446744073709551616:ℚ)) ((13147938611048217553/18446744073709551616:ℚ))
    block46Cuts remaining47 block46_normalization block46_checked tail47
  have hs : ((1481765819686036655/18446744073709551616:ℚ):ℚ)+((13147938611048217553/18446744073709551616:ℚ))=((114294565865111361/144115188075855872:ℚ)) := by norm_num
  simpa only [remaining46,block46,hs] using h

def remaining45 : List NormalizedBlock := block45::remaining46
theorem tail45 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((760/1009:ℚ)) remaining45=some ((1029246701326158619/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block45Expr 18446744073709551616
    ((760/1009:ℚ)) ((397/512:ℚ)) ((114890174405267731/1152921504606846976:ℚ)) ((114294565865111361/144115188075855872:ℚ))
    block45Cuts remaining46 block45_normalization block45_checked tail46
  have hs : ((114890174405267731/1152921504606846976:ℚ):ℚ)+((114294565865111361/144115188075855872:ℚ))=((1029246701326158619/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining45,block45,hs] using h

def remaining44 : List NormalizedBlock := block44::remaining45
theorem tail44 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((3055/4096:ℚ)) remaining44=some ((8551456523581771717/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block44Expr 18446744073709551616
    ((3055/4096:ℚ)) ((760/1009:ℚ)) ((317482912972502765/9223372036854775808:ℚ)) ((1029246701326158619/1152921504606846976:ℚ))
    block44Cuts remaining45 block44_normalization block44_checked tail45
  have hs : ((317482912972502765/9223372036854775808:ℚ):ℚ)+((1029246701326158619/1152921504606846976:ℚ))=((8551456523581771717/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining44,block44,hs] using h

def remaining43 : List NormalizedBlock := block43::remaining44
theorem tail43 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((189/256:ℚ)) remaining43=some ((17759640761749916691/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block43Expr 18446744073709551616
    ((189/256:ℚ)) ((3055/4096:ℚ)) ((656727714586373257/18446744073709551616:ℚ)) ((8551456523581771717/9223372036854775808:ℚ))
    block43Cuts remaining44 block43_normalization block43_checked tail44
  have hs : ((656727714586373257/18446744073709551616:ℚ):ℚ)+((8551456523581771717/9223372036854775808:ℚ))=((17759640761749916691/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining43,block43,hs] using h

def remaining42 : List NormalizedBlock := block42::remaining43
theorem tail42 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((363/512:ℚ)) remaining42=some ((5062942163596905461/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block42Expr 18446744073709551616
    ((363/512:ℚ)) ((189/256:ℚ)) ((2492127892637705153/18446744073709551616:ℚ)) ((17759640761749916691/18446744073709551616:ℚ))
    block42Cuts remaining43 block42_normalization block42_checked tail43
  have hs : ((2492127892637705153/18446744073709551616:ℚ):ℚ)+((17759640761749916691/18446744073709551616:ℚ))=((5062942163596905461/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining42,block42,hs] using h

def remaining41 : List NormalizedBlock := block41::remaining42
theorem tail41 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((568/825:ℚ)) remaining41=some ((21926312830726204289/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block41Expr 18446744073709551616
    ((568/825:ℚ)) ((363/512:ℚ)) ((1674544176338582445/18446744073709551616:ℚ)) ((5062942163596905461/4611686018427387904:ℚ))
    block41Cuts remaining42 block41_normalization block41_checked tail42
  have hs : ((1674544176338582445/18446744073709551616:ℚ):ℚ)+((5062942163596905461/4611686018427387904:ℚ))=((21926312830726204289/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining41,block41,hs] using h

def remaining40 : List NormalizedBlock := block40::remaining41
theorem tail40 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((253/381:ℚ)) remaining40=some ((23795426606086268821/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block40Expr 18446744073709551616
    ((253/381:ℚ)) ((568/825:ℚ)) ((467278443840016133/4611686018427387904:ℚ)) ((21926312830726204289/18446744073709551616:ℚ))
    block40Cuts remaining41 block40_normalization block40_checked tail41
  have hs : ((467278443840016133/4611686018427387904:ℚ):ℚ)+((21926312830726204289/18446744073709551616:ℚ))=((23795426606086268821/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining40,block40,hs] using h

def remaining39 : List NormalizedBlock := block39::remaining40
theorem tail39 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((1337/2048:ℚ)) remaining39=some ((24611701479321820367/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block39Expr 18446744073709551616
    ((1337/2048:ℚ)) ((253/381:ℚ)) ((408137436617775773/9223372036854775808:ℚ)) ((23795426606086268821/18446744073709551616:ℚ))
    block39Cuts remaining40 block39_normalization block39_checked tail40
  have hs : ((408137436617775773/9223372036854775808:ℚ):ℚ)+((23795426606086268821/18446744073709551616:ℚ))=((24611701479321820367/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining39,block39,hs] using h

def remaining38 : List NormalizedBlock := block38::remaining39
theorem tail38 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((18132739637/28673011080:ℚ)) remaining38=some ((26117892469124190821/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block38Expr 18446744073709551616
    ((18132739637/28673011080:ℚ)) ((1337/2048:ℚ)) ((753095494901185227/9223372036854775808:ℚ)) ((24611701479321820367/18446744073709551616:ℚ))
    block38Cuts remaining39 block38_normalization block38_checked tail39
  have hs : ((753095494901185227/9223372036854775808:ℚ):ℚ)+((24611701479321820367/18446744073709551616:ℚ))=((26117892469124190821/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining38,block38,hs] using h

def remaining37 : List NormalizedBlock := block37::remaining38
theorem tail37 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((79/128:ℚ)) remaining37=some ((3408983380309507299/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block37Expr 18446744073709551616
    ((79/128:ℚ)) ((18132739637/28673011080:ℚ)) ((1153974573351867571/18446744073709551616:ℚ)) ((26117892469124190821/18446744073709551616:ℚ))
    block37Cuts remaining38 block37_normalization block37_checked tail38
  have hs : ((1153974573351867571/18446744073709551616:ℚ):ℚ)+((26117892469124190821/18446744073709551616:ℚ))=((3408983380309507299/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining37,block37,hs] using h

def remaining36 : List NormalizedBlock := block36::remaining37
theorem tail36 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((611/1024:ℚ)) remaining36=some ((28909572042871865275/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block36Expr 18446744073709551616
    ((611/1024:ℚ)) ((79/128:ℚ)) ((1637705000395806883/18446744073709551616:ℚ)) ((3408983380309507299/2305843009213693952:ℚ))
    block36Cuts remaining37 block36_normalization block36_checked tail37
  have hs : ((1637705000395806883/18446744073709551616:ℚ):ℚ)+((3408983380309507299/2305843009213693952:ℚ))=((28909572042871865275/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining36,block36,hs] using h

def remaining35 : List NormalizedBlock := block35::remaining36
theorem tail35 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((593/1024:ℚ)) remaining35=some ((237376417688249905/144115188075855872:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block35Expr 18446744073709551616
    ((593/1024:ℚ)) ((611/1024:ℚ)) ((1474609421224122565/18446744073709551616:ℚ)) ((28909572042871865275/18446744073709551616:ℚ))
    block35Cuts remaining36 block35_normalization block35_checked tail36
  have hs : ((1474609421224122565/18446744073709551616:ℚ):ℚ)+((28909572042871865275/18446744073709551616:ℚ))=((237376417688249905/144115188075855872:ℚ)) := by norm_num
  simpa only [remaining35,block35,hs] using h

def remaining34 : List NormalizedBlock := block34::remaining35
theorem tail34 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((1155/2048:ℚ)) remaining34=some ((7929454474932716725/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block34Expr 18446744073709551616
    ((1155/2048:ℚ)) ((593/1024:ℚ)) ((333409108908719765/4611686018427387904:ℚ)) ((237376417688249905/144115188075855872:ℚ))
    block34Cuts remaining35 block34_normalization block34_checked tail35
  have hs : ((333409108908719765/4611686018427387904:ℚ):ℚ)+((237376417688249905/144115188075855872:ℚ))=((7929454474932716725/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining34,block34,hs] using h

def remaining33 : List NormalizedBlock := block33::remaining34
theorem tail33 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((4503/8192:ℚ)) remaining33=some ((8250690196173923009/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block33Expr 18446744073709551616
    ((4503/8192:ℚ)) ((1155/2048:ℚ)) ((80308930310301571/1152921504606846976:ℚ)) ((7929454474932716725/4611686018427387904:ℚ))
    block33Cuts remaining34 block33_normalization block33_checked tail34
  have hs : ((80308930310301571/1152921504606846976:ℚ):ℚ)+((7929454474932716725/4611686018427387904:ℚ))=((8250690196173923009/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining33,block33,hs] using h

def remaining32 : List NormalizedBlock := block32::remaining33
theorem tail32 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((2185/4096:ℚ)) remaining32=some ((34449249905012034433/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block32Expr 18446744073709551616
    ((2185/4096:ℚ)) ((4503/8192:ℚ)) ((1446489120316342397/18446744073709551616:ℚ)) ((8250690196173923009/4611686018427387904:ℚ))
    block32Cuts remaining33 block32_normalization block32_checked tail33
  have hs : ((1446489120316342397/18446744073709551616:ℚ):ℚ)+((8250690196173923009/4611686018427387904:ℚ))=((34449249905012034433/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining32,block32,hs] using h

def remaining31 : List NormalizedBlock := block31::remaining32
theorem tail31 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((4033/8135:ℚ)) remaining31=some ((18857214244436982231/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block31Expr 18446744073709551616
    ((4033/8135:ℚ)) ((2185/4096:ℚ)) ((3265178583861930029/18446744073709551616:ℚ)) ((34449249905012034433/18446744073709551616:ℚ))
    block31Cuts remaining32 block31_normalization block31_checked tail32
  have hs : ((3265178583861930029/18446744073709551616:ℚ):ℚ)+((34449249905012034433/18446744073709551616:ℚ))=((18857214244436982231/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining31,block31,hs] using h

def remaining30 : List NormalizedBlock := block30::remaining31
theorem tail30 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((248/505:ℚ)) remaining30=some ((19059025362922376983/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block30Expr 18446744073709551616
    ((248/505:ℚ)) ((4033/8135:ℚ)) ((3153298726334293/144115188075855872:ℚ)) ((18857214244436982231/9223372036854775808:ℚ))
    block30Cuts remaining31 block30_normalization block30_checked tail31
  have hs : ((3153298726334293/144115188075855872:ℚ):ℚ)+((18857214244436982231/9223372036854775808:ℚ))=((19059025362922376983/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining30,block30,hs] using h

def remaining29 : List NormalizedBlock := block29::remaining30
theorem tail29 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((493/1024:ℚ)) remaining29=some ((4867982559059458733/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block29Expr 18446744073709551616
    ((493/1024:ℚ)) ((248/505:ℚ)) ((412904873315457949/9223372036854775808:ℚ)) ((19059025362922376983/9223372036854775808:ℚ))
    block29Cuts remaining30 block29_normalization block29_checked tail30
  have hs : ((412904873315457949/9223372036854775808:ℚ):ℚ)+((19059025362922376983/9223372036854775808:ℚ))=((4867982559059458733/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining29,block29,hs] using h

def remaining28 : List NormalizedBlock := block28::remaining29
theorem tail28 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((440/953:ℚ)) remaining28=some ((2538069266344649911/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block28Expr 18446744073709551616
    ((440/953:ℚ)) ((493/1024:ℚ)) ((208155973629841089/2305843009213693952:ℚ)) ((4867982559059458733/2305843009213693952:ℚ))
    block28Cuts remaining29 block28_normalization block28_checked tail29
  have hs : ((208155973629841089/2305843009213693952:ℚ):ℚ)+((4867982559059458733/2305843009213693952:ℚ))=((2538069266344649911/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining28,block28,hs] using h

def remaining27 : List NormalizedBlock := block27::remaining28
theorem tail27 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((248/569:ℚ)) remaining27=some ((166986217147501925/72057594037927936:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block27Expr 18446744073709551616
    ((248/569:ℚ)) ((440/953:ℚ)) ((133710208015380889/1152921504606846976:ℚ)) ((2538069266344649911/1152921504606846976:ℚ))
    block27Cuts remaining28 block27_normalization block27_checked tail28
  have hs : ((133710208015380889/1152921504606846976:ℚ):ℚ)+((2538069266344649911/1152921504606846976:ℚ))=((166986217147501925/72057594037927936:ℚ)) := by norm_num
  simpa only [remaining27,block27,hs] using h

def remaining26 : List NormalizedBlock := block26::remaining27
theorem tail26 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((855/2048:ℚ)) remaining26=some ((44284399623961838797/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block26Expr 18446744073709551616
    ((855/2048:ℚ)) ((248/569:ℚ)) ((1535928034201345997/18446744073709551616:ℚ)) ((166986217147501925/72057594037927936:ℚ))
    block26Cuts remaining27 block26_normalization block26_checked tail27
  have hs : ((1535928034201345997/18446744073709551616:ℚ):ℚ)+((166986217147501925/72057594037927936:ℚ))=((44284399623961838797/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining26,block26,hs] using h

def remaining25 : List NormalizedBlock := block25::remaining26
theorem tail25 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((1619/4096:ℚ)) remaining25=some ((46228303645096694391/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block25Expr 18446744073709551616
    ((1619/4096:ℚ)) ((855/2048:ℚ)) ((971952010567427797/9223372036854775808:ℚ)) ((44284399623961838797/18446744073709551616:ℚ))
    block25Cuts remaining26 block25_normalization block25_checked tail26
  have hs : ((971952010567427797/9223372036854775808:ℚ):ℚ)+((44284399623961838797/18446744073709551616:ℚ))=((46228303645096694391/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining25,block25,hs] using h

def remaining24 : List NormalizedBlock := block24::remaining25
theorem tail24 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((104/275:ℚ)) remaining24=some ((47851075104885147151/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block24Expr 18446744073709551616
    ((104/275:ℚ)) ((1619/4096:ℚ)) ((202846432473556595/2305843009213693952:ℚ)) ((46228303645096694391/18446744073709551616:ℚ))
    block24Cuts remaining25 block24_normalization block24_checked tail25
  have hs : ((202846432473556595/2305843009213693952:ℚ):ℚ)+((46228303645096694391/18446744073709551616:ℚ))=((47851075104885147151/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining24,block24,hs] using h

def remaining23 : List NormalizedBlock := block23::remaining24
theorem tail23 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((93/256:ℚ)) remaining23=some ((24651913395050215753/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block23Expr 18446744073709551616
    ((93/256:ℚ)) ((104/275:ℚ)) ((1452751685215284355/18446744073709551616:ℚ)) ((47851075104885147151/18446744073709551616:ℚ))
    block23Cuts remaining24 block23_normalization block23_checked tail24
  have hs : ((1452751685215284355/18446744073709551616:ℚ):ℚ)+((47851075104885147151/18446744073709551616:ℚ))=((24651913395050215753/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining23,block23,hs] using h

def remaining22 : List NormalizedBlock := block22::remaining23
theorem tail22 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((169/512:ℚ)) remaining22=some ((52432081712482060827/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block22Expr 18446744073709551616
    ((169/512:ℚ)) ((93/256:ℚ)) ((3128254922381629321/18446744073709551616:ℚ)) ((24651913395050215753/9223372036854775808:ℚ))
    block22Cuts remaining23 block22_normalization block22_checked tail23
  have hs : ((3128254922381629321/18446744073709551616:ℚ):ℚ)+((24651913395050215753/9223372036854775808:ℚ))=((52432081712482060827/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining22,block22,hs] using h

def remaining21 : List NormalizedBlock := block21::remaining22
theorem tail21 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((165/512:ℚ)) remaining21=some ((3323039109352952201/1152921504606846976:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block21Expr 18446744073709551616
    ((165/512:ℚ)) ((169/512:ℚ)) ((736544037165174389/18446744073709551616:ℚ)) ((52432081712482060827/18446744073709551616:ℚ))
    block21Cuts remaining22 block21_normalization block21_checked tail22
  have hs : ((736544037165174389/18446744073709551616:ℚ):ℚ)+((52432081712482060827/18446744073709551616:ℚ))=((3323039109352952201/1152921504606846976:ℚ)) := by norm_num
  simpa only [remaining21,block21,hs] using h

def remaining20 : List NormalizedBlock := block20::remaining21
theorem tail20 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((155/512:ℚ)) remaining20=some ((6878298379667001925/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block20Expr 18446744073709551616
    ((155/512:ℚ)) ((165/512:ℚ)) ((232220160961097523/2305843009213693952:ℚ)) ((3323039109352952201/1152921504606846976:ℚ))
    block20Cuts remaining21 block20_normalization block20_checked tail21
  have hs : ((232220160961097523/2305843009213693952:ℚ):ℚ)+((3323039109352952201/1152921504606846976:ℚ))=((6878298379667001925/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining20,block20,hs] using h

def remaining19 : List NormalizedBlock := block19::remaining20
theorem tail19 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((497/1777:ℚ)) remaining19=some ((14313660084846807463/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block19Expr 18446744073709551616
    ((497/1777:ℚ)) ((155/512:ℚ)) ((557063325512803613/4611686018427387904:ℚ)) ((6878298379667001925/2305843009213693952:ℚ))
    block19Cuts remaining20 block19_normalization block19_checked tail20
  have hs : ((557063325512803613/4611686018427387904:ℚ):ℚ)+((6878298379667001925/2305843009213693952:ℚ))=((14313660084846807463/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining19,block19,hs] using h

def remaining18 : List NormalizedBlock := block18::remaining19
theorem tail18 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((273/1024:ℚ)) remaining18=some ((58591937799326379745/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block18Expr 18446744073709551616
    ((273/1024:ℚ)) ((497/1777:ℚ)) ((1337297459939149893/18446744073709551616:ℚ)) ((14313660084846807463/4611686018427387904:ℚ))
    block18Cuts remaining19 block18_normalization block18_checked tail19
  have hs : ((1337297459939149893/18446744073709551616:ℚ):ℚ)+((14313660084846807463/4611686018427387904:ℚ))=((58591937799326379745/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining18,block18,hs] using h

def remaining17 : List NormalizedBlock := block17::remaining18
theorem tail17 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((33/128:ℚ)) remaining17=some ((29775069559986313859/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block17Expr 18446744073709551616
    ((33/128:ℚ)) ((273/1024:ℚ)) ((958201320646247973/18446744073709551616:ℚ)) ((58591937799326379745/18446744073709551616:ℚ))
    block17Cuts remaining18 block17_normalization block17_checked tail18
  have hs : ((958201320646247973/18446744073709551616:ℚ):ℚ)+((58591937799326379745/18446744073709551616:ℚ))=((29775069559986313859/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining17,block17,hs] using h

def remaining16 : List NormalizedBlock := block16::remaining17
theorem tail16 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((248/1017:ℚ)) remaining16=some ((61146850613300995833/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block16Expr 18446744073709551616
    ((248/1017:ℚ)) ((33/128:ℚ)) ((1596711493328368115/18446744073709551616:ℚ)) ((29775069559986313859/9223372036854775808:ℚ))
    block16Cuts remaining17 block16_normalization block16_checked tail17
  have hs : ((1596711493328368115/18446744073709551616:ℚ):ℚ)+((29775069559986313859/9223372036854775808:ℚ))=((61146850613300995833/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining16,block16,hs] using h

def remaining15 : List NormalizedBlock := block15::remaining16
theorem tail15 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((15/64:ℚ)) remaining15=some ((62276113782489183087/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block15Expr 18446744073709551616
    ((15/64:ℚ)) ((248/1017:ℚ)) ((564631584594093627/9223372036854775808:ℚ)) ((61146850613300995833/18446744073709551616:ℚ))
    block15Cuts remaining16 block15_normalization block15_checked tail16
  have hs : ((564631584594093627/9223372036854775808:ℚ):ℚ)+((61146850613300995833/18446744073709551616:ℚ))=((62276113782489183087/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining15,block15,hs] using h

def remaining14 : List NormalizedBlock := block14::remaining15
theorem tail14 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((369/1649:ℚ)) remaining14=some ((31782461484189379953/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block14Expr 18446744073709551616
    ((369/1649:ℚ)) ((15/64:ℚ)) ((1288809185889576819/18446744073709551616:ℚ)) ((62276113782489183087/18446744073709551616:ℚ))
    block14Cuts remaining15 block14_normalization block14_checked tail15
  have hs : ((1288809185889576819/18446744073709551616:ℚ):ℚ)+((62276113782489183087/18446744073709551616:ℚ))=((31782461484189379953/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining14,block14,hs] using h

def remaining13 : List NormalizedBlock := block13::remaining14
theorem tail13 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((107/512:ℚ)) remaining13=some ((2044108352336313599/576460752303423488:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block13Expr 18446744073709551616
    ((107/512:ℚ)) ((369/1649:ℚ)) ((923272153191637631/9223372036854775808:ℚ)) ((31782461484189379953/9223372036854775808:ℚ))
    block13Cuts remaining14 block13_normalization block13_checked tail14
  have hs : ((923272153191637631/9223372036854775808:ℚ):ℚ)+((31782461484189379953/9223372036854775808:ℚ))=((2044108352336313599/576460752303423488:ℚ)) := by norm_num
  simpa only [remaining13,block13,hs] using h

def remaining12 : List NormalizedBlock := block12::remaining13
theorem tail12 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((397/2048:ℚ)) remaining12=some ((67356298699465007357/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block12Expr 18446744073709551616
    ((397/2048:ℚ)) ((107/512:ℚ)) ((1944831424702972189/18446744073709551616:ℚ)) ((2044108352336313599/576460752303423488:ℚ))
    block12Cuts remaining13 block12_normalization block12_checked tail13
  have hs : ((1944831424702972189/18446744073709551616:ℚ):ℚ)+((2044108352336313599/576460752303423488:ℚ))=((67356298699465007357/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining12,block12,hs] using h

def remaining11 : List NormalizedBlock := block11::remaining12
theorem tail11 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((369/2033:ℚ)) remaining11=some ((17235402783261337185/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block11Expr 18446744073709551616
    ((369/2033:ℚ)) ((397/2048:ℚ)) ((1585312433580341383/18446744073709551616:ℚ)) ((67356298699465007357/18446744073709551616:ℚ))
    block11Cuts remaining12 block11_normalization block11_checked tail12
  have hs : ((1585312433580341383/18446744073709551616:ℚ):ℚ)+((67356298699465007357/18446744073709551616:ℚ))=((17235402783261337185/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining11,block11,hs] using h

def remaining10 : List NormalizedBlock := block10::remaining11
theorem tail10 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((120/697:ℚ)) remaining10=some ((8768408428336959039/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block10Expr 18446744073709551616
    ((120/697:ℚ)) ((369/2033:ℚ)) ((301414073412580893/4611686018427387904:ℚ)) ((17235402783261337185/4611686018427387904:ℚ))
    block10Cuts remaining11 block10_normalization block10_checked tail11
  have hs : ((301414073412580893/4611686018427387904:ℚ):ℚ)+((17235402783261337185/4611686018427387904:ℚ))=((8768408428336959039/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining10,block10,hs] using h

def remaining09 : List NormalizedBlock := block09::remaining10
theorem tail09 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((159/1024:ℚ)) remaining09=some ((9048443596219925167/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block09Expr 18446744073709551616
    ((159/1024:ℚ)) ((120/697:ℚ)) ((17502197992685383/144115188075855872:ℚ)) ((8768408428336959039/2305843009213693952:ℚ))
    block09Cuts remaining10 block09_normalization block09_checked tail10
  have hs : ((17502197992685383/144115188075855872:ℚ):ℚ)+((8768408428336959039/2305843009213693952:ℚ))=((9048443596219925167/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining09,block09,hs] using h

def remaining08 : List NormalizedBlock := block08::remaining09
theorem tail08 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((8/55:ℚ)) remaining08=some ((73725529852277258397/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block08Expr 18446744073709551616
    ((8/55:ℚ)) ((159/1024:ℚ)) ((1337981082517857061/18446744073709551616:ℚ)) ((9048443596219925167/2305843009213693952:ℚ))
    block08Cuts remaining09 block08_normalization block08_checked tail09
  have hs : ((1337981082517857061/18446744073709551616:ℚ):ℚ)+((9048443596219925167/2305843009213693952:ℚ))=((73725529852277258397/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining08,block08,hs] using h

def remaining07 : List NormalizedBlock := block07::remaining08
theorem tail07 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((261/2048:ℚ)) remaining07=some ((76214960698165172589/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block07Expr 18446744073709551616
    ((261/2048:ℚ)) ((8/55:ℚ)) ((155589427867994637/1152921504606846976:ℚ)) ((73725529852277258397/18446744073709551616:ℚ))
    block07Cuts remaining08 block07_normalization block07_checked tail08
  have hs : ((155589427867994637/1152921504606846976:ℚ):ℚ)+((73725529852277258397/18446744073709551616:ℚ))=((76214960698165172589/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining07,block07,hs] using h

def remaining06 : List NormalizedBlock := block06::remaining07
theorem tail06 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((61/512:ℚ)) remaining06=some ((9681483888618668403/2305843009213693952:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block06Expr 18446744073709551616
    ((61/512:ℚ)) ((261/2048:ℚ)) ((1236910410784174635/18446744073709551616:ℚ)) ((76214960698165172589/18446744073709551616:ℚ))
    block06Cuts remaining07 block06_normalization block06_checked tail07
  have hs : ((1236910410784174635/18446744073709551616:ℚ):ℚ)+((76214960698165172589/18446744073709551616:ℚ))=((9681483888618668403/2305843009213693952:ℚ)) := by norm_num
  simpa only [remaining06,block06,hs] using h

def remaining05 : List NormalizedBlock := block05::remaining06
theorem tail05 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((111/1024:ℚ)) remaining05=some ((79146066680402840067/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block05Expr 18446744073709551616
    ((111/1024:ℚ)) ((61/512:ℚ)) ((1694195571453492843/18446744073709551616:ℚ)) ((9681483888618668403/2305843009213693952:ℚ))
    block05Cuts remaining06 block05_normalization block05_checked tail06
  have hs : ((1694195571453492843/18446744073709551616:ℚ):ℚ)+((9681483888618668403/2305843009213693952:ℚ))=((79146066680402840067/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining05,block05,hs] using h

def remaining04 : List NormalizedBlock := block04::remaining05
theorem tail04 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((201/2048:ℚ)) remaining04=some ((20209763149090160707/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block04Expr 18446744073709551616
    ((201/2048:ℚ)) ((111/1024:ℚ)) ((1692985915957802761/18446744073709551616:ℚ)) ((79146066680402840067/18446744073709551616:ℚ))
    block04Cuts remaining05 block04_normalization block04_checked tail05
  have hs : ((1692985915957802761/18446744073709551616:ℚ):ℚ)+((79146066680402840067/18446744073709551616:ℚ))=((20209763149090160707/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining04,block04,hs] using h

def remaining03 : List NormalizedBlock := block03::remaining04
theorem tail03 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((113/1393:ℚ)) remaining03=some ((20906894532359248597/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block03Expr 18446744073709551616
    ((113/1393:ℚ)) ((201/2048:ℚ)) ((348565691634543945/2305843009213693952:ℚ)) ((20209763149090160707/4611686018427387904:ℚ))
    block03Cuts remaining04 block03_normalization block03_checked tail04
  have hs : ((348565691634543945/2305843009213693952:ℚ):ℚ)+((20209763149090160707/4611686018427387904:ℚ))=((20906894532359248597/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining03,block03,hs] using h

def remaining02 : List NormalizedBlock := block02::remaining03
theorem tail02 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((451/6597:ℚ)) remaining02=some ((42843436568706460265/9223372036854775808:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block02Expr 18446744073709551616
    ((451/6597:ℚ)) ((113/1393:ℚ)) ((1029647503987963071/9223372036854775808:ℚ)) ((20906894532359248597/4611686018427387904:ℚ))
    block02Cuts remaining03 block02_normalization block02_checked tail03
  have hs : ((1029647503987963071/9223372036854775808:ℚ):ℚ)+((20906894532359248597/4611686018427387904:ℚ))=((42843436568706460265/9223372036854775808:ℚ)) := by norm_num
  simpa only [remaining02,block02,hs] using h

def remaining01 : List NormalizedBlock := block01::remaining02
theorem tail01 : checkNormalizedPartition gatheredExpr 18446744073709551616 ((61/1024:ℚ)) remaining01=some ((87123815792653759451/18446744073709551616:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block01Expr 18446744073709551616
    ((61/1024:ℚ)) ((451/6597:ℚ)) ((1436942655240838921/18446744073709551616:ℚ)) ((42843436568706460265/9223372036854775808:ℚ))
    block01Cuts remaining02 block01_normalization block01_checked tail02
  have hs : ((1436942655240838921/18446744073709551616:ℚ):ℚ)+((42843436568706460265/9223372036854775808:ℚ))=((87123815792653759451/18446744073709551616:ℚ)) := by norm_num
  simpa only [remaining01,block01,hs] using h

def remaining00 : List NormalizedBlock := block00::remaining01
theorem tail00 : checkNormalizedPartition gatheredExpr 18446744073709551616 (0) remaining00=some ((24268814554881521781/4611686018427387904:ℚ)) := by
  have h := checkNormalizedPartition_cons gatheredExpr block00Expr 18446744073709551616
    (0) ((61/1024:ℚ)) ((9951442426872327673/18446744073709551616:ℚ)) ((87123815792653759451/18446744073709551616:ℚ))
    block00Cuts remaining01 block00_normalization block00_checked tail01
  have hs : ((9951442426872327673/18446744073709551616:ℚ):ℚ)+((87123815792653759451/18446744073709551616:ℚ))=((24268814554881521781/4611686018427387904:ℚ)) := by norm_num
  simpa only [remaining00,block00,hs] using h

theorem upper_partition_checked : checkNormalizedUnitIntegral gatheredExpr 18446744073709551616 remaining00=some ((24268814554881521781/4611686018427387904:ℚ)) := by
  simpa only [checkNormalizedUnitIntegral,show 0<(18446744073709551616:ℕ) by decide,ite_true] using tail00

theorem actual_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Set.Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..1,(actualChord rectangles weights x y u)^2)≤((24268814554881521781/4611686018427387904:ℚ):ℝ) :=
  NoThreeLine.AutoEnvelope.normalized_positive_certificate_sound rectangles weights positiveEdges negativeEdges
    queryRoot cap 18446744073709551616 remaining00 ((24268814554881521781/4611686018427387904:ℚ))
    (fullExpr rectangles weights positiveEdges queryRoot cap).unitNormalize gatheredExpr
    data_checked negative_edges_nonpositive rfl expression_from_actual_field upper_partition_checked x y hx hy
theorem original_chart_checked : qChartReindexCheck Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group4750.root queryRoot 1 chartPermutation=true := by
  have h := Phase15301Family01.original_chart_checked
  simp only [qChartReindexCheck,decide_eq_true_eq] at h ⊢
  exact ⟨h.1,h.2.1,rfl⟩

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Group4750.root.x0 : ℝ) Phase15301Group4750.root.x1)
    (hy : y∈Set.Icc (Phase15301Group4750.root.y0 : ℝ) Phase15301Group4750.root.y1) :
    (∫ u in (0 : ℝ)..1,(directionalChord 1 Phase15301Original.field0 x y u)^2)≤((24268814554881521781/4611686018427387904:ℚ) : ℝ) :=
  qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Group4750.root queryRoot 1 chartPermutation
    original_chart_checked ((24268814554881521781/4611686018427387904:ℚ) : ℝ) actual_integral_bound x y hx hy

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized






#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.upper_partition_checked
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.actual_integral_bound
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.original_directional_integral_bound
