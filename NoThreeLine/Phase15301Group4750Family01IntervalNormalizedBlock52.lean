import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block52Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(332200843551/51200000000:ℚ),(-26045021257/6400000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(13/16:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-945/1024:ℚ),(13/16:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-945/1024:ℚ),(103/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((40293503/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(1691900096643/204800000000:ℚ),(-1154496197283/204800000000:ℚ)⟩) (.add (.scale ((-5362977/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(1649/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(1665/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1889/2048:ℚ),(1649/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((40293503/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1009/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((5362977/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(953/1024:ℚ),(-103/128:ℚ)⟩) (.add (.min (.atom ⟨(-1905/2048:ℚ),(1649/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(945/1024:ℚ),(-13/16:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(265813537211/40960000000:ℚ),(-833176368373/204800000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(13/16:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-945/1024:ℚ),(13/16:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-945/1024:ℚ),(103/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((40293503/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-505/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((5362977/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(9/128:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-103/128:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1649/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((22943869/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(881/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/2:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-55/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block52Cuts : List (ℚ × AutoTrace) := [((6595/7621:ℚ),.auto),((1649/1905:ℚ),.auto),((111/128:ℚ),.auto),((223/256:ℚ),.auto),((88/101:ℚ),.auto),((3569/4096:ℚ),.auto),((1785/2048:ℚ),.auto),((3571/4096:ℚ),.auto),((824/945:ℚ),.auto),((893/1024:ℚ),.auto),((1649/1889:ℚ),.auto),((832/953:ℚ),.auto),((447/512:ℚ),.auto),((881/1009:ℚ),.auto),((111/127:ℚ),.auto),((7/8:ℚ),.auto),((449/512:ℚ),.auto),((225/256:ℚ),.auto),((901/1024:ℚ),.auto),((1803/2048:ℚ),.auto),((832/945:ℚ),.auto),((3607/4096:ℚ),.auto),((6657/7559:ℚ),.auto),((451/512:ℚ),.auto)]
def block52 : NormalizedBlock := ⟨(451/512:ℚ),block52Cuts⟩

theorem block52_normalization :
    (gatheredExpr.intervalNormalize ((443/512:ℚ)) ((451/512:ℚ))).atomNormalize=block52Expr := by
  decide +kernel

theorem block52_checked : checkUpperBlock block52Expr 18446744073709551616 ((443/512:ℚ)) block52Cuts=
    some ((451/512:ℚ),(953693550089805767/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block52_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block52_checked
