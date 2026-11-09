import NoThreeLine.Phase15301Group7275Family23Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family23
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((11/32:ℚ),.add (.minLeft .auto) .auto),((89/256:ℚ),.add (.minLeft .auto) .auto),((45/128:ℚ),.add (.minLeft .auto) .auto),((91/256:ℚ),.add (.minLeft .auto) .auto),((183/512:ℚ),.add (.minLeft .auto) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((93/256:ℚ),.add (.minLeft .auto) .auto),((187/512:ℚ),.add (.minLeft .auto) .auto),((47/128:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((193/512:ℚ),.add (.minLeft .auto) .auto),((97/256:ℚ),.add (.minLeft .auto) .auto),((49/128:ℚ),.add (.minLeft .auto) .auto),((99/256:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minLeft .auto) .auto),((201/512:ℚ),.add (.minLeft .auto) .auto),((101/256:ℚ),.add (.minLeft .auto) .auto),((51/128:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((105/256:ℚ),.add (.minLeft .auto) .auto),((53/128:ℚ),.add (.minLeft .auto) .auto),((107/256:ℚ),.add (.minLeft .auto) .auto),((27/64:ℚ),.add (.minLeft .auto) .auto),((217/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((43/128:ℚ)) block04=
    some ((217/512:ℚ),(3655581278445779187/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family23
#print axioms NoThreeLine.Phase15301Group7275.Family23.block04_checked
