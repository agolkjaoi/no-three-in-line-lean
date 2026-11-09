import NoThreeLine.Phase15301Leaf75Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family11
open AutoEnvelope

def block06 : List (ℚ × AutoTrace) := [((67/128:ℚ),.add (.minLeft .auto) .auto),((135/256:ℚ),.add (.minLeft .auto) .auto),((271/512:ℚ),.add (.minLeft .auto) .auto),((17/32:ℚ),.add (.minLeft .auto) .auto),((69/128:ℚ),.add (.minLeft .auto) .auto),((277/512:ℚ),.add (.minLeft .auto) .auto),((139/256:ℚ),.add (.minLeft .auto) .auto),((35/64:ℚ),.add (.minLeft .auto) .auto),((141/256:ℚ),.add (.minLeft .auto) .auto),((71/128:ℚ),.add (.minLeft .auto) .auto),((143/256:ℚ),.add (.minLeft .auto) .auto),((287/512:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minLeft .auto) .auto),((145/256:ℚ),.add (.minLeft .auto) .auto),((291/512:ℚ),.add (.minLeft .auto) .auto),((73/128:ℚ),.add (.minLeft .auto) .auto),((37/64:ℚ),.add (.minLeft .auto) .auto),((297/512:ℚ),.add (.minLeft .auto) .auto),((149/256:ℚ),.add (.minLeft .auto) .auto),((75/128:ℚ),.add (.minLeft .auto) .auto),((19/32:ℚ),.add (.minLeft .auto) .auto),((305/512:ℚ),.add (.minLeft .auto) .auto),((153/256:ℚ),.add (.minLeft .auto) .auto),((77/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block06_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((33/64:ℚ)) block06=
    some ((77/128:ℚ),(3631631499558744579/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family11
#print axioms NoThreeLine.Phase15301Leaf75.Family11.block06_checked
