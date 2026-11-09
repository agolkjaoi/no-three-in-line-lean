import NoThreeLine.Phase15301Group2225Family23Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized
open AutoEnvelope

def block01Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(129211394921/25600000000:ℚ),(-1214195091/12800000000:ℚ)⟩) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(349/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(381/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(413/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(8412210811/25600000000:ℚ),(12482578079/51200000000:ℚ)⟩) (.add (.scale ((-8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-17/256:ℚ),(3/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((8059557/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(159/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(175/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(191/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(35/512:ℚ),(-1/256:ℚ)⟩) (.add (.min (.atom ⟨(-17/256:ℚ),(3/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-413/512:ℚ),(15/256:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(129211394921/25600000000:ℚ),(-1214195091/12800000000:ℚ)⟩) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(349/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(381/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(413/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-17/256:ℚ),(3/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((13282563/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(67/512:ℚ),(-1/256:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(33/256:ℚ),(-3/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-413/512:ℚ),(15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block01Cuts : List (ℚ × AutoTrace) := [((293/4096:ℚ),.auto),((147/2048:ℚ),.auto),((295/4096:ℚ),.auto),((37/512:ℚ),.auto),((297/4096:ℚ),.auto),((595/8192:ℚ),.auto),((149/2048:ℚ),.auto),((75/1024:ℚ),.auto),((19/256:ℚ),.auto),((77/1024:ℚ),.auto),((39/512:ℚ),.auto),((79/1024:ℚ),.auto),((5/64:ℚ),.auto),((161/2048:ℚ),.auto),((81/1024:ℚ),.auto),((41/512:ℚ),.auto),((21/256:ℚ),.auto),((85/1024:ℚ),.auto),((43/512:ℚ),.auto),((11/128:ℚ),.auto),((45/512:ℚ),.auto),((23/256:ℚ),.auto),((93/1024:ℚ),.auto),((47/512:ℚ),.auto)]
def block01 : NormalizedBlock := ⟨(47/512:ℚ),block01Cuts⟩

theorem block01_normalization :
    (gatheredExpr.intervalNormalize ((73/1024:ℚ)) ((47/512:ℚ))).atomNormalize=block01Expr := by
  decide +kernel

theorem block01_checked : checkUpperBlock block01Expr 18446744073709551616 ((73/1024:ℚ)) block01Cuts=
    some ((47/512:ℚ),(4606732997744601419/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized.block01_normalization
#print axioms NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized.block01_checked
