import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block46Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-234824409199/102400000000:ℚ),(43672903841/12800000000:ℚ)⟩) (.add (.scale ((-163320237/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(87/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-313/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(-36578631353/20480000000:ℚ),(12347104381/4096000000:ℚ)⟩) (.add (.scale ((-163320237/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(1393/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((163320237/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(889/1024:ℚ),(-87/128:ℚ)⟩) (.add (.min (.atom ⟨(-1777/2048:ℚ),(1393/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(313/1024:ℚ),(-31/128:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(-469020701649/204800000000:ℚ),(139878915641/40960000000:ℚ)⟩) (.add (.scale ((-163320237/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(87/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-313/1024:ℚ),(31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((154608531/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-87/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1393/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((6040491/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(313/1024:ℚ),(-31/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block46Cuts : List (ℚ × AutoTrace) := [((199/256:ℚ),.auto),((399/512:ℚ),.auto),((25/32:ℚ),.auto),((801/1024:ℚ),.auto),((1603/2048:ℚ),.auto),((696/889:ℚ),.auto),((3207/4096:ℚ),.auto),((5569/7111:ℚ),.auto),((401/512:ℚ),.auto),((5571/7109:ℚ),.auto),((1605/2048:ℚ),.auto),((1393/1777:ℚ),.auto),((3211/4096:ℚ),.auto),((803/1024:ℚ),.auto),((201/256:ℚ),.auto),((403/512:ℚ),.auto),((101/128:ℚ),.auto),((405/512:ℚ),.auto),((811/1024:ℚ),.auto),((248/313:ℚ),.auto),((1623/2048:ℚ),.auto),((203/256:ℚ),.auto),((1985/2503:ℚ),.auto),((1987/2501:ℚ),.auto)]
def block46 : NormalizedBlock := ⟨(1987/2501:ℚ),block46Cuts⟩

theorem block46_normalization :
    (gatheredExpr.intervalNormalize ((397/512:ℚ)) ((1987/2501:ℚ))).atomNormalize=block46Expr := by
  decide +kernel

theorem block46_checked : checkUpperBlock block46Expr 18446744073709551616 ((397/512:ℚ)) block46Cuts=
    some ((1987/2501:ℚ),(1481765819686036655/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block46_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block46_checked
