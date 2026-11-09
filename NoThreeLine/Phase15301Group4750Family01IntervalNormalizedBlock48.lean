import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block48Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-232243003273/102400000000:ℚ),(43751209839/12800000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1009/1024:ℚ),(103/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((104000057/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(-463964714113/204800000000:ℚ),(700540649857/204800000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2017/2048:ℚ),(1649/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((104000057/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1393/2048:ℚ),(1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1009/1024:ℚ),(-103/128:ℚ)⟩) (.add (.min (.atom ⟨(-2017/2048:ℚ),(1649/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(-463777244113/204800000000:ℚ),(700728119857/204800000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1009/1024:ℚ),(103/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((104000057/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-103/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/128:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1649/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((2600491/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1137/2048:ℚ)⟩) (.add (.min (.atom ⟨(5/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-71/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block48Cuts : List (ℚ × AutoTrace) := [((13/16:ℚ),.auto),((417/512:ℚ),.auto),((568/697:ℚ),.auto),((835/1024:ℚ),.auto),((1671/2048:ℚ),.auto),((3343/4096:ℚ),.auto),((1137/1393:ℚ),.auto),((209/256:ℚ),.auto),((824/1009:ℚ),.auto),((3345/4096:ℚ),.auto),((6593/8071:ℚ),.auto),((1673/2048:ℚ),.auto),((6595/8069:ℚ),.auto),((837/1024:ℚ),.auto),((6697/8192:ℚ),.auto),((1649/2017:ℚ),.auto),((3349/4096:ℚ),.auto),((1675/2048:ℚ),.auto),((419/512:ℚ),.auto),((105/128:ℚ),.auto),((421/512:ℚ),.auto),((211/256:ℚ),.auto),((423/512:ℚ),.auto),((847/1024:ℚ),.auto)]
def block48 : NormalizedBlock := ⟨(847/1024:ℚ),block48Cuts⟩

theorem block48_normalization :
    (gatheredExpr.intervalNormalize ((415/512:ℚ)) ((847/1024:ℚ))).atomNormalize=block48Expr := by
  decide +kernel

theorem block48_checked : checkUpperBlock block48Expr 18446744073709551616 ((415/512:ℚ)) block48Cuts=
    some ((847/1024:ℚ),(1116717401123123097/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block48_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block48_checked
