import NoThreeLine.Phase15301Leaf74Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family01
open AutoEnvelope

def block07 : List (ℚ × AutoTrace) := [((249/512:ℚ),.add (.minLeft .auto) .auto),((125/256:ℚ),.add (.minLeft .auto) .auto),((251/512:ℚ),.add (.minLeft .auto) .auto),((503/1024:ℚ),.add (.minLeft .auto) .auto),((63/128:ℚ),.add (.minLeft .auto) .auto),((505/1024:ℚ),.add (.minLeft .auto) .auto),((253/512:ℚ),.add (.minLeft .auto) .auto),((507/1024:ℚ),.add (.minLeft .auto) .auto),((127/256:ℚ),.add (.minLeft .auto) .auto),((255/512:ℚ),.add (.minLeft .auto) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((33/64:ℚ),.add (.minLeft .auto) .auto),((67/128:ℚ),.add (.minLeft .auto) .auto),((135/256:ℚ),.add (.minLeft .auto) .auto),((271/512:ℚ),.add (.minLeft .auto) .auto),((543/1024:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((273/512:ℚ),.add (.minLeft .auto) .auto),((137/256:ℚ),.add (.minLeft .auto) .auto),((69/128:ℚ),.add (.minLeft .auto) .auto),((277/512:ℚ),.add (.minLeft .auto) .auto),((139/256:ℚ),.add (.minLeft .auto) .auto),((35/64:ℚ),.add (.minLeft .auto) .auto),((281/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block07_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((31/64:ℚ)) block07=
    some ((281/512:ℚ),(5592780673571963385/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family01
#print axioms NoThreeLine.Phase15301Leaf74.Family01.block07_checked
