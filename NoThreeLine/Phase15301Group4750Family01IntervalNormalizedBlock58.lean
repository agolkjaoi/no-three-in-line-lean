import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block58Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(320358021/102400000000:ℚ),(4335036921/2560000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(55/64:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((41007123/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-121/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((2042171/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-57/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(-6299060667/102400000000:ℚ),(180357019963/102400000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(1761/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩)) (.add (.min (.add (.atom ⟨(1259787451/204800000000:ℚ),(347422025089/204800000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(55/64:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((41007123/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-121/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((2042171/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-57/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1761/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-55/64:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((19542367/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(7/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((4355853/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block58Cuts : List (ℚ × AutoTrace) := [((495/512:ℚ),.auto),((31/32:ℚ),.auto),((130843/135052:ℚ),.auto),((497/512:ℚ),.auto),((249/256:ℚ),.auto),((499/512:ℚ),.auto),((790577/810312:ℚ),.auto),((125/128:ℚ),.auto),((501/512:ℚ),.auto),((251/256:ℚ),.auto),((503/512:ℚ),.auto),((56/57:ℚ),.auto),((63/64:ℚ),.auto),((505/512:ℚ),.auto),((253/256:ℚ),.auto),((880/889:ℚ),.auto),((507/512:ℚ),.auto),((2029/2048:ℚ),.auto),((4059/4096:ℚ),.auto),((1761/1777:ℚ),.auto),((1015/1024:ℚ),.auto),((120/121:ℚ),.auto),((127/128:ℚ),.auto),((184/185:ℚ),.auto)]
def block58 : NormalizedBlock := ⟨(184/185:ℚ),block58Cuts⟩

theorem block58_normalization :
    (gatheredExpr.intervalNormalize ((247/256:ℚ)) ((184/185:ℚ))).atomNormalize=block58Expr := by
  decide +kernel

theorem block58_checked : checkUpperBlock block58Expr 18446744073709551616 ((247/256:ℚ)) block58Cuts=
    some ((184/185:ℚ),(1692962997290423369/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block58_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block58_checked
