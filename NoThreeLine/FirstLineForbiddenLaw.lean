import NoThreeLine.ProtectedLineFirstLikelihood
import NoThreeLine.SavedCreditHistory

/-! An actual first-step probability law forbidding births on L, derived
by a bounded density on the original board. Full-stage iteration remains
separate; this file never assumes that iteration is normalized. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def firstLineForbiddenLaw {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (hn : 0<n) (s : AugTimedState cfg) : Measure (BoardClockPath n) :=
  savedCreditMeasure (boardClockMeasure n (cfg.B/n))
    (fun ω=>augTimedLineLikelihood cfg ε M L (s,WinnerMarkLaw.firstMarkedRace hn ω))

theorem firstLineLikelihood_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (s : AugTimedState cfg) :
    Measurable (fun ω=>augTimedLineLikelihood cfg ε M L (s,WinnerMarkLaw.firstMarkedRace hn ω)) :=
  (augTimedLineLikelihood_section_measurable cfg ε M L s).comp (WinnerMarkLaw.firstMarkedRace_measurable hn)

theorem firstLineLikelihood_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (hn : 0<n) (hB : 0<cfg.B) (s : AugTimedState cfg)
    (hN : occupancy s.val.1.physical.process L≤1) (hk : s.val.1.physical.clocks L≤K) :
    Integrable (fun ω=>augTimedLineLikelihood cfg ε M L (s,WinnerMarkLaw.firstMarkedRace hn ω))
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    (firstLineLikelihood_measurable cfg ε M L hn s) ((2/(2-K))^2)
    (fun ω=>augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s hN hk _)

theorem firstLineForbiddenLaw_probability {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg)
    (hN : occupancy s.val.1.physical.process L≤1) (hk : s.val.1.physical.clocks L≤K) :
    IsProbabilityMeasure (firstLineForbiddenLaw cfg ε M L hn s) :=
  savedCreditMeasure_probability _ _
    (firstLineLikelihood_integrable cfg ε M K hKcfg hK L hsp hn hB s hN hk)
    (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s hN hk _).1)
    (augTimedLineLikelihood_mean_one cfg ε M K hKcfg hK L hsp hn hB hm s hN hk)

theorem firstLineForbiddenLaw_absolutelyContinuous {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (s : AugTimedState cfg) :
    firstLineForbiddenLaw cfg ε M L hn s ≪ boardClockMeasure n (cfg.B/n) :=
  savedCreditMeasure_absolutelyContinuous _ _

theorem firstLineForbiddenLaw_no_line_birth {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (s : AugTimedState cfg) :
    ∀ᵐω ∂firstLineForbiddenLaw cfg ε M L hn s,
      ¬(timedBirth cfg ε M (s,WinnerMarkLaw.firstMarkedRace hn ω) ∧
        (WinnerMarkLaw.firstMarkedRace hn ω).1.2∈L.val) := by
  have hp := savedCreditMeasure_positive_ae (boardClockMeasure n (cfg.B/n)) _
    (firstLineLikelihood_measurable cfg ε M L hn s)
  filter_upwards [hp] with ω hω
  intro hb
  have hz : augTimedLineLikelihood cfg ε M L (s,WinnerMarkLaw.firstMarkedRace hn ω)=0 := by
    simp only [augTimedLineLikelihood,if_neg hb.1.1,lineCandidateSurvival,if_pos hb,mul_zero]
  rw [hz] at hω
  exact (lt_irrefl (0:ℝ)) hω

theorem firstLineForbiddenLaw_event_le {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (hn : 0<n) (hB : 0<cfg.B) (s : AugTimedState cfg)
    (hN : occupancy s.val.1.physical.process L≤1) (hk : s.val.1.physical.clocks L≤K)
    (E : Set (BoardClockPath n)) (hE : MeasurableSet E) :
    (firstLineForbiddenLaw cfg ε M L hn s).real E≤
      (2/(2-K))^2*(boardClockMeasure n (cfg.B/n)).real E := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  rw [firstLineForbiddenLaw,savedCreditMeasure_real_apply _ _
    (firstLineLikelihood_integrable cfg ε M K hKcfg hK L hsp hn hB s hN hk)
    (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s hN hk _).1) E hE]
  calc
    _ ≤ ∫_ω in E,(2/(2-K))^2 ∂boardClockMeasure n (cfg.B/n) :=
      integral_mono_ae
        (firstLineLikelihood_integrable cfg ε M K hKcfg hK L hsp hn hB s hN hk).integrableOn
        (integrable_const _)
        (ae_of_all _ (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s hN hk _).2))
    _ = _ := by rw [setIntegral_const,smul_eq_mul,mul_comm]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.firstLineForbiddenLaw_probability
#print axioms NoThreeLine.BirthWitness.firstLineForbiddenLaw_no_line_birth
#print axioms NoThreeLine.BirthWitness.firstLineForbiddenLaw_event_le
