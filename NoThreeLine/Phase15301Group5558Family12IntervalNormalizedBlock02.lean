import NoThreeLine.Phase15301Group5558Family12Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group5558.Family12.IntervalNormalized
open AutoEnvelope

def block02Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(48823763597/102400000000:ℚ),(-10734702191/51200000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(511/4096:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(61144697/128000000:ℚ),(-21377410379/102400000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1/8:ℚ),(-481/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-511/4096:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),(-481/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(19557452353/40960000000:ℚ),(-42799074193/204800000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(511/4096:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((1061071/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-111/128:ℚ),(-481/4096:ℚ)⟩) (.add (.min (.atom ⟨(127/128:ℚ),0⟩) (.atom ⟨(3553/4096:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((194624179/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(3553/4096:ℚ),(241/2048:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(127/128:ℚ),0⟩) (.atom ⟨(111/128:ℚ),(481/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(147203477/20000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block02Cuts : List (ℚ × AutoTrace) := [((15/16:ℚ),.auto),(1,.auto)]
def block02 : NormalizedBlock := ⟨1,block02Cuts⟩

theorem block02_normalization :
    (gatheredExpr.intervalNormalize ((29/32:ℚ)) (1)).atomNormalize=block02Expr := by
  decide +kernel

theorem block02_checked : checkUpperBlock block02Expr 18446744073709551616 ((29/32:ℚ)) block02Cuts=
    some (1,(111754594585619921/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group5558.Family12.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group5558.Family12.IntervalNormalized.block02_normalization
#print axioms NoThreeLine.Phase15301Group5558.Family12.IntervalNormalized.block02_checked
