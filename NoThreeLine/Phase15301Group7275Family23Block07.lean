import NoThreeLine.Phase15301Group7275Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family23
open AutoEnvelope

def block07 : List (ℚ × AutoTrace) := [((169/256:ℚ),.add (.minLeft .auto) .auto),((677/1024:ℚ),.add (.minLeft .auto) .auto),((339/512:ℚ),.add (.minLeft .auto) .auto),((85/128:ℚ),.add (.minLeft .auto) .auto),((43/64:ℚ),.add (.minLeft .auto) .auto),((11/16:ℚ),.add (.minLeft .auto) .auto),((353/512:ℚ),.add (.minLeft .auto) .auto),((177/256:ℚ),.add (.minLeft .auto) .auto),((89/128:ℚ),.add (.minLeft .auto) .auto),((45/64:ℚ),.add (.minLeft .auto) .auto),((91/128:ℚ),.add (.minLeft .auto) .auto),((23/32:ℚ),.add (.minLeft .auto) .auto),((185/256:ℚ),.add (.minLeft .auto) .auto),((93/128:ℚ),.add (.minLeft .auto) .auto),((47/64:ℚ),.add (.minLeft .auto) .auto),((189/256:ℚ),.add (.minLeft .auto) .auto),((95/128:ℚ),.add (.minLeft .auto) .auto),((191/256:ℚ),.add (.minLeft .auto) .auto),((3/4:ℚ),.add (.minLeft .auto) .auto),((49/64:ℚ),.add (.minLeft .auto) .auto),((197/256:ℚ),.add (.minLeft .auto) .auto),((99/128:ℚ),.add (.minLeft .auto) .auto),((25/32:ℚ),.add (.minLeft .auto) .auto),((101/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block07_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((21/32:ℚ)) block07=
    some ((101/128:ℚ),(542277537970118545/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family23
#print axioms NoThreeLine.Phase15301Group7275.Family23.block07_checked
