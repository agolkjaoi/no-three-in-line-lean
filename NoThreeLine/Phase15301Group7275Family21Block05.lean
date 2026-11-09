import NoThreeLine.Phase15301Group7275Family21Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family21
open AutoEnvelope

def block05 : List (ℚ × AutoTrace) := [((10007/30465:ℚ),.add (.minLeft .auto) .auto),((1251/3808:ℚ),.add (.minLeft .auto) .auto),((2501/7105:ℚ),.add (.minLeft .auto) .auto),((417/1184:ℚ),.add (.minLeft .auto) .auto),((1989/5569:ℚ),.add (.minLeft .auto) .auto),((7957/22275:ℚ),.add (.minLeft .auto) .auto),((7959/22273:ℚ),.add (.minLeft .auto) .auto),((995/2784:ℚ),.add (.minLeft .auto) .auto),((1477/4033:ℚ),.add (.minLeft .auto) .auto),((739/2016:ℚ),.add (.minLeft .auto) .auto),((3013/8129:ℚ),.add (.minLeft .auto) .auto),((12053/32515:ℚ),.add (.minLeft .auto) .auto),((12055/32513:ℚ),.add (.minLeft .auto) .auto),((1507/4064:ℚ),.add (.minLeft .auto) .auto),((2501/6593:ℚ),.add (.minLeft .auto) .auto),((10005/26371:ℚ),.add (.minLeft .auto) .auto),((10007/26369:ℚ),.add (.minLeft .auto) .auto),((1251/3296:ℚ),.add (.minLeft .auto) .auto),((965/2497:ℚ),.add (.minLeft .auto) .auto),((1287/3329:ℚ),.add (.minLeft .auto) .auto),((3863/9985:ℚ),.add (.minLeft .auto) .auto),((161/416:ℚ),.add (.minLeft .auto) .auto),((153/389:ℚ),.add (.minLeft .auto) .auto),((995/2528:ℚ),.add (.minLeft .auto) .auto)]
theorem block05_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((10005/30467:ℚ)) block05=
    some ((995/2528:ℚ),(4518467473874838397/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family21
#print axioms NoThreeLine.Phase15301Group7275.Family21.block05_checked
