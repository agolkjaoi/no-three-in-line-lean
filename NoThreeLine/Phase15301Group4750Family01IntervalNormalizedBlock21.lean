import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block21Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(213870896523/102400000000:ℚ),(724301123/12800000000:ℚ)⟩) (.add (.scale ((-2892229/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-72298773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((98622689/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(427572623027/204800000000:ℚ),(11419647949/204800000000:ℚ)⟩) (.add (.scale ((-2892229/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-72298773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1521/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((98622689/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1137/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((2892229/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(953/1024:ℚ),(-39/128:ℚ)⟩) (.add (.min (.atom ⟨(-1905/2048:ℚ),(625/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((72298773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(761/1024:ℚ),(-31/128:ℚ)⟩) (.add (.min (.atom ⟨(-1521/2048:ℚ),(497/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(213870896523/102400000000:ℚ),(724301123/12800000000:ℚ)⟩) (.add (.scale ((-2892229/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-72298773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((98622689/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((117636567/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(625/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-39/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((30132199/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-39/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((2549419/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(369/2048:ℚ)⟩) (.add (.min (.atom ⟨(7/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block21Cuts : List (ℚ × AutoTrace) := [((331/1024:ℚ),.auto),((2649/8192:ℚ),.auto),((184/569:ℚ),.auto),((1325/4096:ℚ),.auto),((663/2048:ℚ),.auto),((83/256:ℚ),.auto),((123/379:ℚ),.auto),((333/1024:ℚ),.auto),((667/2048:ℚ),.auto),((248/761:ℚ),.auto),((1335/4096:ℚ),.auto),((1985/6087:ℚ),.auto),((167/512:ℚ),.auto),((1987/6085:ℚ),.auto),((669/2048:ℚ),.auto),((497/1521:ℚ),.auto),((1339/4096:ℚ),.auto),((335/1024:ℚ),.auto),((312/953:ℚ),.auto),((227/693:ℚ),.auto),((2499/7621:ℚ),.auto),((125/381:ℚ),.auto),((21/64:ℚ),.auto),((169/512:ℚ),.auto)]
def block21 : NormalizedBlock := ⟨(169/512:ℚ),block21Cuts⟩

theorem block21_normalization :
    (gatheredExpr.intervalNormalize ((165/512:ℚ)) ((169/512:ℚ))).atomNormalize=block21Expr := by
  decide +kernel

theorem block21_checked : checkUpperBlock block21Expr 18446744073709551616 ((165/512:ℚ)) block21Cuts=
    some ((169/512:ℚ),(736544037165174389/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block21_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block21_checked
