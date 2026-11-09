import NoThreeLine.Phase15301Group4750Family23Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized
open AutoEnvelope

def block02Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(30007528301/12800000000:ℚ),(10280595933/102400000000:ℚ)⟩) (.add (.scale ((-15393987/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(55/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-7361681/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(63/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-121/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-44254049/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-121/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(480178711563/204800000000:ℚ),(20619450613/204800000000:ℚ)⟩) (.add (.scale ((-15393987/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(881/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-7361681/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1009/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1649/2048:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-44254049/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1777/2048:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((15393987/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-55/128:ℚ),(57/1024:ℚ)⟩) (.add (.min (.atom ⟨(881/2048:ℚ),(-113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((7361681/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-63/128:ℚ),(57/1024:ℚ)⟩) (.add (.min (.atom ⟨(1009/2048:ℚ),(-113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((44254049/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-111/128:ℚ),(121/1024:ℚ)⟩) (.add (.min (.atom ⟨(1777/2048:ℚ),(-241/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.min (.add (.atom ⟨(1876300679/800000000:ℚ),(10386856437/102400000000:ℚ)⟩) (.add (.scale ((-15393987/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(55/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-7361681/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(63/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((115710943/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-121/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-44254049/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-121/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((5440569/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-271/2048:ℚ),(-241/2048:ℚ)⟩) (.add (.min (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(17/128:ℚ),(121/1024:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block02Cuts : List (ℚ × AutoTrace) := [((29/256:ℚ),.auto),((59/512:ℚ),.auto),((15/128:ℚ),.auto),((31/256:ℚ),.auto),((1/8:ℚ),.auto),((65/512:ℚ),.auto),((131/1024:ℚ),.auto),((263/2048:ℚ),.auto),((33/256:ℚ),.auto),((265/2048:ℚ),.auto),((133/1024:ℚ),.auto),((67/512:ℚ),.auto),((17/128:ℚ),.auto),((69/512:ℚ),.auto),((139/1024:ℚ),.auto),((279/2048:ℚ),.auto),((35/256:ℚ),.auto),((71/512:ℚ),.auto),((9/64:ℚ),.auto),((73/512:ℚ),.auto),((37/256:ℚ),.auto),((75/512:ℚ),.auto),((301/2048:ℚ),.auto),((151/1024:ℚ),.auto)]
def block02 : NormalizedBlock := ⟨(151/1024:ℚ),block02Cuts⟩

theorem block02_normalization :
    (gatheredExpr.intervalNormalize ((57/512:ℚ)) ((151/1024:ℚ))).atomNormalize=block02Expr := by
  decide +kernel

theorem block02_checked : checkUpperBlock block02Expr 18446744073709551616 ((57/512:ℚ)) block02Cuts=
    some ((151/1024:ℚ),(1572628151163318967/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized.block02_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized.block02_checked
