import NoThreeLine.Phase15301Leaf77Family13Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family13
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((73/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((37/64:ℚ),.add (.minLeft .auto) .auto),((19/32:ℚ),.add (.minLeft .auto) .auto),((39/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((79/128:ℚ),.add (.minLeft .auto) .auto),((5/8:ℚ),.add (.minLeft .auto) .auto),((81/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((41/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((83/128:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((169/256:ℚ),.add (.minLeft .auto) .auto),((85/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((43/64:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((89/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((45/64:ℚ),.add (.minLeft .auto) .auto),((91/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((23/32:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((93/128:ℚ),.add (.minLeft .auto) .auto),((47/64:ℚ),.add (.minLeft .auto) .auto),((95/128:ℚ),.add (.minLeft .auto) .auto),((191/256:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((49/64:ℚ),.add (.minLeft .auto) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((9/16:ℚ)) block04=
    some ((49/64:ℚ),(3780067047573324123/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family13
#print axioms NoThreeLine.Phase15301Leaf77.Family13.block04_checked
