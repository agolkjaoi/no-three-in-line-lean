import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((37/371:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((14607023899/146427512225:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((605/6059:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/2272:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1944707/18325952:ℚ),.add (.minLeft .auto) .auto),((453/4033:ℚ),.add (.minLeft .auto) .auto),((227/2016:ℚ),.add (.minLeft .auto) .auto),((965/8129:ℚ),.add (.minLeft .auto) .auto),((3861/32515:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3863/32513:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((483/4064:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((7600771/61910976:ℚ),.add (.minLeft .auto) .auto),((965/7617:ℚ),.add (.minLeft .auto) .auto),((3861/30467:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3863/30465:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((69/544:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((453/3521:ℚ),.add (.minLeft .auto) .auto),((227/1760:ℚ),.add (.minLeft .auto) .auto),((193/1421:ℚ),.add (.minLeft .auto) .auto),((161/1184:ℚ),.add (.minLeft .auto) .auto),((965/6593:ℚ),.add (.minLeft .auto) .auto),((3310406499/22601788369:ℚ),.add (.minLeft .auto) .auto),((483/3296:ℚ),.add (.minLeft .auto) .auto),((151/1003:ℚ),.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((151/1515:ℚ)) block01=
    some ((151/1003:ℚ),(7568748260836434611/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block01_checked
