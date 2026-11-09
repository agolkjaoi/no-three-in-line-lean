import NoThreeLine.Phase15301Group4750Family20Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized
open AutoEnvelope

def block07Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(9347279779/102400000000:ℚ),(2885707073/6400000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(129/2048:ℚ),(-1/16:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(369/2048:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(4605281371/51200000000:ℚ),(46034596131/102400000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(65/1024:ℚ),(-127/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(185/1024:ℚ),(-271/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-129/2048:ℚ),(1/16:ℚ)⟩) (.add (.min (.atom ⟨(65/1024:ℚ),(-127/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(18858774947/204800000000:ℚ),(3700273669/8192000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(129/2048:ℚ),(-1/16:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(369/2048:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block07Cuts : List (ℚ × AutoTrace) := [((41/64:ℚ),.auto),((21/32:ℚ),.auto),((43/64:ℚ),.auto),((11/16:ℚ),.auto),((23/32:ℚ),.auto),((47/64:ℚ),.auto),((3/4:ℚ),.auto),((25/32:ℚ),.auto),((13/16:ℚ),.auto),((27/32:ℚ),.auto),((7/8:ℚ),.auto),((29/32:ℚ),.auto),((15/16:ℚ),.auto),((31/32:ℚ),.auto),(1,.auto)]
def block07 : NormalizedBlock := ⟨1,block07Cuts⟩

theorem block07_normalization :
    (gatheredExpr.intervalNormalize ((5/8:ℚ)) (1)).atomNormalize=block07Expr := by
  decide +kernel

theorem block07_checked : checkUpperBlock block07Expr 18446744073709551616 ((5/8:ℚ)) block07Cuts=
    some (1,(94867922972096183/576460752303423488:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized.block07_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized.block07_checked
