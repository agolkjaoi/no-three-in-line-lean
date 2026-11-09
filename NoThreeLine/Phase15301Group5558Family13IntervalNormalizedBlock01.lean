import NoThreeLine.Phase15301Group5558Family13Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized
open AutoEnvelope

def block01Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(1285735431/640000000:ℚ),(7586959103/51200000000:ℚ)⟩) (.add (.scale ((10755413/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(47/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((45366831/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(55/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((517569/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(63/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((19453953/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(71/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((58224997/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-73231761/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.add (.atom ⟨(205650527729/102400000000:ℚ),(604271079/4096000000:ℚ)⟩) (.add (.scale ((10755413/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1505/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((45366831/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1761/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((517569/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2017/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((19453953/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(2273/4096:ℚ),(-225/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-4208961/2000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3041/4096:ℚ),(-481/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((58224997/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3297/4096:ℚ),(-481/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-73231761/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3553/4096:ℚ),(-481/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))))) (.add (.scale ((4208961/2000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(3041/4096:ℚ),(-481/4096:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((73231761/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-111/128:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(3553/4096:ℚ),(-481/4096:ℚ)⟩) (.atom ⟨(1/16384:ℚ),(1/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(1285735431/640000000:ℚ),(7586959103/51200000000:ℚ)⟩) (.add (.scale ((10755413/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(47/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((45366831/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(55/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((517569/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(63/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((19453953/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(71/128:ℚ),(-113/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((58224997/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(103/128:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-73231761/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/128:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(147203477/20000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block01Cuts : List (ℚ × AutoTrace) := [((49/512:ℚ),.auto),((25/256:ℚ),.auto),((51/512:ℚ),.auto),((13/128:ℚ),.auto),((53/512:ℚ),.auto),((27/256:ℚ),.auto),((7/64:ℚ),.auto),((57/512:ℚ),.auto),((29/256:ℚ),.auto),((15/128:ℚ),.auto),((31/256:ℚ),.auto),((1/8:ℚ),.auto),((65/512:ℚ),.auto),((33/256:ℚ),.auto),((17/128:ℚ),.auto),((35/256:ℚ),.auto),((9/64:ℚ),.auto),((37/256:ℚ),.auto),((75/512:ℚ),.auto),((19/128:ℚ),.auto),((77/512:ℚ),.auto),((39/256:ℚ),.auto),((5/32:ℚ),.auto),((81/512:ℚ),.auto)]
def block01 : NormalizedBlock := ⟨(81/512:ℚ),block01Cuts⟩

theorem block01_normalization :
    (gatheredExpr.intervalNormalize ((3/32:ℚ)) ((81/512:ℚ))).atomNormalize=block01Expr := by
  decide +kernel

theorem block01_checked : checkUpperBlock block01Expr 18446744073709551616 ((3/32:ℚ)) block01Cuts=
    some ((81/512:ℚ),(12480524216616509153/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized.block01_normalization
#print axioms NoThreeLine.Phase15301Group5558.Family13.IntervalNormalized.block01_checked
