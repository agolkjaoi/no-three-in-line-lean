import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block31Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(416464670861/102400000000:ℚ),(-12921695347/12800000000:ℚ)⟩) (.add (.scale ((110603911/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((55883711/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(129651638811/40960000000:ℚ),(-108646695559/204800000000:ℚ)⟩) (.add (.scale ((-7542637/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-2033/2048:ℚ),(1009/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((110603911/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(1009/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-603171/2500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((7542637/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1017/1024:ℚ),(-63/128:ℚ)⟩) (.add (.min (.atom ⟨(-2033/2048:ℚ),(1009/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((603171/2500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(416542378169/102400000000:ℚ),(-25823963867/25600000000:ℚ)⟩) (.add (.scale ((110603911/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(63/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((55883711/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-825/1024:ℚ),(55/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((7542637/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-63/128:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2033/2048:ℚ),(-1009/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((40682899/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((64809739/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(3/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-55/128:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-881/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block31Cuts : List (ℚ × AutoTrace) := [((881/1777:ℚ),.auto),((2031/4096:ℚ),.auto),((127/256:ℚ),.auto),((1345/2711:ℚ),.auto),((1009/2033:ℚ),.auto),((2033/4096:ℚ),.auto),((1017/2048:ℚ),.auto),((509/1024:ℚ),.auto),((255/512:ℚ),.auto),((1/2:ℚ),.auto),((65/128:ℚ),.auto),((33/64:ℚ),.auto),((67/128:ℚ),.auto),((135/256:ℚ),.auto),((541/1024:ℚ),.auto),((1083/2048:ℚ),.auto),((504/953:ℚ),.auto),((271/512:ℚ),.auto),((1009/1905:ℚ),.auto),((17/32:ℚ),.auto),((273/512:ℚ),.auto),((4369/8192:ℚ),.auto),((8/15:ℚ),.auto),((2185/4096:ℚ),.auto)]
def block31 : NormalizedBlock := ⟨(2185/4096:ℚ),block31Cuts⟩

theorem block31_normalization :
    (gatheredExpr.intervalNormalize ((4033/8135:ℚ)) ((2185/4096:ℚ))).atomNormalize=block31Expr := by
  decide +kernel

theorem block31_checked : checkUpperBlock block31Expr 18446744073709551616 ((4033/8135:ℚ)) block31Cuts=
    some ((2185/4096:ℚ),(3265178583861930029/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block31_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block31_checked
