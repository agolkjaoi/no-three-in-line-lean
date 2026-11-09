import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block33Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(46146938501/51200000000:ℚ),(4699133301/6400000000:ℚ)⟩) (.add (.scale ((217583/1000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(444246366687/204800000000:ℚ),(4293719969/204800000000:ℚ)⟩) (.add (.scale ((217583/1000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2033/2048:ℚ),(1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-224108453/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1137/2048:ℚ),(625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((224108453/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1137/2048:ℚ),(625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(441/1024:ℚ),(-31/128:ℚ)⟩) (.add (.min (.atom ⟨(-881/2048:ℚ),(497/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(36974152693/40960000000:ℚ),(150655275093/204800000000:ℚ)⟩) (.add (.scale ((217583/1000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1017/1024:ℚ),(71/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((155579777/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-39/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(7/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((69759467/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(441/1024:ℚ),(-31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block33Cuts : List (ℚ × AutoTrace) := [((625/1137:ℚ),.auto),((563/1024:ℚ),.auto),((141/256:ℚ),.auto),((71/128:ℚ),.auto),((285/512:ℚ),.auto),((571/1024:ℚ),.auto),((568/1017:ℚ),.auto),((143/256:ℚ),.auto),((1137/2033:ℚ),.auto),((287/512:ℚ),.auto),((575/1024:ℚ),.auto),((1151/2048:ℚ),.auto),((2303/4096:ℚ),.auto),((248/441:ℚ),.auto),((4607/8192:ℚ),.auto),((9/16:ℚ),.auto),((146078545663/259658612683:ℚ),.auto),((2305/4096:ℚ),.auto),((1985/3527:ℚ),.auto),((1153/2048:ℚ),.auto),((577/1024:ℚ),.auto),((1987/3525:ℚ),.auto),((2309/4096:ℚ),.auto),((1155/2048:ℚ),.auto)]
def block33 : NormalizedBlock := ⟨(1155/2048:ℚ),block33Cuts⟩

theorem block33_normalization :
    (gatheredExpr.intervalNormalize ((4503/8192:ℚ)) ((1155/2048:ℚ))).atomNormalize=block33Expr := by
  decide +kernel

theorem block33_checked : checkUpperBlock block33Expr 18446744073709551616 ((4503/8192:ℚ)) block33Cuts=
    some ((1155/2048:ℚ),(80308930310301571/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block33_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block33_checked
