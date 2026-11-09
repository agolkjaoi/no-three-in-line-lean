import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block08Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(243451398411/102400000000:ℚ),(653201667/12800000000:ℚ)⟩) (.add (.scale ((-47075767/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-377/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(486995476019/204800000000:ℚ),(10543905869/204800000000:ℚ)⟩) (.add (.scale ((1714223/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-47075767/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-753/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((47075767/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(377/1024:ℚ),(-7/128:ℚ)⟩) (.add (.min (.atom ⟨(-753/2048:ℚ),(113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(243451398411/102400000000:ℚ),(653201667/12800000000:ℚ)⟩) (.add (.scale ((-47075767/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-377/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((3984357/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((555911/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(3/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((46061643/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(5/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block08Cuts : List (ℚ × AutoTrace) := [((149/1024:ℚ),.auto),((824783149/5654979791:ℚ),.auto),((299/2048:ℚ),.auto),((241/1649:ℚ),.auto),((75/512:ℚ),.auto),((19/128:ℚ),.auto),((56/377:ℚ),.auto),((1217/8192:ℚ),.auto),((10546444145/70988784299:ℚ),.auto),((2693540958/18129381845:ℚ),.auto),((609/4096:ℚ),.auto),((449/3015:ℚ),.auto),((305/2048:ℚ),.auto),((153/1024:ℚ),.auto),((451/3013:ℚ),.auto),((307/2048:ℚ),.auto),((113/753:ℚ),.auto),((615/4096:ℚ),.auto),((77/512:ℚ),.auto),((155/1024:ℚ),.auto),((39/256:ℚ),.auto),((157/1024:ℚ),.auto),((79/512:ℚ),.auto),((159/1024:ℚ),.auto)]
def block08 : NormalizedBlock := ⟨(159/1024:ℚ),block08Cuts⟩

theorem block08_normalization :
    (gatheredExpr.intervalNormalize ((8/55:ℚ)) ((159/1024:ℚ))).atomNormalize=block08Expr := by
  decide +kernel

theorem block08_checked : checkUpperBlock block08Expr 18446744073709551616 ((8/55:ℚ)) block08Cuts=
    some ((159/1024:ℚ),(1337981082517857061/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block08_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block08_checked
