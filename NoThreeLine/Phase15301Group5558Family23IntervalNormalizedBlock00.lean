import NoThreeLine.Phase15301Group5558Family23Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized
open AutoEnvelope

def block00Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(11316420711/3200000000:ℚ),(134401287/10240000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-17/128:ℚ),(15/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(95/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(362170263181/102400000000:ℚ),(1388813299/102400000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-543/4096:ℚ),(31/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3041/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3297/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3553/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(17/128:ℚ),(-15/2048:ℚ)⟩) (.add (.min (.atom ⟨(-543/4096:ℚ),(31/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-103/128:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(3297/4096:ℚ),(-225/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(11316420711/3200000000:ℚ),(134401287/10240000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-17/128:ℚ),(15/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(95/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(17/128:ℚ),(-15/2048:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(543/4096:ℚ),(-31/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨1,0⟩) (.atom ⟨(17/128:ℚ),(113/2048:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(543/4096:ℚ),(225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block00Cuts : List (ℚ × AutoTrace) := [((1/32:ℚ),.auto),((3/64:ℚ),.auto),((7/128:ℚ),.auto),((113/2048:ℚ),.auto),((57/1024:ℚ),.auto),((29/512:ℚ),.auto),((15/256:ℚ),.auto),((1/16:ℚ),.auto),((129/2048:ℚ),.auto),((65/1024:ℚ),.auto),((33/512:ℚ),.auto),((17/256:ℚ),.auto),((35/512:ℚ),.auto),((561/8192:ℚ),.auto),((281/4096:ℚ),.auto),((141/2048:ℚ),.auto),((71/1024:ℚ),.auto),((9/128:ℚ),.auto),((73/1024:ℚ),.auto),((37/512:ℚ),.auto),((19/256:ℚ),.auto),((153/2048:ℚ),.auto),((77/1024:ℚ),.auto),((39/512:ℚ),.auto)]
def block00 : NormalizedBlock := ⟨(39/512:ℚ),block00Cuts⟩

theorem block00_normalization :
    (gatheredExpr.intervalNormalize (0) ((39/512:ℚ))).atomNormalize=block00Expr := by
  decide +kernel

theorem block00_checked : checkUpperBlock block00Expr 18446744073709551616 (0) block00Cuts=
    some ((39/512:ℚ),(9956528255182065961/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized.block00_normalization
#print axioms NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized.block00_checked
