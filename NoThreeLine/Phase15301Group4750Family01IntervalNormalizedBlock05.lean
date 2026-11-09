import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block05Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(137987371151/102400000000:ℚ),(2342604263/12800000000:ℚ)⟩) (.add (.scale ((-104962003/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((35602497/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(276189443479/204800000000:ℚ),(7539273877/40960000000:ℚ)⟩) (.add (.scale ((-104962003/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2033/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((35602497/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1009/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((104962003/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩) (.add (.min (.atom ⟨(-2033/2048:ℚ),(241/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(137987371151/102400000000:ℚ),(2342604263/12800000000:ℚ)⟩) (.add (.scale ((-104962003/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((35602497/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((104962003/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2033/2048:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((145341671/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/2:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((54869587/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/2:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block05Cuts : List (ℚ × AutoTrace) := [((7/64:ℚ),.auto),((113/1024:ℚ),.auto),((56/505:ℚ),.auto),((57/512:ℚ),.auto),((229/2048:ℚ),.auto),((113/1009:ℚ),.auto),((459/4096:ℚ),.auto),((115/1024:ℚ),.auto),((29/256:ℚ),.auto),((117/1024:ℚ),.auto),((59/512:ℚ),.auto),((119/1024:ℚ),.auto),((15/128:ℚ),.auto),((241/2048:ℚ),.auto),((483/4096:ℚ),.auto),((1933/16384:ℚ),.auto),((40/339:ℚ),.auto),((967/8192:ℚ),.auto),((961/8135:ℚ),.auto),((121/1024:ℚ),.auto),((321/2711:ℚ),.auto),((241/2033:ℚ),.auto),((243/2048:ℚ),.auto),((61/512:ℚ),.auto)]
def block05 : NormalizedBlock := ⟨(61/512:ℚ),block05Cuts⟩

theorem block05_normalization :
    (gatheredExpr.intervalNormalize ((111/1024:ℚ)) ((61/512:ℚ))).atomNormalize=block05Expr := by
  decide +kernel

theorem block05_checked : checkUpperBlock block05Expr 18446744073709551616 ((111/1024:ℚ)) block05Cuts=
    some ((61/512:ℚ),(1694195571453492843/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block05_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block05_checked
