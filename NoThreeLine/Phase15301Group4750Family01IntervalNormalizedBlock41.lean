import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block41Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(175071542841/51200000000:ℚ),(-5893257791/6400000000:ℚ)⟩) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((103567763/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(608731425087/204800000000:ℚ),(-124165944511/204800000000:ℚ)⟩) (.add (.scale ((78830753/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1265/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(633/1024:ℚ),(-55/128:ℚ)⟩) (.add (.min (.atom ⟨(-1265/2048:ℚ),(881/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(700359853223/204800000000:ℚ),(-188510567453/204800000000:ℚ)⟩) (.add (.scale ((-294439157/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((103567763/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((15730481/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(1137/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((149455501/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-55/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(3/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block41Cuts : List (ℚ × AutoTrace) := [((353/512:ℚ),.auto),((1137/1649:ℚ),.auto),((177/256:ℚ),.auto),((355/512:ℚ),.auto),((711/1024:ℚ),.auto),((1423/2048:ℚ),.auto),((2847/4096:ℚ),.auto),((440/633:ℚ),.auto),((89/128:ℚ),.auto),((3521/5063:ℚ),.auto),((3523/5061:ℚ),.auto),((713/1024:ℚ),.auto),((5705/8192:ℚ),.auto),((881/1265:ℚ),.auto),((2853/4096:ℚ),.auto),((1427/2048:ℚ),.auto),((357/512:ℚ),.auto),((179/256:ℚ),.auto),((45/64:ℚ),.auto),((181/256:ℚ),.auto),((104/147:ℚ),.auto),((1449/2048:ℚ),.auto),((725/1024:ℚ),.auto),((363/512:ℚ),.auto)]
def block41 : NormalizedBlock := ⟨(363/512:ℚ),block41Cuts⟩

theorem block41_normalization :
    (gatheredExpr.intervalNormalize ((568/825:ℚ)) ((363/512:ℚ))).atomNormalize=block41Expr := by
  decide +kernel

theorem block41_checked : checkUpperBlock block41Expr 18446744073709551616 ((568/825:ℚ)) block41Cuts=
    some ((363/512:ℚ),(1674544176338582445/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block41_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block41_checked
