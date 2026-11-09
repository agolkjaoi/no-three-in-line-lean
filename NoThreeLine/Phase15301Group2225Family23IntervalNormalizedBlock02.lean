import NoThreeLine.Phase15301Group2225Family23Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized
open AutoEnvelope

def block02Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(4280624853/1600000000:ℚ),(46927569/800000000:ℚ)⟩) (.add (.scale ((-7361681/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(253/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-148913751/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(285/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((8059557/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(317/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(40683990871/12800000000:ℚ),(396334907/25600000000:ℚ)⟩) (.add (.scale ((-15393987/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-7361681/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(127/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-148913751/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(143/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((15393987/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-221/512:ℚ),(15/256:ℚ)⟩) (.add (.min (.atom ⟨(111/256:ℚ),(-29/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((7361681/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-253/512:ℚ),(15/256:ℚ)⟩) (.add (.min (.atom ⟨(127/256:ℚ),(-29/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((148913751/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-285/512:ℚ),(15/256:ℚ)⟩) (.add (.min (.atom ⟨(143/256:ℚ),(-29/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.min (.add (.atom ⟨(8574532269/3200000000:ℚ),(200992839/3200000000:ℚ)⟩) (.add (.scale ((-7361681/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(253/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-148913751/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(285/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((8059557/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(317/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block02Cuts : List (ℚ × AutoTrace) := [((3/32:ℚ),.auto),((25/256:ℚ),.auto),((51/512:ℚ),.auto),((103/1024:ℚ),.auto),((13/128:ℚ),.auto),((105/1024:ℚ),.auto),((53/512:ℚ),.auto),((107/1024:ℚ),.auto),((27/256:ℚ),.auto),((55/512:ℚ),.auto),((7/64:ℚ),.auto),((29/256:ℚ),.auto),((117/1024:ℚ),.auto),((59/512:ℚ),.auto),((15/128:ℚ),.auto),((61/512:ℚ),.auto),((31/256:ℚ),.auto),((1/8:ℚ),.auto),((33/256:ℚ),.auto),((133/1024:ℚ),.auto),((67/512:ℚ),.auto),((135/1024:ℚ),.auto),((17/128:ℚ),.auto),((69/512:ℚ),.auto)]
def block02 : NormalizedBlock := ⟨(69/512:ℚ),block02Cuts⟩

theorem block02_normalization :
    (gatheredExpr.intervalNormalize ((47/512:ℚ)) ((69/512:ℚ))).atomNormalize=block02Expr := by
  decide +kernel

theorem block02_checked : checkUpperBlock block02Expr 18446744073709551616 ((47/512:ℚ)) block02Cuts=
    some ((69/512:ℚ),(8248004345367241589/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized.block02_normalization
#print axioms NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized.block02_checked
