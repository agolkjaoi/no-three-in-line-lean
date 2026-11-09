import NoThreeLine.Phase15301Group4750Family13Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized
open AutoEnvelope

def block00Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(3010005341/800000000:ℚ),0⟩) (.add (.scale ((-70920221/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(87/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((58224997/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(95/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-727018959/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((247741703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(3010005341/800000000:ℚ),0⟩) (.add (.scale ((-24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1265/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-70920221/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1393/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((58224997/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1521/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-727018959/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1649/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((247741703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1777/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.add (.scale ((24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-79/128:ℚ),(57/1024:ℚ)⟩) (.add (.min (.atom ⟨(1265/2048:ℚ),(-113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((70920221/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-87/128:ℚ),(57/1024:ℚ)⟩) (.add (.min (.atom ⟨(1393/2048:ℚ),(-113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((727018959/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-103/128:ℚ),(57/1024:ℚ)⟩) (.add (.min (.atom ⟨(1649/2048:ℚ),(-113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.min (.add (.atom ⟨(3010005341/800000000:ℚ),0⟩) (.add (.scale ((-70920221/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(87/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((58224997/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(95/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-727018959/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((247741703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-57/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((247741703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨1,0⟩) (.atom ⟨(17/128:ℚ),(57/1024:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(271/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(147203477/20000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block00Cuts : List (ℚ × AutoTrace) := [((1/16:ℚ),.auto),((65/1024:ℚ),.auto),((261/4096:ℚ),.auto),((131/2048:ℚ),.auto),((33/512:ℚ),.auto),((17/256:ℚ),.auto),((35/512:ℚ),.auto),((281/4096:ℚ),.auto),((141/2048:ℚ),.auto),((283/4096:ℚ),.auto),((567/8192:ℚ),.auto),((71/1024:ℚ),.auto),((9/128:ℚ),.auto),((37/512:ℚ),.auto),((19/256:ℚ),.auto),((77/1024:ℚ),.auto),((39/512:ℚ),.auto),((5/64:ℚ),.auto),((41/512:ℚ),.auto),((21/256:ℚ),.auto),((43/512:ℚ),.auto),((11/128:ℚ),.auto),((45/512:ℚ),.auto),((23/256:ℚ),.auto)]
def block00 : NormalizedBlock := ⟨(23/256:ℚ),block00Cuts⟩

theorem block00_normalization :
    (gatheredExpr.intervalNormalize (0) ((23/256:ℚ))).atomNormalize=block00Expr := by
  decide +kernel

theorem block00_checked : checkUpperBlock block00Expr 18446744073709551616 (0) block00Cuts=
    some ((23/256:ℚ),(1492835080455342985/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized.block00_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family13.IntervalNormalized.block00_checked
