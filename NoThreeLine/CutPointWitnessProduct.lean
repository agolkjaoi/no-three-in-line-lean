import NoThreeLine.CutPointWitness
import NoThreeLine.SourceHierarchyProduct

/-! Actual point-law witness bounds obtained by applying the proved source
hierarchy, rather than assuming its moment conclusion. These are active-root
observables at a deterministic cut of one fixed phase. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem cutPoint_activeWitness_product_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0)
    (t : ℝ) (ht : t∈Icc (0:ℝ) s.val.1.val.2) :
    (∫ω,cutActiveWitness cfg ε M start e D p hn s (elapsedCutAmount s.val.1.val.2 t,ω)
      ∂cutPointMeasure cfg ε M start hn s p (elapsedCutAmount s.val.1.val.2 t))≤
      (∏q∈D,∫u in (0:ℝ)..t,elapsedSourceCoefficient cfg start e s q u)/(1-ε)^L.card.choose 2 := by
  apply (cutPoint_activeWitness_mean_bound cfg ε M start e D L p hn hB hm s hs hε hinit _).trans
  apply div_le_div_of_nonneg_right _ (pow_nonneg (sub_nonneg.mpr hε.le) _)
  exact elapsedMixedMean_product_bound cfg ε M start e {p} D L hn hB hm hK
    (Finset.disjoint_singleton_left.mpr hpD) (by simpa only [Finset.singleton_union] using hDL)
    s hS hw hk t ht

theorem elapsedSourcePrimitive_bounds {n : ℕ} (cfg : FlowConfig n) (start : ℝ)
    (e : Retention n) (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1)
    (q : Grid n) (t : ℝ) (ht : 0≤t) :
    0≤(∫u in (0:ℝ)..t,elapsedSourceCoefficient cfg start e s q u) ∧
      (∫u in (0:ℝ)..t,elapsedSourceCoefficient cfg start e s q u)≤
        t*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card) := by
  constructor
  · exact intervalIntegral.integral_nonneg_of_forall ht
      (fun u=>(elapsedSourceCoefficient_bounds cfg start e s hm q u).1)
  · have h := intervalIntegral.integral_mono_on ht
      (elapsedSourceCoefficient_intervalIntegrable cfg start e s hm q 0 t) intervalIntegrable_const
      (fun u _=>(elapsedSourceCoefficient_bounds cfg start e s hm q u).2)
    simpa only [intervalIntegral.integral_const,sub_zero,smul_eq_mul] using h

theorem cutPoint_activeWitness_coarse_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0)
    (t : ℝ) (ht : t∈Icc (0:ℝ) s.val.1.val.2) :
    (∫ω,cutActiveWitness cfg ε M start e D p hn s (elapsedCutAmount s.val.1.val.2 t,ω)
      ∂cutPointMeasure cfg ε M start hn s p (elapsedCutAmount s.val.1.val.2 t))≤
      (t*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^D.card/(1-ε)^L.card.choose 2 := by
  apply (cutPoint_activeWitness_product_bound cfg ε M start e D L p hn hB hm hK hpD hDL s hs hε hinit hS hw hk t ht).trans
  apply div_le_div_of_nonneg_right _ (pow_nonneg (sub_nonneg.mpr hε.le) _)
  calc
    _≤∏_q∈D,t*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card) :=
      Finset.prod_le_prod (fun q _=>(elapsedSourcePrimitive_bounds cfg start e s hm q t ht.1).1)
        (fun q _=>(elapsedSourcePrimitive_bounds cfg start e s hm q t ht.1).2)
    _=_ := by simp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cutPoint_activeWitness_product_bound
#print axioms NoThreeLine.BirthWitness.cutPoint_activeWitness_coarse_bound
