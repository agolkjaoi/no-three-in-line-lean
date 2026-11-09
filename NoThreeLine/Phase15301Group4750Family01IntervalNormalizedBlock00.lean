import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block00Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(236213388567/102400000000:ℚ),(105044331/2560000000:ℚ)⟩) (.add (.scale ((-707391/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-13591551/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(472501808799/204800000000:ℚ),(1695715629/40960000000:ℚ)⟩) (.add (.scale ((-707391/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2033/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-13591551/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((707391/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩) (.add (.min (.atom ⟨(-2033/2048:ℚ),(113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((13591551/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(953/1024:ℚ),(-7/128:ℚ)⟩) (.add (.min (.atom ⟨(-1905/2048:ℚ),(113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(236213388567/102400000000:ℚ),(105044331/2560000000:ℚ)⟩) (.add (.scale ((-707391/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-13591551/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((707391/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2033/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((15006333/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block00Cuts : List (ℚ × AutoTrace) := [((1/32:ℚ),.auto),((3/64:ℚ),.auto),((7/128:ℚ),.auto),((225/4096:ℚ),.auto),((451/8192:ℚ),.auto),((56/1017:ℚ),.auto),((113/2048:ℚ),.auto),((449/8135:ℚ),.auto),((451/8133:ℚ),.auto),((113/2033:ℚ),.auto),((57/1024:ℚ),.auto),((29/512:ℚ),.auto),((59/1024:ℚ),.auto),((15/256:ℚ),.auto),((481/8192:ℚ),.auto),((56/953:ℚ),.auto),((963/16384:ℚ),.auto),((241/4096:ℚ),.auto),((449/7623:ℚ),.auto),((121/2048:ℚ),.auto),((451/7621:ℚ),.auto),((113/1905:ℚ),.auto),((243/4096:ℚ),.auto),((61/1024:ℚ),.auto)]
def block00 : NormalizedBlock := ⟨(61/1024:ℚ),block00Cuts⟩

theorem block00_normalization :
    (gatheredExpr.intervalNormalize (0) ((61/1024:ℚ))).atomNormalize=block00Expr := by
  decide +kernel

theorem block00_checked : checkUpperBlock block00Expr 18446744073709551616 (0) block00Cuts=
    some ((61/1024:ℚ),(9951442426872327673/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block00_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block00_checked
