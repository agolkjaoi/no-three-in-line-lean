import NoThreeLine.Phase15301Leaf77Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family23
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((5/8:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((81/128:ℚ),.add (.minLeft .auto) .auto),((41/64:ℚ),.add (.minLeft .auto) .auto),((83/128:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((85/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((43/64:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((89/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((45/64:ℚ),.add (.minLeft .auto) .auto),((91/128:ℚ),.add (.minLeft .auto) .auto),((23/32:ℚ),.add (.minLeft .auto) .auto),((93/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((47/64:ℚ),.add (.minLeft .auto) .auto),((95/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((191/256:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((49/64:ℚ),.add (.minLeft .auto) .auto),((99/128:ℚ),.add (.minLeft .auto) .auto),((25/32:ℚ),.add (.minLeft .auto) .auto),((101/128:ℚ),.add (.minLeft .auto) .auto),((51/64:ℚ),.add (.minLeft .auto) .auto),((13/16:ℚ),.add (.minLeft .auto) .auto),((53/64:ℚ),.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((79/128:ℚ)) block05=
    some ((53/64:ℚ),(6888243604188289411/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family23
#print axioms NoThreeLine.Phase15301Leaf77.Family23.block05_checked
