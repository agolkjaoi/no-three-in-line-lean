import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block08 : List (ℚ × AutoTrace) := [((1251/2528:ℚ),.add (.minLeft .auto) .auto),((3013/6081:ℚ),.add (.minLeft .auto) .auto),((12053/24323:ℚ),.add (.minLeft .auto) .auto),((12055/24321:ℚ),.add (.minLeft .auto) .auto),((1507/3040:ℚ),.add (.minLeft .auto) .auto),((705/1421:ℚ),.add (.minLeft .auto) .auto),((1763/3552:ℚ),.add (.minLeft .auto) .auto),((367/739:ℚ),.add (.minLeft .auto) .auto),((2307/4645:ℚ),.add (.minLeft .auto) .auto),((16151/32513:ℚ),.add (.minLeft .auto) .auto),((2019/4064:ℚ),.add (.minLeft .auto) .auto),((31785091/61910976:ℚ),.add (.minLeft .auto) .auto),((4037/7617:ℚ),.add (.minLeft .auto) .auto),((2019/3808:ℚ),.add (.minLeft .auto) .auto),((3525/6593:ℚ),.add (.minLeft .auto) .auto),((1763/3296:ℚ),.add (.minLeft .auto) .auto),((3013/5569:ℚ),.add (.minLeft .auto) .auto),((162832255318/300886146689:ℚ),.add (.minLeft .auto) .auto),((1507/2784:ℚ),.add (.minLeft .auto) .auto),((2501/4545:ℚ),.add (.minLeft .auto) .auto),((1251/2272:ℚ),.add (.minLeft .auto) .auto),((4549/8129:ℚ),.add (.minLeft .auto) .auto),((2275/4064:ℚ),.add (.minLeft .auto) .auto),((1989/3521:ℚ),.add (.minLeft .auto) .auto)]
theorem block08_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((10007/20225:ℚ)) block08=
    some ((1989/3521:ℚ),(1264422172528364351/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block08_checked
