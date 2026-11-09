import NoThreeLine.Phase15301Group7275Family10Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family10
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((13/32:ℚ),.add (.minLeft .auto) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((15/32:ℚ),.add (.minLeft .auto) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minLeft .auto) .auto),((19/32:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((23/32:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((7/8:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((25/64:ℚ)) block04=
    some (1,(1865889602769673489/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family10
#print axioms NoThreeLine.Phase15301Group7275.Family10.block04_checked
