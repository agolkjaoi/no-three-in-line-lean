import NoThreeLine.ExponentialDerivativeInequality
import NoThreeLine.ProtectedObservableMarkMean

/-! A nonnegative killed candidate value yields a survival-weighted
interior bound directly from the real generator inequality. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE

theorem exponential_live_survival_le (rate T : ℝ) (hr : 0≤rate) (hT : 0≤T)
    (z J : ℝ→ℝ) (hz : ContinuousOn z (Icc 0 T))
    (hJ : ∀t∈Ioo 0 T,0≤J t)
    (hd : ∀t∈Ioo 0 T,∃v,HasDerivAt z v t ∧ v+rate*(J t-z t)≤0) :
    Real.exp (-(rate*T))*z T≤z 0 := by
  let G := fun t=>Real.exp (-(rate*t))*z t
  have hGc : ContinuousOn G (Icc 0 T) :=
    (by fun_prop : Continuous (fun t : ℝ=>Real.exp (-(rate*t)))).continuousOn.mul hz
  have hGd : ∀t∈Ioo 0 T,∃v,HasDerivAt G v t ∧ v≤0 := by
    intro t ht
    obtain ⟨v,hv,hvg⟩ := hd t ht
    have he : HasDerivAt (fun t : ℝ=>Real.exp (-(rate*t)))
        (Real.exp (-(rate*t))*(-rate)) t := by
      simpa using (((hasDerivAt_id t).const_mul rate).neg.exp)
    refine ⟨Real.exp (-(rate*t))*(v-rate*z t),?_,?_⟩
    · exact (he.mul hv).congr_deriv (by ring)
    · apply mul_nonpos_of_nonneg_of_nonpos (Real.exp_pos _).le
      have hpos := mul_nonneg hr (hJ t ht)
      nlinarith only [hvg,hpos]
  have hGa : AntitoneOn G (Icc 0 T) := by
    apply antitoneOn_of_deriv_nonpos (convex_Icc 0 T) hGc
    · intro t ht
      rw [interior_Icc] at ht
      obtain ⟨v,hv,_⟩ := hGd t ht
      exact hv.differentiableAt.differentiableWithinAt
    · intro t ht
      rw [interior_Icc] at ht
      obtain ⟨v,hv,hv0⟩ := hGd t ht
      simpa only [hv.deriv] using hv0
  have hle := hGa (show (0:ℝ)∈Icc 0 T from ⟨le_rfl,hT⟩)
    (show T∈Icc 0 T from ⟨hT,le_rfl⟩) hT
  simpa only [G,mul_zero,neg_zero,Real.exp_zero,one_mul] using hle

theorem protectedObservableCandidateMean_nonneg {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (positive : Grid n→Grid n→Bool) (F : ExtendedState n→(Grid n→ℝ)→ℝ)
    (hF : ∀v a,0≤F v a) : 0≤protectedObservableCandidateMean L e saved Γ mask B positive F := by
  apply div_nonneg _ (sq_nonneg _)
  apply Finset.sum_nonneg
  intro q _
  apply integral_nonneg
  intro z
  unfold protectedForbiddenMarkObservable
  split_ifs <;> first | exact le_rfl | exact hF _ _

end NoThreeLine
#print axioms NoThreeLine.exponential_live_survival_le
#print axioms NoThreeLine.protectedObservableCandidateMean_nonneg
