import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block35Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(5321899499/10240000000:ℚ),(6056051187/6400000000:ℚ)⟩) (.add (.scale ((-22067989/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((17695151/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((104000057/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-313/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(137393449929/102400000000:ℚ),(9361925771/20480000000:ℚ)⟩) (.add (.scale ((-509441/2000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1521/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((17695151/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1265/2048:ℚ),(753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((104000057/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-625/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((22067989/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(953/1024:ℚ),(-71/128:ℚ)⟩) (.add (.min (.atom ⟨(-1905/2048:ℚ),(1137/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((509441/2000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1521/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(106741800397/204800000000:ℚ),(194097448401/204800000000:ℚ)⟩) (.add (.scale ((-22067989/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((17695151/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((104000057/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-313/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((8314207/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(953/1024:ℚ),(-71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((183300153/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(753/2048:ℚ)⟩) (.add (.min (.atom ⟨(3/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-47/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((8347789/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-47/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(3/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((45498801/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(369/2048:ℚ)⟩) (.add (.min (.atom ⟨(11/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block35Cuts : List (ℚ × AutoTrace) := [((881/1521:ℚ),.auto),((297/512:ℚ),.auto),((149/256:ℚ),.auto),((299/512:ℚ),.auto),((75/128:ℚ),.auto),((184/313:ℚ),.auto),((301/512:ℚ),.auto),((151/256:ℚ),.auto),((1209/2048:ℚ),.auto),((369/625:ℚ),.auto),((605/1024:ℚ),.auto),((303/512:ℚ),.auto),((19/32:ℚ),.auto),((376/633:ℚ),.auto),((609/1024:ℚ),.auto),((1219/2048:ℚ),.auto),((753/1265:ℚ),.auto),((305/512:ℚ),.auto),((2441/4096:ℚ),.auto),((568/953:ℚ),.auto),((1221/2048:ℚ),.auto),((505/847:ℚ),.auto),((4547/7621:ℚ),.auto),((611/1024:ℚ),.auto)]
def block35 : NormalizedBlock := ⟨(611/1024:ℚ),block35Cuts⟩

theorem block35_normalization :
    (gatheredExpr.intervalNormalize ((593/1024:ℚ)) ((611/1024:ℚ))).atomNormalize=block35Expr := by
  decide +kernel

theorem block35_checked : checkUpperBlock block35Expr 18446744073709551616 ((593/1024:ℚ)) block35Cuts=
    some ((611/1024:ℚ),(1474609421224122565/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block35_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block35_checked
