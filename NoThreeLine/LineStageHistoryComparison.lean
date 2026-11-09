import NoThreeLine.LineStageConditionalLikelihood

/-! Change of law on an actual finite state-history event surviving on L
through that update. Later L births under the original law are allowed;
the terminal conditional density, rather than terminal survival, is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem lineStageDensity_recycled_eq_hazard {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (s : AugTimedState cfg)
    (ho : occupancy s.val.1.physical.process L=N) (hk : s.val.1.physical.clocks L≤K)
    (k : ℕ) (ω : BoardClockPath n)
    (hsurv : occupancy (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process L=N) :
    lineStageDensity cfg K L N s (augRecycledPair cfg ε M hn s k ω).1=
      Real.exp (recycledLineIntensityCost cfg ε M hn L s k ω) := by
  have hreg := lineStageRegion_recycled cfg ε M K hKcfg L hsp N hN hn s ⟨ho.ge,fun _=>hk⟩ k ω
  have hstage (i : ℕ) (hi : i<k) : occupancy (augRecycledPair cfg ε M hn s i ω).1.val.1.physical.process L=N := by
    have hlo := recycled_occupancy_monotone cfg ε M L hn s ω (Nat.zero_le i)
    have hhi := recycled_occupancy_monotone cfg ε M L hn s ω hi.le
    change occupancy s.val.1.physical.process L≤occupancy (augRecycledPair cfg ε M hn s i ω).1.val.1.physical.process L at hlo
    change occupancy (augRecycledPair cfg ε M hn s i ω).1.val.1.physical.process L≤
      occupancy (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process L at hhi
    omega
  unfold lineStageDensity lineStageValue
  rw [if_pos ⟨hsurv,hreg.2 hsurv⟩,←Real.exp_add,
    recycledLineIntensityCost_eq_clock cfg ε M K hn hKcfg hK L hsp s hk N hN k ω hstage]
  congr 1
  ring

theorem lineStageDensity_recycled_ge_one {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (s : AugTimedState cfg)
    (ho : occupancy s.val.1.physical.process L=N) (hk : s.val.1.physical.clocks L≤K)
    (k : ℕ) (ω : BoardClockPath n)
    (hsurv : occupancy (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process L=N) :
    1≤lineStageDensity cfg K L N s (augRecycledPair cfg ε M hn s k ω).1 := by
  rw [lineStageDensity_recycled_eq_hazard cfg ε M K hKcfg hK L hsp N hN hn s ho hk k ω hsurv]
  exact Real.one_le_exp_iff.mpr (recycledLineIntensityCost_nonneg cfg ε M L hn s k ω)

theorem phaseLineForbiddenLaw_history_event_ge {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K) (k : ℕ) (E : Set (BoardClockPath n))
    (hE : MeasurableSet[augRecycledStateFiltration cfg ε M hn s k] E)
    (hsurv : ∀ω∈E,occupancy (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process L=N) :
    (boardClockMeasure n (cfg.B/n)).real E≤(phaseLineForbiddenLaw cfg ε M K L N hn s).real E := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  rw [phaseLineForbiddenLaw_history_event cfg ε M K hKcfg hK L hsp N hN hn hB hm s ho hk k E hE]
  have hi : Integrable (fun ω=>lineStageDensity cfg K L N s (augRecycledPair cfg ε M hn s k ω).1)
      (boardClockMeasure n (cfg.B/n)) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((lineStageDensity_measurable cfg K L N s).comp (augRecycledPair_measurable cfg ε M hn s k).fst)
      ((2/(2-K))^2) (fun ω=>lineStageDensity_bounds cfg K hK L N hN s _ hk)
  have he : (boardClockMeasure n (cfg.B/n)).real E=∫_ω in E,(1:ℝ) ∂boardClockMeasure n (cfg.B/n) := by simp
  rw [he]
  apply integral_mono_ae (integrable_const _) hi.integrableOn
  filter_upwards [ae_restrict_mem ((augRecycledStateFiltration cfg ε M hn s).le k E hE)] with ω hω
  exact lineStageDensity_recycled_ge_one cfg ε M K hKcfg hK L hsp N hN hn s ho hk k ω (hsurv ω hω)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineStageDensity_recycled_eq_hazard
#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_history_event_ge
