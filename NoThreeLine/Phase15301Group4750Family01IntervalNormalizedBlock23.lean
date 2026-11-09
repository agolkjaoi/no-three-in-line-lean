import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block23Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(32392687839/12800000000:ℚ),(-136744913/1600000000:ℚ)⟩) (.add (.scale ((-29434119/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-25518969/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(12952712147/5120000000:ℚ),(-2209733551/25600000000:ℚ)⟩) (.add (.scale ((-29434119/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2033/2048:ℚ),(753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-25518969/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1009/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((29434119/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1017/1024:ℚ),(-47/128:ℚ)⟩) (.add (.min (.atom ⟨(-2033/2048:ℚ),(753/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((25518969/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(505/1024:ℚ),(-23/128:ℚ)⟩) (.add (.min (.atom ⟨(-1009/2048:ℚ),(369/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(32392687839/12800000000:ℚ),(-136744913/1600000000:ℚ)⟩) (.add (.scale ((-29434119/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-25518969/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((29434119/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-47/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2033/2048:ℚ),(-753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((12341877/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/2:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block23Cuts : List (ℚ × AutoTrace) := [((373/1024:ℚ),.auto),((184/505:ℚ),.auto),((1473/4039:ℚ),.auto),((747/2048:ℚ),.auto),((24265522207/66439045825:ℚ),.auto),((187/512:ℚ),.auto),((1475/4037:ℚ),.auto),((369/1009:ℚ),.auto),((749/2048:ℚ),.auto),((375/1024:ℚ),.auto),((47/128:ℚ),.auto),((189/512:ℚ),.auto),((757/2048:ℚ),.auto),((376/1017:ℚ),.auto),((1515/4096:ℚ),.auto),((3009/8135:ℚ),.auto),((379/1024:ℚ),.auto),((3011/8133:ℚ),.auto),((1517/4096:ℚ),.auto),((753/2033:ℚ),.auto),((759/2048:ℚ),.auto),((95/256:ℚ),.auto),((3/8:ℚ),.auto),((104/275:ℚ),.auto)]
def block23 : NormalizedBlock := ⟨(104/275:ℚ),block23Cuts⟩

theorem block23_normalization :
    (gatheredExpr.intervalNormalize ((93/256:ℚ)) ((104/275:ℚ))).atomNormalize=block23Expr := by
  decide +kernel

theorem block23_checked : checkUpperBlock block23Expr 18446744073709551616 ((93/256:ℚ)) block23Cuts=
    some ((104/275:ℚ),(1452751685215284355/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block23_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block23_checked
