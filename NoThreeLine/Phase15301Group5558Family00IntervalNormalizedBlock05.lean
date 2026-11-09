import NoThreeLine.Phase15301Group5558Family00Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group5558.Family00.IntervalNormalized
open AutoEnvelope

def block05Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(5184008981/204800000000:ℚ),(1398728911/6400000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(257/4096:ℚ),(-1/16:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(737/4096:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(2562400677/102400000000:ℚ),(1788004701/8192000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(129/2048:ℚ),(-255/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(369/2048:ℚ),(-543/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-257/4096:ℚ),(1/16:ℚ)⟩) (.add (.min (.atom ⟨(129/2048:ℚ),(-255/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(10470312059/409600000000:ℚ),(89620944401/409600000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(257/4096:ℚ),(-1/16:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(737/4096:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block05Cuts : List (ℚ × AutoTrace) := [((11/16:ℚ),.auto),((23/32:ℚ),.auto),((3/4:ℚ),.auto),((13/16:ℚ),.auto),((7/8:ℚ),.auto),((15/16:ℚ),.auto),(1,.auto)]
def block05 : NormalizedBlock := ⟨1,block05Cuts⟩

theorem block05_normalization :
    (gatheredExpr.intervalNormalize ((21/32:ℚ)) (1)).atomNormalize=block05Expr := by
  decide +kernel

theorem block05_checked : checkUpperBlock block05Expr 18446744073709551616 ((21/32:ℚ)) block05Cuts=
    some (1,(142181468812206619/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group5558.Family00.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group5558.Family00.IntervalNormalized.block05_normalization
#print axioms NoThreeLine.Phase15301Group5558.Family00.IntervalNormalized.block05_checked
