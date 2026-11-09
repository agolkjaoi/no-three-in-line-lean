import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((227/2016:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((965/8129:ℚ),.add (.minLeft .auto) .auto),((483/4064:ℚ),.add (.minLeft .auto) .auto),((965/7617:ℚ),.add (.minLeft .auto) .auto),((69/544:ℚ),.add (.minLeft .auto) .auto),((453/3521:ℚ),.add (.minLeft .auto) .auto),((15728567697/122106482843:ℚ),.add (.minLeft .auto) .auto),((227/1760:ℚ),.add (.minLeft .auto) .auto),((193/1421:ℚ),.add (.minLeft .auto) .auto),((161/1184:ℚ),.add (.minLeft .auto) .auto),((965/6593:ℚ),.add (.minLeft .auto) .auto),((163762964817/1118662754543:ℚ),.add (.minLeft .auto) .auto),((3861/26371:ℚ),.add (.minLeft .auto) .auto),((47260482809/322672262828:ℚ),.add (.minLeft .auto) .auto),((3863/26369:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((483/3296:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((151/1003:ℚ),.add (.minLeft .auto) .auto),((1813/12035:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((605/4011:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/1504:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((965/6081:ℚ),.add (.minLeft .auto) .auto),((483/3040:ℚ),.add (.minLeft .auto) .auto),((965/5569:ℚ),.add (.minLeft .auto) .auto),((217607095415/1255492999051:ℚ),.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1815/16129:ℚ)) block01=
    some ((217607095415/1255492999051:ℚ),(1112398195636979445/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block01_checked
