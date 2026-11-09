import NoThreeLine.Phase15301Group2225Family23Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized
open AutoEnvelope

def block00Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(11254734867/3200000000:ℚ),(13282563/1600000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-67/512:ℚ),(1/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-35/512:ℚ),(1/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(445/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(22677641851/6400000000:ℚ),(134401287/12800000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-33/256:ℚ),(3/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(207/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(223/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(67/512:ℚ),(-1/256:ℚ)⟩) (.add (.min (.atom ⟨(-33/256:ℚ),(3/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(35/512:ℚ),(-1/256:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-413/512:ℚ),(15/256:ℚ)⟩) (.add (.min (.atom ⟨(207/256:ℚ),(-29/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.min (.add (.atom ⟨(11254734867/3200000000:ℚ),(13282563/1600000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-67/512:ℚ),(1/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-35/512:ℚ),(1/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(445/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(67/512:ℚ),(-1/256:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(33/256:ℚ),(-3/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((13282563/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(35/512:ℚ),(-1/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨1,0⟩) (.atom ⟨(67/512:ℚ),(15/256:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(33/256:ℚ),(29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block00Cuts : List (ℚ × AutoTrace) := [((1/64:ℚ),.auto),((3/128:ℚ),.auto),((7/256:ℚ),.auto),((15/512:ℚ),.auto),((61/2048:ℚ),.auto),((31/1024:ℚ),.auto),((1/32:ℚ),.auto),((3/64:ℚ),.auto),((25/512:ℚ),.auto),((13/256:ℚ),.auto),((27/512:ℚ),.auto),((7/128:ℚ),.auto),((29/512:ℚ),.auto),((59/1024:ℚ),.auto),((15/256:ℚ),.auto),((1/16:ℚ),.auto),((33/512:ℚ),.auto),((133/2048:ℚ),.auto),((67/1024:ℚ),.auto),((17/256:ℚ),.auto),((69/1024:ℚ),.auto),((35/512:ℚ),.auto),((9/128:ℚ),.auto),((73/1024:ℚ),.auto)]
def block00 : NormalizedBlock := ⟨(73/1024:ℚ),block00Cuts⟩

theorem block00_normalization :
    (gatheredExpr.intervalNormalize (0) ((73/1024:ℚ))).atomNormalize=block00Expr := by
  decide +kernel

theorem block00_checked : checkUpperBlock block00Expr 18446744073709551616 (0) block00Cuts=
    some ((73/1024:ℚ),(9310780548107975761/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized.block00_normalization
#print axioms NoThreeLine.Phase15301Group2225.Family23.IntervalNormalized.block00_checked
