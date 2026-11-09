import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block18Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(190759003513/102400000000:ℚ),(1561760169/12800000000:ℚ)⟩) (.add (.scale ((46285703/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-509441/2000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(52785854933/204800000000:ℚ),(117270765099/204800000000:ℚ)⟩) (.add (.scale ((-509441/2000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-881/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((509441/2000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(441/1024:ℚ),(-15/128:ℚ)⟩) (.add (.min (.atom ⟨(-881/2048:ℚ),(241/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(381786575057/204800000000:ℚ),(5051346147/40960000000:ℚ)⟩) (.add (.scale ((46285703/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-509441/2000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((24425751/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(497/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-31/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((35598807/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(9/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((61070857/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(9/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block18Cuts : List (ℚ × AutoTrace) := [((137/512:ℚ),.auto),((275/1024:ℚ),.auto),((69/256:ℚ),.auto),((277/1024:ℚ),.auto),((139/512:ℚ),.auto),((557/2048:ℚ),.auto),((40/147:ℚ),.auto),((1115/4096:ℚ),.auto),((279/1024:ℚ),.auto),((961/3527:ℚ),.auto),((321/1175:ℚ),.auto),((35/128:ℚ),.auto),((241/881:ℚ),.auto),((561/2048:ℚ),.auto),((281/1024:ℚ),.auto),((141/512:ℚ),.auto),((283/1024:ℚ),.auto),((71/256:ℚ),.auto),((285/1024:ℚ),.auto),((248/889:ℚ),.auto),((143/512:ℚ),.auto),((1145/4096:ℚ),.auto),((2291/8192:ℚ),.auto),((497/1777:ℚ),.auto)]
def block18 : NormalizedBlock := ⟨(497/1777:ℚ),block18Cuts⟩

theorem block18_normalization :
    (gatheredExpr.intervalNormalize ((273/1024:ℚ)) ((497/1777:ℚ))).atomNormalize=block18Expr := by
  decide +kernel

theorem block18_checked : checkUpperBlock block18Expr 18446744073709551616 ((273/1024:ℚ)) block18Cuts=
    some ((497/1777:ℚ),(1337297459939149893/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block18_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block18_checked
