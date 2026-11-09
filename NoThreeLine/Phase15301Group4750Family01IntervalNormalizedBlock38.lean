import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block38Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(120365242917/102400000000:ℚ),(6798335637/12800000000:ℚ)⟩) (.add (.scale ((17526347/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-185/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(318511544479/204800000000:ℚ),(58254230497/204800000000:ℚ)⟩) (.add (.scale ((17526347/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((123498023/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1393/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(185/1024:ℚ),(-15/128:ℚ)⟩) (.add (.min (.atom ⟨(-369/2048:ℚ),(241/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(120516884523/102400000000:ℚ),(27269163351/51200000000:ℚ)⟩) (.add (.scale ((17526347/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-105164097/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-185/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((8314207/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1137/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-71/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((15730481/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-71/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((19542367/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(185/1024:ℚ),(-15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block38Cuts : List (ℚ × AutoTrace) := [((881/1393:ℚ),.auto),((81/128:ℚ),.auto),((325/512:ℚ),.auto),((163/256:ℚ),.auto),((327/512:ℚ),.auto),((2617/4096:ℚ),.auto),((568/889:ℚ),.auto),((1309/2048:ℚ),.auto),((655/1024:ℚ),.auto),((1137/1777:ℚ),.auto),((41/64:ℚ),.auto),((165/256:ℚ),.auto),((83/128:ℚ),.auto),((24/37:ℚ),.auto),((2657/4096:ℚ),.auto),((1329/2048:ℚ),.auto),((665/1024:ℚ),.auto),((10103827939/15556211729:ℚ),.auto),((961/1479:ℚ),.auto),((1331/2048:ℚ),.auto),((333/512:ℚ),.auto),((963/1477:ℚ),.auto),((167/256:ℚ),.auto),((1337/2048:ℚ),.auto)]
def block38 : NormalizedBlock := ⟨(1337/2048:ℚ),block38Cuts⟩

theorem block38_normalization :
    (gatheredExpr.intervalNormalize ((18132739637/28673011080:ℚ)) ((1337/2048:ℚ))).atomNormalize=block38Expr := by
  decide +kernel

theorem block38_checked : checkUpperBlock block38Expr 18446744073709551616 ((18132739637/28673011080:ℚ)) block38Cuts=
    some ((1337/2048:ℚ),(753095494901185227/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block38_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block38_checked
