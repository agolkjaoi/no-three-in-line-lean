import NoThreeLine.FiniteVolterraHierarchy

/-! Finite Volterra hierarchy with a nonzero product initial bound. This
analytic lemma is intended for later phases, where old birth witnesses are
already present. It does not assert the missing stochastic phase-cut input. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Filter
open scoped BigOperators

namespace NoThreeLine.FiniteSourceHierarchy

def shiftedPrimitive {ι : Type*} (c : ι→ℝ) (β : ι→ℝ→ℝ) (a : ℝ) (i : ι) (t : ℝ) : ℝ :=
  c i+primitive β a i t

theorem shiftedPrimitive_absolutelyContinuous {ι : Type*} (c : ι→ℝ) (β : ι→ℝ→ℝ)
    (a b : ℝ) (i : ι) (hβ : IntervalIntegrable (β i) volume a b) :
    AbsolutelyContinuousOnInterval (shiftedPrimitive c β a i) a b :=
  ((LipschitzWith.const (c i)).lipschitzOnWith.absolutelyContinuousOnInterval (a:=a) (b:=b)).add
    (hβ.absolutelyContinuousOnInterval_intervalIntegral (by simp))

theorem shiftedPrimitive_product_identity {ι : Type*} [DecidableEq ι] (D : Finset ι)
    (c : ι→ℝ) (β : ι→ℝ→ℝ) (a b : ℝ)
    (hβ : ∀i∈D,IntervalIntegrable (β i) volume a b) :
    (∫t in a..b,∑i∈D,β i t*(∏j∈D.erase i,shiftedPrimitive c β a j t))=
      (∏i∈D,shiftedPrimitive c β a i b)-(∏i∈D,c i) := by
  have hd (i) (hi : i∈D) : ∀ᵐ t,t∈uIcc a b→HasDerivAt (shiftedPrimitive c β a i) (β i t) t := by
    filter_upwards [(hβ i hi).ae_hasDerivAt_integral] with t ht htab
    exact (ht htab a (by simp)).const_add (c i)
  simpa only [shiftedPrimitive,primitive,intervalIntegral.integral_same,add_zero] using
    integral_product_derivative D (shiftedPrimitive c β a) β a b
      (fun i hi=>shiftedPrimitive_absolutelyContinuous c β a b i (hβ i hi)) hd

theorem shiftedPrimitive_product_term_integrable {ι : Type*} [DecidableEq ι] (D : Finset ι)
    (c : ι→ℝ) (β : ι→ℝ→ℝ) (a b : ℝ)
    (hβ : ∀i∈D,IntervalIntegrable (β i) volume a b) (i : ι) (hi : i∈D) :
    IntervalIntegrable (fun t=>β i t*(∏j∈D.erase i,shiftedPrimitive c β a j t)) volume a b :=
  (hβ i hi).mul_continuousOn
    (absolutelyContinuous_finset_product (D.erase i) (shiftedPrimitive c β a) a b
      (fun j hj=>shiftedPrimitive_absolutelyContinuous c β a b j (hβ j (Finset.mem_of_mem_erase hj)))).continuousOn

theorem sum_integral_shiftedPrimitive_products {ι : Type*} [DecidableEq ι] (D : Finset ι)
    (c : ι→ℝ) (β : ι→ℝ→ℝ) (a b : ℝ)
    (hβ : ∀i∈D,IntervalIntegrable (β i) volume a b) :
    (∑i∈D,∫t in a..b,β i t*(∏j∈D.erase i,shiftedPrimitive c β a j t))=
      (∏i∈D,shiftedPrimitive c β a i b)-(∏i∈D,c i) := by
  rw [←intervalIntegral.integral_finsetSum
    (fun i hi=>shiftedPrimitive_product_term_integrable D c β a b hβ i hi)]
  exact shiftedPrimitive_product_identity D c β a b hβ

theorem shifted_triangular_volterra_bound {ι : Type*} [DecidableEq ι]
    (D : Finset ι) (c : ι→ℝ) (β : ι→ℝ→ℝ) (U : Finset ι→ℝ→ℝ) (a b : ℝ) (hab : a≤b)
    (hβ : ∀i∈D,IntervalIntegrable (β i) volume a b)
    (hβ0 : ∀i∈D,∀t∈Icc a b,0≤β i t)
    (hbase : ∀t∈Icc a b,U ∅ t≤1)
    (hstep : ∀E⊆D,E.Nonempty→∀t∈Icc a b,
      U E t≤(∏i∈E,c i)+∑i∈E,∫u in a..t,β i u*U (E.erase i) u)
    (hterm : ∀E⊆D,∀i∈E,IntervalIntegrable (fun t=>β i t*U (E.erase i) t) volume a b) :
    ∀E⊆D,∀t∈Icc a b,U E t≤∏i∈E,shiftedPrimitive c β a i t := by
  intro E
  refine Finset.strongInductionOn E ?_
  intro E ih hED t ht
  by_cases hE : E=∅
  · simpa only [hE,Finset.prod_empty] using hbase t ht
  have hsub : uIcc a t⊆uIcc a b := by
    rw [uIcc_of_le ht.1,uIcc_of_le hab]
    exact Icc_subset_Icc le_rfl ht.2
  have hβt (i) (hi : i∈E) : IntervalIntegrable (β i) volume a t := (hβ i (hED hi)).mono_set hsub
  apply (hstep E hED (Finset.nonempty_iff_ne_empty.mpr hE) t ht).trans
  have hsum : (∑i∈E,∫u in a..t,β i u*U (E.erase i) u)≤
      ∑i∈E,∫u in a..t,β i u*(∏j∈E.erase i,shiftedPrimitive c β a j u) := by
    apply Finset.sum_le_sum
    intro i hi
    apply intervalIntegral.integral_mono_on ht.1 ((hterm E hED i hi).mono_set hsub)
      (shiftedPrimitive_product_term_integrable E c β a t hβt i hi)
    intro u hu
    have hub : u∈Icc a b := ⟨hu.1,hu.2.trans ht.2⟩
    exact mul_le_mul_of_nonneg_left
      (ih (E.erase i) (Finset.erase_ssubset hi) ((Finset.erase_subset i E).trans hED) u hub)
      (hβ0 i (hED hi) u hub)
  rw [sum_integral_shiftedPrimitive_products E c β a t hβt] at hsum
  linarith

end NoThreeLine.FiniteSourceHierarchy

#print axioms NoThreeLine.FiniteSourceHierarchy.shiftedPrimitive_product_identity
#print axioms NoThreeLine.FiniteSourceHierarchy.shifted_triangular_volterra_bound
