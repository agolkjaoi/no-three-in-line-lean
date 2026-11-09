import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block02Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(339638942669/102400000000:ℚ),(-390558707/12800000000:ℚ)⟩) (.add (.scale ((1714223/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((45232013/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(553205703019/204800000000:ℚ),(156708061/8192000000:ℚ)⟩) (.add (.scale ((-77021597/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((1714223/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1521/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((77021597/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(339638942669/102400000000:ℚ),(-390558707/12800000000:ℚ)⟩) (.add (.scale ((1714223/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((45232013/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((38098371/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(3/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((1386797/4000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(5/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block02Cuts : List (ℚ × AutoTrace) := [((113/1649:ℚ),.auto),((71/1024:ℚ),.auto),((9/128:ℚ),.auto),((73/1024:ℚ),.auto),((37/512:ℚ),.auto),((75/1024:ℚ),.auto),((56/761:ℚ),.auto),((19/256:ℚ),.auto),((113/1521:ℚ),.auto),((153/2048:ℚ),.auto),((77/1024:ℚ),.auto),((39/512:ℚ),.auto),((79/1024:ℚ),.auto),((5/64:ℚ),.auto),((81/1024:ℚ),.auto),((41/512:ℚ),.auto),((56/697:ℚ),.auto),((165/2048:ℚ),.auto),((1321/16384:ℚ),.auto),((3388880279/42024060773:ℚ),.auto),((661/8192:ℚ),.auto),((331/4096:ℚ),.auto),((83/1024:ℚ),.auto),((113/1393:ℚ),.auto)]
def block02 : NormalizedBlock := ⟨(113/1393:ℚ),block02Cuts⟩

theorem block02_normalization :
    (gatheredExpr.intervalNormalize ((451/6597:ℚ)) ((113/1393:ℚ))).atomNormalize=block02Expr := by
  decide +kernel

theorem block02_checked : checkUpperBlock block02Expr 18446744073709551616 ((451/6597:ℚ)) block02Cuts=
    some ((113/1393:ℚ),(1029647503987963071/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block02_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block02_checked
