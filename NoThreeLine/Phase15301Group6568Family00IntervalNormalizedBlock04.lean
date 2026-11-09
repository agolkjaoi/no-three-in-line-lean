import NoThreeLine.Phase15301Group6568Family00Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group6568.Family00.IntervalNormalized
open AutoEnvelope

def block04Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-396102933/3200000000:ℚ),(7726309671/25600000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1/16:ℚ),(-63/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((55843797/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(15/128:ℚ),(-71/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(23/128:ℚ),(-135/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((6931973/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(31/128:ℚ),(-135/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(-2545504717/20480000000:ℚ),(6170601791/20480000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(257/4096:ℚ),(-251/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((55843797/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(481/4096:ℚ),(-283/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(737/4096:ℚ),(-539/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((6931973/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(993/4096:ℚ),(-539/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-1/16:ℚ),(63/1024:ℚ)⟩) (.add (.min (.atom ⟨(257/4096:ℚ),(-251/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(-396102933/3200000000:ℚ),(7726309671/25600000000:ℚ)⟩) (.add (.scale ((-84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1/16:ℚ),(-63/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((55843797/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(15/128:ℚ),(-71/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((2396303/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(23/128:ℚ),(-135/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((6931973/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(31/128:ℚ),(-135/1024:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((102294097/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-31/4096:ℚ),(-283/4096:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1/128:ℚ),(71/1024:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((464503/1000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1/128:ℚ),(71/1024:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(31/4096:ℚ),(283/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block04Cuts : List (ℚ × AutoTrace) := [((1/2:ℚ),.auto),((17/32:ℚ),.auto),((9/16:ℚ),.auto),((19/32:ℚ),.auto),((5/8:ℚ),.auto),((11/16:ℚ),.auto),((3/4:ℚ),.auto),((13/16:ℚ),.auto),((7/8:ℚ),.auto),((15/16:ℚ),.auto),(1,.auto)]
def block04 : NormalizedBlock := ⟨1,block04Cuts⟩

theorem block04_normalization :
    (gatheredExpr.intervalNormalize ((15/32:ℚ)) (1)).atomNormalize=block04Expr := by
  decide +kernel

theorem block04_checked : checkUpperBlock block04Expr 18446744073709551616 ((15/32:ℚ)) block04Cuts=
    some (1,(1194924514019228655/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group6568.Family00.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group6568.Family00.IntervalNormalized.block04_normalization
#print axioms NoThreeLine.Phase15301Group6568.Family00.IntervalNormalized.block04_checked
