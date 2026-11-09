import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block09Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(52032109907/25600000000:ℚ),(337362303/3200000000:ℚ)⟩) (.add (.scale ((-46416503/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(104098993739/51200000000:ℚ),(5432570773/51200000000:ℚ)⟩) (.add (.scale ((-46416503/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1521/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((46416503/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(761/1024:ℚ),(-15/128:ℚ)⟩) (.add (.min (.atom ⟨(-1521/2048:ℚ),(241/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(208174501271/102400000000:ℚ),(10841655339/102400000000:ℚ)⟩) (.add (.scale ((-46416503/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((555911/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((23486207/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block09Cuts : List (ℚ × AutoTrace) := [((5/32:ℚ),.auto),((161/1024:ℚ),.auto),((120/761:ℚ),.auto),((323/2048:ℚ),.auto),((961/6087:ℚ),.auto),((81/512:ℚ),.auto),((963/6085:ℚ),.auto),((241/1521:ℚ),.auto),((163/1024:ℚ),.auto),((41/256:ℚ),.auto),((165/1024:ℚ),.auto),((83/512:ℚ),.auto),((167/1024:ℚ),.auto),((21/128:ℚ),.auto),((169/1024:ℚ),.auto),((350497/2120274:ℚ),.auto),((85/512:ℚ),.auto),((171/1024:ℚ),.auto),((43/256:ℚ),.auto),((173/1024:ℚ),.auto),((87/512:ℚ),.auto),((175/1024:ℚ),.auto),((11/64:ℚ),.auto),((120/697:ℚ),.auto)]
def block09 : NormalizedBlock := ⟨(120/697:ℚ),block09Cuts⟩

theorem block09_normalization :
    (gatheredExpr.intervalNormalize ((159/1024:ℚ)) ((120/697:ℚ))).atomNormalize=block09Expr := by
  decide +kernel

theorem block09_checked : checkUpperBlock block09Expr 18446744073709551616 ((159/1024:ℚ)) block09Cuts=
    some ((120/697:ℚ),(17502197992685383/144115188075855872:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block09_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block09_checked
