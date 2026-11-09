import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block45Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-7589523577/20480000000:ℚ),(4869014319/2560000000:ℚ)⟩) (.add (.scale ((-105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(79/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((103567763/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(-75566252381/204800000000:ℚ),(389850128909/204800000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2017/2048:ℚ),(1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(1265/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((103567763/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1137/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(825/1024:ℚ),(-79/128:ℚ)⟩) (.add (.min (.atom ⟨(-1649/2048:ℚ),(1265/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(-75486372361/204800000000:ℚ),(389930008929/204800000000:ℚ)⟩) (.add (.scale ((-105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(79/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((103567763/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((194624179/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2017/2048:ℚ),(1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((1061071/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-95/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/128:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((8562173/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-79/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(3/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1265/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((149455501/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(881/2048:ℚ)⟩) (.add (.min (.atom ⟨(7/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-55/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((22943869/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-55/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(7/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block45Cuts : List (ℚ × AutoTrace) := [((193/256:ℚ),.auto),((1521/2017:ℚ),.auto),((3089/4096:ℚ),.auto),((1545/2048:ℚ),.auto),((773/1024:ℚ),.auto),((387/512:ℚ),.auto),((97/128:ℚ),.auto),((389/512:ℚ),.auto),((195/256:ℚ),.auto),((391/512:ℚ),.auto),((49/64:ℚ),.auto),((632/825:ℚ),.auto),((5057/6599:ℚ),.auto),((5059/6597:ℚ),.auto),((1265/1649:ℚ),.auto),((393/512:ℚ),.auto),((197/256:ℚ),.auto),((395/512:ℚ),.auto),((440/569:ℚ),.auto),((99/128:ℚ),.auto),((793/1024:ℚ),.auto),((881/1137:ℚ),.auto),((1587/2048:ℚ),.auto),((397/512:ℚ),.auto)]
def block45 : NormalizedBlock := ⟨(397/512:ℚ),block45Cuts⟩

theorem block45_normalization :
    (gatheredExpr.intervalNormalize ((760/1009:ℚ)) ((397/512:ℚ))).atomNormalize=block45Expr := by
  decide +kernel

theorem block45_checked : checkUpperBlock block45Expr 18446744073709551616 ((760/1009:ℚ)) block45Cuts=
    some ((397/512:ℚ),(114890174405267731/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block45_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block45_checked
