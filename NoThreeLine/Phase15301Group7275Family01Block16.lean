import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block16 : List (ℚ × AutoTrace) := [((4037/4545:ℚ),.add (.minLeft .auto) .auto),((2307/2597:ℚ),.add (.minLeft .auto) .auto),((16151/18177:ℚ),.add (.minLeft .auto) .auto),((2019/2272:ℚ),.add (.minLeft .auto) .auto),((4549/5057:ℚ),.add (.minLeft .auto) .auto),((18197/20227:ℚ),.add (.minLeft .auto) .auto),((18199/20225:ℚ),.add (.minLeft .auto) .auto),((2275/2528:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((5061/5569:ℚ),.add (.minLeft .auto) .auto),((4049/4455:ℚ),.add (.minLeft .auto) .auto),((20247/22273:ℚ),.add (.minLeft .auto) .auto),((2531/2784:ℚ),.add (.minLeft .auto) .auto),((233/255:ℚ),.add (.minLeft .auto) .auto),((5573/6081:ℚ),.add (.minLeft .auto) .auto),((22293/24323:ℚ),.add (.minLeft .auto) .auto),((580445254357/633265057162:ℚ),.add (.minLeft .auto) .auto),((22295/24321:ℚ),.add (.minLeft .auto) .auto),((2787/3040:ℚ),.add (.minLeft .auto) .auto),((6085/6593:ℚ),.add (.minLeft .auto) .auto),((24341/26371:ℚ),.add (.minLeft .auto) .auto),((24343/26369:ℚ),.add (.minLeft .auto) .auto),((3043/3296:ℚ),.add (.minLeft .auto) .auto),((7045/7617:ℚ),.add (.minLeft .auto) .auto)]
theorem block16_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((3331/3776:ℚ)) block16=
    some ((7045/7617:ℚ),(2956477521283345225/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block16_checked
