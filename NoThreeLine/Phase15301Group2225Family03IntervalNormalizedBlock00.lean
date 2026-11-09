import NoThreeLine.Phase15301Group2225Family03Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized
open AutoEnvelope

def block00Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(1403482233/400000000:ℚ),0⟩) (.add (.scale ((-13591551/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(349/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-30544661/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(381/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-533013551/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(413/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((92079103/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(445/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(1403482233/400000000:ℚ),0⟩) (.add (.scale ((-3624503/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(159/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-13591551/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(175/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-30544661/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(191/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-533013551/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(207/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((92079103/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(223/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.add (.scale ((3624503/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-317/512:ℚ),(15/256:ℚ)⟩) (.add (.min (.atom ⟨(159/256:ℚ),(-29/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((13591551/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-349/512:ℚ),(15/256:ℚ)⟩) (.add (.min (.atom ⟨(175/256:ℚ),(-29/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((30544661/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-381/512:ℚ),(15/256:ℚ)⟩) (.add (.min (.atom ⟨(191/256:ℚ),(-29/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((533013551/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-413/512:ℚ),(15/256:ℚ)⟩) (.add (.min (.atom ⟨(207/256:ℚ),(-29/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.min (.add (.atom ⟨(1403482233/400000000:ℚ),0⟩) (.add (.scale ((-13591551/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(349/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-30544661/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(381/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-533013551/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(413/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((92079103/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(445/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((92079103/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨1,0⟩) (.atom ⟨(67/512:ℚ),(15/256:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(33/256:ℚ),(29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block00Cuts : List (ℚ × AutoTrace) := [((1/16:ℚ),.auto),((33/512:ℚ),.auto),((133/2048:ℚ),.auto),((67/1024:ℚ),.auto),((17/256:ℚ),.auto),((35/512:ℚ),.auto),((9/128:ℚ),.auto),((37/512:ℚ),.auto),((297/4096:ℚ),.auto),((595/8192:ℚ),.auto),((149/2048:ℚ),.auto),((75/1024:ℚ),.auto),((19/256:ℚ),.auto),((39/512:ℚ),.auto),((5/64:ℚ),.auto),((81/1024:ℚ),.auto),((41/512:ℚ),.auto),((21/256:ℚ),.auto),((43/512:ℚ),.auto),((11/128:ℚ),.auto),((45/512:ℚ),.auto),((23/256:ℚ),.auto),((47/512:ℚ),.auto),((3/32:ℚ),.auto)]
def block00 : NormalizedBlock := ⟨(3/32:ℚ),block00Cuts⟩

theorem block00_normalization :
    (gatheredExpr.intervalNormalize (0) ((3/32:ℚ))).atomNormalize=block00Expr := by
  decide +kernel

theorem block00_checked : checkUpperBlock block00Expr 18446744073709551616 (0) block00Cuts=
    some ((3/32:ℚ),(5500299440425406081/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized.block00_normalization
#print axioms NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized.block00_checked
