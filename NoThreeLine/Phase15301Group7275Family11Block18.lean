import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block18 : List (ℚ × AutoTrace) := [((235/253:ℚ),.add (.minLeft .auto) .auto),((59/63:ℚ),.add (.minLeft .auto) .auto),((4051/4263:ℚ),.add (.minLeft .auto) .auto),((12329/12789:ℚ),.add (.minLeft .auto) .auto),((12505/12789:ℚ),.add (.minLeft .auto) .auto),((1409/1421:ℚ),.add (.minLeft .auto) .auto),((3523/3552:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block18_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((3299/3552:ℚ)) block18=
    some (1,(600585653152178063/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block18_checked
