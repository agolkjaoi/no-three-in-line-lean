import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block43Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(63142299467/51200000000:ℚ),(4468669139/6400000000:ℚ)⟩) (.add (.scale ((-15972857/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-249/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(287530590349/102400000000:ℚ),(-48697042701/102400000000:ℚ)⟩) (.add (.scale ((-30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-497/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((15972857/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(505/1024:ℚ),(-47/128:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(249/1024:ℚ),(-23/128:ℚ)⟩) (.add (.min (.atom ⟨(-497/2048:ℚ),(369/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(126453707981/102400000000:ℚ),(71667815271/102400000000:ℚ)⟩) (.add (.scale ((-15972857/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-249/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((15972857/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(505/1024:ℚ),(-47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((47369791/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(3/4:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block43Cuts : List (ℚ × AutoTrace) := [((1513/2048:ℚ),.auto),((184/249:ℚ),.auto),((757/1024:ℚ),.auto),((1515/2048:ℚ),.auto),((1473/1991:ℚ),.auto),((379/512:ℚ),.auto),((759/1024:ℚ),.auto),((1475/1989:ℚ),.auto),((1519/2048:ℚ),.auto),((95/128:ℚ),.auto),((369/497:ℚ),.auto),((1521/2048:ℚ),.auto),((761/1024:ℚ),.auto),((381/512:ℚ),.auto),((3049/4096:ℚ),.auto),((6099/8192:ℚ),.auto),((376/505:ℚ),.auto),((1525/2048:ℚ),.auto),((3009/4039:ℚ),.auto),((763/1024:ℚ),.auto),((3053/4096:ℚ),.auto),((1505/2019:ℚ),.auto),((1527/2048:ℚ),.auto),((3055/4096:ℚ),.auto)]
def block43 : NormalizedBlock := ⟨(3055/4096:ℚ),block43Cuts⟩

theorem block43_normalization :
    (gatheredExpr.intervalNormalize ((189/256:ℚ)) ((3055/4096:ℚ))).atomNormalize=block43Expr := by
  decide +kernel

theorem block43_checked : checkUpperBlock block43Expr 18446744073709551616 ((189/256:ℚ)) block43Cuts=
    some ((3055/4096:ℚ),(656727714586373257/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block43_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block43_checked
