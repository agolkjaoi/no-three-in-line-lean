import NoThreeLine.Phase15301Group4750Family23Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized
open AutoEnvelope

def block00Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(11316420711/3200000000:ℚ),(313603003/25600000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-17/128:ℚ),(7/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(36221506361/10240000000:ℚ),(134401287/10240000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-271/2048:ℚ),(15/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1649/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1777/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(17/128:ℚ),(-7/1024:ℚ)⟩) (.add (.min (.atom ⟨(-271/2048:ℚ),(15/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-103/128:ℚ),(57/1024:ℚ)⟩) (.add (.min (.atom ⟨(1649/2048:ℚ),(-113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(11316420711/3200000000:ℚ),(313603003/25600000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-17/128:ℚ),(7/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(17/128:ℚ),(-7/1024:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(271/2048:ℚ),(-15/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨1,0⟩) (.atom ⟨(17/128:ℚ),(57/1024:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(271/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block00Cuts : List (ℚ × AutoTrace) := [((1/32:ℚ),.auto),((3/64:ℚ),.auto),((13/256:ℚ),.auto),((53/1024:ℚ),.auto),((27/512:ℚ),.auto),((7/128:ℚ),.auto),((57/1024:ℚ),.auto),((29/512:ℚ),.auto),((15/256:ℚ),.auto),((1/16:ℚ),.auto),((65/1024:ℚ),.auto),((131/2048:ℚ),.auto),((33/512:ℚ),.auto),((17/256:ℚ),.auto),((35/512:ℚ),.auto),((141/2048:ℚ),.auto),((283/4096:ℚ),.auto),((567/8192:ℚ),.auto),((71/1024:ℚ),.auto),((9/128:ℚ),.auto),((73/1024:ℚ),.auto),((37/512:ℚ),.auto),((75/1024:ℚ),.auto),((19/256:ℚ),.auto)]
def block00 : NormalizedBlock := ⟨(19/256:ℚ),block00Cuts⟩

theorem block00_normalization :
    (gatheredExpr.intervalNormalize (0) ((19/256:ℚ))).atomNormalize=block00Expr := by
  decide +kernel

theorem block00_checked : checkUpperBlock block00Expr 18446744073709551616 (0) block00Cuts=
    some ((19/256:ℚ),(19454960367063876451/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized.block00_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized.block00_checked
