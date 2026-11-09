import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block40Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(85162863471/20480000000:ℚ),(-18344542997/12800000000:ℚ)⟩) (.add (.scale ((-2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(87/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(170241009399/40960000000:ℚ),(-293936275667/204800000000:ℚ)⟩) (.add (.scale ((-2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2033/2048:ℚ),(1393/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1017/1024:ℚ),(-87/128:ℚ)⟩) (.add (.min (.atom ⟨(-2033/2048:ℚ),(1393/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(851709814501/204800000000:ℚ),(-293431508161/204800000000:ℚ)⟩) (.add (.scale ((-2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(87/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-87/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2033/2048:ℚ),(-1393/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block40Cuts : List (ℚ × AutoTrace) := [((85/128:ℚ),.auto),((341/512:ℚ),.auto),((171/256:ℚ),.auto),((343/512:ℚ),.auto),((43/64:ℚ),.auto),((345/512:ℚ),.auto),((19351/28702:ℚ),.auto),((173/256:ℚ),.auto),((347/512:ℚ),.auto),((87/128:ℚ),.auto),((349/512:ℚ),.auto),((175/256:ℚ),.auto),((1401/2048:ℚ),.auto),((2803/4096:ℚ),.auto),((232/339:ℚ),.auto),((701/1024:ℚ),.auto),((5569/8135:ℚ),.auto),((1857/2711:ℚ),.auto),((1403/2048:ℚ),.auto),((1393/2033:ℚ),.auto),((351/512:ℚ),.auto),((11/16:ℚ),.auto),((705/1024:ℚ),.auto),((568/825:ℚ),.auto)]
def block40 : NormalizedBlock := ⟨(568/825:ℚ),block40Cuts⟩

theorem block40_normalization :
    (gatheredExpr.intervalNormalize ((253/381:ℚ)) ((568/825:ℚ))).atomNormalize=block40Expr := by
  decide +kernel

theorem block40_checked : checkUpperBlock block40Expr 18446744073709551616 ((253/381:ℚ)) block40Cuts=
    some ((568/825:ℚ),(467278443840016133/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block40_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block40_checked
