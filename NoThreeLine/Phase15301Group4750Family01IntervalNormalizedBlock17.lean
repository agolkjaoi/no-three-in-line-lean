import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block17Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(7480043539/20480000000:ℚ),(6919106591/12800000000:ℚ)⟩) (.add (.scale ((-1830861/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-71194593/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(75226730983/204800000000:ℚ),(111132001049/204800000000:ℚ)⟩) (.add (.scale ((-1830861/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-71194593/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1393/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((1830861/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(953/1024:ℚ),(-31/128:ℚ)⟩) (.add (.min (.atom ⟨(-1905/2048:ℚ),(497/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((71194593/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(697/1024:ℚ),(-23/128:ℚ)⟩) (.add (.min (.atom ⟨(-1393/2048:ℚ),(369/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(18764913731/51200000000:ℚ),(11096492499/20480000000:ℚ)⟩) (.add (.scale ((-1830861/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-71194593/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((17102307/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(497/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-31/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((24425751/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-31/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((5618413/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(5/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block17Cuts : List (ℚ × AutoTrace) := [((265/1024:ℚ),.auto),((133/512:ℚ),.auto),((248/953:ℚ),.auto),((533/2048:ℚ),.auto),((1985/7623:ℚ),.auto),((1987/7621:ℚ),.auto),((267/1024:ℚ),.auto),((2137/8192:ℚ),.auto),((497/1905:ℚ),.auto),((1069/4096:ℚ),.auto),((535/2048:ℚ),.auto),((67/256:ℚ),.auto),((269/1024:ℚ),.auto),((135/512:ℚ),.auto),((1081/4096:ℚ),.auto),((184/697:ℚ),.auto),((541/2048:ℚ),.auto),((1473/5575:ℚ),.auto),((38669803971/146321088901:ℚ),.auto),((271/1024:ℚ),.auto),((1475/5573:ℚ),.auto),((369/1393:ℚ),.auto),((17/64:ℚ),.auto),((273/1024:ℚ),.auto)]
def block17 : NormalizedBlock := ⟨(273/1024:ℚ),block17Cuts⟩

theorem block17_normalization :
    (gatheredExpr.intervalNormalize ((33/128:ℚ)) ((273/1024:ℚ))).atomNormalize=block17Expr := by
  decide +kernel

theorem block17_checked : checkUpperBlock block17Expr 18446744073709551616 ((33/128:ℚ)) block17Cuts=
    some ((273/1024:ℚ),(958201320646247973/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block17_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block17_checked
