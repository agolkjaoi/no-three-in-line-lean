import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block07 : List (ℚ × AutoTrace) := [((12053/28419:ℚ),.add (.minLeft .auto) .auto),((12055/28417:ℚ),.add (.minLeft .auto) .auto),((1507/3552:ℚ),.add (.minLeft .auto) .auto),((3525/8129:ℚ),.add (.minLeft .auto) .auto),((14101/32515:ℚ),.add (.minLeft .auto) .auto),((14103/32513:ℚ),.add (.minLeft .auto) .auto),((1763/4064:ℚ),.add (.minLeft .auto) .auto),((221/505:ℚ),.add (.minLeft .auto) .auto),((995/2272:ℚ),.add (.minLeft .auto) .auto),((2501/5569:ℚ),.add (.minLeft .auto) .auto),((667/1485:ℚ),.add (.minLeft .auto) .auto),((10007/22273:ℚ),.add (.minLeft .auto) .auto),((417/928:ℚ),.add (.minLeft .auto) .auto),((3013/6593:ℚ),.add (.minLeft .auto) .auto),((1507/3296:ℚ),.add (.minLeft .auto) .auto),((1175/2539:ℚ),.add (.minLeft .auto) .auto),((14101/30467:ℚ),.add (.minLeft .auto) .auto),((1567/3385:ℚ),.add (.minLeft .auto) .auto),((1763/3808:ℚ),.add (.minLeft .auto) .auto),((453/961:ℚ),.add (.minLeft .auto) .auto),((259/549:ℚ),.add (.minLeft .auto) .auto),((42105851213/89245918357:ℚ),.add (.minLeft .auto) .auto),((1815/3841:ℚ),.add (.minLeft .auto) .auto),((227/480:ℚ),.add (.minLeft .auto) .auto)]
theorem block07_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((3013/7105:ℚ)) block07=
    some ((227/480:ℚ),(4178543892659754975/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block07_checked
