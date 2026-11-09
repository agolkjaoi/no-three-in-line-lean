import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block16Expr : Expr := .add (.min (.add (.max (.atom ⟨(30479764919/25600000000:ℚ),(1036624283/3200000000:ℚ)⟩) (.add (.atom ⟨(61039150783/51200000000:ℚ),(16665609473/51200000000:ℚ)⟩) (.add (.scale ((-17102307/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2033/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((17102307/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1017/1024:ℚ),(-31/128:ℚ)⟩) (.add (.min (.atom ⟨(-2033/2048:ℚ),(497/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(122048669443/102400000000:ℚ),(33301586823/102400000000:ℚ)⟩) (.add (.scale ((17102307/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-31/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2033/2048:ℚ),(-497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block16Cuts : List (ℚ × AutoTrace) := [((999/4096:ℚ),.auto),((397/1627:ℚ),.auto),((1999/8192:ℚ),.auto),((125/512:ℚ),.auto),((1987/8133:ℚ),.auto),((1001/4096:ℚ),.auto),((497/2033:ℚ),.auto),((2003/8192:ℚ),.auto),((501/2048:ℚ),.auto),((251/1024:ℚ),.auto),((63/256:ℚ),.auto),((253/1024:ℚ),.auto),((127/512:ℚ),.auto),((255/1024:ℚ),.auto),((1/4:ℚ),.auto),((257/1024:ℚ),.auto),((129/512:ℚ),.auto),((977825/3874898:ℚ),.auto),((259/1024:ℚ),.auto),((65/256:ℚ),.auto),((261/1024:ℚ),.auto),((131/512:ℚ),.auto),((263/1024:ℚ),.auto),((33/128:ℚ),.auto)]
def block16 : NormalizedBlock := ⟨(33/128:ℚ),block16Cuts⟩

theorem block16_normalization :
    (gatheredExpr.intervalNormalize ((248/1017:ℚ)) ((33/128:ℚ))).atomNormalize=block16Expr := by
  decide +kernel

theorem block16_checked : checkUpperBlock block16Expr 18446744073709551616 ((248/1017:ℚ)) block16Cuts=
    some ((33/128:ℚ),(1596711493328368115/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block16_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block16_checked
