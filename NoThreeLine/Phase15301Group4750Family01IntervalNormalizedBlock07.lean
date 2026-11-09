import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block07Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(276118058779/102400000000:ℚ),(45567619/12800000000:ℚ)⟩) (.add (.scale ((57737829/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(552238073667/204800000000:ℚ),(731038013/204800000000:ℚ)⟩) (.add (.scale ((57737829/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((55883711/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-881/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨0,0⟩)) (.add (.min (.add (.atom ⟨(276118058779/102400000000:ℚ),(45567619/12800000000:ℚ)⟩) (.add (.scale ((57737829/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((23892003/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((3984357/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((54869587/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-881/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block07Cuts : List (ℚ × AutoTrace) := [((131/1024:ℚ),.auto),((525/4096:ℚ),.auto),((113/881:ℚ),.auto),((1051/8192:ℚ),.auto),((263/2048:ℚ),.auto),((33/256:ℚ),.auto),((133/1024:ℚ),.auto),((67/512:ℚ),.auto),((135/1024:ℚ),.auto),((17/128:ℚ),.auto),((137/1024:ℚ),.auto),((69/512:ℚ),.auto),((120/889:ℚ),.auto),((277/2048:ℚ),.auto),((555/4096:ℚ),.auto),((1111/8192:ℚ),.auto),((241/1777:ℚ),.auto),((139/1024:ℚ),.auto),((35/256:ℚ),.auto),((71/512:ℚ),.auto),((9/64:ℚ),.auto),((73/512:ℚ),.auto),((37/256:ℚ),.auto),((8/55:ℚ),.auto)]
def block07 : NormalizedBlock := ⟨(8/55:ℚ),block07Cuts⟩

theorem block07_normalization :
    (gatheredExpr.intervalNormalize ((261/2048:ℚ)) ((8/55:ℚ))).atomNormalize=block07Expr := by
  decide +kernel

theorem block07_checked : checkUpperBlock block07Expr 18446744073709551616 ((261/2048:ℚ)) block07Cuts=
    some ((8/55:ℚ),(155589427867994637/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block07_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block07_checked
