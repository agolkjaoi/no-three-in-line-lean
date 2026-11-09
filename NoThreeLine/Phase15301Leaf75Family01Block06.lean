import NoThreeLine.Phase15301Leaf75Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf75.Family01
open AutoEnvelope

def block06 : List (ℚ × AutoTrace) := [((335/1024:ℚ),.add (.minLeft .auto) .auto),((21/64:ℚ),.add (.minLeft .auto) .auto),((43/128:ℚ),.add (.minLeft .auto) .auto),((11/32:ℚ),.add (.minLeft .auto) .auto),((45/128:ℚ),.add (.minLeft .auto) .auto),((721/2048:ℚ),.add (.minLeft .auto) .auto),((361/1024:ℚ),.add (.minLeft .auto) .auto),((181/512:ℚ),.add (.minLeft .auto) .auto),((91/256:ℚ),.add (.minLeft .auto) .auto),((183/512:ℚ),.add (.minLeft .auto) .auto),((23/64:ℚ),.add (.minLeft .auto) .auto),((93/256:ℚ),.add (.minLeft .auto) .auto),((187/512:ℚ),.add (.minLeft .auto) .auto),((375/1024:ℚ),.add (.minLeft .auto) .auto),((47/128:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((189/512:ℚ),.add (.minLeft .auto) .auto),((95/256:ℚ),.add (.minLeft .auto) .auto),((3/8:ℚ),.add (.minLeft .auto) .auto),((25/64:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((201/512:ℚ),.add (.minLeft .auto) .auto),((403/1024:ℚ),.add (.minLeft .auto) .auto),((101/256:ℚ),.add (.minLeft .auto) .auto),((405/1024:ℚ),.add (.minLeft .auto) .auto),((203/512:ℚ),.add (.minLeft .auto) .auto)]
theorem block06_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((167/512:ℚ)) block06=
    some ((203/512:ℚ),(6664697773551751639/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf75.Family01
#print axioms NoThreeLine.Phase15301Leaf75.Family01.block06_checked
