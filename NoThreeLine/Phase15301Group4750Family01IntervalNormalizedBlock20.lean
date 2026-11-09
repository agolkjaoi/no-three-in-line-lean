import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block20Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(53882561743/25600000000:ℚ),(159641019/3200000000:ℚ)⟩) (.add (.scale ((-117636567/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((51407863/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-377/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(107728688903/51200000000:ℚ),(2517821721/51200000000:ℚ)⟩) (.add (.scale ((-117636567/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2033/2048:ℚ),(625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((51407863/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-753/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((189114629/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-369/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((117636567/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1017/1024:ℚ),(-39/128:ℚ)⟩) (.add (.min (.atom ⟨(-2033/2048:ℚ),(625/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(26942555581/12800000000:ℚ),(1279677571/25600000000:ℚ)⟩) (.add (.scale ((-117636567/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((51407863/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-377/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((117636567/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-39/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2033/2048:ℚ),(-625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((61070857/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(5/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((223620727/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-369/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block20Cuts : List (ℚ × AutoTrace) := [((39/128:ℚ),.auto),((42579346981/139727155375:ℚ),.auto),((1249/4096:ℚ),.auto),((625/2048:ℚ),.auto),((313/1024:ℚ),.auto),((113/369:ℚ),.auto),((157/512:ℚ),.auto),((104/339:ℚ),.auto),((2497/8135:ℚ),.auto),((833/2711:ℚ),.auto),((625/2033:ℚ),.auto),((315/1024:ℚ),.auto),((79/256:ℚ),.auto),((159/512:ℚ),.auto),((5/16:ℚ),.auto),((161/512:ℚ),.auto),((81/256:ℚ),.auto),((325/1024:ℚ),.auto),((651/2048:ℚ),.auto),((120/377:ℚ),.auto),((163/512:ℚ),.auto),((241/753:ℚ),.auto),((41/128:ℚ),.auto),((165/512:ℚ),.auto)]
def block20 : NormalizedBlock := ⟨(165/512:ℚ),block20Cuts⟩

theorem block20_normalization :
    (gatheredExpr.intervalNormalize ((155/512:ℚ)) ((165/512:ℚ))).atomNormalize=block20Expr := by
  decide +kernel

theorem block20_checked : checkUpperBlock block20Expr 18446744073709551616 ((155/512:ℚ)) block20Cuts=
    some ((165/512:ℚ),(232220160961097523/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block20_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block20_checked
