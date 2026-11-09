import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block12Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(23188845267/20480000000:ℚ),(4014986671/12800000000:ℚ)⟩) (.add (.scale ((-51958047/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(232085233127/204800000000:ℚ),(64436567193/204800000000:ℚ)⟩) (.add (.scale ((-51958047/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((51958047/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(889/1024:ℚ),(-23/128:ℚ)⟩) (.add (.min (.atom ⟨(-1777/2048:ℚ),(369/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(231939030617/204800000000:ℚ),(64290364683/204800000000:ℚ)⟩) (.add (.scale ((-51958047/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((14620251/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block12Cuts : List (ℚ × AutoTrace) := [((199/1024:ℚ),.auto),((25/128:ℚ),.auto),((101/512:ℚ),.auto),((51/256:ℚ),.auto),((103/512:ℚ),.auto),((13/64:ℚ),.auto),((105/512:ℚ),.auto),((211/1024:ℚ),.auto),((423/2048:ℚ),.auto),((847/4096:ℚ),.auto),((1695/8192:ℚ),.auto),((3391/16384:ℚ),.auto),((184/889:ℚ),.auto),((76493296915/369514578533:ℚ),.auto),((53/256:ℚ),.auto),((16537266061/79840261345:ℚ),.auto),((1473/7111:ℚ),.auto),((1475/7109:ℚ),.auto),((425/2048:ℚ),.auto),((1701/8192:ℚ),.auto),((369/1777:ℚ),.auto),((851/4096:ℚ),.auto),((213/1024:ℚ),.auto),((107/512:ℚ),.auto)]
def block12 : NormalizedBlock := ⟨(107/512:ℚ),block12Cuts⟩

theorem block12_normalization :
    (gatheredExpr.intervalNormalize ((397/2048:ℚ)) ((107/512:ℚ))).atomNormalize=block12Expr := by
  decide +kernel

theorem block12_checked : checkUpperBlock block12Expr 18446744073709551616 ((397/2048:ℚ)) block12Cuts=
    some ((107/512:ℚ),(1944831424702972189/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block12_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block12_checked
