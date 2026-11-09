import NoThreeLine.FiniteClockRestart

/-! Exact time measure of a fixed winner section: one exponential head
weighted by survival of m independent competitors. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped ENNReal BigOperators

namespace NoThreeLine.WinnerSectionDensity

def survivorWeight (m : ℕ) (rate t : ℝ) : ℝ≥0∞ :=
  ENNReal.ofReal (Real.exp (-((m : ℝ)*rate*t)))

theorem survivorWeight_measurable (m : ℕ) (rate : ℝ) : Measurable (survivorWeight m rate) := by
  unfold survivorWeight
  fun_prop

theorem exponentialPDF_measurable (rate : ℝ) : Measurable (exponentialPDF rate) := by
  unfold exponentialPDF
  fun_prop

theorem winner_density_identity (m : ℕ) (rate t : ℝ) (hr : 0 < rate) :
    exponentialPDF rate t * survivorWeight m rate t =
      (m+1 : ℝ≥0∞)⁻¹ * exponentialPDF (((m : ℝ)+1)*rate) t := by
  have ha : 0 < (m : ℝ)+1 := by positivity
  have hc : (m+1 : ℝ≥0∞)⁻¹ = ENNReal.ofReal (((m : ℝ)+1)⁻¹) := by
    rw [ENNReal.ofReal_inv_of_pos ha, ENNReal.ofReal_add (Nat.cast_nonneg m) zero_le_one,
      ENNReal.ofReal_natCast, ENNReal.ofReal_one]
  by_cases ht : 0 ≤ t
  · rw [exponentialPDF_of_nonneg ht, exponentialPDF_of_nonneg ht, survivorWeight, hc,
      ← ENNReal.ofReal_mul (mul_nonneg hr.le (Real.exp_pos _).le),
      ← ENNReal.ofReal_mul (inv_nonneg.mpr ha.le)]
    congr 1
    have he : Real.exp (-(rate*t)) * Real.exp (-((m : ℝ)*rate*t)) =
        Real.exp (-(((m : ℝ)+1)*rate*t)) := by
      rw [← Real.exp_add]
      congr 1
      ring
    rw [mul_assoc, he]
    field_simp
  · rw [exponentialPDF_of_neg (lt_of_not_ge ht),
      exponentialPDF_of_neg (lt_of_not_ge ht), zero_mul, mul_zero]

theorem expMeasure_eq_withDensity (rate : ℝ) :
    expMeasure rate = volume.withDensity (exponentialPDF rate) := rfl

theorem fixed_winner_time_measure (m : ℕ) (rate : ℝ) (hr : 0 < rate) :
    (expMeasure rate).withDensity (survivorWeight m rate) =
      (m+1 : ℝ≥0∞)⁻¹ • expMeasure (((m : ℝ)+1)*rate) := by
  rw [expMeasure_eq_withDensity, expMeasure_eq_withDensity,
    ← withDensity_mul volume (exponentialPDF_measurable rate) (survivorWeight_measurable m rate)]
  have he : exponentialPDF rate * survivorWeight m rate =
      (m+1 : ℝ≥0∞)⁻¹ • exponentialPDF (((m : ℝ)+1)*rate) := by
    funext t
    exact winner_density_identity m rate t hr
  rw [he, withDensity_smul _ (exponentialPDF_measurable _)]

end NoThreeLine.WinnerSectionDensity

#print axioms NoThreeLine.WinnerSectionDensity.fixed_winner_time_measure
