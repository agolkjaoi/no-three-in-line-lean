import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block00 : List (ℚ × AutoTrace) := [((453/8129:ℚ),.add (.minLeft .auto) .auto),((259/4645:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1815/32513:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/4064:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((151/2539:ℚ),.add (.minLeft .auto) .auto),((1813/30467:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((121/2031:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/3808:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((453/7105:ℚ),.add (.minLeft .auto) .auto),((25848298644/404787234445:ℚ),.add (.minLeft .auto) .auto),((227/3552:ℚ),.add (.minLeft .auto) .auto),((453/6593:ℚ),.add (.minLeft .auto) .auto),((1813/26371:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((34929706667/507764465795:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1815/26369:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/3296:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((151/2027:ℚ),.add (.minLeft .auto) .auto),((227/3040:ℚ),.add (.minLeft .auto) .auto),((453/5569:ℚ),.add (.minLeft .auto) .auto),((41014873703/503759490869:ℚ),.add (.minLeft .auto) .auto),((227/2784:ℚ),.add (.minLeft .auto) .auto),((453/5057:ℚ),.add (.minLeft .auto) .auto),((227/2528:ℚ),.add (.minLeft .auto) .auto),((151/1515:ℚ),.add (.minLeft .auto) .auto)]
theorem block00_checked : checkUpperBlock gatheredExpr 18446744073709551616 (0) block00=
    some ((151/1515:ℚ),(2060702952997431573/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block00_checked
