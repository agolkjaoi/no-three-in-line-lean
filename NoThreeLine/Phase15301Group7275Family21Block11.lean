import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block11 : List (ℚ × AutoTrace) := [((21/32:ℚ),.add (.minLeft .auto) .auto),((39/59:ℚ),.add (.minLeft .auto) .auto),((7957/12035:ℚ),.add (.minLeft .auto) .auto),((379/573:ℚ),.add (.minLeft .auto) .auto),((995/1504:ℚ),.add (.minLeft .auto) .auto),((3013/4545:ℚ),.add (.minLeft .auto) .auto),((12053/18179:ℚ),.add (.minLeft .auto) .auto),((270833150403/408396026029:ℚ),.add (.minLeft .auto) .auto),((12055/18177:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((57178051009/86212396792:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1507/2272:ℚ),.add (.minLeft .auto) .auto),((4037/6081:ℚ),.add (.minLeft .auto) .auto),((2019/3040:ℚ),.add (.minLeft .auto) .auto),((1687/2539:ℚ),.add (.minLeft .auto) .auto),((2531/3808:ℚ),.add (.minLeft .auto) .auto),((41796483/61910464:ℚ),.add (.minLeft .auto) .auto),((5573/8129:ℚ),.add (.minLeft .auto) .auto),((22293/32515:ℚ),.add (.minLeft .auto) .auto),((1715/2501:ℚ),.add (.minLeft .auto) .auto),((2787/4064:ℚ),.add (.minLeft .auto) .auto),((4549/6593:ℚ),.add (.minLeft .auto) .auto),((2275/3296:ℚ),.add (.minLeft .auto) .auto),((3525/5057:ℚ),.add (.minLeft .auto) .auto),((1763/2528:ℚ),.add (.minLeft .auto) .auto)]
theorem block11_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((3863/5889:ℚ)) block11=
    some ((1763/2528:ℚ),(2897628278926160151/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block11_checked
