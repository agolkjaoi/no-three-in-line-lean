import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block08 : List (ℚ × AutoTrace) := [((1815/3841:ℚ),.add (.minLeft .auto) .auto),((227/480:ℚ),.add (.minLeft .auto) .auto),((193/397:ℚ),.add (.minLeft .auto) .auto),((483/992:ℚ),.add (.minLeft .auto) .auto),((1477/3009:ℚ),.add (.minLeft .auto) .auto),((5909/12035:ℚ),.add (.minLeft .auto) .auto),((5911/12033:ℚ),.add (.minLeft .auto) .auto),((739/1504:ℚ),.add (.minLeft .auto) .auto),((1989/4033:ℚ),.add (.minLeft .auto) .auto),((995/2016:ℚ),.add (.minLeft .auto) .auto),((2501/5057:ℚ),.add (.minLeft .auto) .auto),((1251/2528:ℚ),.add (.minLeft .auto) .auto),((3013/6081:ℚ),.add (.minLeft .auto) .auto),((12053/24323:ℚ),.add (.minLeft .auto) .auto),((12055/24321:ℚ),.add (.minLeft .auto) .auto),((1507/3040:ℚ),.add (.minLeft .auto) .auto),((705/1421:ℚ),.add (.minLeft .auto) .auto),((14101/28419:ℚ),.add (.minLeft .auto) .auto),((14103/28417:ℚ),.add (.minLeft .auto) .auto),((1763/3552:ℚ),.add (.minLeft .auto) .auto),((367/739:ℚ),.add (.minLeft .auto) .auto),((2307/4645:ℚ),.add (.minLeft .auto) .auto),((16151/32513:ℚ),.add (.minLeft .auto) .auto),((2019/4064:ℚ),.add (.minLeft .auto) .auto)]
theorem block08_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((259/549:ℚ)) block08=
    some ((2019/4064:ℚ),(2132763395317227029/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block08_checked
