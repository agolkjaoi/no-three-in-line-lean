import NoThreeLine.Phase15301Group4750Family10Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family10.IntervalNormalized
open AutoEnvelope

def block06Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-6048891497/25600000000:ℚ),(301550471/800000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(129/2048:ℚ),(-1/16:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((31356967/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(241/2048:ℚ),(-9/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((51728609/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(369/2048:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((27111351/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(497/2048:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(-3042876801/12800000000:ℚ),(9612752967/25600000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(65/1024:ℚ),(-127/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((31356967/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(121/1024:ℚ),(-143/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((51728609/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(185/1024:ℚ),(-271/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((27111351/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(249/1024:ℚ),(-271/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-129/2048:ℚ),(1/16:ℚ)⟩) (.add (.min (.atom ⟨(65/1024:ℚ),(-127/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(-6048891497/25600000000:ℚ),(301550471/800000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(129/2048:ℚ),(-1/16:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((31356967/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(241/2048:ℚ),(-9/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((51728609/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(369/2048:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((27111351/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(497/2048:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((106117309/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-7/1024:ℚ),(-143/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(15/2048:ℚ),(9/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(147203477/20000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block06Cuts : List (ℚ × AutoTrace) := [((17/32:ℚ),.auto),((35/64:ℚ),.auto),((9/16:ℚ),.auto),((19/32:ℚ),.auto),((5/8:ℚ),.auto),((21/32:ℚ),.auto),((11/16:ℚ),.auto),((23/32:ℚ),.auto),((3/4:ℚ),.auto),((13/16:ℚ),.auto),((7/8:ℚ),.auto),((15/16:ℚ),.auto),((31/32:ℚ),.auto),(1,.auto)]
def block06 : NormalizedBlock := ⟨1,block06Cuts⟩

theorem block06_normalization :
    (gatheredExpr.intervalNormalize ((33/64:ℚ)) (1)).atomNormalize=block06Expr := by
  decide +kernel

theorem block06_checked : checkUpperBlock block06Expr 18446744073709551616 ((33/64:ℚ)) block06Cuts=
    some (1,(511300491752181471/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family10.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family10.IntervalNormalized.block06_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family10.IntervalNormalized.block06_checked
