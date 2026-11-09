import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block60Expr : Expr := .add (.min (.add (.atom ⟨(9031257457/5120000000:ℚ),(-198592301/3200000000:ℚ)⟩) (.add (.scale ((194624179/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(889/1024:ℚ),(-111/128:ℚ)⟩) (.add (.min (.atom ⟨(-1777/2048:ℚ),(1777/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((224108453/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(441/1024:ℚ),(-55/128:ℚ)⟩) (.add (.min (.atom ⟨(-881/2048:ℚ),(881/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨(308481173861/204800000000:ℚ),(40836718697/204800000000:ℚ)⟩)) (.atom ⟨0,0⟩)
def block60Cuts : List (ℚ × AutoTrace) := [((3523/3525:ℚ),.auto),((2047/2048:ℚ),.auto),((7107/7109:ℚ),.auto),((4095/4096:ℚ),.auto),(1,.auto)]
def block60 : NormalizedBlock := ⟨1,block60Cuts⟩

theorem block60_normalization :
    (gatheredExpr.intervalNormalize ((7105/7111:ℚ)) (1)).atomNormalize=block60Expr := by
  decide +kernel

theorem block60_checked : checkUpperBlock block60Expr 18446744073709551616 ((7105/7111:ℚ)) block60Cuts=
    some (1,(45119129550408219/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block60_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block60_checked
