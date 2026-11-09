import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block06 : List (ℚ × AutoTrace) := [((1477/4033:ℚ),.add (.minLeft .auto) .auto),((311/849:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((97263610703/265423014737:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5911/16129:ℚ),.add (.minLeft .auto) .auto),((739/2016:ℚ),.add (.minLeft .auto) .auto),((3013/8129:ℚ),.add (.minLeft .auto) .auto),((12053/32515:ℚ),.add (.minLeft .auto) .auto),((12055/32513:ℚ),.add (.minLeft .auto) .auto),((1507/4064:ℚ),.add (.minLeft .auto) .auto),((2501/6593:ℚ),.add (.minLeft .auto) .auto),((10005/26371:ℚ),.add (.minLeft .auto) .auto),((10007/26369:ℚ),.add (.minLeft .auto) .auto),((282123236555/743400623047:ℚ),.add (.minLeft .auto) .auto),((1251/3296:ℚ),.add (.minLeft .auto) .auto),((965/2497:ℚ),.add (.minLeft .auto) .auto),((1287/3329:ℚ),.add (.minLeft .auto) .auto),((3863/9985:ℚ),.add (.minLeft .auto) .auto),((161/416:ℚ),.add (.minLeft .auto) .auto),((153/389:ℚ),.add (.minLeft .auto) .auto),((7957/20227:ℚ),.add (.minLeft .auto) .auto),((7959/20225:ℚ),.add (.minLeft .auto) .auto),((995/2528:ℚ),.add (.minLeft .auto) .auto),((3013/7617:ℚ),.add (.minLeft .auto) .auto),((1507/3808:ℚ),.add (.minLeft .auto) .auto)]
theorem block06_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((995/2784:ℚ)) block06=
    some ((1507/3808:ℚ),(3673746100348831251/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block06_checked
