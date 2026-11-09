import NoThreeLine.WitnessResolution
import NoThreeLine.BirthObservationIteration

/-! S7 one-step estimate for the actual timed observer, with its real
cap, first marked board candidate, birth timestamp, and ordered resolution.
The initial segment time is phaseStart+horizon-remaining. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines EtaMixedGenerator

theorem selectedWitnessCurve_initial {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (he : x.1.val.Valid cfg.B) :
    selectedWitnessCurve cfg x b 0=⟨⟨x.1.val,x.2⟩,b⟩ := by
  unfold selectedWitnessCurve selectedAugmentedCurve selectedTrajectory
  rw [(selectedCurve_spec cfg x.1 he.2.1).1,selectedEtaCurve_initial]
  simp only [ExtendedState.withCoordinates,ExtendedState.coordinates,ProcessState.withWeights_self]

theorem actual_resolved_guard_source_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : AugmentedCappedInput cfg) (e : Retention n) (b : BirthRecords n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (ha : WitnessState.Valid ⟨⟨x.1.1.val,x.1.2⟩,recordedValue e b⟩ cfg.B)
    (hstop : x.1.1.val.process.stopped=false) (hC : C⊆x.1.1.val.process.activeEvents)
    (hCL : C⊆L) (hCD : Disjoint C D) (hE : EmptyLineCredit x.1.1.val) (hK : cfg.K<2) :
    (∫ω,mixed cfg.directions C D L
      ((rawObservedWitness cfg ε M
        (start+augAdvance cfg ε M (x,(WinnerMarkLaw.firstMarkedRace hn ω).1.1)) e
        (x,WinnerMarkLaw.firstMarkedRace hn ω) b).resolve cfg.directions cfg.B cfg.K cfg.rho ε M)
        ∂boardClockMeasure n (cfg.B/n))≤
      mixed cfg.directions C D L ⟨⟨x.1.1.val,x.1.2⟩,recordedValue e b⟩+
        ∫t in (0:ℝ)..augGuardTime cfg ε M x,Real.exp (-(((n:ℝ)*cfg.B)*t))*
          selectedSourceSum cfg x.1 (recordedValue e b) C D L e start t := by
  have hi := actual_resolved_first_source_bound cfg x.1 ε M (recordedValue e b) C D L e start
    (witnessGuardHorizon cfg ε M x ha.1.1) hn hB hm ha
    (augGuardTime_mem cfg ε M x ha.1.1).2 hstop hC hCL hCD hE hK
  rw [selectedWitnessCurve_initial cfg x.1 _ ha.1.1] at hi
  convert hi using 1
  · apply integral_congr_ae
    filter_upwards [BoardFirstCandidate.firstTime_ae_positive hn (cfg.B/n)
      (div_pos hB (by exact_mod_cast hn))] with ω hω
    rw [firstWitnessSnapshot_eq_raw cfg ε M start x ha.1.1 e b (WinnerMarkLaw.firstMarkedRace hn ω) hω]
  · rfl

def observedSourceIntegral {n : ℕ} (cfg : FlowConfig n) (ε M phaseStart : ℝ)
    (e : Retention n) (s : TimedObservation cfg) (C D L : Finset (Grid n)) : ℝ :=
  ∫t in (0:ℝ)..augGuardTime cfg ε M (augTimedInput cfg s.1),Real.exp (-(((n:ℝ)*cfg.B)*t))*
    selectedSourceSum cfg (augTimedInput cfg s.1).1 (recordedValue e s.2) C D L e
      (observationTime cfg phaseStart s.1) t

theorem observedClockStep_source_bound {n : ℕ} (cfg : FlowConfig n) (ε M phaseStart : ℝ)
    (e : Retention n) (s : TimedObservation cfg) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hs : RecordsConsistent cfg s)
    (hx : ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true))
    (hC : C⊆s.1.val.1.physical.process.activeEvents)
    (hCL : C⊆L) (hCD : Disjoint C D) (hE : EmptyLineCredit s.1.val.1.physical) (hK : cfg.K<2) :
    (∫ω,mixed cfg.directions C D L
      (observedWitness cfg e (observedClockStep cfg ε M phaseStart hn (s,ω)))
      ∂boardClockMeasure n (cfg.B/n))≤
      mixed cfg.directions C D L (observedWitness cfg e s)+observedSourceIntegral cfg ε M phaseStart e s C D L := by
  have ha := observedWitness_valid cfg e s hs
  have hstop : s.1.val.1.physical.process.stopped=false := by
    cases hh : s.1.val.1.physical.process.stopped
    · rfl
    · exact False.elim (hx (Or.inr hh))
  have hi := actual_resolved_guard_source_bound cfg ε M (observationTime cfg phaseStart s.1)
    (augTimedInput cfg s.1) e s.2 C D L hn hB hm ha hstop hC hCL hCD hE hK
  convert hi using 1
  · apply integral_congr_ae
    exact Filter.Eventually.of_forall (fun ω=>by
      change mixed cfg.directions C D L (observedWitness cfg e
        (observedStep cfg ε M phaseStart (s,WinnerMarkLaw.firstMarkedRace hn ω)))=_
      rw [observedStep_resolved_snapshot cfg ε M phaseStart e (s,WinnerMarkLaw.firstMarkedRace hn ω) hx]
      rfl)
  · rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.actual_resolved_guard_source_bound
#print axioms NoThreeLine.BirthWitness.observedClockStep_source_bound
