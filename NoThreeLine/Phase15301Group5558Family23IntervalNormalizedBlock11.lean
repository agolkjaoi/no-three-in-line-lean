import NoThreeLine.Phase15301Group5558Family23Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized
open AutoEnvelope

def block11Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(2334528593/1600000000:ℚ),(1612141783/5120000000:ℚ)⟩) (.add (.scale ((-204420051/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1/128:ℚ),(15/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-45056803/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(95/128:ℚ),(-1393/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((157081239/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-1649/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(604167747573/409600000000:ℚ),(122825727243/409600000000:ℚ)⟩) (.add (.scale ((-45056803/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3041/4096:ℚ),(-2785/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((157081239/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3297/4096:ℚ),(-3041/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3553/4096:ℚ),(-3297/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((204420051/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1/128:ℚ),(-15/2048:ℚ)⟩) (.add (.min (.atom ⟨(-31/4096:ℚ),(31/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((45056803/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-95/128:ℚ),(1393/2048:ℚ)⟩) (.add (.min (.atom ⟨(3041/4096:ℚ),(-2785/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-111/128:ℚ),(1649/2048:ℚ)⟩) (.add (.min (.atom ⟨(3553/4096:ℚ),(-3297/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.min (.add (.atom ⟨(598061143567/409600000000:ℚ),(129393166399/409600000000:ℚ)⟩) (.add (.scale ((-204420051/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1/128:ℚ),(15/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-45056803/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(95/128:ℚ),(-1393/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((157081239/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-879039/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-1649/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((13282563/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-543/4096:ℚ),(31/4096:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(17/128:ℚ),(-15/2048:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((416941059/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1/128:ℚ),(-15/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((82787323/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-543/4096:ℚ),(-3041/4096:ℚ)⟩) (.add (.min (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(17/128:ℚ),(1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block11Cuts : List (ℚ × AutoTrace) := [((469/512:ℚ),.auto),((235/256:ℚ),.auto),((59/64:ℚ),.auto),((237/256:ℚ),.auto),((119/128:ℚ),.auto),((15/16:ℚ),.auto),((61/64:ℚ),.auto),((31/32:ℚ),.auto),((63/64:ℚ),.auto),(1,.auto)]
def block11 : NormalizedBlock := ⟨1,block11Cuts⟩

theorem block11_normalization :
    (gatheredExpr.intervalNormalize ((117/128:ℚ)) (1)).atomNormalize=block11Expr := by
  decide +kernel

theorem block11_checked : checkUpperBlock block11Expr 18446744073709551616 ((117/128:ℚ)) block11Cuts=
    some (1,(2578336394658187989/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized.block11_normalization
#print axioms NoThreeLine.Phase15301Group5558.Family23.IntervalNormalized.block11_checked
