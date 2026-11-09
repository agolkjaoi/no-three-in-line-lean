import NoThreeLine.Phase15301Group2225Family20Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group2225.Family20.IntervalNormalized
open AutoEnvelope

def block07Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-8552862163/51200000000:ℚ),(29932768077/51200000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(33/512:ℚ),(-31/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((61224377/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(61/512:ℚ),(-35/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(93/512:ℚ),(-67/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((18573479/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(125/512:ℚ),(-67/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(199609443/25600000000:ℚ),(12310208627/25600000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(17/256:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((61224377/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(31/256:ℚ),(-17/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(47/256:ℚ),(-33/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-33/512:ℚ),(31/512:ℚ)⟩) (.add (.min (.atom ⟨(17/256:ℚ),(-15/256:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(-8552862163/51200000000:ℚ),(29932768077/51200000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(33/512:ℚ),(-31/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((61224377/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(61/512:ℚ),(-35/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(93/512:ℚ),(-67/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((18573479/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(125/512:ℚ),(-67/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((164215389/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-1/256:ℚ),(-17/256:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(3/512:ℚ),(35/512:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((25747753/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(3/512:ℚ),(35/512:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1/256:ℚ),(17/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block07Cuts : List (ℚ × AutoTrace) := [((69/128:ℚ),.auto),((35/64:ℚ),.auto),((9/16:ℚ),.auto),((37/64:ℚ),.auto),((19/32:ℚ),.auto),((39/64:ℚ),.auto),((5/8:ℚ),.auto),((41/64:ℚ),.auto),((21/32:ℚ),.auto),((43/64:ℚ),.auto),((11/16:ℚ),.auto),((23/32:ℚ),.auto),((3/4:ℚ),.auto),((25/32:ℚ),.auto),((13/16:ℚ),.auto),((27/32:ℚ),.auto),((7/8:ℚ),.auto),((57/64:ℚ),.auto),((29/32:ℚ),.auto),((15/16:ℚ),.auto),((31/32:ℚ),.auto),(1,.auto)]
def block07 : NormalizedBlock := ⟨1,block07Cuts⟩

theorem block07_normalization :
    (gatheredExpr.intervalNormalize ((17/32:ℚ)) (1)).atomNormalize=block07Expr := by
  decide +kernel

theorem block07_checked : checkUpperBlock block07Expr 18446744073709551616 ((17/32:ℚ)) block07Cuts=
    some (1,(2111994823344793917/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group2225.Family20.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group2225.Family20.IntervalNormalized.block07_normalization
#print axioms NoThreeLine.Phase15301Group2225.Family20.IntervalNormalized.block07_checked
