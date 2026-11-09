import NoThreeLine.ChordIntegral
import Mathlib.Data.Int.Interval
import Mathlib.Algebra.Order.Floor.Ring

/-! Moving integer lattices in open intervals. Endpoint errors are independent
of the shift, and all sampled points are actual integer indices. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section

namespace NoThreeLine

def openIntInterval (a b : ℝ) : Finset ℤ := Finset.Ioo ⌊a⌋ ⌈b⌉

theorem mem_openIntInterval (a b : ℝ) (k : ℤ) :
    k ∈ openIntInterval a b ↔ a < (k:ℝ) ∧ (k:ℝ) < b := by
  simp [openIntInterval, Int.floor_lt, Int.lt_ceil]

theorem openIntInterval_card_error (a b : ℝ) :
    |((openIntInterval a b).card:ℝ) - max 0 (b-a)| ≤ 2 := by
  by_cases hab : a < b
  · have hc := Int.card_Ioo_of_lt ⌊a⌋ ⌈b⌉ (Int.floor_lt_ceil_of_lt hab)
    have hcr : ((openIntInterval a b).card:ℝ) = (⌈b⌉:ℝ) - (⌊a⌋:ℝ) - 1 := by
      exact_mod_cast hc
    rw [hcr, max_eq_right (by linarith : 0 ≤ b-a), abs_le]
    have hfa := Int.floor_le a
    have hfb := Int.lt_floor_add_one a
    have hca := Int.le_ceil b
    have hcb := Int.ceil_lt_add_one b
    constructor <;> linarith
  · have he : openIntInterval a b = ∅ := by
      apply Finset.eq_empty_iff_forall_notMem.mpr
      intro k hk
      have h := (mem_openIntInterval a b k).mp hk
      linarith
    rw [he]
    simp [max_eq_left (by linarith : b-a ≤ 0)]

def latticeIndices (shift step a b : ℝ) : Finset ℤ :=
  openIntInterval ((a-shift)/step) ((b-shift)/step)

theorem mem_latticeIndices (shift step a b : ℝ) (hs : 0 < step) (k : ℤ) :
    k ∈ latticeIndices shift step a b ↔
      a < shift + step*(k:ℝ) ∧ shift + step*(k:ℝ) < b := by
  rw [latticeIndices, mem_openIntInterval, div_lt_iff₀ hs, lt_div_iff₀ hs]
  constructor <;> intro h <;> constructor <;> nlinarith [h.1, h.2]

theorem latticeIndices_card_error (shift step a b : ℝ) (hs : 0 < step) :
    |((latticeIndices shift step a b).card:ℝ) - max 0 (b-a)/step| ≤ 2 := by
  have h := openIntInterval_card_error ((a-shift)/step) ((b-shift)/step)
  have he : max 0 ((b-shift)/step - (a-shift)/step) = max 0 (b-a)/step := by
    rw [← sub_div]
    have hx : b-shift-(a-shift) = b-a := by ring
    rw [hx]
    by_cases hab : 0 ≤ b-a
    · rw [max_eq_right hab, max_eq_right (div_nonneg hab hs.le)]
    · rw [max_eq_left (le_of_not_ge hab), max_eq_left (div_nonpos_of_nonpos_of_nonneg
        (le_of_not_ge hab) hs.le), zero_div]
  simpa only [latticeIndices, he] using h

def parityLatticeIndices (shift step a b : ℝ) (ε : ℤ) : Finset ℤ :=
  (latticeIndices (shift+step*ε) (2*step) a b).image (fun j => 2*j+ε)

theorem parityLatticeIndices_card (shift step a b : ℝ) (ε : ℤ) :
    (parityLatticeIndices shift step a b ε).card =
      (latticeIndices (shift+step*ε) (2*step) a b).card := by
  apply Finset.card_image_of_injective
  intro i j hij
  change 2*i+ε=2*j+ε at hij
  omega

theorem mem_parityLatticeIndices (shift step a b : ℝ) (hs : 0 < step)
    (ε : ℤ) (hε : 0 ≤ ε ∧ ε < 2) (k : ℤ) :
    k ∈ parityLatticeIndices shift step a b ε ↔
      a < shift+step*(k:ℝ) ∧ shift+step*(k:ℝ) < b ∧ k%2=ε := by
  rw [parityLatticeIndices, Finset.mem_image]
  constructor
  · rintro ⟨j,hj,rfl⟩
    have hj' := (mem_latticeIndices (shift+step*ε) (2*step) a b (by positivity) j).mp hj
    push_cast
    constructor
    · nlinarith [hj'.1]
    constructor
    · nlinarith [hj'.2]
    · omega
  · intro hk
    have he : 2*(k/2)+ε=k := by omega
    refine ⟨k/2, ?_, he⟩
    apply (mem_latticeIndices (shift+step*ε) (2*step) a b (by positivity) (k/2)).mpr
    have her : 2*(↑(k/2):ℝ)+ε=(k:ℝ) := by exact_mod_cast he
    constructor <;> nlinarith [hk.1, hk.2.1]

theorem parityLatticeIndices_card_error (shift step a b : ℝ) (hs : 0 < step)
    (ε : ℤ) :
    |((parityLatticeIndices shift step a b ε).card:ℝ) - max 0 (b-a)/(2*step)| ≤ 2 := by
  rw [parityLatticeIndices_card]
  exact latticeIndices_card_error (shift+step*ε) (2*step) a b (by positivity)

end NoThreeLine

#print axioms NoThreeLine.mem_parityLatticeIndices
#print axioms NoThreeLine.parityLatticeIndices_card_error
