import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block12 : List (ℚ × AutoTrace) := [((2501/3521:ℚ),.add (.minLeft .auto) .auto),((10005/14083:ℚ),.add (.minLeft .auto) .auto),((10007/14081:ℚ),.add (.minLeft .auto) .auto),((1251/1760:ℚ),.add (.minLeft .auto) .auto),((723/1015:ℚ),.add (.minLeft .auto) .auto),((2531/3552:ℚ),.add (.minLeft .auto) .auto),((4037/5569:ℚ),.add (.minLeft .auto) .auto),((673/928:ℚ),.add (.minLeft .auto) .auto),((5573/7617:ℚ),.add (.minLeft .auto) .auto),((2787/3808:ℚ),.add (.minLeft .auto) .auto),((1477/1985:ℚ),.add (.minLeft .auto) .auto),((5909/7939:ℚ),.add (.minLeft .auto) .auto),((5911/7937:ℚ),.add (.minLeft .auto) .auto),((739/992:ℚ),.add (.minLeft .auto) .auto),((3013/4033:ℚ),.add (.minLeft .auto) .auto),((6027/8065:ℚ),.add (.minLeft .auto) .auto),((1507/2016:ℚ),.add (.minLeft .auto) .auto),((4549/6081:ℚ),.add (.minLeft .auto) .auto),((18197/24323:ℚ),.add (.minLeft .auto) .auto),((18199/24321:ℚ),.add (.minLeft .auto) .auto),((455/608:ℚ),.add (.minLeft .auto) .auto),((6085/8129:ℚ),.add (.minLeft .auto) .auto),((113083450369/151064422805:ℚ),.add (.minLeft .auto) .auto),((24341/32515:ℚ),.add (.minLeft .auto) .auto)]
theorem block12_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1763/2528:ℚ)) block12=
    some ((24341/32515:ℚ),(3493254424480473671/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block12_checked
