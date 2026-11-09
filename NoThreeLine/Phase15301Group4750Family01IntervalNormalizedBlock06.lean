import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block06Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(173460198817/102400000000:ℚ),(1777702489/12800000000:ℚ)⟩) (.add (.scale ((-3624503/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((55883711/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(248570730619/204800000000:ℚ),(41190390277/204800000000:ℚ)⟩) (.add (.scale ((-3624503/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.scale ((3624503/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(953/1024:ℚ),(-15/128:ℚ)⟩) (.add (.min (.atom ⟨(-1905/2048:ℚ),(241/2048:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(173460198817/102400000000:ℚ),(1777702489/12800000000:ℚ)⟩) (.add (.scale ((-3624503/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(15/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((55883711/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(7/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((104962003/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(241/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((23892003/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-15/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-241/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((54869587/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(113/2048:ℚ)⟩) (.add (.min (.atom ⟨(9/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-7/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block06Cuts : List (ℚ × AutoTrace) := [((245/2048:ℚ),.auto),((123/1024:ℚ),.auto),((247/2048:ℚ),.auto),((31/256:ℚ),.auto),((249/2048:ℚ),.auto),((125/1024:ℚ),.auto),((473633/3874898:ℚ),.auto),((251/2048:ℚ),.auto),((63/512:ℚ),.auto),((253/2048:ℚ),.auto),((127/1024:ℚ),.auto),((255/2048:ℚ),.auto),((1/8:ℚ),.auto),((257/2048:ℚ),.auto),((515/4096:ℚ),.auto),((120/953:ℚ),.auto),((129/1024:ℚ),.auto),((961/7623:ℚ),.auto),((963/7621:ℚ),.auto),((259/2048:ℚ),.auto),((241/1905:ℚ),.auto),((65/512:ℚ),.auto),((8/63:ℚ),.auto),((261/2048:ℚ),.auto)]
def block06 : NormalizedBlock := ⟨(261/2048:ℚ),block06Cuts⟩

theorem block06_normalization :
    (gatheredExpr.intervalNormalize ((61/512:ℚ)) ((261/2048:ℚ))).atomNormalize=block06Expr := by
  decide +kernel

theorem block06_checked : checkUpperBlock block06Expr 18446744073709551616 ((61/512:ℚ)) block06Cuts=
    some ((261/2048:ℚ),(1236910410784174635/18446744073709551616:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block06_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block06_checked
