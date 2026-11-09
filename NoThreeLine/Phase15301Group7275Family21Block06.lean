import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block06 : List (ℚ × AutoTrace) := [((3013/7617:ℚ),.add (.minLeft .auto) .auto),((1507/3808:ℚ),.add (.minLeft .auto) .auto),((18687875/46312896:ℚ),.add (.minLeft .auto) .auto),((2501/6081:ℚ),.add (.minLeft .auto) .auto),((1251/3040:ℚ),.add (.minLeft .auto) .auto),((211/503:ℚ),.add (.minLeft .auto) .auto),((5909/14083:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5911/14081:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((30762987121/73279995461:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((739/1760:ℚ),.add (.minLeft .auto) .auto),((3013/7105:ℚ),.add (.minLeft .auto) .auto),((12053/28419:ℚ),.add (.minLeft .auto) .auto),((12055/28417:ℚ),.add (.minLeft .auto) .auto),((1507/3552:ℚ),.add (.minLeft .auto) .auto),((3525/8129:ℚ),.add (.minLeft .auto) .auto),((1763/4064:ℚ),.add (.minLeft .auto) .auto),((221/505:ℚ),.add (.minLeft .auto) .auto),((7957/18179:ℚ),.add (.minLeft .auto) .auto),((2653/6059:ℚ),.add (.minLeft .auto) .auto),((995/2272:ℚ),.add (.minLeft .auto) .auto),((2501/5569:ℚ),.add (.minLeft .auto) .auto),((417/928:ℚ),.add (.minLeft .auto) .auto),((3013/6593:ℚ),.add (.minLeft .auto) .auto),((12053/26371:ℚ),.add (.minLeft .auto) .auto)]
theorem block06_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((995/2528:ℚ)) block06=
    some ((12053/26371:ℚ),(4954093853352544353/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block06_checked
