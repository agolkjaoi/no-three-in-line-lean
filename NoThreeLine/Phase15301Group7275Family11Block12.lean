import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block12 : List (ℚ × AutoTrace) := [((5573/8129:ℚ),.add (.minLeft .auto) .auto),((22293/32515:ℚ),.add (.minLeft .auto) .auto),((1715/2501:ℚ),.add (.minLeft .auto) .auto),((2787/4064:ℚ),.add (.minLeft .auto) .auto),((4549/6593:ℚ),.add (.minLeft .auto) .auto),((18197/26371:ℚ),.add (.minLeft .auto) .auto),((18199/26369:ℚ),.add (.minLeft .auto) .auto),((2275/3296:ℚ),.add (.minLeft .auto) .auto),((3525/5057:ℚ),.add (.minLeft .auto) .auto),((14101/20227:ℚ),.add (.minLeft .auto) .auto),((14103/20225:ℚ),.add (.minLeft .auto) .auto),((1763/2528:ℚ),.add (.minLeft .auto) .auto),((2501/3521:ℚ),.add (.minLeft .auto) .auto),((10005/14083:ℚ),.add (.minLeft .auto) .auto),((625631815393/880355388495:ℚ),.add (.minLeft .auto) .auto),((10007/14081:ℚ),.add (.minLeft .auto) .auto),((1251/1760:ℚ),.add (.minLeft .auto) .auto),((723/1015:ℚ),.add (.minLeft .auto) .auto),((35225300323/49436409425:ℚ),.add (.minLeft .auto) .auto),((2531/3552:ℚ),.add (.minLeft .auto) .auto),((4037/5569:ℚ),.add (.minLeft .auto) .auto),((5383/7425:ℚ),.add (.minLeft .auto) .auto),((16151/22273:ℚ),.add (.minLeft .auto) .auto),((26680806295/36791760881:ℚ),.add (.minLeft .auto) .auto)]
theorem block12_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((41796483/61910464:ℚ)) block12=
    some ((26680806295/36791760881:ℚ),(1026448632792980307/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block12_checked
