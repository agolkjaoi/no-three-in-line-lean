import NoThreeLine.DivisorSubpower
import Mathlib.Data.Nat.Log

/-! Ceiling-logarithm dyadic cover and a direct subpower bound for its
number of shells. No real-logarithm comparison is needed. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine.DyadicSubpower
open DivisorSubpower

theorem two_pow_clog_le (d : ℕ) (hd : 0 < d) : 2^(Nat.clog 2 d) ≤ 2*d := by
  by_cases he : d=1
  · simp [he]
  · have hd1 : 1 < d := by omega
    have hk : 0 < Nat.clog 2 d := Nat.clog_pos (by decide) hd1
    have hb := Nat.pow_pred_clog_lt_self (by decide : 1<2) hd1
    have heq : Nat.clog 2 d=(Nat.clog 2 d).pred+1 := (Nat.succ_pred_eq_of_pos hk).symm
    rw [heq,pow_succ]
    omega

theorem dyadic_cover (n d : ℕ) (hd : 0 < d) (hdn : d ≤ n) :
    ∃ k ∈ Finset.range (Nat.clog 2 n+1), d ≤ 2^k ∧ 2^k ≤ 2*d := by
  refine ⟨Nat.clog 2 d,Finset.mem_range.mpr ?_,Nat.le_pow_clog (by decide) d,two_pow_clog_le d hd⟩
  have h := Nat.clog_mono_right 2 hdn
  omega

def shellCountCoefficient (ε : ℝ) : ℝ := primeCoefficient ε 2*(2 : ℝ)^ε

theorem shellCountCoefficient_pos (ε : ℝ) : 0 < shellCountCoefficient ε := by
  exact mul_pos (lt_of_lt_of_le zero_lt_one (primeCoefficient_one_le ε 2))
    (Real.rpow_pos_of_pos (by norm_num) ε)

theorem dyadic_count_le (ε : ℝ) (hε : 0 < ε) (n : ℕ) (hn : 0 < n) :
    ((Nat.clog 2 n+1 : ℕ) : ℝ) ≤ shellCountCoefficient ε*(n : ℝ)^ε := by
  have hk := prime_power_factor_le ε hε 2 (Nat.clog 2 n) Nat.prime_two
  have hp : ((2 : ℝ)^ε)^(Nat.clog 2 n) ≤ (2*(n : ℝ))^ε := by
    rw [Real.rpow_pow_comm (by norm_num) ε]
    apply Real.rpow_le_rpow (by positivity) _ hε.le
    exact_mod_cast two_pow_clog_le n hn
  calc
    _ ≤ primeCoefficient ε 2*((2 : ℝ)^ε)^(Nat.clog 2 n) := by
      simpa only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] using hk
    _ ≤ primeCoefficient ε 2*(2*(n : ℝ))^ε :=
      mul_le_mul_of_nonneg_left hp (zero_le_one.trans (primeCoefficient_one_le ε 2))
    _ = shellCountCoefficient ε*(n : ℝ)^ε := by
      rw [Real.mul_rpow (by norm_num) (Nat.cast_nonneg n)]
      dsimp [shellCountCoefficient]
      ring

end NoThreeLine.DyadicSubpower

#print axioms NoThreeLine.DyadicSubpower.dyadic_cover
#print axioms NoThreeLine.DyadicSubpower.dyadic_count_le
