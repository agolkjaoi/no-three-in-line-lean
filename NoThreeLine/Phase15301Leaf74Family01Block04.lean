import NoThreeLine.Phase15301Leaf74Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family01
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((535/2048:ℚ),.add (.minLeft .auto) .auto),((67/256:ℚ),.add (.minLeft .auto) .auto),((135/512:ℚ),.add (.minLeft .auto) .auto),((17/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((69/256:ℚ),.add (.minLeft .auto) .auto),((35/128:ℚ),.add (.minLeft .auto) .auto),((281/1024:ℚ),.add (.minLeft .auto) .auto),((141/512:ℚ),.add (.minLeft .auto) .auto),((71/256:ℚ),.add (.minLeft .auto) .auto),((143/512:ℚ),.add (.minLeft .auto) .auto),((287/1024:ℚ),.add (.minLeft .auto) .auto),((9/32:ℚ),.add (.minLeft .auto) .auto),((37/128:ℚ),.add (.minLeft .auto) .auto),((75/256:ℚ),.add (.minLeft .auto) .auto),((19/64:ℚ),.add (.minLeft .auto) .auto),((77/256:ℚ),.add (.minLeft .auto) .auto),((155/512:ℚ),.add (.minLeft .auto) .auto),((39/128:ℚ),.add (.minLeft .auto) .auto),((157/512:ℚ),.add (.minLeft .auto) .auto),((315/1024:ℚ),.add (.minLeft .auto) .auto),((79/256:ℚ),.add (.minLeft .auto) .auto),((5/16:ℚ),.add (.minLeft .auto) .auto),((41/128:ℚ),.add (.minLeft .auto) .auto),((165/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((267/1024:ℚ)) block04=
    some ((165/512:ℚ),(6069884673905580721/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family01
#print axioms NoThreeLine.Phase15301Leaf74.Family01.block04_checked
