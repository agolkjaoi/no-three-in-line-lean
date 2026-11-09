import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block13Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(256688210969/102400000000:ℚ),(191489033/12800000000:ℚ)⟩) (.add (.scale ((45232013/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((7261771/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(364191371159/204800000000:ℚ),(36435178217/204800000000:ℚ)⟩) (.add (.scale ((7261771/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1137/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩)) (.add (.min (.add (.atom ⟨(513389714471/204800000000:ℚ),(3077117061/204800000000:ℚ)⟩) (.add (.scale ((45232013/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((7261771/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((14620251/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(369/2048:ℚ)⟩) (.add (.min (.atom ⟨(3/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((13934621/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(825/1024:ℚ),(-23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((18642707/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(7/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block13Cuts : List (ℚ × AutoTrace) := [((215/1024:ℚ),.auto),((120/569:ℚ),.auto),((27/128:ℚ),.auto),((217/1024:ℚ),.auto),((241/1137:ℚ),.auto),((869/4096:ℚ),.auto),((435/2048:ℚ),.auto),((109/512:ℚ),.auto),((219/1024:ℚ),.auto),((55/256:ℚ),.auto),((221/1024:ℚ),.auto),((111/512:ℚ),.auto),((45337/208450:ℚ),.auto),((223/1024:ℚ),.auto),((7/32:ℚ),.auto),((225/1024:ℚ),.auto),((113/512:ℚ),.auto),((227/1024:ℚ),.auto),((57/256:ℚ),.auto),((184/825:ℚ),.auto),((229/1024:ℚ),.auto),((33371353689/149185050779:ℚ),.auto),((1833/8192:ℚ),.auto),((369/1649:ℚ),.auto)]
def block13 : NormalizedBlock := ⟨(369/1649:ℚ),block13Cuts⟩

theorem block13_normalization :
    (gatheredExpr.intervalNormalize ((107/512:ℚ)) ((369/1649:ℚ))).atomNormalize=block13Expr := by
  decide +kernel

theorem block13_checked : checkUpperBlock block13Expr 18446744073709551616 ((107/512:ℚ)) block13Cuts=
    some ((369/1649:ℚ),(923272153191637631/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block13_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block13_checked
