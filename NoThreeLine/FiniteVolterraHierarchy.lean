import NoThreeLine.FiniteSourceHierarchy

/-! The finite triangular Volterra induction from manuscript section 8.
This is an analytic theorem: the displayed Volterra inequalities are explicit
hypotheses. The actual continuous-time observed hierarchy must separately be
shown to satisfy them; the theorem does not assert that missing connection. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.FiniteSourceHierarchy

theorem triangular_volterra_bound {ι : Type*} [DecidableEq ι]
    (D : Finset ι) (β : ι → ℝ → ℝ) (U : Finset ι → ℝ → ℝ) (a b : ℝ) (hab : a≤b)
    (hβ : ∀i∈D,IntervalIntegrable (β i) volume a b)
    (hβ0 : ∀i∈D,∀t∈Icc a b,0≤β i t)
    (hbase : ∀t∈Icc a b,U ∅ t≤1)
    (hstep : ∀E⊆D,E.Nonempty→∀t∈Icc a b,
      U E t≤∑i∈E,∫u in a..t,β i u*U (E.erase i) u)
    (hterm : ∀E⊆D,∀i∈E,IntervalIntegrable (fun t=>β i t*U (E.erase i) t) volume a b) :
    ∀E⊆D,∀t∈Icc a b,U E t≤∏i∈E,primitive β a i t := by
  intro E
  refine Finset.strongInductionOn E ?_
  intro E ih
  intro hED t ht
  by_cases hE : E=∅
  · simpa only [hE,Finset.prod_empty] using hbase t ht
  have hE' : E.Nonempty := Finset.nonempty_iff_ne_empty.mpr hE
  have hsub : uIcc a t⊆uIcc a b := by
    rw [uIcc_of_le ht.1,uIcc_of_le hab]
    exact Icc_subset_Icc le_rfl ht.2
  have hβt (i) (hi : i∈E) : IntervalIntegrable (β i) volume a t :=
    (hβ i (hED hi)).mono_set hsub
  apply (hstep E hED hE' t ht).trans
  calc
    _ ≤ ∑i∈E,∫u in a..t,β i u*(∏j∈E.erase i,primitive β a j u) := by
      apply Finset.sum_le_sum
      intro i hi
      apply intervalIntegral.integral_mono_on ht.1 ((hterm E hED i hi).mono_set hsub)
        (primitive_product_term_integrable E β a t hβt i hi)
      intro u hu
      have hub : u∈Icc a b := ⟨hu.1,hu.2.trans ht.2⟩
      exact mul_le_mul_of_nonneg_left
        (ih (E.erase i) (Finset.erase_ssubset hi) (Finset.erase_subset i E |>.trans hED) u hub)
        (hβ0 i (hED hi) u hub)
    _ = _ := sum_integral_primitive_products E hE' β a t hβt

end NoThreeLine.FiniteSourceHierarchy

#print axioms NoThreeLine.FiniteSourceHierarchy.triangular_volterra_bound
