import NoThreeLine.Phase15301Leaf74Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family01
open AutoEnvelope

def block13 : List (ℚ × AutoTrace) := [((225/256:ℚ),.add (.minLeft .auto) .auto),((451/512:ℚ),.add (.minLeft .auto) .auto),((903/1024:ℚ),.add (.minLeft .auto) .auto),((113/128:ℚ),.add (.minLeft .auto) .auto),((227/256:ℚ),.add (.minLeft .auto) .auto),((455/512:ℚ),.add (.minLeft .auto) .auto),((57/64:ℚ),.add (.minLeft .auto) .auto),((115/128:ℚ),.add (.minLeft .auto) .auto),((921/1024:ℚ),.add (.minLeft .auto) .auto),((461/512:ℚ),.add (.minLeft .auto) .auto),((231/256:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((465/512:ℚ),.add (.minLeft .auto) .auto),((233/256:ℚ),.add (.minLeft .auto) .auto),((117/128:ℚ),.add (.minLeft .auto) .auto),((469/512:ℚ),.add (.minLeft .auto) .auto),((939/1024:ℚ),.add (.minLeft .auto) .auto),((235/256:ℚ),.add (.minLeft .auto) .auto),((59/64:ℚ),.add (.minLeft .auto) .auto),((945/1024:ℚ),.add (.minLeft .auto) .auto),((473/512:ℚ),.add (.minLeft .auto) .auto),((947/1024:ℚ),.add (.minLeft .auto) .auto),((237/256:ℚ),.add (.minLeft .auto) .auto),((475/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block13_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((7/8:ℚ)) block13=
    some ((475/512:ℚ),(3603568311842326711/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family01
#print axioms NoThreeLine.Phase15301Leaf74.Family01.block13_checked
