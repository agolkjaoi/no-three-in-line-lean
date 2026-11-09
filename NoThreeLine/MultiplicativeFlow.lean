import NoThreeLine.ExponentialFirstStep

/-! A real multiplicative ODE cannot change the sign of its initial value.
The integrating factor is constructed from the actual continuous coefficient,
so nonnegativity along the path is a conclusion rather than an ODE hypothesis. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

theorem multiplicative_flow_identity (T : ℝ) (hT : 0 ≤ T) (v g : ℝ → ℝ)
    (hv : ContinuousOn v (Icc 0 T)) (hg : ContinuousOn g (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt v (v t*g t) t) (t : ℝ) (ht : t ∈ Icc 0 T) :
    v t * Real.exp (-(∫ u in (0 : ℝ)..t, g u)) = v 0 := by
  have hgi : IntervalIntegrable g volume 0 T := by
    apply ContinuousOn.intervalIntegrable
    simpa only [uIcc_of_le hT] using hg
  have hprim : ContinuousOn (fun t => ∫ u in (0 : ℝ)..t, g u) (Icc 0 T) := by
    simpa only [uIcc_of_le hT] using
      intervalIntegral.continuousOn_primitive_interval' hgi (left_mem_uIcc : (0 : ℝ) ∈ uIcc 0 T)
  have hf : ContinuousOn (fun t => v t * Real.exp (-(∫ u in (0 : ℝ)..t, g u))) (Icc 0 T) :=
    hv.mul (Real.continuous_exp.comp_continuousOn hprim.neg)
  have hder : ∀ u ∈ Ioo 0 T,
      HasDerivAt (fun t => v t * Real.exp (-(∫ u in (0 : ℝ)..t, g u))) 0 u := by
    intro u hu
    have hgiu : IntervalIntegrable g volume 0 u := by
      apply ContinuousOn.intervalIntegrable
      rw [uIcc_of_le hu.1.le]
      exact hg.mono (Icc_subset_Icc le_rfl hu.2.le)
    have hgc : ContinuousAt g u := hg.continuousAt (Icc_mem_nhds hu.1 hu.2)
    have hgm : StronglyMeasurableAtFilter g (nhds u) volume :=
      ContinuousOn.stronglyMeasurableAtFilter isOpen_Ioo (hg.mono Ioo_subset_Icc_self) u hu
    have hp := intervalIntegral.integral_hasDerivAt_right hgiu hgm hgc
    exact ((hd u hu).mul hp.neg.exp).congr_deriv (by ring)
  have he := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le ht.1
    (hf.mono (Icc_subset_Icc le_rfl ht.2))
    (fun u hu => hder u ⟨hu.1,hu.2.trans_le ht.2⟩)
    (intervalIntegrable_const : IntervalIntegrable (fun _ : ℝ => (0 : ℝ)) volume 0 t)
  have heq : v t * Real.exp (-(∫ u in (0 : ℝ)..t, g u)) - v 0 = 0 := by
    simpa using he.symm
  exact sub_eq_zero.mp heq

theorem multiplicative_flow_nonneg (T : ℝ) (hT : 0 ≤ T) (v g : ℝ → ℝ)
    (hv : ContinuousOn v (Icc 0 T)) (hg : ContinuousOn g (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt v (v t*g t) t) (h0 : 0 ≤ v 0)
    (t : ℝ) (ht : t ∈ Icc 0 T) : 0 ≤ v t := by
  have he := multiplicative_flow_identity T hT v g hv hg hd t ht
  have hp := Real.exp_pos (-(∫ u in (0 : ℝ)..t, g u))
  nlinarith

theorem multiplicative_flow_pos (T : ℝ) (hT : 0 ≤ T) (v g : ℝ → ℝ)
    (hv : ContinuousOn v (Icc 0 T)) (hg : ContinuousOn g (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt v (v t*g t) t) (h0 : 0 < v 0)
    (t : ℝ) (ht : t ∈ Icc 0 T) : 0 < v t := by
  have he := multiplicative_flow_identity T hT v g hv hg hd t ht
  have hp := Real.exp_pos (-(∫ u in (0 : ℝ)..t, g u))
  nlinarith

end NoThreeLine

#print axioms NoThreeLine.multiplicative_flow_identity
#print axioms NoThreeLine.multiplicative_flow_nonneg
#print axioms NoThreeLine.multiplicative_flow_pos
