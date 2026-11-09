import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block04 : List (ℚ × AutoTrace) := [((663/2539:ℚ),.add (.minLeft .auto) .auto),((995/3808:ℚ),.add (.minLeft .auto) .auto),((1477/5569:ℚ),.add (.minLeft .auto) .auto),((1028073661/3875505487:ℚ),.add (.minLeft .auto) .auto),((5909/22275:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5911/22273:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((739/2784:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((965/3521:ℚ),.add (.minLeft .auto) .auto),((483/1760:ℚ),.add (.minLeft .auto) .auto),((1989/7105:ℚ),.add (.minLeft .auto) .auto),((995/3552:ℚ),.add (.minLeft .auto) .auto),((1477/5057:ℚ),.add (.minLeft .auto) .auto),((739/2528:ℚ),.add (.minLeft .auto) .auto),((1989/6593:ℚ),.add (.minLeft .auto) .auto),((7957/26371:ℚ),.add (.minLeft .auto) .auto),((1137/3767:ℚ),.add (.minLeft .auto) .auto),((995/3296:ℚ),.add (.minLeft .auto) .auto),((151/491:ℚ),.add (.minLeft .auto) .auto),((2501/8129:ℚ),.add (.minLeft .auto) .auto),((2001/6503:ℚ),.add (.minLeft .auto) .auto),((10007/32513:ℚ),.add (.minLeft .auto) .auto),((1251/4064:ℚ),.add (.minLeft .auto) .auto),((51751641877/168115087445:ℚ),.add (.minLeft .auto) .auto),((227/736:ℚ),.add (.minLeft .auto) .auto)]
theorem block04_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((5220737/20636992:ℚ)) block04=
    some ((227/736:ℚ),(2638879274762305691/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block04_checked
