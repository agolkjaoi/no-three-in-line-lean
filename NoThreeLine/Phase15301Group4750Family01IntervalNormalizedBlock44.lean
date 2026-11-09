import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block44Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-23518294063/20480000000:ℚ),(31713064749/12800000000:ℚ)⟩) (.add (.scale ((-194624179/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(95/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(-46953643127/40960000000:ℚ),(507823760979/204800000000:ℚ)⟩) (.add (.scale ((-194624179/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2033/2048:ℚ),(1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1521/2048:ℚ),(1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-15972857/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1009/2048:ℚ),(753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((194624179/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1017/1024:ℚ),(-95/128:ℚ)⟩) (.add (.min (.atom ⟨(-2033/2048:ℚ),(1521/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(761/1024:ℚ),(-71/128:ℚ)⟩) (.add (.min (.atom ⟨(-1521/2048:ℚ),(1137/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((15972857/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(505/1024:ℚ),(-47/128:ℚ)⟩) (.add (.min (.atom ⟨(-1009/2048:ℚ),(753/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.min (.add (.atom ⟨(-46959470549/40960000000:ℚ),(507794623869/204800000000:ℚ)⟩) (.add (.scale ((-194624179/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(95/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-30186123/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((194624179/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-95/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2033/2048:ℚ),(-1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((2600491/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-71/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((15972857/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-47/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/2:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block44Cuts : List (ℚ × AutoTrace) := [((3011/4037:ℚ),.auto),((191/256:ℚ),.auto),((753/1009:ℚ),.auto),((3057/4096:ℚ),.auto),((568/761:ℚ),.auto),((1529/2048:ℚ),.auto),((1515/2029:ℚ),.auto),((765/1024:ℚ),.auto),((4547/6085:ℚ),.auto),((760/1017:ℚ),.auto),((3061/4096:ℚ),.auto),((6081/8135:ℚ),.auto),((379/507:ℚ),.auto),((1531/2048:ℚ),.auto),((6083/8133:ℚ),.auto),((383/512:ℚ),.auto),((1521/2033:ℚ),.auto),((6129/8192:ℚ),.auto),((3065/4096:ℚ),.auto),((1533/2048:ℚ),.auto),((767/1024:ℚ),.auto),((3/4:ℚ),.auto),((385/512:ℚ),.auto),((760/1009:ℚ),.auto)]
def block44 : NormalizedBlock := ⟨(760/1009:ℚ),block44Cuts⟩

theorem block44_normalization :
    (gatheredExpr.intervalNormalize ((3055/4096:ℚ)) ((760/1009:ℚ))).atomNormalize=block44Expr := by
  decide +kernel

theorem block44_checked : checkUpperBlock block44Expr 18446744073709551616 ((3055/4096:ℚ)) block44Cuts=
    some ((760/1009:ℚ),(317482912972502765/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block44_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block44_checked
