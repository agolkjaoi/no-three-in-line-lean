import NoThreeLine.Phase15301Group2225Family12Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group2225.Family12.IntervalNormalized
open AutoEnvelope

def block02Expr : Expr := .add (.min (.add (.atom ⟨(11577270383/51200000000:ℚ),(1116944131/51200000000:ℚ)⟩) (.add (.scale ((53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-15/256:ℚ),(15/256:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-17/256:ℚ),(17/256:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-31/256:ℚ),(31/256:ℚ)⟩) (.add (.min (.atom ⟨(63/512:ℚ),(-61/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(3812977759/12800000000:ℚ),(-146591369/3200000000:ℚ)⟩)) (.atom ⟨0,0⟩)
def block02Cuts : List (ℚ × AutoTrace) := [(1,.auto)]
def block02 : NormalizedBlock := ⟨1,block02Cuts⟩

theorem block02_normalization :
    (gatheredExpr.intervalNormalize ((31/32:ℚ)) (1)).atomNormalize=block02Expr := by
  decide +kernel

theorem block02_checked : checkUpperBlock block02Expr 18446744073709551616 ((31/32:ℚ)) block02Cuts=
    some (1,(36419627078604805/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group2225.Family12.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group2225.Family12.IntervalNormalized.block02_normalization
#print axioms NoThreeLine.Phase15301Group2225.Family12.IntervalNormalized.block02_checked
