import NoThreeLine.RootFreezeMoments
import NoThreeLine.InitialPointWitness

/-! Canonical initialization supplies the credit, eta and physical base
conditions of the actual frozen-boundary moment and Markov bound. The tail
event explicitly retains activity of the saved boundary snapshot. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem initial_rootPoint_activeWitness_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (hε0 : 0≤ε) (hε : ε<1) (deadline : Grid n→ℝ) :
    let s := initialGoodObservation cfg ε M hB deadline start
    (∫ω,activeWitness D p (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        (∏q∈D,∫u in (0:ℝ)..(cfg.horizon:ℝ),(cfg.mask q*e.value q (start+u)/n)*
          max 1 (protection 1 cfg.K)^cfg.directions.card)/(1-ε)^L.card.choose 2 := by
  have hh := rootPoint_activeWitness_product_bound cfg ε M start e D L p hn
    (lt_of_lt_of_le zero_lt_one hB) hm hK hpD hDL (initialGoodObservation cfg ε M hB deadline start)
    (initialGoodObservation_credit cfg ε M hB deadline start p) hε
    (fun a _ b _ _=>by rw [initialGoodObservation_eta]; linarith)
    (initialGoodObservation_selected cfg ε M hB deadline start)
    (fun q=>(initialGoodObservation_weight cfg ε M hB deadline start q).le)
    (initialGoodObservation_clock cfg ε M hB deadline start)
  simpa only [elapsedSourceCoefficient,initialGoodObservation_time,initialGoodObservation_remaining] using hh

theorem initial_rootPoint_activeWitnessPower_moment {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n)
    (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hε0 : 0≤ε) (hε : ε<1) (deadline : Grid n→ℝ) (hw0 : ∀q,0≤w q) :
    let s := initialGoodObservation cfg ε M hB deadline start
    (∫ω,activeWitnessPower w m p (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        ∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
          (((cfg.horizon:ℝ)*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^(Finset.univ.image f).card/
            (1-ε)^(insert p (Finset.univ.image f)).card.choose 2) :=
  rootPoint_activeWitnessPower_moment cfg ε M start e w m p hn
    (lt_of_lt_of_le zero_lt_one hB) hm hK (initialGoodObservation cfg ε M hB deadline start)
    (initialGoodObservation_credit cfg ε M hB deadline start p) hε
    (fun a b _=>by rw [initialGoodObservation_eta]; linarith)
    (initialGoodObservation_selected cfg ε M hB deadline start)
    (fun q=>(initialGoodObservation_weight cfg ε M hB deadline start q).le)
    (initialGoodObservation_clock cfg ε M hB deadline start) hw0

theorem initial_rootPoint_witness_tail {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n)
    (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hε0 : 0≤ε) (hε : ε<1) (deadline : Grid n→ℝ) (hw0 : ∀q,0≤w q) (r : ℝ) (hr : 0<r) :
    let s := initialGoodObservation cfg ε M hB deadline start
    let W := rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val
    (withinPhasePointMeasure cfg ε M hn s.val.1 p).real
      {ω | ((W ω).augmented.physical.process.accounts p).status=.active ∧ r≤witnessSum w (W ω)}≤
        (∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
          (((cfg.horizon:ℝ)*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^(Finset.univ.image f).card/
            (1-ε)^(insert p (Finset.univ.image f)).card.choose 2))/r^m := by
  dsimp only
  let s := initialGoodObservation cfg ε M hB deadline start
  let W := rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val
  let ν := withinPhasePointMeasure cfg ε M hn s.val.1 p
  letI := withinPhasePointMeasure_probability cfg ε M hn (lt_of_lt_of_le zero_lt_one hB) hm s.val.1 p
    (initialGoodObservation_credit cfg ε M hB deadline start p)
  have hv (ω : BoardClockPath n) : (W ω).Valid cfg.B :=
    rootBoundaryWitness_valid cfg ε M start e p hn _ (goodRootInitial cfg p s).property.1 ω
  have hi : Integrable (fun ω=>activeWitnessPower w m p (W ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((activeWitnessPower_measurable w m p).comp (rootBoundaryWitness_measurable cfg ε M start e p hn _))
      ((∑q,w q)^m) (fun ω=>activeWitnessPower_bounds w m p _ cfg.B (hv ω) hw0)
  have hMarkov := mul_meas_ge_le_integral_of_nonneg
    (Filter.Eventually.of_forall (fun ω=>(activeWitnessPower_bounds w m p _ cfg.B (hv ω) hw0).1)) hi (r^m)
  have hset : {ω : BoardClockPath n | ((W ω).augmented.physical.process.accounts p).status=.active ∧
      r≤witnessSum w (W ω)}⊆{ω | r^m≤activeWitnessPower w m p (W ω)} := by
    intro ω hω
    change r^m≤(if ((W ω).augmented.physical.process.accounts p).status=.active then witnessSum w (W ω)^m else 0)
    rw [if_pos hω.1]
    exact pow_le_pow_left₀ hr.le hω.2 m
  have hbound := (mul_le_mul_of_nonneg_left (measureReal_mono (μ:=ν) hset) (pow_nonneg hr.le m)).trans hMarkov
  have hmoment := initial_rootPoint_activeWitnessPower_moment cfg ε M start e w m p hn hB hm hK hε0 hε deadline hw0
  apply (le_div_iff₀ (pow_pos hr m)).mpr
  simpa only [mul_comm] using hbound.trans hmoment

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_rootPoint_activeWitness_product
#print axioms NoThreeLine.BirthWitness.initial_rootPoint_activeWitnessPower_moment
#print axioms NoThreeLine.BirthWitness.initial_rootPoint_witness_tail
