import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((739/3040:ℚ),.add (.minLeft .auto) .auto),((1989/8129:ℚ),.add (.minLeft .auto) .auto),((7957/32515:ℚ),.add (.minLeft .auto) .auto),((7959/32513:ℚ),.add (.minLeft .auto) .auto),((995/4064:ℚ),.add (.minLeft .auto) .auto),((5220737/20636992:ℚ),.add (.minLeft .auto) .auto),((663/2539:ℚ),.add (.minLeft .auto) .auto),((7957/30467:ℚ),.add (.minLeft .auto) .auto),((2653/10155:ℚ),.add (.minLeft .auto) .auto),((995/3808:ℚ),.add (.minLeft .auto) .auto),((1477/5569:ℚ),.add (.minLeft .auto) .auto),((5909/22275:ℚ),.add (.minLeft .auto) .auto),((155102777975/584650815201:ℚ),.add (.minLeft .auto) .auto),((5911/22273:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((739/2784:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((965/3521:ℚ),.add (.minLeft .auto) .auto),((3861/14083:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((3863/14081:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((483/1760:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1989/7105:ℚ),.add (.minLeft .auto) .auto),((995/3552:ℚ),.add (.minLeft .auto) .auto),((1477/5057:ℚ),.add (.minLeft .auto) .auto),((739/2528:ℚ),.add (.minLeft .auto) .auto),((1989/6593:ℚ),.add (.minLeft .auto) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1477/6081:ℚ)) block04=
    some ((1989/6593:ℚ),(6157830762580738171/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block04_checked
