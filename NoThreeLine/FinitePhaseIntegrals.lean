import NoThreeLine.FiniteS6
import Mathlib.MeasureTheory.Integral.IntervalIntegral.IntegrationByParts
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! Actual real integrals of finite, left-closed/right-open phase rates.
The right endpoint convention is used to obtain right derivatives at every time.
No stochastic process, compensator, or complete certified schedule is assumed here. -/
set_option autoImplicit false
open MeasureTheory Set Filter
open scoped BigOperators Topology Interval
noncomputable section
namespace NoThreeLine.FinitePhase

def pulse (a b c t : ℝ) : ℝ := (Ico a b).indicator (fun _ => c) t

theorem pulse_integrable (a b c : ℝ) : Integrable (pulse a b c) := by
  have h : IntegrableOn (fun _ : ℝ => c) (Ico a b) volume :=
    integrableOn_const (by rw [Real.volume_Ico]; simp)
  exact h.integrable_indicator measurableSet_Ico

theorem pulse_right_continuous (a b c t : ℝ) :
    ContinuousWithinAt (pulse a b c) (Ioi t) t := by
  by_cases hta : t < a
  · apply continuousWithinAt_const.congr_of_eventuallyEq (f := fun _ : ℝ => (0 : ℝ))
    · filter_upwards [nhdsWithin_le_nhds (Iio_mem_nhds hta)] with s hs
      simp [pulse,Set.indicator_of_notMem,show s ∉ Ico a b from fun h => not_lt_of_ge h.1 hs]
    · simp [pulse,show t ∉ Ico a b from fun h => not_lt_of_ge h.1 hta]
  · have hat : a ≤ t := le_of_not_gt hta
    by_cases htb : t < b
    · apply continuousWithinAt_const.congr_of_eventuallyEq (f := fun _ : ℝ => c)
      · filter_upwards [self_mem_nhdsWithin, nhdsWithin_le_nhds (Iio_mem_nhds htb)] with s hs hsb
        simp [pulse,show s ∈ Ico a b from ⟨hat.trans hs.le,hsb⟩]
      · simp [pulse,hat,htb]
    · have hbt : b ≤ t := le_of_not_gt htb
      apply continuousWithinAt_const.congr_of_eventuallyEq (f := fun _ : ℝ => (0 : ℝ))
      · filter_upwards [self_mem_nhdsWithin] with s hs
        simp [pulse,show s ∉ Ico a b from fun h => not_lt_of_ge (hbt.trans hs.le) h.2]
      · simp [pulse,show t ∉ Ico a b from fun h => not_lt_of_ge hbt h.2]

def rate {J : Type*} (P : Finset J) (lo hi c : J → ℝ) (t : ℝ) : ℝ :=
  ∑ j ∈ P, pulse (lo j) (hi j) (c j) t

def cumulative {J : Type*} (P : Finset J) (lo hi c : J → ℝ) (t : ℝ) : ℝ :=
  ∫ s in (0 : ℝ)..t, rate P lo hi c s

theorem rate_integrable {J : Type*} (P : Finset J) (lo hi c : J → ℝ) :
    Integrable (rate P lo hi c) := by
  exact integrable_finsetSum P (fun j _ => pulse_integrable (lo j) (hi j) (c j))

theorem rate_right_continuous {J : Type*} (P : Finset J) (lo hi c : J → ℝ) (t : ℝ) :
    ContinuousWithinAt (rate P lo hi c) (Ioi t) t := by
  exact tendsto_finsetSum P (fun j _ => pulse_right_continuous (lo j) (hi j) (c j) t)

theorem cumulative_continuous {J : Type*} (P : Finset J) (lo hi c : J → ℝ) :
    Continuous (cumulative P lo hi c) :=
  (rate_integrable P lo hi c).continuous_primitive 0

@[simp] theorem cumulative_zero {J : Type*} (P : Finset J) (lo hi c : J → ℝ) :
    cumulative P lo hi c 0 = 0 := by simp [cumulative]

theorem cumulative_hasDeriv_right {J : Type*} (P : Finset J) (lo hi c : J → ℝ) (t : ℝ) :
    HasDerivWithinAt (cumulative P lo hi c) (rate P lo hi c t) (Ioi t) t := by
  exact (intervalIntegral.integral_hasDerivWithinAt_right (s := Ici t)
    (rate_integrable P lo hi c).intervalIntegrable
    (rate_integrable P lo hi c).aestronglyMeasurable.stronglyMeasurableAtFilter
    (rate_right_continuous P lo hi c t)).mono Ioi_subset_Ici_self

theorem rate_mul_cumulative_intervalIntegrable {J : Type*} (P : Finset J)
    (lo hi c d : J → ℝ) (a b : ℝ) :
    IntervalIntegrable (fun t => rate P lo hi c t * cumulative P lo hi d t) volume a b :=
  (rate_integrable P lo hi c).intervalIntegrable.mul_continuousOn
    (cumulative_continuous P lo hi d).continuousOn

/-- The product identity is proved from the actual integrals, including phase boundaries. -/
theorem cumulative_product_identity {J : Type*} (P : Finset J)
    (lo hi c d : J → ℝ) (T : ℝ) :
    (∫ t in (0 : ℝ)..T, rate P lo hi c t * cumulative P lo hi d t +
      cumulative P lo hi c t * rate P lo hi d t) =
        cumulative P lo hi c T * cumulative P lo hi d T := by
  simpa using intervalIntegral.integral_deriv_mul_eq_sub_of_hasDeriv_right (a := 0) (b := T)
    (cumulative_continuous P lo hi c).continuousOn
    (cumulative_continuous P lo hi d).continuousOn
    (fun t _ => cumulative_hasDeriv_right P lo hi c t)
    (fun t _ => cumulative_hasDeriv_right P lo hi d t)
    (rate_integrable P lo hi c).intervalIntegrable
    (rate_integrable P lo hi d).intervalIntegrable

def elapsed (a b T : ℝ) : ℝ := max 0 (min T b - max 0 a)

theorem pulse_integral (a b c T : ℝ) (hT : 0 ≤ T) :
    (∫ t in (0 : ℝ)..T, pulse a b c t) = elapsed a b T * c := by
  rw [intervalIntegral.integral_of_le hT,← integral_Ico_eq_integral_Ioc]
  unfold pulse
  rw [integral_indicator measurableSet_Ico,Measure.restrict_restrict measurableSet_Ico,
    Ico_inter_Ico,setIntegral_const,Real.volume_real_Ico,smul_eq_mul]
  simp only [elapsed,min_comm T b,max_comm]

theorem cumulative_eq_sum {J : Type*} (P : Finset J) (lo hi c : J → ℝ)
    (T : ℝ) (hT : 0 ≤ T) :
    cumulative P lo hi c T = ∑ j ∈ P, elapsed (lo j) (hi j) T * c j := by
  unfold cumulative rate
  rw [intervalIntegral.integral_finsetSum]
  · exact Finset.sum_congr rfl (fun j _ => pulse_integral (lo j) (hi j) (c j) T hT)
  · intro j hj
    exact (pulse_integrable (lo j) (hi j) (c j)).intervalIntegrable

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.cumulative_product_identity
