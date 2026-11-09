import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block00 : List (ℚ × AutoTrace) := [((453/8129:ℚ),.add (.minLeft .auto) .auto),((227/4064:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((151/2539:ℚ),.add (.minLeft .auto) .auto),((227/3808:ℚ),.add (.minLeft .auto) .auto),((453/7105:ℚ),.add (.minLeft .auto) .auto),((1813/28419:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1815/28417:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/3552:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((453/6593:ℚ),.add (.minLeft .auto) .auto),((2783869024/40443647477:ℚ),.add (.minLeft .auto) .auto),((227/3296:ℚ),.add (.minLeft .auto) .auto),((151/2027:ℚ),.add (.minLeft .auto) .auto),((227/3040:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((453/5569:ℚ),.add (.minLeft .auto) .auto),((227/2784:ℚ),.add (.minLeft .auto) .auto),((453/5057:ℚ),.add (.minLeft .auto) .auto),((227/2528:ℚ),.add (.minLeft .auto) .auto),((151/1515:ℚ),.add (.minLeft .auto) .auto),((37/371:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((605/6059:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/2272:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((453/4033:ℚ),.add (.minLeft .auto) .auto),((1813/16131:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1815/16129:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block00_checked : checkUpperBlock gatheredExpr 18446744073709551616 (0) block00=
    some ((1815/16129:ℚ),(10842908522673384027/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block00_checked
