import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block28Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(262386380721/102400000000:ℚ),(-512169771/2560000000:ℚ)⟩) (.add (.scale ((-163320237/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-121/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.atom ⟨(524687927273/204800000000:ℚ),(-41058415849/204800000000:ℚ)⟩) (.add (.scale ((-550773/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-163320237/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-241/2048:ℚ),(113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.scale ((550773/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(953/1024:ℚ),(-55/128:ℚ)⟩) (.add (.min (.atom ⟨(-1905/2048:ℚ),(881/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((163320237/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(121/1024:ℚ),(-7/128:ℚ)⟩) (.add (.min (.atom ⟨(-241/2048:ℚ),(113/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(524791388819/204800000000:ℚ),(-40954954303/204800000000:ℚ)⟩) (.add (.scale ((-163320237/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-121/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((7255343/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((40682899/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-55/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((4355853/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(7/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block28Cuts : List (ℚ × AutoTrace) := [((503/1089:ℚ),.auto),((473/1024:ℚ),.auto),((3523/7621:ℚ),.auto),((947/2048:ℚ),.auto),((881/1905:ℚ),.auto),((56/121:ℚ),.auto),((237/512:ℚ),.auto),((475/1024:ℚ),.auto),((449/967:ℚ),.auto),((951/2048:ℚ),.auto),((119/256:ℚ),.auto),((239/512:ℚ),.auto),((957/2048:ℚ),.auto),((451/965:ℚ),.auto),((479/1024:ℚ),.auto),((15/32:ℚ),.auto),((113/241:ℚ),.auto),((961/2048:ℚ),.auto),((481/1024:ℚ),.auto),((241/512:ℚ),.auto),((121/256:ℚ),.auto),((61/128:ℚ),.auto),((123/256:ℚ),.auto),((493/1024:ℚ),.auto)]
def block28 : NormalizedBlock := ⟨(493/1024:ℚ),block28Cuts⟩

theorem block28_normalization :
    (gatheredExpr.intervalNormalize ((440/953:ℚ)) ((493/1024:ℚ))).atomNormalize=block28Expr := by
  decide +kernel

theorem block28_checked : checkUpperBlock block28Expr 18446744073709551616 ((440/953:ℚ)) block28Cuts=
    some ((493/1024:ℚ),(208155973629841089/2305843009213693952:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block28_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block28_checked
