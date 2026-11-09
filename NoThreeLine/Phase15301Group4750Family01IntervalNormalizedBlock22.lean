import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block22Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(17675569923/5120000000:ℚ),(-1353011083/3200000000:ℚ)⟩) (.add (.scale ((137826537/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((1534497/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(176672812103/51200000000:ℚ),(-4346212891/10240000000:ℚ)⟩) (.add (.scale ((137826537/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((1534497/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1393/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨0,0⟩)) (.add (.min (.add (.atom ⟨(17675569923/5120000000:ℚ),(-1353011083/3200000000:ℚ)⟩) (.add (.scale ((137826537/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((1534497/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((30132199/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(625/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-39/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block22Cuts : List (ℚ × AutoTrace) := [((85/256:ℚ),.auto),((171/512:ℚ),.auto),((43/128:ℚ),.auto),((87/256:ℚ),.auto),((11/32:ℚ),.auto),((89/256:ℚ),.auto),((179/512:ℚ),.auto),((359/1024:ℚ),.auto),((1437/4096:ℚ),.auto),((2875/8192:ℚ),.auto),((312/889:ℚ),.auto),((719/2048:ℚ),.auto),((45/128:ℚ),.auto),((625/1777:ℚ),.auto),((181/512:ℚ),.auto),((91/256:ℚ),.auto),((248/697:ℚ),.auto),((729/2048:ℚ),.auto),((365/1024:ℚ),.auto),((71/199:ℚ),.auto),((183/512:ℚ),.auto),((23/64:ℚ),.auto),((185/512:ℚ),.auto),((93/256:ℚ),.auto)]
def block22 : NormalizedBlock := ⟨(93/256:ℚ),block22Cuts⟩

theorem block22_normalization :
    (gatheredExpr.intervalNormalize ((169/512:ℚ)) ((93/256:ℚ))).atomNormalize=block22Expr := by
  decide +kernel

theorem block22_checked : checkUpperBlock block22Expr 18446744073709551616 ((169/512:ℚ)) block22Cuts=
    some ((93/256:ℚ),(3128254922381629321/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block22_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block22_checked
