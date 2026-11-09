import NoThreeLine.Phase15301Leaf78Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf78.Family11
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((37/256:ℚ),.add (.minLeft .auto) .auto),((75/512:ℚ),.add (.minLeft .auto) .auto),((19/128:ℚ),.add (.minLeft .auto) .auto),((77/512:ℚ),.add (.minLeft .auto) .auto),((39/256:ℚ),.add (.minLeft .auto) .auto),((5/32:ℚ),.add (.minLeft .auto) .auto),((21/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((43/256:ℚ),.add (.minLeft .auto) .auto),((11/64:ℚ),.add (.minLeft .auto) .auto),((177/1024:ℚ),.add (.minLeft .auto) .auto),((89/512:ℚ),.add (.minLeft .auto) .auto),((45/256:ℚ),.add (.minLeft .auto) .auto),((23/128:ℚ),.add (.minLeft .auto) .auto),((93/512:ℚ),.add (.minLeft .auto) .auto),((47/256:ℚ),.add (.minLeft .auto) .auto),((3/16:ℚ),.add (.minLeft .auto) .auto),((97/512:ℚ),.add (.minLeft .auto) .auto),((195/1024:ℚ),.add (.minLeft .auto) .auto),((49/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((99/512:ℚ),.add (.minLeft .auto) .auto),((25/128:ℚ),.add (.minLeft .auto) .auto),((13/64:ℚ),.add (.minLeft .auto) .auto),((53/256:ℚ),.add (.minLeft .auto) .auto),((27/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((9/64:ℚ)) block02=
    some ((27/128:ℚ),(4370950705499382875/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf78.Family11
#print axioms NoThreeLine.Phase15301Leaf78.Family11.block02_checked
