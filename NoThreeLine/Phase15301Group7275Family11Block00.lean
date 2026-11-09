import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block00 : List (ℚ × AutoTrace) := [((453/8129:ℚ),.add (.minLeft .auto) .auto),((227/4064:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((151/2539:ℚ),.add (.minLeft .auto) .auto),((1813/30467:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((121/2031:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/3808:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((453/7105:ℚ),.add (.minLeft .auto) .auto),((1377046162/21565765445:ℚ),.add (.minLeft .auto) .auto),((227/3552:ℚ),.add (.minLeft .auto) .auto),((453/6593:ℚ),.add (.minLeft .auto) .auto),((227/3296:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((151/2027:ℚ),.add (.minLeft .auto) .auto),((19498208629/261394367621:ℚ),.add (.minLeft .auto) .auto),((227/3040:ℚ),.add (.minLeft .auto) .auto),((453/5569:ℚ),.add (.minLeft .auto) .auto),((1813/22275:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1815/22273:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/2784:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((453/5057:ℚ),.add (.minLeft .auto) .auto),((227/2528:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((151/1515:ℚ),.add (.minLeft .auto) .auto),((37/371:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((605/6059:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/2272:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block00_checked : checkUpperBlock gatheredExpr 18446744073709551616 (0) block00=
    some ((227/2272:ℚ),(15289308417401849887/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block00_checked
