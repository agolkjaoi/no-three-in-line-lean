import NoThreeLine.WitnessSurvivalStep
import NoThreeLine.ActualWitnessGuardEstimate

/-! The survival bound includes the actual guard and the existing ordered
resolution. Eta factors and active-root gates are not discarded. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped NNReal
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines EtaMixedGenerator

theorem actual_resolved_survival_witness_bound {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (ε M : ℝ) (b : Grid n→ℝ) (C L : Finset (Grid n)) (e : Retention n)
    (start : ℝ) (T : ℝ≥0) (u : ℝ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (ha : WitnessState.Valid ⟨⟨x.1.val,x.2⟩,b⟩ cfg.B)
    (hT : (T:ℝ)≤selectedGuardTime cfg x.1) (hu : 0≤u) (huT : u≤T)
    (hstop : x.1.val.process.stopped=false) (hC : C⊆x.1.val.process.activeEvents)
    (hCL : C⊆L) (hE : EmptyLineCredit x.1.val) (hK : cfg.K<2) :
    (∫ω in {ω | u<(WinnerMarkLaw.firstMarkedRace hn ω).1.1},
      mixed cfg.directions C ∅ L
        ((firstWitnessSnapshot cfg x b e start T (WinnerMarkLaw.firstMarkedRace hn ω)).resolve
          cfg.directions cfg.B cfg.K cfg.rho ε M) ∂boardClockMeasure n (cfg.B/n))≤
      Real.exp (-(((n:ℝ)*cfg.B)*u))*mixed cfg.directions C ∅ L (selectedWitnessCurve cfg x b u) := by
  let μ := (boardClockMeasure n (cfg.B/n)).restrict {ω | u<(WinnerMarkLaw.firstMarkedRace hn ω).1.1}
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let f := fun ω=>firstWitnessSnapshot cfg x b e start T (WinnerMarkLaw.firstMarkedRace hn ω)
  have hf : Measurable f := (firstWitnessSnapshot_measurable cfg x b e start T).comp
    (WinnerMarkLaw.firstMarkedRace_measurable hn)
  have hv (ω : BoardClockPath n) : (f ω).Valid cfg.B := firstWitnessSnapshot_valid cfg x b e start T ha hT _
  have hi : (∫ω,mixed cfg.directions C ∅ L
        ((f ω).resolve cfg.directions cfg.B cfg.K cfg.rho ε M) ∂μ)≤
      ∫ω,mixed cfg.directions C ∅ L (f ω) ∂μ := by
    apply integral_mono
    · exact mixed_integrable μ _ ((WitnessState.resolve_measurable cfg.directions cfg.B cfg.K cfg.rho ε M).comp hf)
        cfg.directions C ∅ L cfg.B (fun ω=>WitnessState.resolve_valid _ cfg.directions cfg.B cfg.K cfg.rho ε M (hv ω))
    · exact mixed_integrable μ _ hf cfg.directions C ∅ L cfg.B hv
    · intro ω
      exact mixed_resolve_le _ cfg.directions C ∅ L cfg.B cfg.K cfg.rho ε M (hv ω)
  exact hi.trans (actual_survival_witness_source_free_bound cfg x b C L e start T u
    hn hB hm ha hT hu huT hstop hC hCL hE hK)

theorem observedClockStep_survival_source_free_bound {n : ℕ} (cfg : FlowConfig n) (ε M phaseStart : ℝ)
    (e : Retention n) (s : TimedObservation cfg) (C L : Finset (Grid n)) (u : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hs : RecordsConsistent cfg s)
    (hx : ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true))
    (hC : C⊆s.1.val.1.physical.process.activeEvents) (hCL : C⊆L)
    (hE : EmptyLineCredit s.1.val.1.physical) (hK : cfg.K<2)
    (hu : 0≤u) (huT : u≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    (∫ω in {ω | u<(WinnerMarkLaw.firstMarkedRace hn ω).1.1},
      mixed cfg.directions C ∅ L (observedWitness cfg e (observedClockStep cfg ε M phaseStart hn (s,ω)))
      ∂boardClockMeasure n (cfg.B/n))≤
      Real.exp (-(((n:ℝ)*cfg.B)*u))*mixed cfg.directions C ∅ L
        (selectedWitnessCurve cfg (augTimedInput cfg s.1).1 (recordedValue e s.2) u) := by
  have ha := observedWitness_valid cfg e s hs
  have hstop : s.1.val.1.physical.process.stopped=false := by
    cases hh : s.1.val.1.physical.process.stopped
    · rfl
    · exact False.elim (hx (Or.inr hh))
  have hi := actual_resolved_survival_witness_bound cfg (augTimedInput cfg s.1).1 ε M (recordedValue e s.2)
    C L e (observationTime cfg phaseStart s.1) (witnessGuardHorizon cfg ε M (augTimedInput cfg s.1) ha.1.1) u
    hn hB hm ha (augGuardTime_mem cfg ε M (augTimedInput cfg s.1) ha.1.1).2 hu huT hstop hC hCL hE hK
  convert hi using 1
  apply integral_congr_ae
  filter_upwards [ae_restrict_of_ae (BoardFirstCandidate.firstTime_ae_positive hn (cfg.B/n)
    (div_pos hB (by exact_mod_cast hn)))] with ω hω
  change mixed cfg.directions C ∅ L (observedWitness cfg e
    (observedStep cfg ε M phaseStart (s,WinnerMarkLaw.firstMarkedRace hn ω)))=_
  rw [observedStep_resolved_snapshot cfg ε M phaseStart e (s,WinnerMarkLaw.firstMarkedRace hn ω) hx,
    firstWitnessSnapshot_eq_raw cfg ε M (observationTime cfg phaseStart s.1) (augTimedInput cfg s.1)
      ha.1.1 e s.2 (WinnerMarkLaw.firstMarkedRace hn ω) hω]
  rfl

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.actual_resolved_survival_witness_bound
#print axioms NoThreeLine.BirthWitness.observedClockStep_survival_source_free_bound
