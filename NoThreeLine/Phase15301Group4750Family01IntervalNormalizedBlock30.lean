import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block30Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(13678188783/6400000000:ℚ),(24194907/1600000000:ℚ)⟩) (.add (.scale ((-7542637/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-603171/2500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-114501729/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((15489619/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(135441965591/51200000000:ℚ),(-12186294583/51200000000:ℚ)⟩) (.add (.scale ((-114501729/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1521/2048:ℚ),(753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((15489619/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1265/2048:ℚ),(625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((17695151/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1009/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((7542637/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1017/1024:ℚ),(-63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((603171/2500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(889/1024:ℚ),(-55/128:ℚ)⟩) (.add (.min (.atom ⟨(-1777/2048:ℚ),(881/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((114501729/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(761/1024:ℚ),(-47/128:ℚ)⟩) (.add (.min (.atom ⟨(-1521/2048:ℚ),(753/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.min (.add (.atom ⟨(109450437591/51200000000:ℚ),(799164351/51200000000:ℚ)⟩) (.add (.scale ((-7542637/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-603171/2500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-114501729/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((15489619/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((7542637/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1017/1024:ℚ),(-63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((40682899/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(881/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-55/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((64809739/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(889/1024:ℚ),(-55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((13926327/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-47/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block30Cuts : List (ℚ × AutoTrace) := [((503/1024:ℚ),.auto),((63/128:ℚ),.auto),((497/1009:ℚ),.auto),((1009/2048:ℚ),.auto),((104/211:ℚ),.auto),((2019/4096:ℚ),.auto),((505/1024:ℚ),.auto),((1011/2048:ℚ),.auto),((125/253:ℚ),.auto),((376/761:ℚ),.auto),((253/512:ℚ),.auto),((1003/2029:ℚ),.auto),((2025/4096:ℚ),.auto),((1013/2048:ℚ),.auto),((3011/6085:ℚ),.auto),((2027/4096:ℚ),.auto),((440/889:ℚ),.auto),((251/507:ℚ),.auto),((507/1024:ℚ),.auto),((3521/7111:ℚ),.auto),((3523/7109:ℚ),.auto),((56/113:ℚ),.auto),((1015/2048:ℚ),.auto),((4033/8135:ℚ),.auto)]
def block30 : NormalizedBlock := ⟨(4033/8135:ℚ),block30Cuts⟩

theorem block30_normalization :
    (gatheredExpr.intervalNormalize ((248/505:ℚ)) ((4033/8135:ℚ))).atomNormalize=block30Expr := by
  decide +kernel

theorem block30_checked : checkUpperBlock block30Expr 18446744073709551616 ((248/505:ℚ)) block30Cuts=
    some ((4033/8135:ℚ),(3153298726334293/144115188075855872:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block30_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block30_checked
