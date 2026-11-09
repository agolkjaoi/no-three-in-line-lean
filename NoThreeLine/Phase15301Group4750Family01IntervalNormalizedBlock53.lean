import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block53Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(496865806769/102400000000:ℚ),(-33540375623/12800000000:ℚ)⟩) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(993486427241/204800000000:ℚ),(-107378239253/40960000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1889/2048:ℚ),(1665/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1137/2048:ℚ),(1009/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(945/1024:ℚ),(-13/16:ℚ)⟩) (.add (.min (.atom ⟨(-1889/2048:ℚ),(1665/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(569/1024:ℚ),(-63/128:ℚ)⟩) (.add (.min (.atom ⟨(-1137/2048:ℚ),(1009/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(993995925389/204800000000:ℚ),(-536381698117/204800000000:ℚ)⟩) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-569/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((154920223/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-63/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(7/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1009/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block53Cuts : List (ℚ × AutoTrace) := [((3609/4096:ℚ),.auto),((6659/7557:ℚ),.auto),((1805/2048:ℚ),.auto),((1665/1889:ℚ),.auto),((3611/4096:ℚ),.auto),((903/1024:ℚ),.auto),((113/128:ℚ),.auto),((453/512:ℚ),.auto),((907/1024:ℚ),.auto),((504/569:ℚ),.auto),((109/123:ℚ),.auto),((1815/2048:ℚ),.auto),((227/256:ℚ),.auto),((3633/4096:ℚ),.auto),((4035/4549:ℚ),.auto),((1817/2048:ℚ),.auto),((1009/1137:ℚ),.auto),((3635/4096:ℚ),.auto),((909/1024:ℚ),.auto),((455/512:ℚ),.auto),((57/64:ℚ),.auto),((457/512:ℚ),.auto),((229/256:ℚ),.auto),((459/512:ℚ),.auto)]
def block53 : NormalizedBlock := ⟨(459/512:ℚ),block53Cuts⟩

theorem block53_normalization :
    (gatheredExpr.intervalNormalize ((451/512:ℚ)) ((459/512:ℚ))).atomNormalize=block53Expr := by
  decide +kernel

theorem block53_checked : checkUpperBlock block53Expr 18446744073709551616 ((451/512:ℚ)) block53Cuts=
    some ((459/512:ℚ),(260744026461475629/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block53_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block53_checked
