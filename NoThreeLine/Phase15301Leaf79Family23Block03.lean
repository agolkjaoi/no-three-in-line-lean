import NoThreeLine.Phase15301Leaf79Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf79.Family23
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((149/512:ℚ),.add (.minLeft .auto) .auto),((75/256:ℚ),.add (.minLeft .auto) .auto),((19/64:ℚ),.add (.minLeft .auto) .auto),((77/256:ℚ),.add (.minLeft .auto) .auto),((39/128:ℚ),.add (.minLeft .auto) .auto),((5/16:ℚ),.add (.minLeft .auto) .auto),((41/128:ℚ),.add (.minLeft .auto) .auto),((21/64:ℚ),.add (.minLeft .auto) .auto),((11/32:ℚ),.add (.minLeft .auto) .auto),((89/256:ℚ),.add (.minLeft .auto) .auto),((45/128:ℚ),.add (.minLeft .auto) .auto),((91/256:ℚ),.add (.minLeft .auto) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((93/256:ℚ),.add (.minLeft .auto) .auto),((47/128:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((97/256:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((49/128:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minLeft .auto) .auto),((101/256:ℚ),.add (.minLeft .auto) .auto),((51/128:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((105/256:ℚ),.add (.minLeft .auto) .auto),((53/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((37/128:ℚ)) block03=
    some ((53/128:ℚ),(10679592623028660447/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf79.Family23
#print axioms NoThreeLine.Phase15301Leaf79.Family23.block03_checked
