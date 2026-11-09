import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block15Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(208884290771/102400000000:ℚ),(1495639547/12800000000:ℚ)⟩) (.add (.scale ((81985773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-114501729/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(418001553787/204800000000:ℚ),(24163204997/204800000000:ℚ)⟩) (.add (.scale ((81985773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1521/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-114501729/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1009/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((114501729/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(505/1024:ℚ),(-15/128:ℚ)⟩) (.add (.min (.atom ⟨(-1009/2048:ℚ),(241/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(417992202269/204800000000:ℚ),(24153853479/204800000000:ℚ)⟩) (.add (.scale ((81985773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-114501729/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((13934621/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(369/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((35598807/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/2:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block15Cuts : List (ℚ × AutoTrace) := [((121/512:ℚ),.auto),((243/1024:ℚ),.auto),((973/4096:ℚ),.auto),((24/101:ℚ),.auto),((1947/8192:ℚ),.auto),((487/2048:ℚ),.auto),((961/4039:ℚ),.auto),((61/256:ℚ),.auto),((25315971693/106188898307:ℚ),.auto),((963/4037:ℚ),.auto),((489/2048:ℚ),.auto),((241/1009:ℚ),.auto),((245/1024:ℚ),.auto),((123/512:ℚ),.auto),((247/1024:ℚ),.auto),((184/761:ℚ),.auto),((31/128:ℚ),.auto),((993/4096:ℚ),.auto),((1987/8192:ℚ),.auto),((41/169:ℚ),.auto),((497/2048:ℚ),.auto),((249/1024:ℚ),.auto),((499/2048:ℚ),.auto),((248/1017:ℚ),.auto)]
def block15 : NormalizedBlock := ⟨(248/1017:ℚ),block15Cuts⟩

theorem block15_normalization :
    (gatheredExpr.intervalNormalize ((15/64:ℚ)) ((248/1017:ℚ))).atomNormalize=block15Expr := by
  decide +kernel

theorem block15_checked : checkUpperBlock block15Expr 18446744073709551616 ((15/64:ℚ)) block15Cuts=
    some ((248/1017:ℚ),(564631584594093627/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block15_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block15_checked
