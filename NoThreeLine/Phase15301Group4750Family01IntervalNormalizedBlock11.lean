import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block11Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(300707041467/102400000000:ℚ),(-765153653/12800000000:ℚ)⟩) (.add (.scale ((96121357/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-72298773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(601403031203/204800000000:ℚ),(-12253510179/204800000000:ℚ)⟩) (.add (.scale ((96121357/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(369/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-72298773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1265/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((72298773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(633/1024:ℚ),(-15/128:ℚ)⟩) (.add (.min (.atom ⟨(-1265/2048:ℚ),(241/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(601427375467/204800000000:ℚ),(-2445833183/40960000000:ℚ)⟩) (.add (.scale ((96121357/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-72298773/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((34491679/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(369/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((18642707/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(3/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block11Cuts : List (ℚ × AutoTrace) := [((1487/8192:ℚ),.auto),((93/512:ℚ),.auto),((47/256:ℚ),.auto),((95/512:ℚ),.auto),((3/16:ℚ),.auto),((97/512:ℚ),.auto),((40/211:ℚ),.auto),((1553/8192:ℚ),.auto),((777/4096:ℚ),.auto),((961/5063:ℚ),.auto),((1555/8192:ℚ),.auto),((389/2048:ℚ),.auto),((33680579303/177239895313:ℚ),.auto),((321/1687:ℚ),.auto),((195/1024:ℚ),.auto),((241/1265:ℚ),.auto),((49/256:ℚ),.auto),((197/1024:ℚ),.auto),((184/953:ℚ),.auto),((99/512:ℚ),.auto),((793/4096:ℚ),.auto),((17728864501/91561118408:ℚ),.auto),((123/635:ℚ),.auto),((397/2048:ℚ),.auto)]
def block11 : NormalizedBlock := ⟨(397/2048:ℚ),block11Cuts⟩

theorem block11_normalization :
    (gatheredExpr.intervalNormalize ((369/2033:ℚ)) ((397/2048:ℚ))).atomNormalize=block11Expr := by
  decide +kernel

theorem block11_checked : checkUpperBlock block11Expr 18446744073709551616 ((369/2033:ℚ)) block11Cuts=
    some ((397/2048:ℚ),(1585312433580341383/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block11_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block11_checked
