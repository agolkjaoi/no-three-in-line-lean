import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block14 : List (ℚ × AutoTrace) := [((6085/7617:ℚ),.add (.minLeft .auto) .auto),((24341/30467:ℚ),.add (.minLeft .auto) .auto),((24343/30465:ℚ),.add (.minLeft .auto) .auto),((179/224:ℚ),.add (.minLeft .auto) .auto),((2015827/2494912:ℚ),.add (.minLeft .auto) .auto),((4549/5569:ℚ),.add (.minLeft .auto) .auto),((2275/2784:ℚ),.add (.minLeft .auto) .auto),((6597/8065:ℚ),.add (.minLeft .auto) .auto),((26389/32259:ℚ),.add (.minLeft .auto) .auto),((26391/32257:ℚ),.add (.minLeft .auto) .auto),((3299/4032:ℚ),.add (.minLeft .auto) .auto),((2501/3009:ℚ),.add (.minLeft .auto) .auto),((69/83:ℚ),.add (.minLeft .auto) .auto),((10007/12033:ℚ),.add (.minLeft .auto) .auto),((1251/1504:ℚ),.add (.minLeft .auto) .auto),((1687/2027:ℚ),.add (.minLeft .auto) .auto),((2531/3040:ℚ),.add (.minLeft .auto) .auto),((5573/6593:ℚ),.add (.minLeft .auto) .auto),((2787/3296:ℚ),.add (.minLeft .auto) .auto),((6533/7681:ℚ),.add (.minLeft .auto) .auto),((8711/10241:ℚ),.add (.minLeft .auto) .auto),((26135/30721:ℚ),.add (.minLeft .auto) .auto),((1089/1280:ℚ),.add (.minLeft .auto) .auto),((3013/3521:ℚ),.add (.minLeft .auto) .auto)]
theorem block14_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((2019/2528:ℚ)) block14=
    some ((3013/3521:ℚ),(1852080801565320027/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block14_checked
