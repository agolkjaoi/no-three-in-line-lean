import NoThreeLine.FiniteSumMoment
import NoThreeLine.MomentEnvelopeRoot
import NoThreeLine.CalendarIntegralFubini

/-! Integrate a common moment bound over finitely many phase windows on
one law. Only the total duration is paid; no phase independence is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.FiniteMomentIntegral

theorem interval_constant_moment {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (f : Ω×ℝ→ℝ) (hf : Measurable f)
    (F : ℝ) (hF0 : 0≤F) (hF : ∀x,0≤f x ∧ f x≤F)
    (H D : ℝ) (hH : 0≤H) (hD : 0≤D) (m : ℕ) (hm : 2≤m)
    (hM : ∀t∈Icc (0:ℝ) H,(∫ω,f (ω,t)^m ∂μ)≤D) :
    (∫ω,(∫t in (0:ℝ)..H,f (ω,t))^m ∂μ)≤(H*positiveMomentRoot m D)^m := by
  let ν := volume.restrict (Ioc (0:ℝ) H)
  have hh : ∀ᵐt ∂ν,(∫ω,f (ω,t)^m ∂μ)≤positiveMomentRoot m D^m := by
    filter_upwards [ae_restrict_mem measurableSet_Ioc] with t ht
    rw [positiveMomentRoot_pow m (by omega),max_eq_right hD]
    exact hM t ⟨ht.1.le,ht.2⟩
  have hi := bounded_moment_integral μ ν f hf F hF0 hF (fun _=>positiveMomentRoot m D)
    (fun _=>positiveMomentRoot_nonneg _ _) (integrable_const _) m hm hh
  have hc : (∫t,positiveMomentRoot m D ∂ν)=H*positiveMomentRoot m D := by
    simp [ν,integral_const,Measure.real,Real.volume_Ioc,ENNReal.toReal_ofReal hH,smul_eq_mul]
  rw [hc] at hi
  simpa only [intervalIntegral.integral_of_le hH] using hi

theorem finite_phase_constant_moment {Ω ι : Type*} [MeasurableSpace Ω] [Fintype ι]
    [MeasurableSpace ι] [MeasurableSingletonClass ι]
    (μ : Measure Ω) [IsFiniteMeasure μ] (f : ι→Ω×ℝ→ℝ) (hf : ∀i,Measurable (f i))
    (F : ℝ) (hF0 : 0≤F) (hF : ∀i x,0≤f i x ∧ f i x≤F)
    (H : ι→ℝ) (hH : ∀i,0≤H i) (D : ℝ) (hD : 0≤D) (m : ℕ) (hm : 2≤m)
    (hM : ∀i t,t∈Icc (0:ℝ) (H i)→(∫ω,f i (ω,t)^m ∂μ)≤D) :
    (∫ω,(∑i,∫t in (0:ℝ)..H i,f i (ω,t))^m ∂μ)≤(∑i,H i)^m*D := by
  let Y := fun i ω=>∫t in (0:ℝ)..H i,f i (ω,t)
  have hY (i) : Measurable (Y i) :=
    variable_running_integral_measurable (fun _=>H i) measurable_const (fun _=>hH i) (f i) (hf i)
  have hYb (i ω) : 0≤Y i ω ∧ Y i ω≤H i*F :=
    integral_initial_segment_bounds (H i) (H i) (hH i) le_rfl _
      ((hf i).comp (measurable_const.prodMk measurable_id)) F hF0 (fun t _=>hF i (ω,t))
  have hb (i) : 0≤H i*positiveMomentRoot m D := mul_nonneg (hH i) (positiveMomentRoot_nonneg _ _)
  have hs := finite_sum_moment μ Y hY (fun i=>H i*F) (fun i=>mul_nonneg (hH i) hF0)
    hYb (fun i=>H i*positiveMomentRoot m D) hb m hm
    (fun i=>interval_constant_moment μ (f i) (hf i) F hF0 (hF i) (H i) D (hH i) hD m hm (hM i))
  rw [←Finset.sum_mul,mul_pow,positiveMomentRoot_pow m (by omega),max_eq_right hD] at hs
  exact hs

end NoThreeLine.FiniteMomentIntegral

#print axioms NoThreeLine.FiniteMomentIntegral.interval_constant_moment
#print axioms NoThreeLine.FiniteMomentIntegral.finite_phase_constant_moment
