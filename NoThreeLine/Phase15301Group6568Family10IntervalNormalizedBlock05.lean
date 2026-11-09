import NoThreeLine.Phase15301Group6568Family10Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group6568.Family10.IntervalNormalized
open AutoEnvelope

def block05Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(226403303/3200000000:ℚ),(937739511/5120000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1/16:ℚ),(-63/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(7222248443/102400000000:ℚ),(18732132967/102400000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(257/4096:ℚ),(-251/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-1/16:ℚ),(63/1024:ℚ)⟩) (.add (.min (.atom ⟨(257/4096:ℚ),(-251/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(29085740093/409600000000:ℚ),(75125278189/409600000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1/16:ℚ),(-63/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨(147203477/20000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block05Cuts : List (ℚ × AutoTrace) := [((15/16:ℚ),.auto),(1,.auto)]
def block05 : NormalizedBlock := ⟨1,block05Cuts⟩

theorem block05_normalization :
    (gatheredExpr.intervalNormalize ((7/8:ℚ)) (1)).atomNormalize=block05Expr := by
  decide +kernel

theorem block05_checked : checkUpperBlock block05Expr 18446744073709551616 ((7/8:ℚ)) block05Cuts=
    some (1,(82137445298915165/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group6568.Family10.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group6568.Family10.IntervalNormalized.block05_normalization
#print axioms NoThreeLine.Phase15301Group6568.Family10.IntervalNormalized.block05_checked
