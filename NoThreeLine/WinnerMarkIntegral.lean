import NoThreeLine.WinnerMarkLaw
import Mathlib.MeasureTheory.Integral.Bochner.SumMeasure
import Mathlib.MeasureTheory.Integral.Prod

/-! Integrating actual first-event observables using the proved joint law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators ENNReal

namespace NoThreeLine
namespace BoardWinnerLaw

theorem uniformGrid_integrable {n : ℕ} (hn : 0 < n) (f : Grid n → ℝ) :
    Integrable f (uniformGrid hn) := by
  classical
  apply Integrable.of_bound (measurable_of_countable f).aestronglyMeasurable
    (∑ q : Grid n, ‖f q‖)
  exact Filter.Eventually.of_forall (fun q => Finset.single_le_sum
    (fun x _ => norm_nonneg (f x)) (Finset.mem_univ q))

theorem uniformGrid_integral {n : ℕ} (hn : 0 < n) (f : Grid n → ℝ) :
    (∫ q, f q ∂uniformGrid hn) = (∑ q, f q) / (n : ℝ)^2 := by
  rw [integral_fintype (uniformGrid_integrable hn f)]
  have hm (q : Grid n) : (uniformGrid hn).real {q} = 1 / (n : ℝ)^2 := by
    rw [measureReal_def, uniformGrid_apply hn {q} (measurableSet_singleton q)]
    simp [Grid, pow_two]
  simp_rw [hm, smul_eq_mul]
  rw [← Finset.mul_sum]
  ring

end BoardWinnerLaw
namespace WinnerMarkLaw
open BoardWinnerLaw

theorem candidate_firstMarkedRace_integral {n : ℕ} (hn : 0 < n) (B : ℝ) (hB : 0 < B)
    (F : (ℝ × Grid n) × ℝ → ℝ)
    (hF : Integrable F (((expMeasure (n*B)).prod (uniformGrid hn)).prod markMeasure)) :
    (∫ ω, F (firstMarkedRace hn ω) ∂boardClockMeasure n (B/n)) =
      ∫ t, (∑ q : Grid n, ∫ z, F ((t,q),z) ∂markMeasure) / (n : ℝ)^2
        ∂expMeasure (n*B) := by
  letI := isProbabilityMeasure_expMeasure (mul_pos (show (0 : ℝ) < n by exact_mod_cast hn) hB)
  have hmap := candidate_firstMarkedRace_map hn B hB
  have hm : AEStronglyMeasurable F
      ((boardClockMeasure n (B/n)).map (firstMarkedRace hn)) := by
    rw [hmap]
    exact hF.aestronglyMeasurable
  rw [← integral_map (firstMarkedRace_measurable hn).aemeasurable hm, hmap,
    integral_prod F hF, integral_prod _ hF.integral_prod_left]
  apply integral_congr_ae
  exact Filter.Eventually.of_forall (fun t => uniformGrid_integral hn _)

end WinnerMarkLaw
end NoThreeLine

#print axioms NoThreeLine.BoardWinnerLaw.uniformGrid_integral
#print axioms NoThreeLine.WinnerMarkLaw.candidate_firstMarkedRace_integral
