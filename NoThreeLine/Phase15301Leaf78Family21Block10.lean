import NoThreeLine.Phase15301Leaf78Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family21
open AutoEnvelope

def block10 : List (ℚ × AutoTrace) := [((225/256:ℚ),.add (.minLeft .auto) .auto),((113/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/256:ℚ),.add (.minLeft .auto) .auto),((455/512:ℚ),.add (.minLeft .auto) .auto),((57/64:ℚ),.add (.minLeft .auto) .auto),((115/128:ℚ),.add (.minLeft .auto) .auto),((231/256:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((233/256:ℚ),.add (.minLeft .auto) .auto),((117/128:ℚ),.add (.minLeft .auto) .auto),((469/512:ℚ),.add (.minLeft .auto) .auto),((235/256:ℚ),.add (.minLeft .auto) .auto),((59/64:ℚ),.add (.minLeft .auto) .auto),((473/512:ℚ),.add (.minLeft .auto) .auto),((947/1024:ℚ),.add (.minLeft .auto) .auto),((237/256:ℚ),.add (.minLeft .auto) .auto),((119/128:ℚ),.add (.minLeft .auto) .auto),((239/256:ℚ),.add (.minLeft .auto) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),((61/64:ℚ),.add (.minLeft .auto) .auto),((31/32:ℚ),.add (.minLeft .auto) .auto),((63/64:ℚ),.add (.minLeft .auto) .auto),((253/256:ℚ),.add (.minLeft .auto) .auto),((127/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block10_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((7/8:ℚ)) block10=
    some ((127/128:ℚ),(7438194758798137447/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family21
#print axioms NoThreeLine.Phase15301Leaf78.Family21.block10_checked
