import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block17 : List (ℚ × AutoTrace) := [((18199/20225:ℚ),.add (.minLeft .auto) .auto),((2275/2528:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((5061/5569:ℚ),.add (.minLeft .auto) .auto),((4049/4455:ℚ),.add (.minLeft .auto) .auto),((20247/22273:ℚ),.add (.minLeft .auto) .auto),((2531/2784:ℚ),.add (.minLeft .auto) .auto),((233/255:ℚ),.add (.minLeft .auto) .auto),((5573/6081:ℚ),.add (.minLeft .auto) .auto),((22293/24323:ℚ),.add (.minLeft .auto) .auto),((22295/24321:ℚ),.add (.minLeft .auto) .auto),((2787/3040:ℚ),.add (.minLeft .auto) .auto),((6085/6593:ℚ),.add (.minLeft .auto) .auto),((24341/26371:ℚ),.add (.minLeft .auto) .auto),((24343/26369:ℚ),.add (.minLeft .auto) .auto),((3043/3296:ℚ),.add (.minLeft .auto) .auto),((7045/7617:ℚ),.add (.minLeft .auto) .auto),((28181/30467:ℚ),.add (.minLeft .auto) .auto),((28183/30465:ℚ),.add (.minLeft .auto) .auto),((3523/3808:ℚ),.add (.minLeft .auto) .auto),((6597/7105:ℚ),.add (.minLeft .auto) .auto),((26389/28419:ℚ),.add (.minLeft .auto) .auto),((26391/28417:ℚ),.add (.minLeft .auto) .auto),((3299/3552:ℚ),.add (.minLeft .auto) .auto)]
theorem block17_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((18197/20227:ℚ)) block17=
    some ((3299/3552:ℚ),(2014291120238642313/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block17_checked
