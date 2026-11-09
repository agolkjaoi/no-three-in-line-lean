import NoThreeLine.Phase15301Group6568Family23Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group6568.Family23.IntervalNormalized
open AutoEnvelope

def block00Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(90576166117/25600000000:ℚ),(1388813299/102400000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-135/1024:ℚ),(31/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(697/1024:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(761/1024:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(825/1024:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(889/1024:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.atom ⟨(362349464897/102400000000:ℚ),(44800429/3200000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-539/4096:ℚ),(1/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2789/4096:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3045/4096:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3301/4096:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3557/4096:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.add (.scale ((44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(135/1024:ℚ),(-31/4096:ℚ)⟩) (.add (.min (.atom ⟨(-539/4096:ℚ),(1/128:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-825/1024:ℚ),(225/4096:ℚ)⟩) (.add (.min (.atom ⟨(3301/4096:ℚ),(-7/128:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(90576166117/25600000000:ℚ),(1388813299/102400000000:ℚ)⟩) (.add (.scale ((-44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-135/1024:ℚ),(31/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(697/1024:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(761/1024:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-584509541/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(825/1024:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(889/1024:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(135/1024:ℚ),(-31/4096:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(539/4096:ℚ),(-1/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((88030373/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨1,0⟩) (.atom ⟨(135/1024:ℚ),(225/4096:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(539/4096:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block00Cuts : List (ℚ × AutoTrace) := [((1/32:ℚ),.auto),((3/64:ℚ),.auto),((7/128:ℚ),.auto),((29/512:ℚ),.auto),((59/1024:ℚ),.auto),((15/256:ℚ),.auto),((1/16:ℚ),.auto),((129/2048:ℚ),.auto),((65/1024:ℚ),.auto),((33/512:ℚ),.auto),((17/256:ℚ),.auto),((35/512:ℚ),.auto),((9/128:ℚ),.auto),((37/512:ℚ),.auto),((75/1024:ℚ),.auto),((151/2048:ℚ),.auto),((19/256:ℚ),.auto),((39/512:ℚ),.auto),((5/64:ℚ),.auto),((41/512:ℚ),.auto),((83/1024:ℚ),.auto),((21/256:ℚ),.auto),((11/128:ℚ),.auto),((45/512:ℚ),.auto)]
def block00 : NormalizedBlock := ⟨(45/512:ℚ),block00Cuts⟩

theorem block00_normalization :
    (gatheredExpr.intervalNormalize (0) ((45/512:ℚ))).atomNormalize=block00Expr := by
  decide +kernel

theorem block00_checked : checkUpperBlock block00Expr 18446744073709551616 (0) block00Cuts=
    some ((45/512:ℚ),(11247355122758732833/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group6568.Family23.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group6568.Family23.IntervalNormalized.block00_normalization
#print axioms NoThreeLine.Phase15301Group6568.Family23.IntervalNormalized.block00_checked
