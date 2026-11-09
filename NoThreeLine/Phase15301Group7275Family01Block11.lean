import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block11 : List (ℚ × AutoTrace) := [((4549/7105:ℚ),.add (.minLeft .auto) .auto),((2275/3552:ℚ),.add (.minLeft .auto) .auto),((965/1473:ℚ),.add (.minLeft .auto) .auto),((203007080345/309773056627:ℚ),.add (.minLeft .auto) .auto),((3861/5891:ℚ),.add (.minLeft .auto) .auto),((3863/5889:ℚ),.add (.minLeft .auto) .auto),((21/32:ℚ),.add (.minLeft .auto) .auto),((39/59:ℚ),.add (.minLeft .auto) .auto),((279027396551/421904835862:ℚ),.add (.minLeft .auto) .auto),((995/1504:ℚ),.add (.minLeft .auto) .auto),((3013/4545:ℚ),.add (.minLeft .auto) .auto),((1507/2272:ℚ),.add (.minLeft .auto) .auto),((4037/6081:ℚ),.add (.minLeft .auto) .auto),((2019/3040:ℚ),.add (.minLeft .auto) .auto),((1687/2539:ℚ),.add (.minLeft .auto) .auto),((2531/3808:ℚ),.add (.minLeft .auto) .auto),((41796483/61910464:ℚ),.add (.minLeft .auto) .auto),((5573/8129:ℚ),.add (.minLeft .auto) .auto),((22293/32515:ℚ),.add (.minLeft .auto) .auto),((1715/2501:ℚ),.add (.minLeft .auto) .auto),((2787/4064:ℚ),.add (.minLeft .auto) .auto),((4549/6593:ℚ),.add (.minLeft .auto) .auto),((2275/3296:ℚ),.add (.minLeft .auto) .auto),((3525/5057:ℚ),.add (.minLeft .auto) .auto)]
theorem block11_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1763/2784:ℚ)) block11=
    some ((3525/5057:ℚ),(149961668546954153/576460752303423488:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block11_checked
