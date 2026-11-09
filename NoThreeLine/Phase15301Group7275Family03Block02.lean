import NoThreeLine.Phase15301Group7275Family03Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family03
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((3/16:ℚ),.add (.minLeft .auto) .auto),((97/512:ℚ),.add (.minLeft .auto) .auto),((49/256:ℚ),.add (.minLeft .auto) .auto),((25/128:ℚ),.add (.minLeft .auto) .auto),((13/64:ℚ),.add (.minLeft .auto) .auto),((53/256:ℚ),.add (.minLeft .auto) .auto),((27/128:ℚ),.add (.minLeft .auto) .auto),((55/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((7/32:ℚ),.add (.minLeft .auto) .auto),((57/256:ℚ),.add (.minLeft .auto) .auto),((29/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((59/256:ℚ),.add (.minLeft .auto) .auto),((15/64:ℚ),.add (.minLeft .auto) .auto),((61/256:ℚ),.add (.minLeft .auto) .auto),((31/128:ℚ),.add (.minLeft .auto) .auto),((1/4:ℚ),.add (.minLeft .auto) .auto),((33/128:ℚ),.add (.minLeft .auto) .auto),((17/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((69/256:ℚ),.add (.minLeft .auto) .auto),((139/512:ℚ),.add (.minLeft .auto) .auto),((35/128:ℚ),.add (.minLeft .auto) .auto),((71/256:ℚ),.add (.minLeft .auto) .auto),((143/512:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((9/32:ℚ),.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((47/256:ℚ)) block02=
    some ((9/32:ℚ),(1539890014677442995/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family03
#print axioms NoThreeLine.Phase15301Group7275.Family03.block02_checked
