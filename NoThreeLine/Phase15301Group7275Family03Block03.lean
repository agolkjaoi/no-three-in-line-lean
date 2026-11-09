import NoThreeLine.Phase15301Group7275Family03Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family03
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((37/128:ℚ),.add (.minLeft .auto) .auto),((19/64:ℚ),.add (.minLeft .auto) .auto),((77/256:ℚ),.add (.minLeft .auto) .auto),((39/128:ℚ),.add (.minLeft .auto) .auto),((5/16:ℚ),.add (.minLeft .auto) .auto),((41/128:ℚ),.add (.minLeft .auto) .auto),((83/256:ℚ),.add (.minLeft .auto) .auto),((167/512:ℚ),.add (.minLeft .auto) .auto),((21/64:ℚ),.add (.minLeft .auto) .auto),((11/32:ℚ),.add (.minLeft .auto) .auto),((45/128:ℚ),.add (.minLeft .auto) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((93/256:ℚ),.add (.minLeft .auto) .auto),((47/128:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((97/256:ℚ),.add (.minLeft .auto) .auto),((49/128:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minLeft .auto) .auto),((201/512:ℚ),.add (.minLeft .auto) .auto),((101/256:ℚ),.add (.minLeft .auto) .auto),((51/128:ℚ),.add (.minLeft .auto) .auto),((13/32:ℚ),.add (.minLeft .auto) .auto),((105/256:ℚ),.add (.minLeft .auto) .auto),((53/128:ℚ),.add (.minLeft .auto) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((9/32:ℚ)) block03=
    some ((53/128:ℚ),(15011909389179544489/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family03
#print axioms NoThreeLine.Phase15301Group7275.Family03.block03_checked
