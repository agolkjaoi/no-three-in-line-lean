import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block15 : List (ℚ × AutoTrace) := [((6533/7681:ℚ),.add (.minLeft .auto) .auto),((8711/10241:ℚ),.add (.minLeft .auto) .auto),((26135/30721:ℚ),.add (.minLeft .auto) .auto),((1089/1280:ℚ),.add (.minLeft .auto) .auto),((3013/3521:ℚ),.add (.minLeft .auto) .auto),((12053/14083:ℚ),.add (.minLeft .auto) .auto),((12055/14081:ℚ),.add (.minLeft .auto) .auto),((137/160:ℚ),.add (.minLeft .auto) .auto),((1217/1421:ℚ),.add (.minLeft .auto) .auto),((3043/3552:ℚ),.add (.minLeft .auto) .auto),((6533/7617:ℚ),.add (.minLeft .auto) .auto),((3267/3808:ℚ),.add (.minLeft .auto) .auto),((6597/7681:ℚ),.add (.minLeft .auto) .auto),((3299/3840:ℚ),.add (.minLeft .auto) .auto),((6533/7553:ℚ),.add (.minLeft .auto) .auto),((277172515553/320390558856:ℚ),.add (.minLeft .auto) .auto),((3267/3776:ℚ),.add (.minLeft .auto) .auto),((2199/2539:ℚ),.add (.minLeft .auto) .auto),((3299/3808:ℚ),.add (.minLeft .auto) .auto),((6597/7553:ℚ),.add (.minLeft .auto) .auto),((3299/3776:ℚ),.add (.minLeft .auto) .auto),((3525/4033:ℚ),.add (.minLeft .auto) .auto),((14101/16131:ℚ),.add (.minLeft .auto) .auto),((14103/16129:ℚ),.add (.minLeft .auto) .auto)]
theorem block15_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((2787/3296:ℚ)) block15=
    some ((14103/16129:ℚ),(850100293435293617/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block15_checked
