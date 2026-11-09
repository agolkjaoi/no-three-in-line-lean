import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block47Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(-110496487669/102400000000:ℚ),(1252300163/512000000:ℚ)⟩) (.add (.scale ((-55843797/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(95/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((280485087/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(-44112036977/40960000000:ℚ),(501352855653/204800000000:ℚ)⟩) (.add (.scale ((-55843797/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((280485087/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1265/2048:ℚ),(1009/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-625/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((55843797/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(953/1024:ℚ),(-95/128:ℚ)⟩) (.add (.min (.atom ⟨(-1905/2048:ℚ),(1521/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((165128117/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-625/2048:ℚ),(497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(-220353338353/204800000000:ℚ),(100311940437/40960000000:ℚ)⟩) (.add (.scale ((-55843797/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(95/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((280485087/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-633/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((1061071/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1521/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-95/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((57965939/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-95/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((140966153/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1009/2048:ℚ)⟩) (.add (.min (.atom ⟨(3/8:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-63/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((6040491/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-31/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(11/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-497/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block47Cuts : List (ℚ × AutoTrace) := [((407/512:ℚ),.auto),((3257/4096:ℚ),.auto),((497/625:ℚ),.auto),((1629/2048:ℚ),.auto),((815/1024:ℚ),.auto),((168/211:ℚ),.auto),((51/64:ℚ),.auto),((1633/2048:ℚ),.auto),((760/953:ℚ),.auto),((3267/4096:ℚ),.auto),((1009/1265:ℚ),.auto),((2027/2541:ℚ),.auto),((817/1024:ℚ),.auto),((6083/7621:ℚ),.auto),((1635/2048:ℚ),.auto),((507/635:ℚ),.auto),((409/512:ℚ),.auto),((205/256:ℚ),.auto),((411/512:ℚ),.auto),((103/128:ℚ),.auto),((413/512:ℚ),.auto),((714059/885190:ℚ),.auto),((207/256:ℚ),.auto),((415/512:ℚ),.auto)]
def block47 : NormalizedBlock := ⟨(415/512:ℚ),block47Cuts⟩

theorem block47_normalization :
    (gatheredExpr.intervalNormalize ((1987/2501:ℚ)) ((415/512:ℚ))).atomNormalize=block47Expr := by
  decide +kernel

theorem block47_checked : checkUpperBlock block47Expr 18446744073709551616 ((1987/2501:ℚ)) block47Cuts=
    some ((415/512:ℚ),(1154770891529330029/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block47_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block47_checked
