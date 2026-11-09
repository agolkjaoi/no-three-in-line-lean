import NoThreeLine.Phase15301Leaf75Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family01
open AutoEnvelope

def block12 : List (ℚ × AutoTrace) := [((371/512:ℚ),.add (.minLeft .auto) .auto),((1485/2048:ℚ),.add (.minLeft .auto) .auto),((743/1024:ℚ),.add (.minLeft .auto) .auto),((93/128:ℚ),.add (.minLeft .auto) .auto),((187/256:ℚ),.add (.minLeft .auto) .auto),((375/512:ℚ),.add (.minLeft .auto) .auto),((47/64:ℚ),.add (.minLeft .auto) .auto),((95/128:ℚ),.add (.minLeft .auto) .auto),((381/512:ℚ),.add (.minLeft .auto) .auto),((191/256:ℚ),.add (.minLeft .auto) .auto),((765/1024:ℚ),.add (.minLeft .auto) .auto),((1531/2048:ℚ),.add (.minLeft .auto) .auto),((383/512:ℚ),.add (.minLeft .auto) .auto),((1533/2048:ℚ),.add (.minLeft .auto) .auto),((767/1024:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((193/256:ℚ),.add (.minLeft .auto) .auto),((773/1024:ℚ),.add (.minLeft .auto) .auto),((387/512:ℚ),.add (.minLeft .auto) .auto),((97/128:ℚ),.add (.minLeft .auto) .auto),((49/64:ℚ),.add (.minLeft .auto) .auto),((99/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((397/512:ℚ),.add (.minLeft .auto) .auto),((199/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block12_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((185/256:ℚ)) block12=
    some ((199/256:ℚ),(1157020827709394747/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family01
#print axioms NoThreeLine.Phase15301Leaf75.Family01.block12_checked
