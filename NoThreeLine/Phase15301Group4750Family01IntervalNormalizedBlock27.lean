import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block27Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(1145388891/409600000:ℚ),(-1973215317/6400000000:ℚ)⟩) (.add (.scale ((35602497/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((98622689/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(57244188491/20480000000:ℚ),(-31697725367/102400000000:ℚ)⟩) (.add (.scale ((35602497/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((98622689/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1393/2048:ℚ),(625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((15489619/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1137/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨0,0⟩)) (.add (.min (.add (.atom ⟨(71593668699/25600000000:ℚ),(-15771996513/51200000000:ℚ)⟩) (.add (.scale ((35602497/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((98622689/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((92052489/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(625/2048:ℚ)⟩) (.add (.min (.atom ⟨(5/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-39/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((48599461/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1137/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block27Cuts : List (ℚ × AutoTrace) := [((893/2048:ℚ),.auto),((447/1024:ℚ),.auto),((497/1137:ℚ),.auto),((7/16:ℚ),.auto),((113/256:ℚ),.auto),((57/128:ℚ),.auto),((229/512:ℚ),.auto),((1833/4096:ℚ),.auto),((312/697:ℚ),.auto),((917/2048:ℚ),.auto),((459/1024:ℚ),.auto),((625/1393:ℚ),.auto),((115/256:ℚ),.auto),((29/64:ℚ),.auto),((233/512:ℚ),.auto),((933/2048:ℚ),.auto),((376/825:ℚ),.auto),((1867/4096:ℚ),.auto),((467/1024:ℚ),.auto),((753/1649:ℚ),.auto),((117/256:ℚ),.auto),((235/512:ℚ),.auto),((59/128:ℚ),.auto),((440/953:ℚ),.auto)]
def block27 : NormalizedBlock := ⟨(440/953:ℚ),block27Cuts⟩

theorem block27_normalization :
    (gatheredExpr.intervalNormalize ((248/569:ℚ)) ((440/953:ℚ))).atomNormalize=block27Expr := by
  decide +kernel

theorem block27_checked : checkUpperBlock block27Expr 18446744073709551616 ((248/569:ℚ)) block27Cuts=
    some ((440/953:ℚ),(133710208015380889/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block27_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block27_checked
