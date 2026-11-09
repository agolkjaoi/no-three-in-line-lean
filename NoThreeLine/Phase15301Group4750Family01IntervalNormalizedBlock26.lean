import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block26Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(4780649239/3200000000:ℚ),(54591943/200000000:ℚ)⟩) (.add (.scale ((-7255343/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((22865109/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(9559536699/6400000000:ℚ),(1745180397/6400000000:ℚ)⟩) (.add (.scale ((-7255343/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2033/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((22865109/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((123498023/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-881/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((7255343/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1017/1024:ℚ),(-55/128:ℚ)⟩) (.add (.min (.atom ⟨(-2033/2048:ℚ),(881/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(306120830623/204800000000:ℚ),(56061428959/204800000000:ℚ)⟩) (.add (.scale ((-7255343/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((22865109/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((7255343/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-55/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2033/2048:ℚ),(-881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((12341877/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-881/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block26Cuts : List (ℚ × AutoTrace) := [((45500981953/108871546797:ℚ),.auto),((107/256:ℚ),.auto),((369/881:ℚ),.auto),((215/512:ℚ),.auto),((27/64:ℚ),.auto),((433/1024:ℚ),.auto),((376/889:ℚ),.auto),((753/1777:ℚ),.auto),((217/512:ℚ),.auto),((109/256:ℚ),.auto),((55/128:ℚ),.auto),((221/512:ℚ),.auto),((443/1024:ℚ),.auto),((440/1017:ℚ),.auto),((3521/8135:ℚ),.auto),((1773/4096:ℚ),.auto),((887/2048:ℚ),.auto),((3523/8133:ℚ),.auto),((1775/4096:ℚ),.auto),((881/2033:ℚ),.auto),((111/256:ℚ),.auto),((223/512:ℚ),.auto),((1785/4096:ℚ),.auto),((248/569:ℚ),.auto)]
def block26 : NormalizedBlock := ⟨(248/569:ℚ),block26Cuts⟩

theorem block26_normalization :
    (gatheredExpr.intervalNormalize ((855/2048:ℚ)) ((248/569:ℚ))).atomNormalize=block26Expr := by
  decide +kernel

theorem block26_checked : checkUpperBlock block26Expr 18446744073709551616 ((855/2048:ℚ)) block26Cuts=
    some ((248/569:ℚ),(1535928034201345997/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block26_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block26_checked
