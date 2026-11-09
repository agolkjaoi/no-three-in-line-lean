import NoThreeLine.Phase15301Leaf74Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family01
open AutoEnvelope

def block08 : List (ℚ × AutoTrace) := [((563/1024:ℚ),.add (.minLeft .auto) .auto),((1127/2048:ℚ),.add (.minLeft .auto) .auto),((141/256:ℚ),.add (.minLeft .auto) .auto),((71/128:ℚ),.add (.minLeft .auto) .auto),((143/256:ℚ),.add (.minLeft .auto) .auto),((9/16:ℚ),.add (.minLeft .auto) .auto),((289/512:ℚ),.add (.minLeft .auto) .auto),((579/1024:ℚ),.add (.minLeft .auto) .auto),((145/256:ℚ),.add (.minLeft .auto) .auto),((291/512:ℚ),.add (.minLeft .auto) .auto),((73/128:ℚ),.add (.minLeft .auto) .auto),((37/64:ℚ),.add (.minLeft .auto) .auto),((297/512:ℚ),.add (.minLeft .auto) .auto),((149/256:ℚ),.add (.minLeft .auto) .auto),((75/128:ℚ),.add (.minLeft .auto) .auto),((151/256:ℚ),.add (.minLeft .auto) .auto),((303/512:ℚ),.add (.minLeft .auto) .auto),((19/32:ℚ),.add (.minLeft .auto) .auto),((305/512:ℚ),.add (.minLeft .auto) .auto),((611/1024:ℚ),.add (.minLeft .auto) .auto),((153/256:ℚ),.add (.minLeft .auto) .auto),((77/128:ℚ),.add (.minLeft .auto) .auto),((39/64:ℚ),.add (.minLeft .auto) .auto),((313/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block08_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((281/512:ℚ)) block08=
    some ((313/512:ℚ),(1339194257985173839/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family01
#print axioms NoThreeLine.Phase15301Leaf74.Family01.block08_checked
