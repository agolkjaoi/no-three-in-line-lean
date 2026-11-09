import NoThreeLine.Phase15301Group4750Family20Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized
open AutoEnvelope

def block05Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(3311684581/204800000000:ℚ),(6676592163/12800000000:ℚ)⟩) (.add (.scale ((-157081239/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(497/2048:ℚ),(-9/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-23053/31250:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(881/2048:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((46550233/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1009/2048:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.add (.atom ⟨(1515437901/102400000000:ℚ),(106544665829/204800000000:ℚ)⟩) (.add (.scale ((-157081239/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(249/1024:ℚ),(-143/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-23053/31250:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(441/1024:ℚ),(-271/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((46550233/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(505/1024:ℚ),(-271/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.scale ((157081239/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-497/2048:ℚ),(9/128:ℚ)⟩) (.add (.min (.atom ⟨(249/1024:ℚ),(-143/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((23053/31250:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(-881/2048:ℚ),(17/128:ℚ)⟩) (.add (.min (.atom ⟨(441/1024:ℚ),(-271/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.min (.add (.atom ⟨(3311684581/204800000000:ℚ),(6676592163/12800000000:ℚ)⟩) (.add (.scale ((-157081239/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(497/2048:ℚ),(-9/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-23053/31250:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(881/2048:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((46550233/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(1009/2048:ℚ),(-17/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((52305077/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-7/1024:ℚ),(-143/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(15/2048:ℚ),(9/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((261691393/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(15/2048:ℚ),(9/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(7/1024:ℚ),(143/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block05Cuts : List (ℚ × AutoTrace) := [((123/512:ℚ),.auto),((31/128:ℚ),.auto),((63/256:ℚ),.auto),((1/4:ℚ),.auto),((65/256:ℚ),.auto),((33/128:ℚ),.auto),((17/64:ℚ),.auto),((69/256:ℚ),.auto),((35/128:ℚ),.auto),((9/32:ℚ),.auto),((73/256:ℚ),.auto),((147/512:ℚ),.auto),((37/128:ℚ),.auto),((75/256:ℚ),.auto),((19/64:ℚ),.auto),((39/128:ℚ),.auto),((79/256:ℚ),.auto),((5/16:ℚ),.auto),((41/128:ℚ),.auto),((21/64:ℚ),.auto),((43/128:ℚ),.auto),((11/32:ℚ),.auto),((45/128:ℚ),.auto),((23/64:ℚ),.auto)]
def block05 : NormalizedBlock := ⟨(23/64:ℚ),block05Cuts⟩

theorem block05_normalization :
    (gatheredExpr.intervalNormalize ((245/1024:ℚ)) ((23/64:ℚ))).atomNormalize=block05Expr := by
  decide +kernel

theorem block05_checked : checkUpperBlock block05Expr 18446744073709551616 ((245/1024:ℚ)) block05Cuts=
    some ((23/64:ℚ),(7248544893228079739/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized.block05_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family20.IntervalNormalized.block05_checked
