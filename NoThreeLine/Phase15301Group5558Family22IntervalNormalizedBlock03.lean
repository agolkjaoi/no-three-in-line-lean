import NoThreeLine.Phase15301Group5558Family22Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group5558.Family22.IntervalNormalized
open AutoEnvelope

def block03Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(49398537943/81920000000:ℚ),(-12187557293/204800000000:ℚ)⟩) (.add (.scale ((-53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(255/4096:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(287/4096:ℚ),(-129/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(511/4096:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((204420051/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(543/4096:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(7735799203/12800000000:ℚ),(-4764445961/81920000000:ℚ)⟩) (.add (.scale ((-53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1/16:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(9/128:ℚ),(-257/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1/8:ℚ),(-481/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((204420051/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(17/128:ℚ),(-481/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-255/4096:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/16:ℚ),(-225/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-287/4096:ℚ),(129/2048:ℚ)⟩) (.add (.min (.atom ⟨(9/128:ℚ),(-257/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-511/4096:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),(-481/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.min (.add (.atom ⟨(123704815387/204800000000:ℚ),(-23958173527/409600000000:ℚ)⟩) (.add (.scale ((-53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(255/4096:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(287/4096:ℚ),(-129/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(511/4096:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((204420051/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(543/4096:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-111/128:ℚ),(-257/4096:ℚ)⟩) (.add (.min (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(3553/4096:ℚ),(129/2048:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(3553/4096:ℚ),(129/2048:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(15/16:ℚ),0⟩) (.atom ⟨(111/128:ℚ),(257/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((5959007/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-111/128:ℚ),(-481/4096:ℚ)⟩) (.add (.min (.atom ⟨(127/128:ℚ),0⟩) (.atom ⟨(3553/4096:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((204420051/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨1,0⟩) (.atom ⟨(3553/4096:ℚ),(241/2048:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(127/128:ℚ),0⟩) (.atom ⟨(111/128:ℚ),(481/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block03Cuts : List (ℚ × AutoTrace) := [((57/64:ℚ),.auto),((29/32:ℚ),.auto),((15/16:ℚ),.auto),((31/32:ℚ),.auto),(1,.auto)]
def block03 : NormalizedBlock := ⟨1,block03Cuts⟩

theorem block03_normalization :
    (gatheredExpr.intervalNormalize ((7/8:ℚ)) (1)).atomNormalize=block03Expr := by
  decide +kernel

theorem block03_checked : checkUpperBlock block03Expr 18446744073709551616 ((7/8:ℚ)) block03Cuts=
    some (1,(344186895650132531/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group5558.Family22.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group5558.Family22.IntervalNormalized.block03_normalization
#print axioms NoThreeLine.Phase15301Group5558.Family22.IntervalNormalized.block03_checked
