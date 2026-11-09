import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block15 : List (ℚ × AutoTrace) := [((6597/8065:ℚ),.add (.minLeft .auto) .auto),((26389/32259:ℚ),.add (.minLeft .auto) .auto),((26391/32257:ℚ),.add (.minLeft .auto) .auto),((3299/4032:ℚ),.add (.minLeft .auto) .auto),((6670241/8088192:ℚ),.add (.minLeft .auto) .auto),((2501/3009:ℚ),.add (.minLeft .auto) .auto),((69/83:ℚ),.add (.minLeft .auto) .auto),((10007/12033:ℚ),.add (.minLeft .auto) .auto),((1251/1504:ℚ),.add (.minLeft .auto) .auto),((1687/2027:ℚ),.add (.minLeft .auto) .auto),((2531/3040:ℚ),.add (.minLeft .auto) .auto),((5573/6593:ℚ),.add (.minLeft .auto) .auto),((2787/3296:ℚ),.add (.minLeft .auto) .auto),((6533/7681:ℚ),.add (.minLeft .auto) .auto),((8711/10241:ℚ),.add (.minLeft .auto) .auto),((26135/30721:ℚ),.add (.minLeft .auto) .auto),((1089/1280:ℚ),.add (.minLeft .auto) .auto),((3013/3521:ℚ),.add (.minLeft .auto) .auto),((137/160:ℚ),.add (.minLeft .auto) .auto),((1217/1421:ℚ),.add (.minLeft .auto) .auto),((3043/3552:ℚ),.add (.minLeft .auto) .auto),((6533/7617:ℚ),.add (.minLeft .auto) .auto),((3267/3808:ℚ),.add (.minLeft .auto) .auto),((6597/7681:ℚ),.add (.minLeft .auto) .auto)]
theorem block15_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((2275/2784:ℚ)) block15=
    some ((6597/7681:ℚ),(2461438889086137757/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block15_checked
