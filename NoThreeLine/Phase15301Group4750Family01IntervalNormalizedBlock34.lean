import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block34Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(15181906553/102400000000:ℚ),(2978034317/2560000000:ℚ)⟩) (.add (.scale ((-64935591/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-509441/2000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(69454924163/204800000000:ℚ),(216149992317/204800000000:ℚ)⟩) (.add (.scale ((-64935591/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(1009/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-881/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((64935591/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(889/1024:ℚ),(-63/128:ℚ)⟩) (.add (.min (.atom ⟨(-1777/2048:ℚ),(1009/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((509441/2000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(761/1024:ℚ),(-55/128:ℚ)⟩) (.add (.min (.atom ⟨(-1521/2048:ℚ),(881/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-881/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.min (.add (.atom ⟨(3850300293/25600000000:ℚ),(119340667299/102400000000:ℚ)⟩) (.add (.scale ((-64935591/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-509441/2000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((69759467/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-31/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(9/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block34Cuts : List (ℚ × AutoTrace) := [((4621/8192:ℚ),.auto),((497/881:ℚ),.auto),((2311/4096:ℚ),.auto),((289/512:ℚ),.auto),((145/256:ℚ),.auto),((1161/2048:ℚ),.auto),((72/127:ℚ),.auto),((2323/4096:ℚ),.auto),((4033/7111:ℚ),.auto),((581/1024:ℚ),.auto),((4035/7109:ℚ),.auto),((2325/4096:ℚ),.auto),((1009/1777:ℚ),.auto),((1163/2048:ℚ),.auto),((291/512:ℚ),.auto),((73/128:ℚ),.auto),((293/512:ℚ),.auto),((147/256:ℚ),.auto),((295/512:ℚ),.auto),((37/64:ℚ),.auto),((440/761:ℚ),.auto),((3521/6087:ℚ),.auto),((3523/6085:ℚ),.auto),((593/1024:ℚ),.auto)]
def block34 : NormalizedBlock := ⟨(593/1024:ℚ),block34Cuts⟩

theorem block34_normalization :
    (gatheredExpr.intervalNormalize ((1155/2048:ℚ)) ((593/1024:ℚ))).atomNormalize=block34Expr := by
  decide +kernel

theorem block34_checked : checkUpperBlock block34Expr 18446744073709551616 ((1155/2048:ℚ)) block34Cuts=
    some ((593/1024:ℚ),(333409108908719765/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block34_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block34_checked
