import NoThreeLine.Phase15301Group4750Family23Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized
open AutoEnvelope

def block12Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(5057718087/6400000000:ℚ),(1899126319/2048000000:ℚ)⟩) (.add (.scale ((157081239/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-761/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-825/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(165014572127/204800000000:ℚ),(186947623713/204800000000:ℚ)⟩) (.add (.scale ((157081239/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1649/2048:ℚ),(-1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1777/2048:ℚ),(-1649/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((204420051/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1/128:ℚ),(-7/1024:ℚ)⟩) (.add (.min (.atom ⟨(-15/2048:ℚ),(15/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-111/128:ℚ),(825/1024:ℚ)⟩) (.add (.min (.atom ⟨(1777/2048:ℚ),(-1649/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(165752044367/204800000000:ℚ),(187685095953/204800000000:ℚ)⟩) (.add (.scale ((157081239/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-761/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-825/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((82787323/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-271/2048:ℚ),(-1521/2048:ℚ)⟩) (.add (.min (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(17/128:ℚ),(761/1024:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block12Cuts : List (ℚ × AutoTrace) := [((237/256:ℚ),.auto),((119/128:ℚ),.auto),((15/16:ℚ),.auto),((31/32:ℚ),.auto),(1,.auto)]
def block12 : NormalizedBlock := ⟨1,block12Cuts⟩

theorem block12_normalization :
    (gatheredExpr.intervalNormalize ((59/64:ℚ)) (1)).atomNormalize=block12Expr := by
  decide +kernel

theorem block12_checked : checkUpperBlock block12Expr 18446744073709551616 ((59/64:ℚ)) block12Cuts=
    some (1,(4690802335349947809/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized.block12_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family23.IntervalNormalized.block12_checked
