import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((453/4033:ℚ),.add (.minLeft .auto) .auto),((227/2016:ℚ),.add (.minLeft .auto) .auto),((965/8129:ℚ),.add (.minLeft .auto) .auto),((3861/32515:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3863/32513:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((483/4064:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((965/7617:ℚ),.add (.minLeft .auto) .auto),((3861/30467:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3863/30465:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((69/544:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((453/3521:ℚ),.add (.minLeft .auto) .auto),((227/1760:ℚ),.add (.minLeft .auto) .auto),((193/1421:ℚ),.add (.minLeft .auto) .auto),((161/1184:ℚ),.add (.minLeft .auto) .auto),((965/6593:ℚ),.add (.minLeft .auto) .auto),((483/3296:ℚ),.add (.minLeft .auto) .auto),((151/1003:ℚ),.add (.minLeft .auto) .auto),((3079885679/20452698119:ℚ),.add (.minLeft .auto) .auto),((227/1504:ℚ),.add (.minLeft .auto) .auto),((965/6081:ℚ),.add (.minLeft .auto) .auto),((88870776651/559889715625:ℚ),.add (.minLeft .auto) .auto),((297/1871:ℚ),.add (.minLeft .auto) .auto),((85201099661/536591165823:ℚ),.add (.minLeft .auto) .auto),((3863/24321:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((227/2272:ℚ)) block01=
    some ((3863/24321:ℚ),(7876977298033310513/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block01_checked
