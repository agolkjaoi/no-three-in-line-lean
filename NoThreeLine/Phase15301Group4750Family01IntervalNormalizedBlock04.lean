import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block04Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(226754467217/102400000000:ℚ),(1017391697/12800000000:ℚ)⟩) (.add (.scale ((-112769283/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(90730855221/40960000000:ℚ),(16423608823/204800000000:ℚ)⟩) (.add (.scale ((-112769283/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1137/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((112769283/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(569/1024:ℚ),(-7/128:ℚ)⟩) (.add (.min (.atom ⟨(-1137/2048:ℚ),(113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(226754467217/102400000000:ℚ),(1017391697/12800000000:ℚ)⟩) (.add (.scale ((-112769283/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((145341671/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(7/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block04Cuts : List (ℚ × AutoTrace) := [((403/4096:ℚ),.auto),((56/569:ℚ),.auto),((807/8192:ℚ),.auto),((101/1024:ℚ),.auto),((449/4551:ℚ),.auto),((25340516287/256582691213:ℚ),.auto),((451/4549:ℚ),.auto),((113/1137:ℚ),.auto),((51/512:ℚ),.auto),((205/2048:ℚ),.auto),((103/1024:ℚ),.auto),((207/2048:ℚ),.auto),((13/128:ℚ),.auto),((209/2048:ℚ),.auto),((105/1024:ℚ),.auto),((211/2048:ℚ),.auto),((53/512:ℚ),.auto),((213/2048:ℚ),.auto),((107/1024:ℚ),.auto),((120737/1148370:ℚ),.auto),((27/256:ℚ),.auto),((109/1024:ℚ),.auto),((55/512:ℚ),.auto),((111/1024:ℚ),.auto)]
def block04 : NormalizedBlock := ⟨(111/1024:ℚ),block04Cuts⟩

theorem block04_normalization :
    (gatheredExpr.intervalNormalize ((201/2048:ℚ)) ((111/1024:ℚ))).atomNormalize=block04Expr := by
  decide +kernel

theorem block04_checked : checkUpperBlock block04Expr 18446744073709551616 ((201/2048:ℚ)) block04Cuts=
    some ((111/1024:ℚ),(1692985915957802761/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block04_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block04_checked
