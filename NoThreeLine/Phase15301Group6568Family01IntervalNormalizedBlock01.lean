import NoThreeLine.Phase15301Group6568Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized
open AutoEnvelope

def block01Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(907453893881/409600000000:ℚ),(8284475247/102400000000:ℚ)⟩) (.add (.scale ((1714223/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3041/4096:ℚ),(57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((45232013/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2785/4096:ℚ),(57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((12201397/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2529/4096:ℚ),(57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-112769283/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2273/4096:ℚ),(57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(28362476111/12800000000:ℚ),(33283242659/409600000000:ℚ)⟩) (.add (.scale ((1714223/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-95/128:ℚ),(229/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((45232013/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-87/128:ℚ),(229/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((12201397/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-79/128:ℚ),(229/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-112769283/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-71/128:ℚ),(229/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((112769283/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(2273/4096:ℚ),(-57/1024:ℚ)⟩) (.add (.min (.atom ⟨(-71/128:ℚ),(229/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(907453893881/409600000000:ℚ),(8284475247/102400000000:ℚ)⟩) (.add (.scale ((1714223/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3041/4096:ℚ),(57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((45232013/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2785/4096:ℚ),(57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((12201397/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2529/4096:ℚ),(57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-112769283/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2273/4096:ℚ),(57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((38098371/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-127/128:ℚ),(229/4096:ℚ)⟩) (.add (.min (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(4065/4096:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((1386797/4000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(5/16:ℚ),0⟩) (.atom ⟨(4065/4096:ℚ),(-57/1024:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(127/128:ℚ),(-229/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((145341671/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(4065/4096:ℚ),(-57/1024:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(7/16:ℚ),0⟩) (.atom ⟨(127/128:ℚ),(-229/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block01Cuts : List (ℚ × AutoTrace) := [((19/256:ℚ),.auto),((77/1024:ℚ),.auto),((39/512:ℚ),.auto),((5/64:ℚ),.auto),((41/512:ℚ),.auto),((21/256:ℚ),.auto),((43/512:ℚ),.auto),((11/128:ℚ),.auto),((45/512:ℚ),.auto),((23/256:ℚ),.auto),((93/1024:ℚ),.auto),((47/512:ℚ),.auto),((3/32:ℚ),.auto),((49/512:ℚ),.auto),((25/256:ℚ),.auto),((51/512:ℚ),.auto),((205/2048:ℚ),.auto),((411/4096:ℚ),.auto),((103/1024:ℚ),.auto),((13/128:ℚ),.auto),((53/512:ℚ),.auto),((27/256:ℚ),.auto),((55/512:ℚ),.auto),((7/64:ℚ),.auto)]
def block01 : NormalizedBlock := ⟨(7/64:ℚ),block01Cuts⟩

theorem block01_normalization :
    (gatheredExpr.intervalNormalize ((37/512:ℚ)) ((7/64:ℚ))).atomNormalize=block01Expr := by
  decide +kernel

theorem block01_checked : checkUpperBlock block01Expr 18446744073709551616 ((37/512:ℚ)) block01Cuts=
    some ((7/64:ℚ),(378744338629291277/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized.block01_normalization
#print axioms NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized.block01_checked
