import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block36Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-305700257/1280000000:ℚ),(2255456127/1600000000:ℚ)⟩) (.add (.scale ((-47075767/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(-3039190993/12800000000:ℚ),(18061460593/12800000000:ℚ)⟩) (.add (.scale ((-22067989/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-47075767/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(1009/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((22067989/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((47075767/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(825/1024:ℚ),(-63/128:ℚ)⟩) (.add (.min (.atom ⟨(-1649/2048:ℚ),(1009/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(-24283245879/102400000000:ℚ),(144521966809/102400000000:ℚ)⟩) (.add (.scale ((-47075767/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((8314207/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-71/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((39326881/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-63/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(3/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1009/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block36Cuts : List (ℚ × AutoTrace) := [((379/635:ℚ),.auto),((2445/4096:ℚ),.auto),((1223/2048:ℚ),.auto),((153/256:ℚ),.auto),((307/512:ℚ),.auto),((77/128:ℚ),.auto),((309/512:ℚ),.auto),((155/256:ℚ),.auto),((311/512:ℚ),.auto),((39/64:ℚ),.auto),((625/1024:ℚ),.auto),((1251/2048:ℚ),.auto),((168/275:ℚ),.auto),((2503/4096:ℚ),.auto),((4033/6599:ℚ),.auto),((313/512:ℚ),.auto),((2505/4096:ℚ),.auto),((1345/2199:ℚ),.auto),((1253/2048:ℚ),.auto),((1009/1649:ℚ),.auto),((627/1024:ℚ),.auto),((157/256:ℚ),.auto),((315/512:ℚ),.auto),((79/128:ℚ),.auto)]
def block36 : NormalizedBlock := ⟨(79/128:ℚ),block36Cuts⟩

theorem block36_normalization :
    (gatheredExpr.intervalNormalize ((611/1024:ℚ)) ((79/128:ℚ))).atomNormalize=block36Expr := by
  decide +kernel

theorem block36_checked : checkUpperBlock block36Expr 18446744073709551616 ((611/1024:ℚ)) block36Cuts=
    some ((79/128:ℚ),(1637705000395806883/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block36_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block36_checked
