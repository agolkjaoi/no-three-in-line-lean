import NoThreeLine.Phase15301Group5558Family13Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized
open AutoEnvelope

def block00Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(3010005341/800000000:ℚ),0⟩) (.add (.scale ((-24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(79/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-70920221/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(87/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((58224997/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(95/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-727018959/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((247741703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.atom ⟨(3010005341/800000000:ℚ),0⟩) (.add (.scale ((-24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2529/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-70920221/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2785/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((58224997/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3041/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-727018959/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3297/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((247741703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3553/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.add (.scale ((24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-79/128:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(2529/4096:ℚ),(-225/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((70920221/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-87/128:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(2785/4096:ℚ),(-225/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((727018959/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-103/128:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(3297/4096:ℚ),(-225/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.min (.add (.atom ⟨(3010005341/800000000:ℚ),0⟩) (.add (.scale ((-24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(79/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-70920221/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(87/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((58224997/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(95/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-727018959/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((247741703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((247741703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨1,0⟩) (.atom ⟨(17/128:ℚ),(113/2048:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(543/4096:ℚ),(225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(147203477/20000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block00Cuts : List (ℚ × AutoTrace) := [((1/16:ℚ),.auto),((129/2048:ℚ),.auto),((259/4096:ℚ),.auto),((65/1024:ℚ),.auto),((33/512:ℚ),.auto),((17/256:ℚ),.auto),((35/512:ℚ),.auto),((281/4096:ℚ),.auto),((141/2048:ℚ),.auto),((71/1024:ℚ),.auto),((9/128:ℚ),.auto),((37/512:ℚ),.auto),((19/256:ℚ),.auto),((39/512:ℚ),.auto),((5/64:ℚ),.auto),((41/512:ℚ),.auto),((83/1024:ℚ),.auto),((21/256:ℚ),.auto),((43/512:ℚ),.auto),((11/128:ℚ),.auto),((45/512:ℚ),.auto),((23/256:ℚ),.auto),((47/512:ℚ),.auto),((3/32:ℚ),.auto)]
def block00 : NormalizedBlock := ⟨(3/32:ℚ),block00Cuts⟩

theorem block00_normalization :
    (gatheredExpr.intervalNormalize (0) ((3/32:ℚ))).atomNormalize=block00Expr := by
  decide +kernel

theorem block00_checked : checkUpperBlock block00Expr 18446744073709551616 (0) block00Cuts=
    some ((3/32:ℚ),(12401871038058136705/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized.block00_normalization
#print axioms NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized.block00_checked
