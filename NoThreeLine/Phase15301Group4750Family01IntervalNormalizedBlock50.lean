import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block50Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(6045338673/6400000000:ℚ),(8989880387/12800000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-961/1024:ℚ),(51/64:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((17905157/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(95/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((40293503/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(34512657823/204800000000:ℚ),(280155945409/204800000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1921/2048:ℚ),(1633/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((189114629/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(1393/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((40293503/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-881/2048:ℚ),(753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(961/1024:ℚ),(-51/64:ℚ)⟩) (.add (.min (.atom ⟨(-1921/2048:ℚ),(1633/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(96976769581/102400000000:ℚ),(72170393909/102400000000:ℚ)⟩) (.add (.scale ((-192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-961/1024:ℚ),(51/64:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((17905157/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-889/1024:ℚ),(95/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((40293503/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(47/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-51/64:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(7/128:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1633/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((57965939/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1521/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-95/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((154608531/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1649/2048:ℚ),(1393/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((15972857/10000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(753/2048:ℚ)⟩) (.add (.min (.atom ⟨(9/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-47/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block50Cuts : List (ℚ × AutoTrace) := [((1393/1649:ℚ),.auto),((1731/2048:ℚ),.auto),((433/512:ℚ),.auto),((217/256:ℚ),.auto),((869/1024:ℚ),.auto),((816/961:ℚ),.auto),((1739/2048:ℚ),.auto),((6529/7687:ℚ),.auto),((3479/4096:ℚ),.auto),((435/512:ℚ),.auto),((6531/7685:ℚ),.auto),((3481/4096:ℚ),.auto),((1633/1921:ℚ),.auto),((1741/2048:ℚ),.auto),((871/1024:ℚ),.auto),((109/128:ℚ),.auto),((376/441:ℚ),.auto),((437/512:ℚ),.auto),((875/1024:ℚ),.auto),((753/881:ℚ),.auto),((3501/4096:ℚ),.auto),((760/889:ℚ),.auto),((1751/2048:ℚ),.auto),((219/256:ℚ),.auto)]
def block50 : NormalizedBlock := ⟨(219/256:ℚ),block50Cuts⟩

theorem block50_normalization :
    (gatheredExpr.intervalNormalize ((865/1024:ℚ)) ((219/256:ℚ))).atomNormalize=block50Expr := by
  decide +kernel

theorem block50_checked : checkUpperBlock block50Expr 18446744073709551616 ((865/1024:ℚ)) block50Cuts=
    some ((219/256:ℚ),(627598151768847649/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block50_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block50_checked
