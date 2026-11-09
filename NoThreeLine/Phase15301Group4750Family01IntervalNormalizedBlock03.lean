import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block03Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(355085911271/102400000000:ℚ),(-112275653/2560000000:ℚ)⟩) (.add (.scale ((12201397/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(710091625647/204800000000:ℚ),(-1812449827/40960000000:ℚ)⟩) (.add (.scale ((12201397/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1265/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩)) (.add (.min (.add (.atom ⟨(355085911271/102400000000:ℚ),(-112275653/2560000000:ℚ)⟩) (.add (.scale ((12201397/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block03Cuts : List (ℚ × AutoTrace) := [((21/256:ℚ),.auto),((85/1024:ℚ),.auto),((43/512:ℚ),.auto),((87/1024:ℚ),.auto),((11/128:ℚ),.auto),((89/1024:ℚ),.auto),((45/512:ℚ),.auto),((181/2048:ℚ),.auto),((56/633:ℚ),.auto),((725/8192:ℚ),.auto),((363/4096:ℚ),.auto),((91/1024:ℚ),.auto),((113/1265:ℚ),.auto),((23/256:ℚ),.auto),((93/1024:ℚ),.auto),((47/512:ℚ),.auto),((95/1024:ℚ),.auto),((3/32:ℚ),.auto),((135137/1439570:ℚ),.auto),((97/1024:ℚ),.auto),((49/512:ℚ),.auto),((99/1024:ℚ),.auto),((25/256:ℚ),.auto),((201/2048:ℚ),.auto)]
def block03 : NormalizedBlock := ⟨(201/2048:ℚ),block03Cuts⟩

theorem block03_normalization :
    (gatheredExpr.intervalNormalize ((113/1393:ℚ)) ((201/2048:ℚ))).atomNormalize=block03Expr := by
  decide +kernel

theorem block03_checked : checkUpperBlock block03Expr 18446744073709551616 ((113/1393:ℚ)) block03Cuts=
    some ((201/2048:ℚ),(348565691634543945/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block03_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block03_checked
