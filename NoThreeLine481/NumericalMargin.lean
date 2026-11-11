import Mathlib.Data.Real.Basic
import Mathlib.Tactic

/-! The rational margin in Section 10 of the 481-phase manuscript.
The board mass and the retained-exposure estimate enter explicitly. -/
set_option autoImplicit false

namespace NoThreeLine481

def inputMass : ℚ := 3842853135627 / 2560000000000

def boardMassFloor : ℚ := inputMass * (1 - 1/32768)^2

theorem inputMass_pos : 0 < inputMass := by
  norm_num [inputMass]

theorem retained_margin :
    (1 - 1/100000) * boardMassFloor - 1501/1000 =
      (2165079963272809251797/274877906944000000000000000 : ℚ) := by
  norm_num [boardMassFloor, inputMass]

theorem retained_mass_gt :
    (1501/1000 : ℚ) < (1 - 1/100000) * boardMassFloor := by
  apply sub_pos.mp
  rw [retained_margin]
  norm_num

theorem boardMassFloor_le_of_lattice_bound (n : ℕ) (hn : 2^24 ≤ n) (mass : ℝ)
    (hMass : (inputMass : ℝ) * (1 - 512/(n:ℝ))^2 ≤ mass) :
    (boardMassFloor : ℝ) ≤ mass := by
  have hn' : (16777216 : ℝ) ≤ n := by
    exact_mod_cast (show 16777216 ≤ n by simpa using hn)
  have hnPos : (0 : ℝ) < n := by linarith
  have hfrac : 512/(n:ℝ) ≤ 1/32768 := by
    apply (div_le_iff₀ hnPos).mpr
    linarith
  have hbase : 1 - (1/32768 : ℝ) ≤ 1 - 512/(n:ℝ) := by linarith
  have hMassPos : 0 ≤ (inputMass : ℝ) := by exact_mod_cast inputMass_pos.le
  calc
    (boardMassFloor : ℝ) = (inputMass : ℝ) * (1 - 1/32768)^2 := by
      simp [boardMassFloor]
    _ ≤ (inputMass : ℝ) * (1 - 512/(n:ℝ))^2 :=
      mul_le_mul_of_nonneg_left (pow_le_pow_left₀ (by norm_num) hbase 2) hMassPos
    _ ≤ mass := hMass

theorem cardinality_of_retained_exposure (n k : ℕ) (mass : ℝ)
    (hMass : (boardMassFloor : ℝ) ≤ mass)
    (hRetained : (1 - 1/100000) * ((n:ℝ) * mass) ≤ k) :
    1501*n ≤ 1000*k := by
  have hMargin : (1501/1000 : ℝ) < (1 - 1/100000) * (boardMassFloor : ℝ) := by
    have h : ((1501/1000 : ℚ) : ℝ) < (((1 - 1/100000) * boardMassFloor : ℚ) : ℝ) :=
      Rat.cast_lt.mpr retained_mass_gt
    simpa using h
  have hLower : (1501/1000 : ℝ) ≤ (1 - 1/100000) * mass :=
    hMargin.le.trans (mul_le_mul_of_nonneg_left hMass (by norm_num))
  have hcard : (1501/1000 : ℝ) * (n:ℝ) ≤ (k:ℝ) := calc
    _ ≤ ((1 - 1/100000) * mass) * (n:ℝ) :=
      mul_le_mul_of_nonneg_right hLower (Nat.cast_nonneg n)
    _ = (1 - 1/100000) * ((n:ℝ) * mass) := by ring
    _ ≤ (k:ℝ) := hRetained
  exact_mod_cast (show (1501:ℝ) * n ≤ 1000 * (k:ℝ) by linarith)

#print axioms retained_margin
#print axioms boardMassFloor_le_of_lattice_bound
#print axioms cardinality_of_retained_exposure

end NoThreeLine481
