import NoThreeLine.Phase15301Group6568Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized
open AutoEnvelope

def block19Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-30819785923/409600000000:ℚ),(181924292363/102400000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3553/4096:ℚ),(881/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(-956393869/12800000000:ℚ),(727912351567/409600000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-111/128:ℚ),(3525/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩)) (.add (.min (.add (.atom ⟨(-15076459037/204800000000:ℚ),(728364037301/409600000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-3553/4096:ℚ),(881/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-127/128:ℚ),(3525/4096:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(4065/4096:ℚ),(-881/1024:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block19Cuts : List (ℚ × AutoTrace) := [((123/128:ℚ),.auto),((247/256:ℚ),.auto),((31/32:ℚ),.auto),((249/256:ℚ),.auto),((125/128:ℚ),.auto),((63/64:ℚ),.auto),((127/128:ℚ),.auto),((509/512:ℚ),.auto),((255/256:ℚ),.auto),(1,.auto)]
def block19 : NormalizedBlock := ⟨1,block19Cuts⟩

theorem block19_normalization :
    (gatheredExpr.intervalNormalize ((245/256:ℚ)) (1)).atomNormalize=block19Expr := by
  decide +kernel

theorem block19_checked : checkUpperBlock block19Expr 18446744073709551616 ((245/256:ℚ)) block19Cuts=
    some (1,(1237904498705712561/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized.block19_normalization
#print axioms NoThreeLine.Phase15301Group6568.Family01.IntervalNormalized.block19_checked
