import NoThreeLine.Phase15301Group7275Family11Data
import NoThreeLine.BenchmarkAutoChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group7275.Family11
open AutoEnvelope

def block08 : List (ℚ × AutoTrace) := [((193/397:ℚ),.add (.minLeft .auto) .auto),((45305669076/93089720849:ℚ),.add (.minLeft .auto) .auto),((483/992:ℚ),.add (.minLeft .auto) .auto),((1477/3009:ℚ),.add (.minLeft .auto) .auto),((5909/12035:ℚ),.add (.minLeft .auto) .auto),((5911/12033:ℚ),.add (.minLeft .auto) .auto),((739/1504:ℚ),.add (.minLeft .auto) .auto),((1989/4033:ℚ),.add (.minLeft .auto) .auto),((458209605813/928952752673:ℚ),.add (.minLeft .auto) .auto),((7957/16131:ℚ),.add (.minLeft .auto) .auto),((7959/16129:ℚ),.add (.minLeft .auto) .auto),((995/2016:ℚ),.add (.minLeft .auto) .auto),((2501/5057:ℚ),.add (.minLeft .auto) .auto),((514124042425/1038994832919:ℚ),.add (.minLeft .auto) .auto),((1251/2528:ℚ),.add (.minLeft .auto) .auto),((3013/6081:ℚ),.add (.minLeft .auto) .auto),((12053/24323:ℚ),.add (.minLeft .auto) .auto),((103630227215/209090679937:ℚ),.add (.minLeft .auto) .auto),((12055/24321:ℚ),.add (.minLeft .auto) .auto),((1507/3040:ℚ),.add (.minLeft .auto) .auto),((705/1421:ℚ),.add (.minLeft .auto) .auto),((112847476886/227434550199:ℚ),.add (.minLeft .auto) .auto),((1763/3552:ℚ),.add (.minLeft .auto) .auto),((367/739:ℚ),.add (.minLeft .auto) .auto)]
theorem block08_checked : checkUpperBlock gatheredExpr 18446744073709551616 ((227/480:ℚ)) block08=
    some ((367/739:ℚ),(1984347651411406941/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group7275.Family11
#print axioms NoThreeLine.Phase15301Group7275.Family11.block08_checked
