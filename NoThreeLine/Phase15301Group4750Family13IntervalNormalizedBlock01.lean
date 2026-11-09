import NoThreeLine.Phase15301Group4750Family13Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized
open AutoEnvelope

def block01Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(27637106233/12800000000:ℚ),(13921154289/102400000000:ℚ)⟩) (.add (.scale ((45366831/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(55/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((517569/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(63/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((19453953/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(71/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(79/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-73231761/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-121/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.atom ⟨(102791693249/51200000000:ℚ),(7586959103/51200000000:ℚ)⟩) (.add (.scale ((45366831/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(881/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((517569/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1009/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((19453953/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1137/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-73231761/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1777/2048:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-79/128:ℚ),(57/1024:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((73231761/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-111/128:ℚ),(121/1024:ℚ)⟩) (.add (.min (.atom ⟨(1777/2048:ℚ),(-241/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(27637106233/12800000000:ℚ),(13921154289/102400000000:ℚ)⟩) (.add (.scale ((45366831/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(55/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((517569/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(63/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((19453953/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(71/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(79/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-73231761/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-121/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(147203477/20000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block01Cuts : List (ℚ × AutoTrace) := [((47/512:ℚ),.auto),((3/32:ℚ),.auto),((49/512:ℚ),.auto),((25/256:ℚ),.auto),((51/512:ℚ),.auto),((103/1024:ℚ),.auto),((13/128:ℚ),.auto),((53/512:ℚ),.auto),((27/256:ℚ),.auto),((55/512:ℚ),.auto),((7/64:ℚ),.auto),((57/512:ℚ),.auto),((29/256:ℚ),.auto),((59/512:ℚ),.auto),((15/128:ℚ),.auto),((61/512:ℚ),.auto),((31/256:ℚ),.auto),((1/8:ℚ),.auto),((33/256:ℚ),.auto),((67/512:ℚ),.auto),((17/128:ℚ),.auto),((35/256:ℚ),.auto),((9/64:ℚ),.auto),((37/256:ℚ),.auto)]
def block01 : NormalizedBlock := ⟨(37/256:ℚ),block01Cuts⟩

theorem block01_normalization :
    (gatheredExpr.intervalNormalize ((23/256:ℚ)) ((37/256:ℚ))).atomNormalize=block01Expr := by
  decide +kernel

theorem block01_checked : checkUpperBlock block01Expr 18446744073709551616 ((23/256:ℚ)) block01Cuts=
    some ((37/256:ℚ),(5597454106003560863/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized.block01_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized.block01_checked
