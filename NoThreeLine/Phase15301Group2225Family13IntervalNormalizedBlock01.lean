import NoThreeLine.Phase15301Group2225Family13Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group2225.Family13.IntervalNormalized
open AutoEnvelope

def block01Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(22060838831/10240000000:ℚ),(732692331/5120000000:ℚ)⟩) (.add (.scale ((45366831/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(221/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((517569/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(253/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((19453953/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(285/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(317/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(55029981689/25600000000:ℚ),(7082692533/51200000000:ℚ)⟩) (.add (.scale ((45366831/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(111/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((517569/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(127/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((19453953/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(143/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(159/256:ℚ),(-29/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-73231761/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(223/256:ℚ),(-61/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.add (.scale ((24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-317/512:ℚ),(15/256:ℚ)⟩) (.add (.min (.atom ⟨(159/256:ℚ),(-29/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((73231761/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-445/512:ℚ),(31/256:ℚ)⟩) (.add (.min (.atom ⟨(223/256:ℚ),(-61/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(22060838831/10240000000:ℚ),(732692331/5120000000:ℚ)⟩) (.add (.scale ((45366831/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(221/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((517569/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(253/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((19453953/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(285/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-24334147/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(317/512:ℚ),(-15/256:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.atom ⟨(147203477/20000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block01Cuts : List (ℚ × AutoTrace) := [((47/512:ℚ),.auto),((3/32:ℚ),.auto),((97/1024:ℚ),.auto),((49/512:ℚ),.auto),((25/256:ℚ),.auto),((51/512:ℚ),.auto),((13/128:ℚ),.auto),((53/512:ℚ),.auto),((27/256:ℚ),.auto),((55/512:ℚ),.auto),((7/64:ℚ),.auto),((57/512:ℚ),.auto),((29/256:ℚ),.auto),((59/512:ℚ),.auto),((15/128:ℚ),.auto),((61/512:ℚ),.auto),((31/256:ℚ),.auto),((1/8:ℚ),.auto),((33/256:ℚ),.auto),((17/128:ℚ),.auto),((69/512:ℚ),.auto),((139/1024:ℚ),.auto),((35/256:ℚ),.auto),((71/512:ℚ),.auto)]
def block01 : NormalizedBlock := ⟨(71/512:ℚ),block01Cuts⟩

theorem block01_normalization :
    (gatheredExpr.intervalNormalize ((23/256:ℚ)) ((71/512:ℚ))).atomNormalize=block01Expr := by
  decide +kernel

theorem block01_checked : checkUpperBlock block01Expr 18446744073709551616 ((23/256:ℚ)) block01Cuts=
    some ((71/512:ℚ),(5260435333119445859/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group2225.Family13.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group2225.Family13.IntervalNormalized.block01_normalization
#print axioms NoThreeLine.Phase15301Group2225.Family13.IntervalNormalized.block01_checked
