import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block55Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(55461302087/102400000000:ℚ),(16767103511/12800000000:ℚ)⟩) (.add (.scale ((-163320237/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(95/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(87/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(95147909371/51200000000:ℚ),(5054384549/51200000000:ℚ)⟩) (.add (.scale ((-105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1521/2048:ℚ),(1393/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((163320237/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(825/1024:ℚ),(-95/128:ℚ)⟩) (.add (.min (.atom ⟨(-1649/2048:ℚ),(1521/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(761/1024:ℚ),(-87/128:ℚ)⟩) (.add (.min (.atom ⟨(-1521/2048:ℚ),(1393/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(6966106977/12800000000:ℚ),(134404381817/102400000000:ℚ)⟩) (.add (.scale ((-163320237/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(95/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(87/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((131760391/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(825/1024:ℚ),(-95/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block55Cuts : List (ℚ × AutoTrace) := [((1873/2048:ℚ),.auto),((696/761:ℚ),.auto),((7493/8192:ℚ),.auto),((48799421997/53349970889:ℚ),.auto),((3747/4096:ℚ),.auto),((5569/6087:ℚ),.auto),((937/1024:ℚ),.auto),((1875/2048:ℚ),.auto),((5571/6085:ℚ),.auto),((3751/4096:ℚ),.auto),((1393/1521:ℚ),.auto),((469/512:ℚ),.auto),((235/256:ℚ),.auto),((471/512:ℚ),.auto),((943/1024:ℚ),.auto),((3773/4096:ℚ),.auto),((152/165:ℚ),.auto),((1887/2048:ℚ),.auto),((6081/6599:ℚ),.auto),((59/64:ℚ),.auto),((6083/6597:ℚ),.auto),((3777/4096:ℚ),.auto),((1889/2048:ℚ),.auto),((1521/1649:ℚ),.auto)]
def block55 : NormalizedBlock := ⟨(1521/1649:ℚ),block55Cuts⟩

theorem block55_normalization :
    (gatheredExpr.intervalNormalize ((117/128:ℚ)) ((1521/1649:ℚ))).atomNormalize=block55Expr := by
  decide +kernel

theorem block55_checked : checkUpperBlock block55Expr 18446744073709551616 ((117/128:ℚ)) block55Cuts=
    some ((1521/1649:ℚ),(296315089263747255/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block55_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block55_checked
