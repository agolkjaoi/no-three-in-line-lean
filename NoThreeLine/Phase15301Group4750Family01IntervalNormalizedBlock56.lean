import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block56Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-177638274707/102400000000:ℚ),(2730889917/800000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(55/64:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-55843797/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(103/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(-354674241083/204800000000:ℚ),(699710127083/204800000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(1761/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-55843797/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(1649/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(953/1024:ℚ),(-55/64:ℚ)⟩) (.add (.min (.atom ⟨(-1905/2048:ℚ),(1761/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((55843797/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(889/1024:ℚ),(-103/128:ℚ)⟩) (.add (.min (.atom ⟨(-1777/2048:ℚ),(1649/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(-70921936313/40960000000:ℚ),(699774686601/204800000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(55/64:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-55843797/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(103/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-55/64:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1761/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block56Cuts : List (ℚ × AutoTrace) := [((945/1024:ℚ),.auto),((1891/2048:ℚ),.auto),((880/953:ℚ),.auto),((3783/4096:ℚ),.auto),((2347/2541:ℚ),.auto),((473/512:ℚ),.auto),((3785/4096:ℚ),.auto),((7043/7621:ℚ),.auto),((1893/2048:ℚ),.auto),((587/635:ℚ),.auto),((7573/8192:ℚ),.auto),((3787/4096:ℚ),.auto),((947/1024:ℚ),.auto),((237/256:ℚ),.auto),((949/1024:ℚ),.auto),((824/889:ℚ),.auto),((6593/7111:ℚ),.auto),((1899/2048:ℚ),.auto),((6595/7109:ℚ),.auto),((475/512:ℚ),.auto),((1649/1777:ℚ),.auto),((3801/4096:ℚ),.auto),((1901/2048:ℚ),.auto),((951/1024:ℚ),.auto)]
def block56 : NormalizedBlock := ⟨(951/1024:ℚ),block56Cuts⟩

theorem block56_normalization :
    (gatheredExpr.intervalNormalize ((1521/1649:ℚ)) ((951/1024:ℚ))).atomNormalize=block56Expr := by
  decide +kernel

theorem block56_checked : checkUpperBlock block56Expr 18446744073709551616 ((1521/1649:ℚ)) block56Cuts=
    some ((951/1024:ℚ),(223908768234099335/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block56_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block56_checked
