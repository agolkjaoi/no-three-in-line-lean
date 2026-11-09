import NoThreeLine.Phase15301Leaf74Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf74.Family21
open AutoEnvelope

def block09 : List (ℚ × AutoTrace) := [((393/512:ℚ),.add (.minLeft .auto) .auto),((197/256:ℚ),.add (.minLeft .auto) .auto),((99/128:ℚ),.add (.minLeft .auto) .auto),((397/512:ℚ),.add (.minLeft .auto) .auto),((199/256:ℚ),.add (.minLeft .auto) .auto),((25/32:ℚ),.add (.minLeft .auto) .auto),((201/256:ℚ),.add (.minLeft .auto) .auto),((101/128:ℚ),.add (.minLeft .auto) .auto),((51/64:ℚ),.add (.minLeft .auto) .auto),((103/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((209/256:ℚ),.add (.minLeft .auto) .auto),((419/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((105/128:ℚ),.add (.minLeft .auto) .auto),((53/64:ℚ),.add (.minLeft .auto) .auto),((213/256:ℚ),.add (.minLeft .auto) .auto),((107/128:ℚ),.add (.minLeft .auto) .auto),((27/32:ℚ),.add (.minLeft .auto) .auto),((433/512:ℚ),.add (.minLeft .auto) .auto),((217/256:ℚ),.add (.minLeft .auto) .auto),((435/512:ℚ),.add (.minLeft .auto) .auto),((871/1024:ℚ),.add (.minLeft .auto) .auto),((109/128:ℚ),.add (.minLeft .auto) .auto),((219/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block09_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((49/64:ℚ)) block09=
    some ((219/256:ℚ),(1553568903353479015/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf74.Family21
#print axioms NoThreeLine.Phase15301Leaf74.Family21.block09_checked
