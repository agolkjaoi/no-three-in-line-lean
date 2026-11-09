import NoThreeLine.Phase15301Leaf77Family03Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family03
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((37/128:ℚ),.add (.minLeft .auto) .auto),((19/64:ℚ),.add (.minLeft .auto) .auto),((39/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5/16:ℚ),.add (.minLeft .auto) .auto),((41/128:ℚ),.add (.minLeft .auto) .auto),((83/256:ℚ),.add (.minLeft .auto) .auto),((21/64:ℚ),.add (.minLeft .auto) .auto),((11/32:ℚ),.add (.minLeft .auto) .auto),((45/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((47/128:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((97/256:ℚ),.add (.minLeft .auto) .auto),((49/128:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((105/256:ℚ),.add (.minLeft .auto) .auto),((53/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((107/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto),((55/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((7/16:ℚ),.add (.minLeft .auto) .auto),((57/128:ℚ),.add (.minLeft .auto) .auto),((115/256:ℚ),.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((9/32:ℚ)) block02=
    some ((115/256:ℚ),(9481568515703854951/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family03
#print axioms NoThreeLine.Phase15301Leaf77.Family03.block02_checked
