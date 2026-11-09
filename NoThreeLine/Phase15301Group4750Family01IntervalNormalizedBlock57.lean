import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block57Expr : Expr := .atom ⟨(-354674241083/204800000000:ℚ),(699710127083/204800000000:ℚ)⟩
def block57Cuts : List (ℚ × AutoTrace) := [((119/128:ℚ),.auto),((477/512:ℚ),.auto),((239/256:ℚ),.auto),((757463/810312:ℚ),.auto),((479/512:ℚ),.auto),((15/16:ℚ),.auto),((481/512:ℚ),.auto),((241/256:ℚ),.auto),((381491/405156:ℚ),.auto),((483/512:ℚ),.auto),((121/128:ℚ),.auto),((485/512:ℚ),.auto),((256167/270104:ℚ),.auto),((243/256:ℚ),.auto),((487/512:ℚ),.auto),((61/64:ℚ),.auto),((489/512:ℚ),.auto),((193505/202578:ℚ),.auto),((245/256:ℚ),.auto),((491/512:ℚ),.auto),((123/128:ℚ),.auto),((779539/810312:ℚ),.auto),((493/512:ℚ),.auto),((247/256:ℚ),.auto)]
def block57 : NormalizedBlock := ⟨(247/256:ℚ),block57Cuts⟩

theorem block57_normalization :
    (gatheredExpr.intervalNormalize ((951/1024:ℚ)) ((247/256:ℚ))).atomNormalize=block57Expr := by
  decide +kernel

theorem block57_checked : checkUpperBlock block57Expr 18446744073709551616 ((951/1024:ℚ)) block57Cuts=
    some ((247/256:ℚ),(2349949857023006799/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block57_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block57_checked
