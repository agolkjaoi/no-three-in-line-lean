import NoThreeLine.Phase15301Group6568Family20Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group6568.Family20.IntervalNormalized
open AutoEnvelope

def block05Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-2035977449/12800000000:ℚ),(60274488521/102400000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1/16:ℚ),(-63/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((61224377/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(15/128:ℚ),(-71/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(23/128:ℚ),(-135/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((18573479/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(31/128:ℚ),(-135/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(-13112046147/81920000000:ℚ),(240689001717/409600000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(257/4096:ℚ),(-251/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((61224377/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(481/4096:ℚ),(-283/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(737/4096:ℚ),(-539/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((18573479/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(993/4096:ℚ),(-539/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-1/16:ℚ),(63/1024:ℚ)⟩) (.add (.min (.atom ⟨(257/4096:ℚ),(-251/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(-2035977449/12800000000:ℚ),(60274488521/102400000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1/16:ℚ),(-63/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((61224377/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(15/128:ℚ),(-71/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(23/128:ℚ),(-135/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((18573479/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(31/128:ℚ),(-135/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((164215389/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-31/4096:ℚ),(-283/4096:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1/128:ℚ),(71/1024:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((25747753/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1/128:ℚ),(71/1024:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(31/4096:ℚ),(283/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block05Cuts : List (ℚ × AutoTrace) := [((35/64:ℚ),.auto),((9/16:ℚ),.auto),((37/64:ℚ),.auto),((19/32:ℚ),.auto),((5/8:ℚ),.auto),((21/32:ℚ),.auto),((11/16:ℚ),.auto),((23/32:ℚ),.auto),((3/4:ℚ),.auto),((25/32:ℚ),.auto),((13/16:ℚ),.auto),((27/32:ℚ),.auto),((7/8:ℚ),.auto),((29/32:ℚ),.auto),((15/16:ℚ),.auto),((31/32:ℚ),.auto),((63/64:ℚ),.auto),(1,.auto)]
def block05 : NormalizedBlock := ⟨1,block05Cuts⟩

theorem block05_normalization :
    (gatheredExpr.intervalNormalize ((17/32:ℚ)) (1)).atomNormalize=block05Expr := by
  decide +kernel

theorem block05_checked : checkUpperBlock block05Expr 18446744073709551616 ((17/32:ℚ)) block05Cuts=
    some (1,(1084385311878990001/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group6568.Family20.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group6568.Family20.IntervalNormalized.block05_normalization
#print axioms NoThreeLine.Phase15301Group6568.Family20.IntervalNormalized.block05_checked
