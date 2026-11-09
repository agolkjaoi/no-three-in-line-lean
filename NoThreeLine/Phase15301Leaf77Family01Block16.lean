import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block16 : List (ℚ × BoundTrace) := [((72773/80903:ℚ),.add (.minLeft .exact) .exact),((72775/80901:ℚ),.add (.minLeft .exact) .exact),((18194/20225:ℚ),.add (.minLeft .exact) .exact),((20241/22274:ℚ),.add (.minLeft .exact) .exact),((16193/17819:ℚ),.add (.minLeft .exact) .exact),((80967/89093:ℚ),.add (.minLeft .exact) .exact),((20242/22273:ℚ),.add (.minLeft .exact) .exact),((22289/24322:ℚ),.add (.minLeft .exact) .exact),((781337467000/852597108089:ℚ),.add (.minLeft .exact) .exact),((29719/32429:ℚ),.add (.minLeft .exact) .exact),((89159/97285:ℚ),.add (.minLeft .exact) .exact),((7430/8107:ℚ),.add (.minLeft .exact) .exact),((24337/26370:ℚ),.add (.minLeft .exact) .exact),((97349/105479:ℚ),.add (.minLeft .exact) .exact),((97351/105477:ℚ),.add (.minLeft .exact) .exact),((24338/26369:ℚ),.add (.minLeft .exact) .exact),((28177/30466:ℚ),.add (.minLeft .exact) .exact),((112709/121863:ℚ),.add (.minLeft .exact) .exact),((112711/121861:ℚ),.add (.minLeft .exact) .exact),((28178/30465:ℚ),.add (.minLeft .exact) .exact),((26385/28418:ℚ),.add (.minLeft .exact) .exact),((105541/113671:ℚ),.add (.minLeft .exact) .exact),((105543/113669:ℚ),.add (.minLeft .exact) .exact),((26386/28417:ℚ),.add (.minLeft .exact) .exact)]
theorem block16_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((18193/20226:ℚ)) block16=
    some ((26386/28417:ℚ),(1025886579877366919/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block16_checked
