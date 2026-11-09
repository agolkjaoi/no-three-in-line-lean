import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block17 : List (ℚ × AutoTrace) := [((28181/30467:ℚ),.add (.minLeft .auto) .auto),((28183/30465:ℚ),.add (.minLeft .auto) .auto),((3523/3808:ℚ),.add (.minLeft .auto) .auto),((6597/7105:ℚ),.add (.minLeft .auto) .auto),((26389/28419:ℚ),.add (.minLeft .auto) .auto),((26391/28417:ℚ),.add (.minLeft .auto) .auto),((3299/3552:ℚ),.add (.minLeft .auto) .auto),((235/253:ℚ),.add (.minLeft .auto) .auto),((59/63:ℚ),.add (.minLeft .auto) .auto),((4051/4263:ℚ),.add (.minLeft .auto) .auto),((12329/12789:ℚ),.add (.minLeft .auto) .auto),((12505/12789:ℚ),.add (.minLeft .auto) .auto),((1409/1421:ℚ),.add (.minLeft .auto) .auto),((3523/3552:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minLeft .auto) .auto)]
theorem block17_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((7045/7617:ℚ)) block17=
    some (1,(2309275299271306623/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block17_checked
