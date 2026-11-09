import NoThreeLine.Phase15301Group4750Family21Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family21.IntervalNormalized
open AutoEnvelope

def block19Expr : Expr := .add (.min (.add (.atom ⟨(27684784767/20480000000:ℚ),(47047788421/102400000000:ℚ)⟩) (.add (.scale ((204420051/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(889/1024:ℚ),(-111/128:ℚ)⟩) (.add (.min (.atom ⟨(-1777/2048:ℚ),(1777/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((28684999/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(569/1024:ℚ),(-71/128:ℚ)⟩) (.add (.min (.atom ⟨(-1137/2048:ℚ),(1137/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((75726479/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(505/1024:ℚ),(-63/128:ℚ)⟩) (.add (.min (.atom ⟨(-1009/2048:ℚ),(1009/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((75726479/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(377/1024:ℚ),(-47/128:ℚ)⟩) (.add (.min (.atom ⟨(-753/2048:ℚ),(753/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(513838869207/204800000000:ℚ),(-141551507267/204800000000:ℚ)⟩)) (.atom ⟨0,0⟩)
def block19Cuts : List (ℚ × AutoTrace) := [((3011/3013:ℚ),.auto),((4035/4037:ℚ),.auto),((4547/4549:ℚ),.auto),((7107/7109:ℚ),.auto),(1,.auto)]
def block19 : NormalizedBlock := ⟨1,block19Cuts⟩

theorem block19_normalization :
    (gatheredExpr.intervalNormalize ((2499/2501:ℚ)) (1)).atomNormalize=block19Expr := by
  decide +kernel

theorem block19_checked : checkUpperBlock block19Expr 18446744073709551616 ((2499/2501:ℚ)) block19Cuts=
    some (1,(24236377274461317/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family21.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family21.IntervalNormalized.block19_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family21.IntervalNormalized.block19_checked
