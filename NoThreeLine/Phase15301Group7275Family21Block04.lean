import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((7957/28419:ℚ),.add (.minLeft .auto) .auto),((166294977399/593933198692:ℚ),.add (.minLeft .auto) .auto),((7959/28417:ℚ),.add (.minLeft .auto) .auto),((995/3552:ℚ),.add (.minLeft .auto) .auto),((1477/5057:ℚ),.add (.minLeft .auto) .auto),((5909/20227:ℚ),.add (.minLeft .auto) .auto),((425245561901/1455331532275:ℚ),.add (.minLeft .auto) .auto),((5911/20225:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((739/2528:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1989/6593:ℚ),.add (.minLeft .auto) .auto),((995/3296:ℚ),.add (.minLeft .auto) .auto),((151/491:ℚ),.add (.minLeft .auto) .auto),((2501/8129:ℚ),.add (.minLeft .auto) .auto),((1251/4064:ℚ),.add (.minLeft .auto) .auto),((623576074/2023460653:ℚ),.add (.minLeft .auto) .auto),((227/736:ℚ),.add (.minLeft .auto) .auto),((965/3009:ℚ),.add (.minLeft .auto) .auto),((483/1504:ℚ),.add (.minLeft .auto) .auto),((1477/4545:ℚ),.add (.minLeft .auto) .auto),((739/2272:ℚ),.add (.minLeft .auto) .auto),((663/2027:ℚ),.add (.minLeft .auto) .auto),((199/608:ℚ),.add (.minLeft .auto) .auto),((2501/7617:ℚ),.add (.minLeft .auto) .auto),((10005/30467:ℚ),.add (.minLeft .auto) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1989/7105:ℚ)) block04=
    some ((10005/30467:ℚ),(3377141597884690071/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block04_checked
