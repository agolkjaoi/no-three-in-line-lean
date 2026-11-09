import NoThreeLine.Phase15301Group6568Family11Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group6568.Family11.IntervalNormalized
open AutoEnvelope

def block14Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(81433357897/40960000000:ℚ),(-1238418497/10240000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3553/4096:ℚ),(881/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-31356967/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3553/4096:ℚ),(825/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(12720132959/6400000000:ℚ),(-24890904737/204800000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-111/128:ℚ),(3525/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-31356967/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-111/128:ℚ),(3301/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((31356967/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(3553/4096:ℚ),(-825/1024:ℚ)⟩) (.add (.min (.atom ⟨(-111/128:ℚ),(3301/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(32588320487/16384000000:ℚ),(-1966492267/16384000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3553/4096:ℚ),(881/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-31356967/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3553/4096:ℚ),(825/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-127/128:ℚ),(3525/4096:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(4065/4096:ℚ),(-881/1024:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((19310559/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(4065/4096:ℚ),(-825/1024:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(127/128:ℚ),(-3301/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(147203477/20000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block14Cuts : List (ℚ × AutoTrace) := [((475/512:ℚ),.auto),((951/1024:ℚ),.auto),((119/128:ℚ),.auto),((15/16:ℚ),.auto),((121/128:ℚ),.auto),((61/64:ℚ),.auto),((123/128:ℚ),.auto),((31/32:ℚ),.auto),((125/128:ℚ),.auto),((63/64:ℚ),.auto),((253/256:ℚ),.auto),((507/512:ℚ),.auto),((127/128:ℚ),.auto),(1,.auto)]
def block14 : NormalizedBlock := ⟨1,block14Cuts⟩

theorem block14_normalization :
    (gatheredExpr.intervalNormalize ((237/256:ℚ)) (1)).atomNormalize=block14Expr := by
  decide +kernel

theorem block14_checked : checkUpperBlock block14Expr 18446744073709551616 ((237/256:ℚ)) block14Cuts=
    some (1,(5018251368387111105/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group6568.Family11.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group6568.Family11.IntervalNormalized.block14_normalization
#print axioms NoThreeLine.Phase15301Group6568.Family11.IntervalNormalized.block14_checked
