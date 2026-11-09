import NoThreeLine.Phase15301Group7275Family01Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family01
open AutoEnvelope

def block03 : List (ℚ × AutoTrace) := [((142056313915/732071306643:ℚ),.add (.minLeft .auto) .auto),((739/3808:ℚ),.add (.minLeft .auto) .auto),((211/1015:ℚ),.add (.minLeft .auto) .auto),((306979193407/1476636644009:ℚ),.add (.minLeft .auto) .auto),((33171400480/159538744021:ℚ),.add (.minLeft .auto) .auto),((5909/28419:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((5911/28417:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((739/3552:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((193/909:ℚ),.add (.minLeft .auto) .auto),((483/2272:ℚ),.add (.minLeft .auto) .auto),((1477/6593:ℚ),.add (.minLeft .auto) .auto),((133695958523/596348731297:ℚ),.add (.minLeft .auto) .auto),((739/3296:ℚ),.add (.minLeft .auto) .auto),((453/1985:ℚ),.add (.minLeft .auto) .auto),((31762847929/139163864395:ℚ),.add (.minLeft .auto) .auto),((1813/7939:ℚ),.add (.minLeft .auto) .auto),((1815/7937:ℚ),.add (.minLeft .auto) .auto),((227/992:ℚ),.add (.minLeft .auto) .auto),((965/4033:ℚ),.add (.minLeft .auto) .auto),((1287/5377:ℚ),.add (.minLeft .auto) .auto),((101588796293/424220275915:ℚ),.add (.minLeft .auto) .auto),((3863/16129:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((23/96:ℚ),.add (.minRight (.add (.minLeft .auto) .auto)) .auto),((1477/6081:ℚ),.add (.minLeft .auto) .auto)]
theorem block03_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((1477/7617:ℚ)) block03=
    some ((1477/6081:ℚ),(6095474601730941459/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family01
#print axioms NoThreeLine.Phase15301Group7275.Family01.block03_checked
