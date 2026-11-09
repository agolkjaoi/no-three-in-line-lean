import NoThreeLine.Phase15301Leaf75Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family01
open AutoEnvelope

def block08 : List (ℚ × AutoTrace) := [((121/256:ℚ),.add (.minLeft .auto) .auto),((61/128:ℚ),.add (.minLeft .auto) .auto),((31/64:ℚ),.add (.minLeft .auto) .auto),((249/512:ℚ),.add (.minLeft .auto) .auto),((125/256:ℚ),.add (.minLeft .auto) .auto),((251/512:ℚ),.add (.minLeft .auto) .auto),((503/1024:ℚ),.add (.minLeft .auto) .auto),((63/128:ℚ),.add (.minLeft .auto) .auto),((505/1024:ℚ),.add (.minLeft .auto) .auto),((253/512:ℚ),.add (.minLeft .auto) .auto),((507/1024:ℚ),.add (.minLeft .auto) .auto),((1015/2048:ℚ),.add (.minLeft .auto) .auto),((127/256:ℚ),.add (.minLeft .auto) .auto),((509/1024:ℚ),.add (.minLeft .auto) .auto),((255/512:ℚ),.add (.minLeft .auto) .auto),((1/2:ℚ),.add (.minLeft .auto) .auto),((33/64:ℚ),.add (.minLeft .auto) .auto),((67/128:ℚ),.add (.minLeft .auto) .auto),((135/256:ℚ),.add (.minLeft .auto) .auto),((271/512:ℚ),.add (.minLeft .auto) .auto),((543/1024:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((273/512:ℚ),.add (.minLeft .auto) .auto),((547/1024:ℚ),.add (.minLeft .auto) .auto)]
theorem block08_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((15/32:ℚ)) block08=
    some ((547/1024:ℚ),(5614084355206068435/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family01
#print axioms NoThreeLine.Phase15301Leaf75.Family01.block08_checked
