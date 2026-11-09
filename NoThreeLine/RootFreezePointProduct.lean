import NoThreeLine.RootFreezeProduct
import NoThreeLine.RootFreezeEta
import NoThreeLine.CutPointWitnessProduct

/-! Point-law product bounds at the actual simultaneously frozen root
snapshot. The active indicator belongs to that saved snapshot; it is not
replaced by terminal activity, nor discarded without a support proof. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem rootPoint_activeWitness_mean_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) (hc : augTimedCredit cfg p s.1.1=1) (hε : ε<1)
    (hactual : ∀a∈L,∀b∈L,a≠b→1-ε≤s.1.1.val.1.eta a b)
    (hsaved : ∀a∈L,∀b∈L,a≠b→1-ε≤s.2.2.1.eta a b) :
    (∫ω,activeWitness D p (rootBoundaryWitness cfg ε M start e p hn s ω)
      ∂withinPhasePointMeasure cfg ε M hn s.1.1 p)≤
        (∫ω,mixed cfg.directions {p} D L (rootBoundaryWitness cfg ε M start e p hn s ω)
          ∂boardClockMeasure n (cfg.B/n))/(1-ε)^L.card.choose 2 := by
  let ν := withinPhasePointMeasure cfg ε M hn s.1.1 p
  letI := withinPhasePointMeasure_probability cfg ε M hn hB hm s.1.1 p hc
  have hv (ω : BoardClockPath n) := rootBoundaryWitness_valid cfg ε M start e p hn s hs ω
  have hi : Integrable (fun ω=>activeWitness D p (rootBoundaryWitness cfg ε M start e p hn s ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((activeWitness_measurable D p).comp (rootBoundaryWitness_measurable cfg ε M start e p hn s))
      1 (fun ω=>activeWitness_bounds D p _ cfg.B (hv ω))
  have hj : Integrable (fun ω=>correctedActiveWitness D L p (rootBoundaryWitness cfg ε M start e p hn s ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((correctedActiveWitness_measurable D L p).comp (rootBoundaryWitness_measurable cfg ε M start e p hn s))
      1 (fun ω=>correctedActiveWitness_bounds D L p _ cfg.B (hv ω))
  have hh := integral_mono (hi.const_mul ((1-ε)^L.card.choose 2)) hj (fun ω=>
    activeWitness_eta_floor D L p _ cfg.B ε (hv ω) hε.le
      (fun a ha b hb hab=>rootBoundaryWitness_eta_lower cfg ε M start e p hn s a b hab
        (hactual a ha b hb hab) (hsaved a ha b hb hab) ω))
  rw [integral_const_mul] at hh
  change (1-ε)^L.card.choose 2*(∫ω,activeWitness D p (rootBoundaryWitness cfg ε M start e p hn s ω) ∂ν)≤
    ∫ω,correctedActiveWitness D L p (rootBoundaryWitness cfg ε M start e p hn s ω)
      ∂withinPhasePointMeasure cfg ε M hn s.1.1 p at hh
  rw [rootBoundaryWitness_corrected_point_mean cfg ε M start e p hn s hs D L] at hh
  apply (le_div_iff₀ (pow_pos (sub_pos.mpr hε) _)).mpr
  simpa only [mul_comm] using hh

theorem rootPoint_activeWitness_product_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) :
    (∫ω,activeWitness D p
      (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        (∏q∈D,∫u in (0:ℝ)..s.val.1.val.2,elapsedSourceCoefficient cfg start e s q u)/
          (1-ε)^L.card.choose 2 := by
  apply (rootPoint_activeWitness_mean_bound cfg ε M start e D L p hn hB hm
    (goodRootInitial cfg p s).val (goodRootInitial cfg p s).property.1 hs hε hinit hinit).trans
  apply div_le_div_of_nonneg_right _ (pow_nonneg (sub_nonneg.mpr hε.le) _)
  exact rootBoundaryMixed_product_bound cfg ε M start p e {p} D L hn hB hm hK
    (Finset.disjoint_singleton_left.mpr hpD) (by simpa only [Finset.singleton_union] using hDL)
    s hS hw hk

theorem rootPoint_activeWitness_coarse_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) :
    (∫ω,activeWitness D p
      (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        (s.val.1.val.2*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^D.card/
          (1-ε)^L.card.choose 2 := by
  apply (rootPoint_activeWitness_product_bound cfg ε M start e D L p hn hB hm hK hpD hDL s hs hε hinit hS hw hk).trans
  apply div_le_div_of_nonneg_right _ (pow_nonneg (sub_nonneg.mpr hε.le) _)
  calc
    _≤∏_q∈D,s.val.1.val.2*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card) :=
      Finset.prod_le_prod
        (fun q _=>(elapsedSourcePrimitive_bounds cfg start e s hm q s.val.1.val.2 s.val.1.property.2.1).1)
        (fun q _=>(elapsedSourcePrimitive_bounds cfg start e s hm q s.val.1.val.2 s.val.1.property.2.1).2)
    _=_ := by simp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rootPoint_activeWitness_mean_bound
#print axioms NoThreeLine.BirthWitness.rootPoint_activeWitness_product_bound
#print axioms NoThreeLine.BirthWitness.rootPoint_activeWitness_coarse_bound
