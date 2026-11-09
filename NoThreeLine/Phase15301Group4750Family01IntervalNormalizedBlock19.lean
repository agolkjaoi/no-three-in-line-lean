import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block19Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(296405106909/102400000000:ℚ),(-2407026147/12800000000:ℚ)⟩) (.add (.scale ((12201397/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((1534497/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((189114629/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-185/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(453083058443/204800000000:ℚ),(4066928629/204800000000:ℚ)⟩) (.add (.scale ((12201397/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((1534497/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1265/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨0,0⟩)) (.add (.min (.add (.atom ⟨(23714851387/8192000000:ℚ),(-7690269499/40960000000:ℚ)⟩) (.add (.scale ((12201397/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((1534497/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((189114629/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-185/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((5618413/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(369/2048:ℚ)⟩) (.add (.min (.atom ⟨(3/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((2549419/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(3/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((223620727/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(13/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block19Cuts : List (ℚ × AutoTrace) := [((573/2048:ℚ),.auto),((287/1024:ℚ),.auto),((9/32:ℚ),.auto),((145/512:ℚ),.auto),((73/256:ℚ),.auto),((147/512:ℚ),.auto),((37/128:ℚ),.auto),((184/633:ℚ),.auto),((149/512:ℚ),.auto),((597/2048:ℚ),.auto),((369/1265:ℚ),.auto),((1195/4096:ℚ),.auto),((299/1024:ℚ),.auto),((75/256:ℚ),.auto),((151/512:ℚ),.auto),((19/64:ℚ),.auto),((153/512:ℚ),.auto),((248/825:ℚ),.auto),((77/256:ℚ),.auto),((617/2048:ℚ),.auto),((497/1649:ℚ),.auto),((309/1024:ℚ),.auto),((56/185:ℚ),.auto),((155/512:ℚ),.auto)]
def block19 : NormalizedBlock := ⟨(155/512:ℚ),block19Cuts⟩

theorem block19_normalization :
    (gatheredExpr.intervalNormalize ((497/1777:ℚ)) ((155/512:ℚ))).atomNormalize=block19Expr := by
  decide +kernel

theorem block19_checked : checkUpperBlock block19Expr 18446744073709551616 ((497/1777:ℚ)) block19Cuts=
    some ((155/512:ℚ),(557063325512803613/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block19_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block19_checked
