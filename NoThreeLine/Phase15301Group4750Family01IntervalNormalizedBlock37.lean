import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block37Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(128114113841/102400000000:ℚ),(6132154001/12800000000:ℚ)⟩) (.add (.scale ((-6931973/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(79/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((123498023/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((40293503/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(42095080601/102400000000:ℚ),(103455450919/102400000000:ℚ)⟩) (.add (.scale ((-6931973/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2033/2048:ℚ),(1265/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((40293503/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1009/2048:ℚ),(625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((6931973/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1017/1024:ℚ),(-79/128:ℚ)⟩) (.add (.min (.atom ⟨(-2033/2048:ℚ),(1265/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(51312672937/40960000000:ℚ),(98449601019/204800000000:ℚ)⟩) (.add (.scale ((-6931973/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(79/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((123498023/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((40293503/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((6931973/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-79/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2033/2048:ℚ),(-1265/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((155579777/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(625/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/2:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-39/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block37Cuts : List (ℚ × AutoTrace) := [((312/505:ℚ),.auto),((317/512:ℚ),.auto),((2537/4096:ℚ),.auto),((625/1009:ℚ),.auto),((1269/2048:ℚ),.auto),((635/1024:ℚ),.auto),((159/256:ℚ),.auto),((632/1017:ℚ),.auto),((1273/2048:ℚ),.auto),((5057/8135:ℚ),.auto),((5059/8133:ℚ),.auto),((637/1024:ℚ),.auto),((1265/2033:ℚ),.auto),((2549/4096:ℚ),.auto),((1275/2048:ℚ),.auto),((319/512:ℚ),.auto),((5/8:ℚ),.auto),((321/512:ℚ),.auto),((161/256:ℚ),.auto),((323/512:ℚ),.auto),((440/697:ℚ),.auto),((647/1024:ℚ),.auto),((1295/2048:ℚ),.auto),((18132739637/28673011080:ℚ),.auto)]
def block37 : NormalizedBlock := ⟨(18132739637/28673011080:ℚ),block37Cuts⟩

theorem block37_normalization :
    (gatheredExpr.intervalNormalize ((79/128:ℚ)) ((18132739637/28673011080:ℚ))).atomNormalize=block37Expr := by
  decide +kernel

theorem block37_checked : checkUpperBlock block37Expr 18446744073709551616 ((79/128:ℚ)) block37Cuts=
    some ((18132739637/28673011080:ℚ),(1153974573351867571/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block37_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block37_checked
