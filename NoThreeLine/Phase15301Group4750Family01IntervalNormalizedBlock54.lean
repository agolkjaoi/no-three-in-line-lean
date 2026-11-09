import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block54Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(175130126623/51200000000:ℚ),(-8523435941/6400000000:ℚ)⟩) (.add (.scale ((-30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(79/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(350250410279/102400000000:ℚ),(-136384818023/102400000000:ℚ)⟩) (.add (.scale ((-30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1393/2048:ℚ),(1265/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1265/2048:ℚ),(1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(697/1024:ℚ),(-79/128:ℚ)⟩) (.add (.min (.atom ⟨(-1393/2048:ℚ),(1265/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(633/1024:ℚ),(-71/128:ℚ)⟩) (.add (.min (.atom ⟨(-1265/2048:ℚ),(1137/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(350469869283/102400000000:ℚ),(-136165359019/102400000000:ℚ)⟩) (.add (.scale ((-30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(79/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((41744869/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-79/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(5/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1265/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((14826103/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-71/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(3/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block54Cuts : List (ℚ × AutoTrace) := [((1837/2048:ℚ),.auto),((3675/4096:ℚ),.auto),((568/633:ℚ),.auto),((919/1024:ℚ),.auto),((4545/5063:ℚ),.auto),((115/128:ℚ),.auto),((4547/5061:ℚ),.auto),((3681/4096:ℚ),.auto),((1137/1265:ℚ),.auto),((1841/2048:ℚ),.auto),((921/1024:ℚ),.auto),((461/512:ℚ),.auto),((231/256:ℚ),.auto),((29/32:ℚ),.auto),((1857/2048:ℚ),.auto),((632/697:ℚ),.auto),((5057/5575:ℚ),.auto),((929/1024:ℚ),.auto),((1859/2048:ℚ),.auto),((5059/5573:ℚ),.auto),((1265/1393:ℚ),.auto),((465/512:ℚ),.auto),((233/256:ℚ),.auto),((117/128:ℚ),.auto)]
def block54 : NormalizedBlock := ⟨(117/128:ℚ),block54Cuts⟩

theorem block54_normalization :
    (gatheredExpr.intervalNormalize ((459/512:ℚ)) ((117/128:ℚ))).atomNormalize=block54Expr := by
  decide +kernel

theorem block54_checked : checkUpperBlock block54Expr 18446744073709551616 ((459/512:ℚ)) block54Cuts=
    some ((117/128:ℚ),(615229633388691061/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block54_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block54_checked
