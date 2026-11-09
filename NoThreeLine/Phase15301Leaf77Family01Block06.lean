import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block06 : List (ℚ × BoundTrace) := [((77745875587/212337601421:ℚ),.add (.minRight (.add (.minLeft .exact) .exact)) .exact),((23623/64517:ℚ),.add (.minLeft .exact) .exact),((5906/16129:ℚ),.add (.minLeft .exact) .exact),((12049/32514:ℚ),.add (.minLeft .exact) .exact),((48197/130055:ℚ),.add (.minLeft .exact) .exact),((48199/130053:ℚ),.add (.minLeft .exact) .exact),((12050/32513:ℚ),.add (.minLeft .exact) .exact),((10001/26370:ℚ),.add (.minLeft .exact) .exact),((40005/105479:ℚ),.add (.minLeft .exact) .exact),((40007/105477:ℚ),.add (.minLeft .exact) .exact),((1127892859055/2973638732938:ℚ),.add (.minLeft .exact) .exact),((10002/26369:ℚ),.add (.minLeft .exact) .exact),((3857/9986:ℚ),.add (.minLeft .exact) .exact),((15429/39943:ℚ),.add (.minLeft .exact) .exact),((15431/39941:ℚ),.add (.minLeft .exact) .exact),((3858/9985:ℚ),.add (.minLeft .exact) .exact),((2651/6742:ℚ),.add (.minLeft .exact) .exact),((31813/80903:ℚ),.add (.minLeft .exact) .exact),((35/89:ℚ),.add (.minLeft .exact) .exact),((7954/20225:ℚ),.add (.minLeft .exact) .exact),((12049/30466:ℚ),.add (.minLeft .exact) .exact),((2410/6093:ℚ),.add (.minLeft .exact) .exact),((10001/24322:ℚ),.add (.minLeft .exact) .exact),((3334/8107:ℚ),.add (.minLeft .exact) .exact)]
theorem block06_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1817/4963:ℚ)) block06=
    some ((3334/8107:ℚ),(526804997973112459/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block06_checked
