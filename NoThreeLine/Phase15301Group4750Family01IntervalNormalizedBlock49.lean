import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block49Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(22656855869/20480000000:ℚ),(7328595393/12800000000:ℚ)⟩) (.add (.scale ((189114629/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(87/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((189870837/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(79/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-377/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(-396883856257/204800000000:ℚ),(644378514177/204800000000:ℚ)⟩) (.add (.scale ((189870837/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1521/2048:ℚ),(1265/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-753/2048:ℚ),(625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(377/1024:ℚ),(-39/128:ℚ)⟩) (.add (.min (.atom ⟨(-753/2048:ℚ),(625/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(227143971169/204800000000:ℚ),(117832938767/204800000000:ℚ)⟩) (.add (.scale ((189114629/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(87/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((189870837/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(79/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-377/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((154608531/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1393/2048:ℚ)⟩) (.add (.min (.atom ⟨(3/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-87/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((8562173/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1265/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-79/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((18122957/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-39/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(5/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block49Cuts : List (ℚ × AutoTrace) := [((24/29:ℚ),.auto),((1695/2048:ℚ),.auto),((53/64:ℚ),.auto),((2497/3015:ℚ),.auto),((849/1024:ℚ),.auto),((3397/4096:ℚ),.auto),((2499/3013:ℚ),.auto),((1699/2048:ℚ),.auto),((625/753:ℚ),.auto),((425/512:ℚ),.auto),((632/761:ℚ),.auto),((851/1024:ℚ),.auto),((1703/2048:ℚ),.auto),((1265/1521:ℚ),.auto),((3407/4096:ℚ),.auto),((213/256:ℚ),.auto),((427/512:ℚ),.auto),((107/128:ℚ),.auto),((429/512:ℚ),.auto),((215/256:ℚ),.auto),((431/512:ℚ),.auto),((232/275:ℚ),.auto),((27/32:ℚ),.auto),((865/1024:ℚ),.auto)]
def block49 : NormalizedBlock := ⟨(865/1024:ℚ),block49Cuts⟩

theorem block49_normalization :
    (gatheredExpr.intervalNormalize ((847/1024:ℚ)) ((865/1024:ℚ))).atomNormalize=block49Expr := by
  decide +kernel

theorem block49_checked : checkUpperBlock block49Expr 18446744073709551616 ((847/1024:ℚ)) block49Cuts=
    some ((865/1024:ℚ),(270605385692896687/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block49_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block49_checked
