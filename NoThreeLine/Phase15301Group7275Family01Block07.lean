import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block07 : List (ℚ × AutoTrace) := [((18687875/46312896:ℚ),.add (.minLeft .auto) .auto),((2501/6081:ℚ),.add (.minLeft .auto) .auto),((1251/3040:ℚ),.add (.minLeft .auto) .auto),((211/503:ℚ),.add (.minLeft .auto) .auto),((91230144730/217391414747:ℚ),.add (.minLeft .auto) .auto),((739/1760:ℚ),.add (.minLeft .auto) .auto),((3013/7105:ℚ),.add (.minLeft .auto) .auto),((1507/3552:ℚ),.add (.minLeft .auto) .auto),((3525/8129:ℚ),.add (.minLeft .auto) .auto),((14101/32515:ℚ),.add (.minLeft .auto) .auto),((14103/32513:ℚ),.add (.minLeft .auto) .auto),((1763/4064:ℚ),.add (.minLeft .auto) .auto),((221/505:ℚ),.add (.minLeft .auto) .auto),((995/2272:ℚ),.add (.minLeft .auto) .auto),((2501/5569:ℚ),.add (.minLeft .auto) .auto),((417/928:ℚ),.add (.minLeft .auto) .auto),((3013/6593:ℚ),.add (.minLeft .auto) .auto),((1507/3296:ℚ),.add (.minLeft .auto) .auto),((1175/2539:ℚ),.add (.minLeft .auto) .auto),((14101/30467:ℚ),.add (.minLeft .auto) .auto),((1567/3385:ℚ),.add (.minLeft .auto) .auto),((1763/3808:ℚ),.add (.minLeft .auto) .auto),((453/961:ℚ),.add (.minLeft .auto) .auto),((259/549:ℚ),.add (.minLeft .auto) .auto)]
theorem block07_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1507/3808:ℚ)) block07=
    some ((259/549:ℚ),(6410195171740965957/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block07_checked
