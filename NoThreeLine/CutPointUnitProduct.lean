import NoThreeLine.InitialPointWitness
import NoThreeLine.UnitSourceProduct

/-! The actual point-law product estimate retains unit source price when
the fixed labels share no specified line. No coarse price is silently
discarded: the separated-label hypothesis feeds the proved actual hierarchy. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness

theorem cutPoint_activeWitness_unit_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (hsep : SeparatedLabels cfg.directions (insert p D))
    (s : GoodObservation cfg) (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0)
    (t : ℝ) (ht : t∈Icc (0:ℝ) s.val.1.val.2) :
    (∫ω,cutActiveWitness cfg ε M start e D p hn s (elapsedCutAmount s.val.1.val.2 t,ω)
      ∂cutPointMeasure cfg ε M start hn s p (elapsedCutAmount s.val.1.val.2 t))≤
      (∏q∈D,∫u in (0:ℝ)..t,unitSourceCoefficient cfg start e s q u)/(1-ε)^L.card.choose 2 := by
  apply (cutPoint_activeWitness_mean_bound cfg ε M start e D L p hn hB hm s hs hε hinit _).trans
  apply div_le_div_of_nonneg_right _ (pow_nonneg (sub_nonneg.mpr hε.le) _)
  exact elapsedMixedMean_unit_product cfg ε M start e {p} D L hn hB hm hK
    (Finset.disjoint_singleton_left.mpr hpD) (by simpa only [Finset.singleton_union] using hDL)
    (by simpa only [Finset.singleton_union] using hsep) s hS hw hk t ht

theorem initial_cutPoint_activeWitness_unit_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (hsep : SeparatedLabels cfg.directions (insert p D))
    (hε0 : 0≤ε) (hε : ε<1) (deadline : Grid n→ℝ) (t : ℝ) (ht : t∈Icc (0:ℝ) cfg.horizon) :
    let s := initialGoodObservation cfg ε M hB deadline start
    (∫ω,cutActiveWitness cfg ε M start e D p hn s (elapsedCutAmount cfg.horizon t,ω)
      ∂cutPointMeasure cfg ε M start hn s p (elapsedCutAmount cfg.horizon t))≤
      (∏q∈D,∫u in (0:ℝ)..t,cfg.mask q*e.value q (start+u)/n)/(1-ε)^L.card.choose 2 := by
  have hh := cutPoint_activeWitness_unit_product cfg ε M start e D L p hn
    (lt_of_lt_of_le zero_lt_one hB) hm hK hpD hDL hsep (initialGoodObservation cfg ε M hB deadline start)
    (initialGoodObservation_credit cfg ε M hB deadline start p) hε
    (fun a _ b _ _=>by rw [initialGoodObservation_eta]; linarith)
    (initialGoodObservation_selected cfg ε M hB deadline start)
    (fun q=>(initialGoodObservation_weight cfg ε M hB deadline start q).le)
    (initialGoodObservation_clock cfg ε M hB deadline start) t ht
  simpa only [unitSourceCoefficient,initialGoodObservation_time,initialGoodObservation_remaining] using hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cutPoint_activeWitness_unit_product
#print axioms NoThreeLine.BirthWitness.initial_cutPoint_activeWitness_unit_product
