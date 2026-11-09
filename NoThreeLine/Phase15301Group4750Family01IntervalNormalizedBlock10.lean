import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block10Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(50973702311/20480000000:ℚ),(361155963/12800000000:ℚ)⟩) (.add (.scale ((-34491679/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((78830753/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-313/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(57987137737/20480000000:ℚ),(-693616329/20480000000:ℚ)⟩) (.add (.scale ((81985773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1393/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((78830753/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-625/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((34491679/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩) (.add (.min (.atom ⟨(-2033/2048:ℚ),(369/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(50973702311/20480000000:ℚ),(361155963/12800000000:ℚ)⟩) (.add (.scale ((-34491679/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((78830753/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-313/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((34491679/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((23486207/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1393/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((46061643/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(11/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((13292533/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(11/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block10Cuts : List (ℚ × AutoTrace) := [((177/1024:ℚ),.auto),((1417/8192:ℚ),.auto),((241/1393:ℚ),.auto),((709/4096:ℚ),.auto),((355/2048:ℚ),.auto),((89/512:ℚ),.auto),((45/256:ℚ),.auto),((91/512:ℚ),.auto),((56/313:ℚ),.auto),((23/128:ℚ),.auto),((369/2048:ℚ),.auto),((2962051421/16430313817:ℚ),.auto),((739/4096:ℚ),.auto),((185/1024:ℚ),.auto),((113/625:ℚ),.auto),((741/4096:ℚ),.auto),((184/1017:ℚ),.auto),((1473/8135:ℚ),.auto),((371/2048:ℚ),.auto),((1485/8192:ℚ),.auto),((6357329349/35067177130:ℚ),.auto),((1475/8133:ℚ),.auto),((743/4096:ℚ),.auto),((369/2033:ℚ),.auto)]
def block10 : NormalizedBlock := ⟨(369/2033:ℚ),block10Cuts⟩

theorem block10_normalization :
    (gatheredExpr.intervalNormalize ((120/697:ℚ)) ((369/2033:ℚ))).atomNormalize=block10Expr := by
  decide +kernel

theorem block10_checked : checkUpperBlock block10Expr 18446744073709551616 ((120/697:ℚ)) block10Cuts=
    some ((369/2033:ℚ),(301414073412580893/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block10_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block10_checked
