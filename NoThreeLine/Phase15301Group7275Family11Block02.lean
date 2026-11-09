import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((483/3040:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((965/5569:ℚ),.add (.minLeft .auto) .auto),((153163014215/883402493917:ℚ),.add (.minLeft .auto) .auto),((161/928:ℚ),.add (.minLeft .auto) .auto),((453/2497:ℚ),.add (.minLeft .auto) .auto),((1813/9987:ℚ),.add (.minLeft .auto) .auto),((1477/8129:ℚ),.add (.minLeft .auto) .auto),((363/1997:ℚ),.add (.minLeft .auto) .auto),((739/4064:ℚ),.add (.minLeft .auto) .auto),((227/1248:ℚ),.add (.minLeft .auto) .auto),((965/5057:ℚ),.add (.minLeft .auto) .auto),((3861/20227:ℚ),.add (.minLeft .auto) .auto),((27740605316/145243208493:ℚ),.add (.minLeft .auto) .auto),((3863/20225:ℚ),.add (.minLeft .auto) .auto),((483/2528:ℚ),.add (.minLeft .auto) .auto),((1477/7617:ℚ),.add (.minLeft .auto) .auto),((739/3808:ℚ),.add (.minLeft .auto) .auto),((211/1015:ℚ),.add (.minLeft .auto) .auto),((5909/28419:ℚ),.add (.minLeft .auto) .auto),((464932709417/2235884309343:ℚ),.add (.minLeft .auto) .auto),((5911/28417:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((739/3552:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((193/909:ℚ),.add (.minLeft .auto) .auto),((483/2272:ℚ),.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((3863/24321:ℚ)) block02=
    some ((483/2272:ℚ),(3360954036950785013/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block02_checked
