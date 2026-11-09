import NoThreeLine.Phase15301Group2225Family03Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized
open AutoEnvelope

def block11Expr : Expr := .add (.min (.add (.atom ⟨(194624179/204800000000:ℚ),(194624179/204800000000:ℚ)⟩) (.add (.max (.atom ⟨(-847428257/12800000000:ℚ),(11328866111/6400000000:ℚ)⟩) (.add (.atom ⟨(26644321251/25600000000:ℚ),(33771317079/51200000000:ℚ)⟩) (.add (.scale ((123498023/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(143/256:ℚ),(-285/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((51407863/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(159/256:ℚ),(-317/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((78830753/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(175/256:ℚ),(-349/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((41007123/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(191/256:ℚ),(-381/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((2042171/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(207/256:ℚ),(-413/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-194624179/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(223/256:ℚ),(-445/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))))) (.add (.scale ((224108453/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-221/512:ℚ),(111/256:ℚ)⟩) (.add (.min (.atom ⟨(111/256:ℚ),(-221/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((194624179/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-445/512:ℚ),(223/256:ℚ)⟩) (.add (.min (.atom ⟨(223/256:ℚ),(-445/512:ℚ)⟩) (.atom ⟨(1/2048:ℚ),(1/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.min (.add (.atom ⟨(14282490203/25600000000:ℚ),(5944605659/5120000000:ℚ)⟩) (.add (.scale ((18122957/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(143/256:ℚ),(-285/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((21485633/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(67/512:ℚ),(143/256:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(11/16:ℚ),0⟩) (.atom ⟨(33/256:ℚ),(285/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((6040491/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(159/256:ℚ),(-317/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((47369791/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(175/256:ℚ),(-349/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((19542367/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(191/256:ℚ),(-381/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((4355853/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(207/256:ℚ),(-413/512:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block11Cuts : List (ℚ × AutoTrace) := [((511/512:ℚ),.auto),(1,.auto)]
def block11 : NormalizedBlock := ⟨1,block11Cuts⟩

theorem block11_normalization :
    (gatheredExpr.intervalNormalize ((255/256:ℚ)) (1)).atomNormalize=block11Expr := by
  decide +kernel

theorem block11_checked : checkUpperBlock block11Expr 18446744073709551616 ((255/256:ℚ)) block11Cuts=
    some (1,(52814604489130641/4611686018427387904:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized.block11_normalization
#print axioms NoThreeLine.Phase15301Group2225.Family03.IntervalNormalized.block11_checked
