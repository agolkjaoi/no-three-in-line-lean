import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block29Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(9896436761/4096000000:ℚ),(-1610964719/12800000000:ℚ)⟩) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-377/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((189870837/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-249/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(494712261161/204800000000:ℚ),(-25885012393/204800000000:ℚ)⟩) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-753/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((189870837/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-497/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(377/1024:ℚ),(-23/128:ℚ)⟩) (.add (.min (.atom ⟨(-753/2048:ℚ),(369/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(98974246531/40960000000:ℚ),(-25726040899/204800000000:ℚ)⟩) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-377/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((189870837/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-249/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((45498801/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(5/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((18627377/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(3/4:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block29Cuts : List (ℚ × AutoTrace) := [((40/83:ℚ),.auto),((987/2048:ℚ),.auto),((247/512:ℚ),.auto),((31/64:ℚ),.auto),((241/497:ℚ),.auto),((249/512:ℚ),.auto),((499/1024:ℚ),.auto),((999/2048:ℚ),.auto),((1999/4096:ℚ),.auto),((184/377:ℚ),.auto),((125/256:ℚ),.auto),((2001/4096:ℚ),.auto),((491/1005:ℚ),.auto),((1001/2048:ℚ),.auto),((501/1024:ℚ),.auto),((2005/4096:ℚ),.auto),((1475/3013:ℚ),.auto),((1003/2048:ℚ),.auto),((2007/4096:ℚ),.auto),((123/251:ℚ),.auto),((251/512:ℚ),.auto),((1005/2048:ℚ),.auto),((2011/4096:ℚ),.auto),((248/505:ℚ),.auto)]
def block29 : NormalizedBlock := ⟨(248/505:ℚ),block29Cuts⟩

theorem block29_normalization :
    (gatheredExpr.intervalNormalize ((493/1024:ℚ)) ((248/505:ℚ))).atomNormalize=block29Expr := by
  decide +kernel

theorem block29_checked : checkUpperBlock block29Expr 18446744073709551616 ((493/1024:ℚ)) block29Cuts=
    some ((248/505:ℚ),(412904873315457949/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block29_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block29_checked
