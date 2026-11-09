import NoThreeLine.RootFreezeTerminal
import NoThreeLine.WithinPhasePointLaw
import NoThreeLine.SingletonWitnessCredit

/-! The frozen root snapshot uses the already constructed actual point
law. Its density is exactly the actual terminal saved credit, not a new
independence hypothesis. The snapshot's own active indicator is retained. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def rootBoundaryWitness {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (ω : BoardClockPath n) : WitnessState n :=
  savedWitness e (rootObserverTerminal cfg ε M start p hn (s,ω)).2.2

theorem rootBoundaryWitness_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (p : Grid n) (hn : 0<n) (s : RootObservation cfg) :
    Measurable (rootBoundaryWitness cfg ε M start e p hn s) :=
  (savedWitness_measurable e).comp (((rootObserverTerminal_measurable cfg ε M start p hn).comp
    (measurable_const.prodMk measurable_id)).snd.snd)

theorem rootBoundaryWitness_valid {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (p : Grid n) (hn : 0<n) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) (ω : BoardClockPath n) :
    (rootBoundaryWitness cfg ε M start e p hn s ω).Valid cfg.B :=
  savedWitness_valid cfg.B e _ (rootObserverTerminal_invariant cfg ε M start p hn (s,ω) hs).saved

theorem rootBoundaryWitness_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (p : Grid n) (hn : 0<n) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) (ω : BoardClockPath n) :
    ((rootBoundaryWitness cfg ε M start e p hn s ω).augmented.physical.process.accounts p).credit=
      augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s.1.1 ω) := by
  change ((rootObserverTerminal cfg ε M start p hn (s,ω)).2.2.1.physical.process.accounts p).credit=_
  rw [rootObserverTerminal_credit cfg ε M start p hn (s,ω) hs,observedRecycledTerminal_base]

theorem rootBoundaryWitness_density_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (p : Grid n) (hn : 0<n) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) :
    savedCreditMeasure (boardClockMeasure n (cfg.B/n))
      (fun ω=>((rootBoundaryWitness cfg ε M start e p hn s ω).augmented.physical.process.accounts p).credit)=
      withinPhasePointMeasure cfg ε M hn s.1.1 p := by
  simp only [rootBoundaryWitness_credit cfg ε M start e p hn s hs,withinPhasePointMeasure]

theorem rootBoundaryWitness_corrected_point_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (p : Grid n) (hn : 0<n) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) (D L : Finset (Grid n)) :
    (∫ω,correctedActiveWitness D L p (rootBoundaryWitness cfg ε M start e p hn s ω)
      ∂withinPhasePointMeasure cfg ε M hn s.1.1 p)=
      ∫ω,mixed cfg.directions {p} D L (rootBoundaryWitness cfg ε M start e p hn s ω)
        ∂boardClockMeasure n (cfg.B/n) := by
  unfold withinPhasePointMeasure
  have hZ : Measurable (fun ω=>augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s.1.1 ω)) :=
    (augTimedCredit_measurable cfg p).comp (augRecycledTerminal_measurable cfg ε M hn s.1.1)
  rw [savedCreditMeasure_integral _ _ hZ (fun ω=>(augTimedCredit_bounds cfg p _).1)]
  apply integral_congr_ae
  exact Filter.Eventually.of_forall (fun ω=>by
    change augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s.1.1 ω)*
      correctedActiveWitness D L p (rootBoundaryWitness cfg ε M start e p hn s ω)=_
    rw [←rootBoundaryWitness_credit cfg ε M start e p hn s hs ω]
    exact (singleton_mixed_credit cfg.directions D L p _).symm)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rootBoundaryWitness_measurable
#print axioms NoThreeLine.BirthWitness.rootBoundaryWitness_density_eq
#print axioms NoThreeLine.BirthWitness.rootBoundaryWitness_corrected_point_mean
