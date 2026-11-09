import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block16 : List (ℚ × AutoTrace) := [((6661/7617:ℚ),.add (.minLeft .auto) .auto),((1763/2016:ℚ),.add (.minLeft .auto) .auto),((7109/8129:ℚ),.add (.minLeft .auto) .auto),((28437/32515:ℚ),.add (.minLeft .auto) .auto),((28439/32513:ℚ),.add (.minLeft .auto) .auto),((3331/3808:ℚ),.add (.minLeft .auto) .auto),((3555/4064:ℚ),.add (.minLeft .auto) .auto),((6661/7553:ℚ),.add (.minLeft .auto) .auto),((26645/30211:ℚ),.add (.minLeft .auto) .auto),((26647/30209:ℚ),.add (.minLeft .auto) .auto),((27879096725/31604032708:ℚ),.add (.minLeft .auto) .auto),((3331/3776:ℚ),.add (.minLeft .auto) .auto),((4037/4545:ℚ),.add (.minLeft .auto) .auto),((1020695032643/1149113714071:ℚ),.add (.minLeft .auto) .auto),((2019/2272:ℚ),.add (.minLeft .auto) .auto),((4549/5057:ℚ),.add (.minLeft .auto) .auto),((2275/2528:ℚ),.add (.minLeft .auto) .auto),((29/32:ℚ),.add (.minLeft .auto) .auto),((5061/5569:ℚ),.add (.minLeft .auto) .auto),((4049/4455:ℚ),.add (.minLeft .auto) .auto),((20247/22273:ℚ),.add (.minLeft .auto) .auto),((2531/2784:ℚ),.add (.minLeft .auto) .auto),((233/255:ℚ),.add (.minLeft .auto) .auto),((5573/6081:ℚ),.add (.minLeft .auto) .auto)]
theorem block16_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((14103/16129:ℚ)) block16=
    some ((5573/6081:ℚ),(2624881226350333169/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block16_checked
