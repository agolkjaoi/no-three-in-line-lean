import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block15 : List (ℚ × AutoTrace) := [((137/160:ℚ),.add (.minLeft .auto) .auto),((1217/1421:ℚ),.add (.minLeft .auto) .auto),((3043/3552:ℚ),.add (.minLeft .auto) .auto),((6533/7617:ℚ),.add (.minLeft .auto) .auto),((3267/3808:ℚ),.add (.minLeft .auto) .auto),((6597/7681:ℚ),.add (.minLeft .auto) .auto),((1269977421247/1478566663039:ℚ),.add (.minLeft .auto) .auto),((3299/3840:ℚ),.add (.minLeft .auto) .auto),((6533/7553:ℚ),.add (.minLeft .auto) .auto),((3267/3776:ℚ),.add (.minLeft .auto) .auto),((2199/2539:ℚ),.add (.minLeft .auto) .auto),((26389/30467:ℚ),.add (.minLeft .auto) .auto),((8797/10155:ℚ),.add (.minLeft .auto) .auto),((3299/3808:ℚ),.add (.minLeft .auto) .auto),((6597/7553:ℚ),.add (.minLeft .auto) .auto),((3299/3776:ℚ),.add (.minLeft .auto) .auto),((3525/4033:ℚ),.add (.minLeft .auto) .auto),((6661/7617:ℚ),.add (.minLeft .auto) .auto),((1763/2016:ℚ),.add (.minLeft .auto) .auto),((3331/3808:ℚ),.add (.minLeft .auto) .auto),((6661/7553:ℚ),.add (.minLeft .auto) .auto),((26645/30211:ℚ),.add (.minLeft .auto) .auto),((26647/30209:ℚ),.add (.minLeft .auto) .auto),((3331/3776:ℚ),.add (.minLeft .auto) .auto)]
theorem block15_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((3013/3521:ℚ)) block15=
    some ((3331/3776:ℚ),(789478002182726793/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block15_checked
