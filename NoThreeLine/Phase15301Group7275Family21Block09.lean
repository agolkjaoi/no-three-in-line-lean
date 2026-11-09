import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block09 : List (ℚ × AutoTrace) := [((199/352:ℚ),.add (.minLeft .auto) .auto),((4037/7105:ℚ),.add (.minLeft .auto) .auto),((59698080133/105063422216:ℚ),.add (.minLeft .auto) .auto),((5383/9473:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((16151/28417:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((358262316977/630306697117:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((673/1184:ℚ),.add (.minLeft .auto) .auto),((1175/2027:ℚ),.add (.minLeft .auto) .auto),((1763/3040:ℚ),.add (.minLeft .auto) .auto),((1477/2497:ℚ),.add (.minLeft .auto) .auto),((74338727593/125656208255:ℚ),.add (.minLeft .auto) .auto),((5909/9987:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((281607060111/475898301049:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5911/9985:ℚ),.add (.minLeft .auto) .auto),((739/1248:ℚ),.add (.minLeft .auto) .auto),((3013/5057:ℚ),.add (.minLeft .auto) .auto),((12053/20227:ℚ),.add (.minLeft .auto) .auto),((2411/4045:ℚ),.add (.minLeft .auto) .auto),((1507/2528:ℚ),.add (.minLeft .auto) .auto),((4549/7617:ℚ),.add (.minLeft .auto) .auto),((18197/30467:ℚ),.add (.minLeft .auto) .auto),((18199/30465:ℚ),.add (.minLeft .auto) .auto),((325/544:ℚ),.add (.minLeft .auto) .auto),((4037/6593:ℚ),.add (.minLeft .auto) .auto)]
theorem block09_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1989/3521:ℚ)) block09=
    some ((4037/6593:ℚ),(3854266136636850367/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block09_checked
