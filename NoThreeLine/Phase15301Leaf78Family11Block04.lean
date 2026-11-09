import NoThreeLine.Phase15301Leaf78Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family11
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((71/256:ℚ),.add (.minLeft .auto) .auto),((143/512:ℚ),.add (.minLeft .auto) .auto),((287/1024:ℚ),.add (.minLeft .auto) .auto),((9/32:ℚ),.add (.minLeft .auto) .auto),((37/128:ℚ),.add (.minLeft .auto) .auto),((149/512:ℚ),.add (.minLeft .auto) .auto),((299/1024:ℚ),.add (.minLeft .auto) .auto),((75/256:ℚ),.add (.minLeft .auto) .auto),((19/64:ℚ),.add (.minLeft .auto) .auto),((77/256:ℚ),.add (.minLeft .auto) .auto),((39/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((157/512:ℚ),.add (.minLeft .auto) .auto),((315/1024:ℚ),.add (.minLeft .auto) .auto),((79/256:ℚ),.add (.minLeft .auto) .auto),((5/16:ℚ),.add (.minLeft .auto) .auto),((41/128:ℚ),.add (.minLeft .auto) .auto),((83/256:ℚ),.add (.minLeft .auto) .auto),((167/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((335/1024:ℚ),.add (.minLeft .auto) .auto),((21/64:ℚ),.add (.minLeft .auto) .auto),((85/256:ℚ),.add (.minLeft .auto) .auto),((43/128:ℚ),.add (.minLeft .auto) .auto),((11/32:ℚ),.add (.minLeft .auto) .auto),((45/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((35/128:ℚ)) block04=
    some ((45/128:ℚ),(3702307145371154691/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family11
#print axioms NoThreeLine.Phase15301Leaf78.Family11.block04_checked
