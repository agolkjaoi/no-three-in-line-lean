import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block14 : List (ℚ × AutoTrace) := [((6085/7617:ℚ),.add (.minLeft .auto) .auto),((24341/30467:ℚ),.add (.minLeft .auto) .auto),((24343/30465:ℚ),.add (.minLeft .auto) .auto),((179/224:ℚ),.add (.minLeft .auto) .auto),((6597/8129:ℚ),.add (.minLeft .auto) .auto),((26389/32515:ℚ),.add (.minLeft .auto) .auto),((26391/32513:ℚ),.add (.minLeft .auto) .auto),((3299/4064:ℚ),.add (.minLeft .auto) .auto),((4549/5569:ℚ),.add (.minLeft .auto) .auto),((18197/22275:ℚ),.add (.minLeft .auto) .auto),((18199/22273:ℚ),.add (.minLeft .auto) .auto),((2275/2784:ℚ),.add (.minLeft .auto) .auto),((6597/8065:ℚ),.add (.minLeft .auto) .auto),((26389/32259:ℚ),.add (.minLeft .auto) .auto),((26391/32257:ℚ),.add (.minLeft .auto) .auto),((3299/4032:ℚ),.add (.minLeft .auto) .auto),((2501/3009:ℚ),.add (.minLeft .auto) .auto),((1251/1504:ℚ),.add (.minLeft .auto) .auto),((1687/2027:ℚ),.add (.minLeft .auto) .auto),((20245/24323:ℚ),.add (.minLeft .auto) .auto),((6749/8107:ℚ),.add (.minLeft .auto) .auto),((2531/3040:ℚ),.add (.minLeft .auto) .auto),((5573/6593:ℚ),.add (.minLeft .auto) .auto),((2787/3296:ℚ),.add (.minLeft .auto) .auto)]
theorem block14_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((2019/2528:ℚ)) block14=
    some ((2787/3296:ℚ),(3193391937887858485/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block14_checked
