import NoThreeLine.ProtectedLineFirstLikelihood
import NoThreeLine.ProtectedLineSurvivalFlow

/-! The actual original-board first candidate, restricted to survival
beyond u, has exactly exp(-n B u) times the selected-flow likelihood. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem augTimedLineLikelihood_survival_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (hN : occupancy s.val.1.physical.process L≤1)
    (hk : s.val.1.physical.clocks L≤K)
    (hd : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true))
    (u : ℝ) (hu : 0≤u) (huT : u≤augGuardTime cfg ε M (augTimedInput cfg s)) :
    (∫ω,(if u<(WinnerMarkLaw.firstMarkedRace hn ω).1.1 then
      augTimedLineLikelihood cfg ε M L (s,WinnerMarkLaw.firstMarkedRace hn ω) else 0)
      ∂boardClockMeasure n (cfg.B/n))=
      Real.exp (-((n:ℝ)*cfg.B*u))*selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L u := by
  classical
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB hnR)
  letI := isProbabilityMeasure_expMeasure (mul_pos hnR hB)
  let F := fun z : CandidateData n=>if u<z.1.1 then augTimedLineLikelihood cfg ε M L (s,z) else 0
  have hFm : Measurable F :=
    (augTimedLineLikelihood_section_measurable cfg ε M L s).piecewise
      (measurableSet_lt measurable_const measurable_fst.fst) measurable_const
  have hFb : ∀z,0≤F z ∧ F z≤(2/(2-K))^2 := by
    intro z
    dsimp only [F]
    split_ifs
    · exact augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s hN hk z
    · exact ⟨le_rfl,sq_nonneg _⟩
  have hf : Integrable F
      (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hFm ((2/(2-K))^2) hFb
  change (∫ω,F (WinnerMarkLaw.firstMarkedRace hn ω) ∂boardClockMeasure n (cfg.B/n))=_
  rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB F hf]
  let J := fun t=>if t≤augGuardTime cfg ε M (augTimedInput cfg s) then
    selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L t*
      (1-lineIntensity s.val.1.physical.process cfg.mask
        (selectedCurve cfg ((augTimedInput cfg s).1.1,t)) L/((n:ℝ)*cfg.B))
    else selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L
      (augGuardTime cfg ε M (augTimedInput cfg s))
  have heq : (∫t,(∑q : Grid n,∫z,F ((t,q),z) ∂markMeasure)/(n:ℝ)^2 ∂expMeasure ((n:ℝ)*cfg.B))=
      ∫t,(if u<t then J t else 0) ∂expMeasure ((n:ℝ)*cfg.B) := by
    apply integral_congr_ae
    filter_upwards [expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos hnR hB)] with t ht
    by_cases hut : u<t
    · simp only [F,hut,if_true]
      exact augTimedLineLikelihood_candidate_mean cfg ε M L hn hB hm s hd t ht
    · simp only [F,hut,if_false,integral_zero,Finset.sum_const_zero,zero_div]
  rw [heq]
  change (∫t,(Ioi u).indicator J t ∂expMeasure ((n:ℝ)*cfg.B))=_
  rw [integral_indicator measurableSet_Ioi]
  have hstop : s.val.1.physical.process.stopped=false := by
    cases hs : s.val.1.physical.process.stopped <;> simp_all
  exact selectedLineLikelihood_survival_mean cfg (augTimedInput cfg s).1.1 s.property.1.1
    K hKcfg hK L hstop hsp hN hk ((n:ℝ)*cfg.B) u _ (mul_pos hnR hB) hu huT
    (augGuardTime_mem cfg ε M _ s.property.1.1).2

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.augTimedLineLikelihood_survival_mean
