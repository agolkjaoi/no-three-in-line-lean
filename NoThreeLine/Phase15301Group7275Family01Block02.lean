import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block02 : List (ℚ × AutoTrace) := [((14217372413/94433497823:ℚ),.add (.minLeft .auto) .auto),((21785734747/144701467895:ℚ),.add (.minLeft .auto) .auto),((1813/12035:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((605/4011:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((227/1504:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((965/6081:ℚ),.add (.minLeft .auto) .auto),((297/1871:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3863/24321:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((483/3040:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5623427/33859520:ℚ),.add (.minLeft .auto) .auto),((965/5569:ℚ),.add (.minLeft .auto) .auto),((161/928:ℚ),.add (.minLeft .auto) .auto),((453/2497:ℚ),.add (.minLeft .auto) .auto),((1477/8129:ℚ),.add (.minLeft .auto) .auto),((5909/32515:ℚ),.add (.minLeft .auto) .auto),((5911/32513:ℚ),.add (.minLeft .auto) .auto),((739/4064:ℚ),.add (.minLeft .auto) .auto),((227/1248:ℚ),.add (.minLeft .auto) .auto),((965/5057:ℚ),.add (.minLeft .auto) .auto),((3861/20227:ℚ),.add (.minLeft .auto) .auto),((135219320403/708182471189:ℚ),.add (.minLeft .auto) .auto),((3863/20225:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((483/2528:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1477/7617:ℚ),.add (.minLeft .auto) .auto)]
theorem block02_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((151/1003:ℚ)) block02=
    some ((1477/7617:ℚ),(5688615357356736337/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block02_checked
