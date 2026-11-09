import NoThreeLine.Phase15301Group6568Family21Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group6568.Family21.IntervalNormalized
open AutoEnvelope

def block16Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(834150047681/409600000000:ℚ),(-23263076761/102400000000:ℚ)⟩) (.add (.scale ((-8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3809/4096:ℚ),(889/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3553/4096:ℚ),(881/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-61224377/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3553/4096:ℚ),(825/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(26058969111/12800000000:ℚ),(-93315343173/409600000000:ℚ)⟩) (.add (.scale ((-8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-119/128:ℚ),(3557/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-111/128:ℚ),(3525/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-61224377/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-111/128:ℚ),(3301/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(3809/4096:ℚ),(-889/1024:ℚ)⟩) (.add (.min (.atom ⟨(-119/128:ℚ),(3557/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((61224377/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(3553/4096:ℚ),(-825/1024:ℚ)⟩) (.add (.min (.atom ⟨(-111/128:ℚ),(3301/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(417237829183/204800000000:ℚ),(-92726696359/409600000000:ℚ)⟩) (.add (.scale ((-8329823/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3809/4096:ℚ),(889/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3553/4096:ℚ),(881/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-61224377/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3553/4096:ℚ),(825/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((44800429/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-127/128:ℚ),(3557/4096:ℚ)⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(4065/4096:ℚ),(-889/1024:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((13282563/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(4065/4096:ℚ),(-889/1024:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(127/128:ℚ),(-3557/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-127/128:ℚ),(3525/4096:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(4065/4096:ℚ),(-881/1024:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block16Cuts : List (ℚ × AutoTrace) := [((119/128:ℚ),.auto),((239/256:ℚ),.auto),((15/16:ℚ),.auto),((121/128:ℚ),.auto),((61/64:ℚ),.auto),((123/128:ℚ),.auto),((31/32:ℚ),.auto),((125/128:ℚ),.auto),((63/64:ℚ),.auto),((253/256:ℚ),.auto),((507/512:ℚ),.auto),((127/128:ℚ),.auto),(1,.auto)]
def block16 : NormalizedBlock := ⟨1,block16Cuts⟩

theorem block16_normalization :
    (gatheredExpr.intervalNormalize ((951/1024:ℚ)) (1)).atomNormalize=block16Expr := by
  decide +kernel

theorem block16_checked : checkUpperBlock block16Expr 18446744073709551616 ((951/1024:ℚ)) block16Cuts=
    some (1,(2250836242353495973/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group6568.Family21.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group6568.Family21.IntervalNormalized.block16_normalization
#print axioms NoThreeLine.Phase15301Group6568.Family21.IntervalNormalized.block16_checked
