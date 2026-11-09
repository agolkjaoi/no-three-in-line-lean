import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block42Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(18915196493/6400000000:ℚ),(-46660681/80000000:ℚ)⟩) (.add (.scale ((2042171/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(87/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((41007123/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(79/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(7563327337/2560000000:ℚ),(-7479465261/12800000000:ℚ)⟩) (.add (.scale ((2042171/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(1393/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((41007123/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(1265/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1393/2048:ℚ),(1009/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((103567763/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-881/2048:ℚ),(625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(697/1024:ℚ),(-63/128:ℚ)⟩) (.add (.min (.atom ⟨(-1393/2048:ℚ),(1009/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(605483539717/204800000000:ℚ),(-119254091419/204800000000:ℚ)⟩) (.add (.scale ((2042171/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(87/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((41007123/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(79/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-697/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1393/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-87/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((1922389/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1265/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-79/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((140966153/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-63/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(5/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1009/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block42Cuts : List (ℚ × AutoTrace) := [((625/881:ℚ),.auto),((632/889:ℚ),.auto),((91/128:ℚ),.auto),((1265/1777:ℚ),.auto),((365/512:ℚ),.auto),((183/256:ℚ),.auto),((367/512:ℚ),.auto),((23/32:ℚ),.auto),((369/512:ℚ),.auto),((185/256:ℚ),.auto),((504/697:ℚ),.auto),((4033/5575:ℚ),.auto),((4035/5573:ℚ),.auto),((1009/1393:ℚ),.auto),((371/512:ℚ),.auto),((93/128:ℚ),.auto),((373/512:ℚ),.auto),((747/1024:ℚ),.auto),((1495/2048:ℚ),.auto),((696/953:ℚ),.auto),((187/256:ℚ),.auto),((1393/1905:ℚ),.auto),((47/64:ℚ),.auto),((189/256:ℚ),.auto)]
def block42 : NormalizedBlock := ⟨(189/256:ℚ),block42Cuts⟩

theorem block42_normalization :
    (gatheredExpr.intervalNormalize ((363/512:ℚ)) ((189/256:ℚ))).atomNormalize=block42Expr := by
  decide +kernel

theorem block42_checked : checkUpperBlock block42Expr 18446744073709551616 ((363/512:ℚ)) block42Cuts=
    some ((189/256:ℚ),(2492127892637705153/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block42_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block42_checked
