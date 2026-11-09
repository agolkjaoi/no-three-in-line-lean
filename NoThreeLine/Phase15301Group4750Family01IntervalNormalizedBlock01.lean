import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block01Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(273976469141/102400000000:ℚ),(266688597/12800000000:ℚ)⟩) (.add (.scale ((113954891/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-77021597/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(337499825053/102400000000:ℚ),(-2199162269/102400000000:ℚ)⟩) (.add (.scale ((113954891/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((77021597/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(825/1024:ℚ),(-7/128:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(273976469141/102400000000:ℚ),(266688597/12800000000:ℚ)⟩) (.add (.scale ((113954891/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-77021597/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((15006333/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((38098371/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(825/1024:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block01Cuts : List (ℚ × AutoTrace) := [((123/2048:ℚ),.auto),((31/512:ℚ),.auto),((125/2048:ℚ),.auto),((63/1024:ℚ),.auto),((127/2048:ℚ),.auto),((1/16:ℚ),.auto),((129/2048:ℚ),.auto),((8/127:ℚ),.auto),((259/4096:ℚ),.auto),((519/8192:ℚ),.auto),((12837979457/202536764533:ℚ),.auto),((1039/16384:ℚ),.auto),((65/1024:ℚ),.auto),((113/1777:ℚ),.auto),((33/512:ℚ),.auto),((67/1024:ℚ),.auto),((17/256:ℚ),.auto),((69/1024:ℚ),.auto),((139/2048:ℚ),.auto),((56/825:ℚ),.auto),((449/6599:ℚ),.auto),((4332671045/63523355912:ℚ),.auto),((35/512:ℚ),.auto),((451/6597:ℚ),.auto)]
def block01 : NormalizedBlock := ⟨(451/6597:ℚ),block01Cuts⟩

theorem block01_normalization :
    (gatheredExpr.intervalNormalize ((61/1024:ℚ)) ((451/6597:ℚ))).atomNormalize=block01Expr := by
  decide +kernel

theorem block01_checked : checkUpperBlock block01Expr 18446744073709551616 ((61/1024:ℚ)) block01Cuts=
    some ((451/6597:ℚ),(1436942655240838921/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block01_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block01_checked
