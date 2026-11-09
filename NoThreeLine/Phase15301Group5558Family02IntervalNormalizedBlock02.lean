import NoThreeLine.Phase15301Group5558Family02Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group5558.Family02.IntervalNormalized
open AutoEnvelope

def block02Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(24549039529/51200000000:ℚ),(-1084270793/5120000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(511/4096:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(384304913/800000000:ℚ),(-10796233027/51200000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1/8:ℚ),(-481/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-511/4096:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),(-481/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(98335892687/204800000000:ℚ),(-43231097149/204800000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(511/4096:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((1061071/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-111/128:ℚ),(-481/4096:ℚ)⟩) (.add (.min (.atom ⟨(127/128:ℚ),0⟩) (.atom ⟨(3553/4096:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((194624179/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(3553/4096:ℚ),(241/2048:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(127/128:ℚ),0⟩) (.atom ⟨(111/128:ℚ),(481/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block02Cuts : List (ℚ × AutoTrace) := [((15/16:ℚ),.auto),(1,.auto)]
def block02 : NormalizedBlock := ⟨1,block02Cuts⟩

theorem block02_normalization :
    (gatheredExpr.intervalNormalize ((29/32:ℚ)) (1)).atomNormalize=block02Expr := by
  decide +kernel

theorem block02_checked : checkUpperBlock block02Expr 18446744073709551616 ((29/32:ℚ)) block02Cuts=
    some (1,(56089585891263255/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group5558.Family02.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group5558.Family02.IntervalNormalized.block02_normalization
#print axioms NoThreeLine.Phase15301Group5558.Family02.IntervalNormalized.block02_checked
