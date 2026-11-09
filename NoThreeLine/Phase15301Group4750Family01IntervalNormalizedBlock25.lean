import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block25Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(84773556451/51200000000:ℚ),(51466503/256000000:ℚ)⟩) (.add (.scale ((7261771/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((123498023/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.add (.atom ⟨(230222679007/204800000000:ℚ),(86674184353/204800000000:ℚ)⟩) (.add (.scale ((14881467/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((7261771/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1521/2048:ℚ),(625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))) (.atom ⟨0,0⟩)) (.add (.min (.add (.atom ⟨(169580726321/102400000000:ℚ),(20620214619/102400000000:ℚ)⟩) (.add (.scale ((7261771/6250000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-761/1024:ℚ),(39/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((123498023/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-441/1024:ℚ),(23/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((29434119/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(753/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((8329633/4000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(625/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-39/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((92052489/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(1017/1024:ℚ),(-39/128:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-625/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((12341877/25000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(369/2048:ℚ)⟩) (.add (.min (.atom ⟨(9/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-23/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block25Cuts : List (ℚ × AutoTrace) := [((251/635:ℚ),.auto),((405/1024:ℚ),.auto),((203/512:ℚ),.auto),((407/1024:ℚ),.auto),((51/128:ℚ),.auto),((409/1024:ℚ),.auto),((205/512:ℚ),.auto),((103/256:ℚ),.auto),((389131/966470:ℚ),.auto),((207/512:ℚ),.auto),((13/32:ℚ),.auto),((209/512:ℚ),.auto),((312/761:ℚ),.auto),((105/256:ℚ),.auto),((841/2048:ℚ),.auto),((1683/4096:ℚ),.auto),((625/1521:ℚ),.auto),((421/1024:ℚ),.auto),((211/512:ℚ),.auto),((53/128:ℚ),.auto),((213/512:ℚ),.auto),((427/1024:ℚ),.auto),((184/441:ℚ),.auto),((855/2048:ℚ),.auto)]
def block25 : NormalizedBlock := ⟨(855/2048:ℚ),block25Cuts⟩

theorem block25_normalization :
    (gatheredExpr.intervalNormalize ((1619/4096:ℚ)) ((855/2048:ℚ))).atomNormalize=block25Expr := by
  decide +kernel

theorem block25_checked : checkUpperBlock block25Expr 18446744073709551616 ((1619/4096:ℚ)) block25Cuts=
    some ((855/2048:ℚ),(971952010567427797/9223372036854775808:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block25_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block25_checked
