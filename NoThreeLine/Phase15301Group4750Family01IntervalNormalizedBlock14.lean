import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block14Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(204316490663/102400000000:ℚ),(1663786391/12800000000:ℚ)⟩) (.add (.scale ((-105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-249/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(81766687523/40960000000:ℚ),(5364207709/40960000000:ℚ)⟩) (.add (.scale ((-105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-497/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(249/1024:ℚ),(-7/128:ℚ)⟩) (.add (.min (.atom ⟨(-497/2048:ℚ),(113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(40868871981/20480000000:ℚ),(1333816037/10240000000:ℚ)⟩) (.add (.scale ((-105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-249/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((13292533/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(3/4:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((223620727/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(3/4:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block14Cuts : List (ℚ × AutoTrace) := [((917/4096:ℚ),.auto),((459/2048:ℚ),.auto),((115/512:ℚ),.auto),((921/4096:ℚ),.auto),((56/249:ℚ),.auto),((1843/8192:ℚ),.auto),((7855543211/34911189569:ℚ),.auto),((461/2048:ℚ),.auto),((449/1991:ℚ),.auto),((231/1024:ℚ),.auto),((29/128:ℚ),.auto),((451/1989:ℚ),.auto),((929/4096:ℚ),.auto),((465/2048:ℚ),.auto),((931/4096:ℚ),.auto),((113/497:ℚ),.auto),((1863/8192:ℚ),.auto),((233/1024:ℚ),.auto),((117/512:ℚ),.auto),((235/1024:ℚ),.auto),((59/256:ℚ),.auto),((237/1024:ℚ),.auto),((119/512:ℚ),.auto),((15/64:ℚ),.auto)]
def block14 : NormalizedBlock := ⟨(15/64:ℚ),block14Cuts⟩

theorem block14_normalization :
    (gatheredExpr.intervalNormalize ((369/1649:ℚ)) ((15/64:ℚ))).atomNormalize=block14Expr := by
  decide +kernel

theorem block14_checked : checkUpperBlock block14Expr 18446744073709551616 ((369/1649:ℚ)) block14Cuts=
    some ((15/64:ℚ),(1288809185889576819/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block14_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block14_checked
