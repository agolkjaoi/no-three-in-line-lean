import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block11 : List (ℚ × AutoTrace) := [((3525/5569:ℚ),.add (.minLeft .auto) .auto),((1763/2784:ℚ),.add (.minLeft .auto) .auto),((4549/7105:ℚ),.add (.minLeft .auto) .auto),((589904138143/921338241065:ℚ),.add (.minLeft .auto) .auto),((2275/3552:ℚ),.add (.minLeft .auto) .auto),((965/1473:ℚ),.add (.minLeft .auto) .auto),((3861/5891:ℚ),.add (.minLeft .auto) .auto),((92432183216/140937949169:ℚ),.add (.minLeft .auto) .auto),((3863/5889:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((39/59:ℚ),.add (.minLeft .auto) .auto),((209082203273/316126804057:ℚ),.add (.minLeft .auto) .auto),((995/1504:ℚ),.add (.minLeft .auto) .auto),((3013/4545:ℚ),.add (.minLeft .auto) .auto),((1507/2272:ℚ),.add (.minLeft .auto) .auto),((4037/6081:ℚ),.add (.minLeft .auto) .auto),((16149/24323:ℚ),.add (.minLeft .auto) .auto),((16151/24321:ℚ),.add (.minLeft .auto) .auto),((2019/3040:ℚ),.add (.minLeft .auto) .auto),((1687/2539:ℚ),.add (.minLeft .auto) .auto),((20245/30467:ℚ),.add (.minLeft .auto) .auto),((6749/10155:ℚ),.add (.minLeft .auto) .auto),((2531/3808:ℚ),.add (.minLeft .auto) .auto),((41796483/61910464:ℚ),.add (.minLeft .auto) .auto)]
theorem block11_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((2531/4064:ℚ)) block11=
    some ((41796483/61910464:ℚ),(4017896363081924641/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block11_checked
