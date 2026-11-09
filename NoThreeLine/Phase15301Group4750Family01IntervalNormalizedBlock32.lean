import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block32Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(200013354139/102400000000:ℚ),(363098407/2560000000:ℚ)⟩) (.add (.scale ((-25518969/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-224108453/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(81852881731/25600000000:ℚ),(-13879359507/25600000000:ℚ)⟩) (.add (.scale ((55883711/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-25518969/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1393/2048:ℚ),(753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((25518969/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(697/1024:ℚ),(-47/128:ℚ)⟩) (.add (.min (.atom ⟨(-1393/2048:ℚ),(753/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((224108453/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(569/1024:ℚ),(-39/128:ℚ)⟩) (.add (.min (.atom ⟨(-1137/2048:ℚ),(625/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(200063208793/102400000000:ℚ),(7286895467/51200000000:ℚ)⟩) (.add (.scale ((-25518969/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-224108453/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((64809739/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((13926327/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(753/2048:ℚ)⟩) (.add (.min (.atom ⟨(5/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-47/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((183300153/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-47/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(5/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((155579777/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(569/1024:ℚ),(-39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block32Cuts : List (ℚ × AutoTrace) := [((1093/2048:ℚ),.auto),((547/1024:ℚ),.auto),((881/1649:ℚ),.auto),((137/256:ℚ),.auto),((275/512:ℚ),.auto),((69/128:ℚ),.auto),((376/697:ℚ),.auto),((3009/5575:ℚ),.auto),((3011/5573:ℚ),.auto),((753/1393:ℚ),.auto),((277/512:ℚ),.auto),((139/256:ℚ),.auto),((279/512:ℚ),.auto),((35/64:ℚ),.auto),((561/1024:ℚ),.auto),((312/569:ℚ),.auto),((1123/2048:ℚ),.auto),((2247/4096:ℚ),.auto),((2497/4551:ℚ),.auto),((281/512:ℚ),.auto),((1125/2048:ℚ),.auto),((2499/4549:ℚ),.auto),((2251/4096:ℚ),.auto),((4503/8192:ℚ),.auto)]
def block32 : NormalizedBlock := ⟨(4503/8192:ℚ),block32Cuts⟩

theorem block32_normalization :
    (gatheredExpr.intervalNormalize ((2185/4096:ℚ)) ((4503/8192:ℚ))).atomNormalize=block32Expr := by
  decide +kernel

theorem block32_checked : checkUpperBlock block32Expr 18446744073709551616 ((2185/4096:ℚ)) block32Cuts=
    some ((4503/8192:ℚ),(1446489120316342397/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block32_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block32_checked
