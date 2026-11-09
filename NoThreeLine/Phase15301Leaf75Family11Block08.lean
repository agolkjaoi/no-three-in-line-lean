import NoThreeLine.Phase15301Leaf75Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family11
open AutoEnvelope

def block08 : List (ℚ × AutoTrace) := [((183/256:ℚ),.add (.minLeft .auto) .auto),((23/32:ℚ),.add (.minLeft .auto) .auto),((93/128:ℚ),.add (.minLeft .auto) .auto),((187/256:ℚ),.add (.minLeft .auto) .auto),((375/512:ℚ),.add (.minLeft .auto) .auto),((47/64:ℚ),.add (.minLeft .auto) .auto),((95/128:ℚ),.add (.minLeft .auto) .auto),((191/256:ℚ),.add (.minLeft .auto) .auto),((383/512:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((193/256:ℚ),.add (.minLeft .auto) .auto),((387/512:ℚ),.add (.minLeft .auto) .auto),((97/128:ℚ),.add (.minLeft .auto) .auto),((49/64:ℚ),.add (.minLeft .auto) .auto),((99/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((25/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((201/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((101/128:ℚ),.add (.minLeft .auto) .auto),((51/64:ℚ),.add (.minLeft .auto) .auto),((409/512:ℚ),.add (.minLeft .auto) .auto),((205/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((103/128:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((209/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block08_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((365/512:ℚ)) block08=
    some ((209/256:ℚ),(8455955441045291465/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family11
#print axioms NoThreeLine.Phase15301Leaf75.Family11.block08_checked
