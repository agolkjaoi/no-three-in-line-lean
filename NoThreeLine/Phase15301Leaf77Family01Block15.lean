import NoThreeLine.Phase15301Leaf77Family01Data
import NoThreeLine.BenchmarkUpperChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Leaf77.Family01
open OneSided

def block15 : List (ℚ × BoundTrace) := [((26385/30722:ℚ),.add (.minLeft .exact) .exact),((5079207729403/5914006097556:ℚ),.add (.minLeft .exact) .exact),((26386/30721:ℚ),.add (.minLeft .exact) .exact),((493/570:ℚ),.add (.minLeft .exact) .exact),((26130/30209:ℚ),.add (.minLeft .exact) .exact),((26385/30466:ℚ),.add (.minLeft .exact) .exact),((105541/121863:ℚ),.add (.minLeft .exact) .exact),((105543/121861:ℚ),.add (.minLeft .exact) .exact),((26386/30465:ℚ),.add (.minLeft .exact) .exact),((1759/2014:ℚ),.add (.minLeft .exact) .exact),((26386/30209:ℚ),.add (.minLeft .exact) .exact),((14097/16130:ℚ),.add (.minLeft .exact) .exact),((14098/16129:ℚ),.add (.minLeft .exact) .exact),((26641/30466:ℚ),.add (.minLeft .exact) .exact),((26642/30465:ℚ),.add (.minLeft .exact) .exact),((26641/30210:ℚ),.add (.minLeft .exact) .exact),((106565/120839:ℚ),.add (.minLeft .exact) .exact),((106567/120837:ℚ),.add (.minLeft .exact) .exact),((26642/30209:ℚ),.add (.minLeft .exact) .exact),((16145/18178:ℚ),.add (.minLeft .exact) .exact),((21527/24237:ℚ),.add (.minLeft .exact) .exact),((3799/4277:ℚ),.add (.minLeft .exact) .exact),((5382/6059:ℚ),.add (.minLeft .exact) .exact),((18193/20226:ℚ),.add (.minLeft .exact) .exact)]
theorem block15_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1742/2031:ℚ)) block15=
    some ((18193/20226:ℚ),(2625625240382461429/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Leaf77.Family01
#print axioms NoThreeLine.Phase15301Leaf77.Family01.block15_checked
