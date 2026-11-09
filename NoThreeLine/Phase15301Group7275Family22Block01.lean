import NoThreeLine.Phase15301Group7275Family22Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family22
open AutoEnvelope

def block01 : List (ℚ × AutoTrace) := [((7/256:ℚ),.add (.minLeft .auto) .auto),((1/32:ℚ),.add (.minLeft .auto) .auto),((9/256:ℚ),.add (.minLeft .auto) .auto),((5/128:ℚ),.add (.minLeft .auto) .auto),((11/256:ℚ),.add (.minLeft .auto) .auto),((3/64:ℚ),.add (.minLeft .auto) .auto),((7/128:ℚ),.add (.minLeft .auto) .auto),((1/16:ℚ),.add (.minLeft .auto) .auto),((9/128:ℚ),.add (.minLeft .auto) .auto),((5/64:ℚ),.add (.minLeft .auto) .auto),((3/32:ℚ),.add (.minLeft .auto) .auto),((7/64:ℚ),.add (.minLeft .auto) .auto),((1/8:ℚ),.add (.minLeft .auto) .auto),((9/64:ℚ),.add (.minLeft .auto) .auto),((5/32:ℚ),.add (.minLeft .auto) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((7/32:ℚ),.add (.minLeft .auto) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((5/16:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minLeft .auto) .auto)]
theorem block01_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((13/512:ℚ)) block01=
    some ((9/16:ℚ),(3957439429593583293/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family22
#print axioms NoThreeLine.Phase15301Group7275.Family22.block01_checked
