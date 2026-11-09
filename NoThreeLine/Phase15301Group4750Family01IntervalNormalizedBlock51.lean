import NoThreeLine.Phase15301Group4750Family01Data
import NoThreeLine.BenchmarkNormalizedChunks

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
open AutoEnvelope

def block51Expr : Expr := .add (.min (.add (.max (.add (.atom ⟨(459384640801/102400000000:ℚ),(-29920650567/12800000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-961/1024:ℚ),(103/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-5362977/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(103/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(51/64:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-945/1024:ℚ),(51/64:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.atom ⟨(464377625961/102400000000:ℚ),(-48780445901/20480000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1921/2048:ℚ),(1649/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1905/2048:ℚ),(1633/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1889/2048:ℚ),(1633/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((17905157/20000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))) (.add (.scale ((5362977/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(953/1024:ℚ),(-103/128:ℚ)⟩) (.atom ⟨(1/8192:ℚ),(1/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.min (.add (.atom ⟨(919079481191/204800000000:ℚ),(-478420209483/204800000000:ℚ)⟩) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-961/1024:ℚ),(103/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-5362977/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(103/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((53828537/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-953/1024:ℚ),(51/64:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-945/1024:ℚ),(51/64:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1649/2048:ℚ)⟩) (.add (.min (.atom ⟨(7/128:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-103/128:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((5362977/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(953/1024:ℚ),(-103/128:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((192502037/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(-2033/2048:ℚ),(1633/2048:ℚ)⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-51/64:ℚ)⟩)) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((84844963/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(9/128:ℚ),0⟩) (.atom ⟨(1017/1024:ℚ),(-51/64:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(2033/2048:ℚ),(-1633/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((57965939/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-1777/2048:ℚ),(1521/2048:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))))))) (.atom ⟨(350464747/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def block51Cuts : List (ℚ × AutoTrace) := [((1521/1777:ℚ),.auto),((1753/2048:ℚ),.auto),((816/953:ℚ),.auto),((877/1024:ℚ),.auto),((1755/2048:ℚ),.auto),((3511/4096:ℚ),.auto),((1633/1905:ℚ),.auto),((439/512:ℚ),.auto),((824/961:ℚ),.auto),((52880806689/61657905326:ℚ),.auto),((3513/4096:ℚ),.auto),((1757/2048:ℚ),.auto),((879/1024:ℚ),.auto),((97/113:ℚ),.auto),((55/64:ℚ),.auto),((221/256:ℚ),.auto),((272/315:ℚ),.auto),((3537/4096:ℚ),.auto),((1769/2048:ℚ),.auto),((885/1024:ℚ),.auto),((1633/1889:ℚ),.auto),((824/953:ℚ),.auto),((6593/7623:ℚ),.auto),((443/512:ℚ),.auto)]
def block51 : NormalizedBlock := ⟨(443/512:ℚ),block51Cuts⟩

theorem block51_normalization :
    (gatheredExpr.intervalNormalize ((219/256:ℚ)) ((443/512:ℚ))).atomNormalize=block51Expr := by
  decide +kernel

theorem block51_checked : checkUpperBlock block51Expr 18446744073709551616 ((219/256:ℚ)) block51Cuts=
    some ((443/512:ℚ),(35379121599345247/1152921504606846976:ℚ)) := by decide +kernel

end NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block51_normalization
#print axioms NoThreeLine.Phase15301Group4750.Family01.IntervalNormalized.block51_checked
