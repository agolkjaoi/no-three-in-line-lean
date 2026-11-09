import NoThreeLine.Phase15301Leaf75Family13Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family13
open AutoEnvelope

def block06 : List (ℚ × AutoTrace) := [((117/128:ℚ),.add (.minLeft .auto) .auto),((59/64:ℚ),.add (.minLeft .auto) .auto),((119/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((15/16:ℚ),.add (.minLeft .auto) .auto),((31/32:ℚ),.add (.minLeft .auto) .auto),((63/64:ℚ),.add (.minLeft .auto) .auto),((127/128:ℚ),.add (.minLeft .auto) .auto),((255/256:ℚ),.add (.minLeft .auto) .auto),((511/512:ℚ),.add (.minLeft .auto) .auto),(1,.add (.minRight (.add (.minLeft .auto) .auto)) .auto)]
theorem block06_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((29/32:ℚ)) block06=
    some (1,(359647396790067477/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family13
#print axioms NoThreeLine.Phase15301Leaf75.Family13.block06_checked
