import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block17 : List (ℚ × AutoTrace) := [((22293/24323:ℚ),.add (.minLeft .auto) .auto),((22295/24321:ℚ),.add (.minLeft .auto) .auto),((2787/3040:ℚ),.add (.minLeft .auto) .auto),((6085/6593:ℚ),.add (.minLeft .auto) .auto),((24341/26371:ℚ),.add (.minLeft .auto) .auto),((24343/26369:ℚ),.add (.minLeft .auto) .auto),((3043/3296:ℚ),.add (.minLeft .auto) .auto),((7045/7617:ℚ),.add (.minLeft .auto) .auto),((28181/30467:ℚ),.add (.minLeft .auto) .auto),((28183/30465:ℚ),.add (.minLeft .auto) .auto),((3523/3808:ℚ),.add (.minLeft .auto) .auto),((6597/7105:ℚ),.add (.minLeft .auto) .auto),((26389/28419:ℚ),.add (.minLeft .auto) .auto),((26391/28417:ℚ),.add (.minLeft .auto) .auto),((3299/3552:ℚ),.add (.minLeft .auto) .auto),((235/253:ℚ),.add (.minLeft .auto) .auto),((7109/7617:ℚ),.add (.minLeft .auto) .auto),((28437/30467:ℚ),.add (.minLeft .auto) .auto),((28439/30465:ℚ),.add (.minLeft .auto) .auto),((3555/3808:ℚ),.add (.minLeft .auto) .auto),((59/63:ℚ),.add (.minLeft .auto) .auto),((4051/4263:ℚ),.add (.minLeft .auto) .auto),((12329/12789:ℚ),.add (.minLeft .auto) .auto),((1409/1421:ℚ),.add (.minLeft .auto) .auto)]
theorem block17_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((5573/6081:ℚ)) block17=
    some ((1409/1421:ℚ),(601356477538446943/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block17_checked
