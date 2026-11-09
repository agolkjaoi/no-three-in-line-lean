import NoThreeLine.ConcreteSieveData
import NoThreeLine.ParitySieveEstimate
import Mathlib.Data.Finset.Pairwise

set_option autoImplicit false
set_option maxRecDepth 10000
set_option maxHeartbeats 8000000

open scoped BigOperators
open Set MeasureTheory
namespace NoThreeLine.ConcreteSieve

def P : Finset ℕ := factors.toFinset
def Q : ℕ := ∏ p ∈ P, p
def numeratorProduct : ℕ := ∏ p ∈ P, (p^2 - 1)
def denominatorProduct : ℕ := ∏ p ∈ P, p^2
def densityRat : ℚ := 3 * numeratorProduct / (4 * denominatorProduct)
def absoluteNumeratorProduct : ℕ := ∏ p ∈ P, (p^2 + 1)
def logMajorant : ℕ := ∑ p ∈ P, (p - 1)

theorem factors_length : factors.length = 175 := by decide
theorem factors_nodup : factors.Nodup := by decide
theorem factors_gt_one : ∀ p ∈ factors, 1 < p := by decide
theorem factors_odd : ∀ p ∈ factors, Odd p := by decide
theorem factors_pairwise : factors.Pairwise Nat.Coprime := by decide
theorem factor_count : P.card = 175 := by decide
theorem Q_eq_saved : Q = savedQ := by decide
theorem denominator_pos : 0 < denominatorProduct := by decide

/-- All products and this integer comparison reduce inside the kernel. -/
theorem density_integer_certificate :
    375 * numeratorProduct < 304 * denominatorProduct := by decide

theorem P_gt_one : ∀ p ∈ P, 1 < p := by
  intro p hp
  exact factors_gt_one p (List.mem_toFinset.mp hp)

theorem P_odd : ∀ p ∈ P, Odd p := by
  intro p hp
  exact factors_odd p (List.mem_toFinset.mp hp)

theorem P_pairwise : (P : Set ℕ).Pairwise Nat.Coprime := by
  exact (List.pairwise_iff_coe_toFinset_pairwise factors_nodup).mpr factors_pairwise

theorem density_eq_ratio : finiteSieveDensity P =
    3 * (numeratorProduct : ℝ) / (4 * (denominatorProduct : ℝ)) := by
  have hfactor (p : ℕ) (hp : p ∈ P) :
      (1 - 1/(p:ℝ)^2) = ((p^2-1 : ℕ) : ℝ) / ((p^2 : ℕ) : ℝ) := by
    have hp1 := P_gt_one p hp
    have hp2 : 1 ≤ p^2 := by nlinarith
    have hp0 : (p:ℝ) ≠ 0 := by exact_mod_cast (show p ≠ 0 by omega)
    rw [Nat.cast_sub hp2, Nat.cast_pow, Nat.cast_one]
    field_simp
  unfold finiteSieveDensity
  rw [Finset.prod_congr rfl hfactor, Finset.prod_div_distrib]
  simp only [← Nat.cast_prod, numeratorProduct, denominatorProduct]
  ring

theorem densityRat_cast : (densityRat : ℝ) = finiteSieveDensity P := by
  rw [density_eq_ratio]
  unfold densityRat
  push_cast
  rfl

theorem density_lt_target : finiteSieveDensity P < 76/125 := by
  rw [density_eq_ratio]
  have hden : (0:ℝ) < denominatorProduct := by exact_mod_cast denominator_pos
  have hcert : (375:ℝ)*numeratorProduct < 304*denominatorProduct := by
    exact_mod_cast density_integer_certificate
  apply (div_lt_div_iff₀ (by positivity : (0:ℝ) < 4*denominatorProduct)
    (by norm_num : (0:ℝ) < 125)).mpr
  nlinarith

/-- The frozen rational majorant, cleared of its positive denominator. -/
theorem error_integer_certificate :
    (20 + logMajorant) * absoluteNumeratorProduct < 102344 * denominatorProduct := by
  decide

theorem absolute_factor_eq_ratio : finiteSieveAbsoluteFactor P =
    (absoluteNumeratorProduct : ℝ) / (denominatorProduct : ℝ) := by
  have hfactor (p : ℕ) (hp : p ∈ P) :
      (1 + 1/(p:ℝ)^2) = ((p^2+1 : ℕ) : ℝ) / ((p^2 : ℕ) : ℝ) := by
    have hp1 := P_gt_one p hp
    have hp0 : (p:ℝ) ≠ 0 := by exact_mod_cast (show p ≠ 0 by omega)
    push_cast
    field_simp
  unfold finiteSieveAbsoluteFactor
  rw [Finset.prod_congr rfl hfactor, Finset.prod_div_distrib]
  simp only [← Nat.cast_prod, absoluteNumeratorProduct, denominatorProduct]

theorem log_Q_le_majorant : Real.log Q ≤ logMajorant := by
  have hp0 (p : ℕ) (hp : p ∈ P) : (0:ℝ) < p := by
    exact_mod_cast (lt_trans Nat.zero_lt_one (P_gt_one p hp))
  change Real.log (↑(∏ p ∈ P, p) : ℝ) ≤ ↑(∑ p ∈ P, (p - 1))
  rw [Nat.cast_prod, Real.log_prod (fun p hp => ne_of_gt (hp0 p hp)), Nat.cast_sum]
  apply Finset.sum_le_sum
  intro p hp
  rw [Nat.cast_sub (Nat.le_of_lt (P_gt_one p hp)), Nat.cast_one]
  exact Real.log_le_sub_one_of_pos (hp0 p hp)

theorem error_constant_lt_target : finiteSieveErrorConstant P < 25586 := by
  have hden : (0:ℝ) < denominatorProduct := by exact_mod_cast denominator_pos
  have hcert : (20+(logMajorant:ℝ))*absoluteNumeratorProduct <
      102344*denominatorProduct := by exact_mod_cast error_integer_certificate
  have hnum : (0:ℝ) ≤ absoluteNumeratorProduct := by positivity
  have hlog := log_Q_le_majorant
  change (5 + Real.log Q / 4) * finiteSieveAbsoluteFactor P < 25586
  rw [absolute_factor_eq_ratio]
  calc
    _ ≤ (5 + (logMajorant:ℝ)/4) *
        ((absoluteNumeratorProduct:ℝ) / denominatorProduct) := by
      apply mul_le_mul_of_nonneg_right _ (by positivity)
      linarith
    _ < 25586 := by
      rw [← mul_div_assoc]
      apply (div_lt_iff₀ hden).mpr
      nlinarith

/-- Concrete FS1. The large fixed threshold Q is retained explicitly. -/
theorem concrete_finite_sieve_BV_upper_bound (N ε η : ℕ) (f : ℝ → ℝ) (M : ℝ)
    (hN : Q ≤ N) (hε : ε ≤ 1) (hη : η ≤ 1)
    (hf : BoundedVariationOn f (Icc 0 1))
    (hM : ∀ u ∈ Icc (0 : ℝ) 1, 0 ≤ f u ∧ f u ≤ M) :
    primitiveParityK N ε η f ≤
      (76/375:ℝ) * (∫ u in (0:ℝ)..1, f u) * Real.log N +
        25586 * (M + (eVariationOn f (Icc 0 1)).toReal) := by
  have hbase := finite_sieve_BV_upper_bound P N ε η f M
    P_gt_one P_pairwise P_odd hN hε hη hf hM
  have hI := (bv_unit_integral_bounds f M hf hM).1
  have hQ : 1 ≤ Q := by decide
  have hlog : 0 ≤ Real.log N := Real.log_nonneg (by exact_mod_cast le_trans hQ hN)
  have hMV : 0 ≤ M + (eVariationOn f (Icc 0 1)).toReal := by
    have hm := hM 0 (by constructor <;> norm_num)
    exact add_nonneg (le_trans hm.1 hm.2) ENNReal.toReal_nonneg
  have hmain : (finiteSieveDensity P/3) * (∫ u in (0:ℝ)..1, f u) * Real.log N ≤
      (76/375:ℝ) * (∫ u in (0:ℝ)..1, f u) * Real.log N := by
    apply mul_le_mul_of_nonneg_right _ hlog
    apply mul_le_mul_of_nonneg_right _ hI
    have hd := density_lt_target
    linarith
  have herr := mul_le_mul_of_nonneg_right (le_of_lt error_constant_lt_target) hMV
  exact hbase.trans (add_le_add hmain herr)

end NoThreeLine.ConcreteSieve

#print axioms NoThreeLine.ConcreteSieve.factors_pairwise
#print axioms NoThreeLine.ConcreteSieve.density_integer_certificate
#print axioms NoThreeLine.ConcreteSieve.density_lt_target
#print axioms NoThreeLine.ConcreteSieve.error_integer_certificate
#print axioms NoThreeLine.ConcreteSieve.error_constant_lt_target
#print axioms NoThreeLine.ConcreteSieve.concrete_finite_sieve_BV_upper_bound
