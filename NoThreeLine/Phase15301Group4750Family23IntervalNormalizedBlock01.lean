import NoThreeLine.Phase15301Group4750Family23Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized
open AutoEnvelope

def block01Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(4304069299/12800000000:ℚ),(24769228371/102400000000:ℚ)⟩) (.add (.scale ((-8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-9/128:ℚ),(7/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-148913751/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(71/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((8059557/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(79/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(87/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(95/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.atom ⟨(68669180997/204800000000:ℚ),(9868505791/40960000000:ℚ)⟩) (.add (.scale ((-8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-143/2048:ℚ),(15/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-148913751/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1137/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((8059557/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1265/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1393/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1521/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.add (.scale ((8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(9/128:ℚ),(-7/1024:ℚ)⟩) (.add (.min (.atom ⟨(-143/2048:ℚ),(15/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((148913751/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-71/128:ℚ),(57/1024:ℚ)⟩) (.add (.min (.atom ⟨(1137/2048:ℚ),(-113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(4304069299/12800000000:ℚ),(24769228371/102400000000:ℚ)⟩) (.add (.scale ((-8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-9/128:ℚ),(7/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-148913751/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(71/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((8059557/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(79/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(87/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(95/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-271/2048:ℚ),(15/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(17/128:ℚ),(-7/1024:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((13282563/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(17/128:ℚ),(-7/1024:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(271/2048:ℚ),(-15/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block01Cuts : List (ℚ × AutoTrace) := [((153/2048:ℚ),.auto),((307/4096:ℚ),.auto),((77/1024:ℚ),.auto),((39/512:ℚ),.auto),((5/64:ℚ),.auto),((41/512:ℚ),.auto),((83/1024:ℚ),.auto),((21/256:ℚ),.auto),((43/512:ℚ),.auto),((11/128:ℚ),.auto),((45/512:ℚ),.auto),((91/1024:ℚ),.auto),((183/2048:ℚ),.auto),((23/256:ℚ),.auto),((3/32:ℚ),.auto),((25/256:ℚ),.auto),((51/512:ℚ),.auto),((103/1024:ℚ),.auto),((13/128:ℚ),.auto),((53/512:ℚ),.auto),((27/256:ℚ),.auto),((55/512:ℚ),.auto),((7/64:ℚ),.auto),((57/512:ℚ),.auto)]
def block01 : NormalizedBlock := ⟨(57/512:ℚ),block01Cuts⟩

theorem block01_normalization :
    (gatheredExpr.intervalNormalize ((19/256:ℚ)) ((57/512:ℚ))).atomNormalize=block01Expr := by
  decide +kernel

theorem block01_checked : checkUpperBlock block01Expr 18446744073709551616 ((19/256:ℚ)) block01Cuts=
    some ((57/512:ℚ),(7825854615307050185/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized.block01_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized.block01_checked
