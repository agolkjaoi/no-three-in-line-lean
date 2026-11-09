import NoThreeLine.BoundedIntegralTail
import Mathlib.MeasureTheory.Integral.Bochner.SumMeasure

/-! Finite-sum moment and tail bounds on one measure. No independence of
the summands is assumed: this is Minkowski for the finite counting measure. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.FiniteMomentIntegral

theorem finite_sum_moment {Ω ι : Type*} [MeasurableSpace Ω] [Fintype ι]
    [MeasurableSpace ι] [MeasurableSingletonClass ι]
    (μ : Measure Ω) [IsFiniteMeasure μ] (f : ι→Ω→ℝ) (hf : ∀i,Measurable (f i))
    (F : ι→ℝ) (hF0 : ∀i,0≤F i) (hF : ∀i ω,0≤f i ω ∧ f i ω≤F i)
    (b : ι→ℝ) (hb : ∀i,0≤b i) (m : ℕ) (hm : 2≤m)
    (hM : ∀i,(∫ω,f i ω^m ∂μ)≤b i^m) :
    (∫ω,(∑i,f i ω)^m ∂μ)≤(∑i,b i)^m := by
  classical
  have htot (i) : F i≤∑j,F j := Finset.single_le_sum (fun j _=>hF0 j) (Finset.mem_univ i)
  have h := bounded_moment_integral μ (Measure.count : Measure ι) (fun x : Ω×ι=>f x.2 x.1)
    (measurable_from_prod_countable_left hf) (∑i,F i) (Finset.sum_nonneg (fun i _=>hF0 i))
    (fun x=>⟨(hF x.2 x.1).1,(hF x.2 x.1).2.trans (htot x.2)⟩)
    b hb (Integrable.of_finite) m hm (Filter.Eventually.of_forall hM)
  simpa only [integral_count] using h

theorem finite_sum_tail_le_moment {Ω ι : Type*} [MeasurableSpace Ω] [Fintype ι]
    [MeasurableSpace ι] [MeasurableSingletonClass ι]
    (μ : Measure Ω) [IsFiniteMeasure μ] (f : ι→Ω→ℝ) (hf : ∀i,Measurable (f i))
    (F : ι→ℝ) (hF0 : ∀i,0≤F i) (hF : ∀i ω,0≤f i ω ∧ f i ω≤F i)
    (m : ℕ) (r : ℝ) (hr : 0<r) :
    μ.real {ω | r≤∑i,f i ω}≤(∫ω,(∑i,f i ω)^m ∂μ)/r^m := by
  classical
  have htot (i) : F i≤∑j,F j := Finset.single_le_sum (fun j _=>hF0 j) (Finset.mem_univ i)
  have h := bounded_integral_tail_le_moment μ (Measure.count : Measure ι) (fun x : Ω×ι=>f x.2 x.1)
    (measurable_from_prod_countable_left hf) (∑i,F i)
    (fun x=>⟨(hF x.2 x.1).1,(hF x.2 x.1).2.trans (htot x.2)⟩) m r hr
  simpa only [integral_count] using h

end NoThreeLine.FiniteMomentIntegral

#print axioms NoThreeLine.FiniteMomentIntegral.finite_sum_moment
#print axioms NoThreeLine.FiniteMomentIntegral.finite_sum_tail_le_moment
