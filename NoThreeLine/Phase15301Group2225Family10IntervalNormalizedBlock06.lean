import NoThreeLine.Phase15301Group2225Family10Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group2225.Family10.IntervalNormalized
open AutoEnvelope

def block06Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-1539869453/6400000000:ℚ),(2375541663/6400000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(33/512:ℚ),(-31/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((31356967/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(61/512:ℚ),(-35/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((51728609/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(93/512:ℚ),(-67/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((27111351/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(125/512:ℚ),(-67/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(-788365779/3200000000:ℚ),(1169339779/3200000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(17/256:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((31356967/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(31/256:ℚ),(-17/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((51728609/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(47/256:ℚ),(-33/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((27111351/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(63/256:ℚ),(-33/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-33/512:ℚ),(31/512:ℚ)⟩) (.add (.min (.atom ⟨(17/256:ℚ),(-15/256:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(-1539869453/6400000000:ℚ),(2375541663/6400000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(33/512:ℚ),(-31/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((31356967/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(61/512:ℚ),(-35/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((51728609/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(93/512:ℚ),(-67/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((27111351/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(125/512:ℚ),(-67/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((106117309/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-1/256:ℚ),(-17/256:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(3/512:ℚ),(35/512:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(147203477/20000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block06Cuts : List (ℚ × AutoTrace) := [((31/64:ℚ),.auto),((1/2:ℚ),.auto),((17/32:ℚ),.auto),((35/64:ℚ),.auto),((9/16:ℚ),.auto),((37/64:ℚ),.auto),((19/32:ℚ),.auto),((5/8:ℚ),.auto),((21/32:ℚ),.auto),((11/16:ℚ),.auto),((23/32:ℚ),.auto),((3/4:ℚ),.auto),((13/16:ℚ),.auto),((7/8:ℚ),.auto),((15/16:ℚ),.auto),(1,.auto)]
def block06 : NormalizedBlock := ⟨1,block06Cuts⟩

theorem block06_normalization :
    (gatheredExpr.intervalNormalize ((15/32:ℚ)) (1)).atomNormalize=block06Expr := by
  decide +kernel

theorem block06_checked : checkUpperBlock block06Expr 18446744073709551616 ((15/32:ℚ)) block06Cuts=
    some (1,(606682339954100125/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group2225.Family10.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group2225.Family10.IntervalNormalized.block06_normalization
#print axioms NoThreeLine.Phase15301Group2225.Family10.IntervalNormalized.block06_checked
