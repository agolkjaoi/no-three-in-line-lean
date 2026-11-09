import Mathlib.MeasureTheory.Integral.IntervalIntegral.AbsolutelyContinuousFun
import Mathlib.Analysis.Calculus.Deriv.Mul

/-! The analytic finite-product identity used in manuscript section 8.
The rates need only be interval integrable: their primitives are absolutely
continuous, and differentiation of the finite product holds almost everywhere.
No independence assertion or stochastic hierarchy estimate is assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Filter
open scoped BigOperators

namespace NoThreeLine.FiniteSourceHierarchy

theorem absolutelyContinuous_finset_product {ι : Type*} (D : Finset ι)
    (F : ι → ℝ → ℝ) (a b : ℝ)
    (hF : ∀i∈D,AbsolutelyContinuousOnInterval (F i) a b) :
    AbsolutelyContinuousOnInterval (fun t=>∏i∈D,F i t) a b := by
  classical
  revert hF
  induction D using Finset.induction_on with
  | empty =>
    intro _
    simpa only [Finset.prod_empty] using
      (LipschitzWith.const (1:ℝ)).lipschitzOnWith.absolutelyContinuousOnInterval (a:=a) (b:=b)
  | @insert i D hi ih =>
    intro hF
    simp only [Finset.prod_insert hi]
    exact (hF i (Finset.mem_insert_self i D)).fun_mul
      (ih (fun j hj=>hF j (Finset.mem_insert_of_mem hj)))

theorem integral_product_derivative {ι : Type*} [DecidableEq ι] (D : Finset ι)
    (F β : ι → ℝ → ℝ) (a b : ℝ)
    (hF : ∀i∈D,AbsolutelyContinuousOnInterval (F i) a b)
    (hd : ∀i∈D,∀ᵐ t,t∈uIcc a b→HasDerivAt (F i) (β i t) t) :
    (∫t in a..b,∑i∈D,β i t*(∏j∈D.erase i,F j t))=
      (∏i∈D,F i b)-(∏i∈D,F i a) := by
  classical
  rw [← (absolutelyContinuous_finset_product D F a b hF).integral_deriv_eq_sub]
  apply intervalIntegral.integral_congr_ae
  have hd' : ∀ᵐ t,∀i:D,t∈uIcc a b→HasDerivAt (F i) (β i t) t :=
    ae_all_iff.mpr (fun i=>hd i i.property)
  filter_upwards [hd'] with t ht htab
  have hh := HasDerivAt.fun_finsetProd (u:=D) (f:=F) (f':=fun i=>β i t)
    (fun i hi=>ht ⟨i,hi⟩ (uIoc_subset_uIcc htab))
  simpa only [smul_eq_mul,mul_comm] using hh.deriv.symm

def primitive {ι : Type*} (β : ι → ℝ → ℝ) (a : ℝ) (i : ι) (t : ℝ) : ℝ :=
  ∫u in a..t,β i u

theorem primitive_product_identity {ι : Type*} [DecidableEq ι] (D : Finset ι)
    (β : ι → ℝ → ℝ) (a b : ℝ)
    (hβ : ∀i∈D,IntervalIntegrable (β i) volume a b) :
    (∫t in a..b,∑i∈D,β i t*(∏j∈D.erase i,primitive β a j t))=
      (∏i∈D,primitive β a i b)-(∏i∈D,(0:ℝ)) := by
  have hF (i) (hi : i∈D) : AbsolutelyContinuousOnInterval (primitive β a i) a b :=
    (hβ i hi).absolutelyContinuousOnInterval_intervalIntegral (by simp)
  have hd (i) (hi : i∈D) : ∀ᵐ t,t∈uIcc a b→HasDerivAt (primitive β a i) (β i t) t := by
    filter_upwards [(hβ i hi).ae_hasDerivAt_integral] with t ht htab
    exact ht htab a (by simp)
  simpa only [primitive,intervalIntegral.integral_same] using
    integral_product_derivative D (primitive β a) β a b hF hd

theorem primitive_product_identity_nonempty {ι : Type*} [DecidableEq ι] (D : Finset ι) (hD : D.Nonempty)
    (β : ι → ℝ → ℝ) (a b : ℝ)
    (hβ : ∀i∈D,IntervalIntegrable (β i) volume a b) :
    (∫t in a..b,∑i∈D,β i t*(∏j∈D.erase i,primitive β a j t))=
      ∏i∈D,primitive β a i b := by
  have hz : (∏i∈D,(0:ℝ))=0 := Finset.prod_eq_zero hD.choose_spec rfl
  simpa only [hz,sub_zero] using primitive_product_identity D β a b hβ

theorem primitive_product_term_integrable {ι : Type*} [DecidableEq ι] (D : Finset ι)
    (β : ι → ℝ → ℝ) (a b : ℝ)
    (hβ : ∀i∈D,IntervalIntegrable (β i) volume a b) (i : ι) (hi : i∈D) :
    IntervalIntegrable (fun t=>β i t*(∏j∈D.erase i,primitive β a j t)) volume a b := by
  classical
  exact (hβ i hi).mul_continuousOn
    (absolutelyContinuous_finset_product (D.erase i) (primitive β a) a b
      (fun j hj=>(hβ j (Finset.mem_of_mem_erase hj)).absolutelyContinuousOnInterval_intervalIntegral
        (by simp))).continuousOn

theorem sum_integral_primitive_products {ι : Type*} [DecidableEq ι] (D : Finset ι) (hD : D.Nonempty)
    (β : ι → ℝ → ℝ) (a b : ℝ)
    (hβ : ∀i∈D,IntervalIntegrable (β i) volume a b) :
    (∑i∈D,∫t in a..b,β i t*(∏j∈D.erase i,primitive β a j t))=
      ∏i∈D,primitive β a i b := by
  rw [← intervalIntegral.integral_finsetSum (fun i hi=>primitive_product_term_integrable D β a b hβ i hi)]
  exact primitive_product_identity_nonempty D hD β a b hβ

end NoThreeLine.FiniteSourceHierarchy

#print axioms NoThreeLine.FiniteSourceHierarchy.primitive_product_identity_nonempty
#print axioms NoThreeLine.FiniteSourceHierarchy.sum_integral_primitive_products
