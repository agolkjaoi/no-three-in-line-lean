import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block13 : List (ℚ × AutoTrace) := [((673/928:ℚ),.add (.minLeft .auto) .auto),((5573/7617:ℚ),.add (.minLeft .auto) .auto),((368687757401/503909968334:ℚ),.add (.minLeft .auto) .auto),((2787/3808:ℚ),.add (.minLeft .auto) .auto),((1477/1985:ℚ),.add (.minLeft .auto) .auto),((5909/7939:ℚ),.add (.minLeft .auto) .auto),((5911/7937:ℚ),.add (.minLeft .auto) .auto),((739/992:ℚ),.add (.minLeft .auto) .auto),((3013/4033:ℚ),.add (.minLeft .auto) .auto),((12053/16131:ℚ),.add (.minLeft .auto) .auto),((6027/8065:ℚ),.add (.minLeft .auto) .auto),((12055/16129:ℚ),.add (.minLeft .auto) .auto),((1507/2016:ℚ),.add (.minLeft .auto) .auto),((4549/6081:ℚ),.add (.minLeft .auto) .auto),((18197/24323:ℚ),.add (.minLeft .auto) .auto),((18199/24321:ℚ),.add (.minLeft .auto) .auto),((455/608:ℚ),.add (.minLeft .auto) .auto),((6085/8129:ℚ),.add (.minLeft .auto) .auto),((24341/32515:ℚ),.add (.minLeft .auto) .auto),((24343/32513:ℚ),.add (.minLeft .auto) .auto),((3043/4064:ℚ),.add (.minLeft .auto) .auto),((1217/1613:ℚ),.add (.minLeft .auto) .auto),((3043/4032:ℚ),.add (.minLeft .auto) .auto),((5061/6593:ℚ),.add (.minLeft .auto) .auto)]
theorem block13_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((26680806295/36791760881:ℚ)) block13=
    some ((5061/6593:ℚ),(3610679340479597783/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block13_checked
