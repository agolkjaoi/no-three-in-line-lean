import NoThreeLine.InitialPointWitness

/-! Markov tail bound for an actual weighted retained-witness sum under the
actual point probability law. The event includes root activity; no boundary
retirement probability or asymptotic smallness is claimed here. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem initial_cutPoint_witness_tail {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n)
    (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hε0 : 0≤ε) (hε : ε<1) (deadline : Grid n→ℝ) (hw0 : ∀q,0≤w q)
    (t : ℝ) (ht : t∈Icc (0:ℝ) cfg.horizon) (r : ℝ) (hr : 0<r) :
    let s := initialGoodObservation cfg ε M hB deadline start
    let δ := elapsedCutAmount cfg.horizon t
    (cutPointMeasure cfg ε M start hn s p δ).real
      {ω | ((cutProcess cfg ε M start hn s (δ,ω)).accounts p).status=.active ∧
        r≤witnessSum w (observedWitness cfg e (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω))}≤
      (∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
        ((t*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^(Finset.univ.image f).card/
          (1-ε)^(insert p (Finset.univ.image f)).card.choose 2))/r^m := by
  dsimp only
  let s := initialGoodObservation cfg ε M hB deadline start
  let δ := elapsedCutAmount cfg.horizon t
  let ν := cutPointMeasure cfg ε M start hn s p δ
  letI := cutPointMeasure_probability cfg ε M start hn (lt_of_lt_of_le zero_lt_one hB) hm s p
    (initialGoodObservation_credit cfg ε M hB deadline start p) δ
  have hv (ω : BoardClockPath n) := observedWitness_valid cfg e _
    (sourceCutTerminal_consistent cfg ε M start δ δ.coe_nonneg hn s ω)
  have hi : Integrable (fun ω=>cutActiveWitnessPower cfg ε M start e w m p hn s (δ,ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((cutActiveWitnessPower_measurable cfg ε M start e w m p hn s).comp
        (measurable_const.prodMk measurable_id)) ((∑q,w q)^m)
      (fun ω=>activeWitnessPower_bounds w m p _ cfg.B (hv ω) hw0)
  have hMarkov := mul_meas_ge_le_integral_of_nonneg
    (Filter.Eventually.of_forall (fun ω=>(activeWitnessPower_bounds w m p _ cfg.B (hv ω) hw0).1)) hi (r^m)
  have hset : {ω : BoardClockPath n | ((cutProcess cfg ε M start hn s (δ,ω)).accounts p).status=.active ∧
      r≤witnessSum w (observedWitness cfg e (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω))}⊆
      {ω | r^m≤cutActiveWitnessPower cfg ε M start e w m p hn s (δ,ω)} := by
    intro ω hω
    change r^m≤(if ((cutProcess cfg ε M start hn s (δ,ω)).accounts p).status=.active then
      witnessSum w (observedWitness cfg e (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω))^m else 0)
    rw [if_pos hω.1]
    exact pow_le_pow_left₀ hr.le hω.2 m
  have hmeasure := measureReal_mono (μ := ν) hset
  have hbound := (mul_le_mul_of_nonneg_left hmeasure (pow_nonneg hr.le m)).trans hMarkov
  have hmoment := initial_cutPoint_activeWitnessPower_moment cfg ε M start e w m p hn hB hm hK
    hε0 hε deadline hw0 t ht
  apply (le_div_iff₀ (pow_pos hr m)).mpr
  simpa only [mul_comm] using hbound.trans hmoment

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_cutPoint_witness_tail
