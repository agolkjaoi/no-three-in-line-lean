import NoThreeLine.LineStageInteriorSurvival
import NoThreeLine.CandidateGuardNoTie

/-! The actual selected flow reaches a given elapsed time, including the
guard endpoint. An exact candidate at the cut has zero original probability. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def firstLineCutReached {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (s : AugTimedState cfg) (u : ℝ) : Set (BoardClockPath n) :=
  {ω | u≤s.val.2-(augRecycledPair cfg ε M hn s 1 ω).1.val.2}

theorem firstLineCutReached_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (s : AugTimedState cfg) (u : ℝ) :
    MeasurableSet[augRecycledStateFiltration cfg ε M hn s 1]
      (firstLineCutReached cfg ε M hn s u) :=
  measurableSet_le measurable_const (measurable_const.sub
    (measurable_subtype_coe.snd.comp (StateHistory.state_measurable
      (fun k ω=>(augRecycledPair cfg ε M hn s k ω).1)
      (fun k=>(augRecycledPair_measurable cfg ε M hn s k).fst) 1)))

theorem firstLineCutReached_ae_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (s : AugTimedState cfg) (u : ℝ)
    (hd : ¬birthDone cfg s) (hu : 0≤u) (huT : u≤augGuardTime cfg ε M (augTimedInput cfg s)) :
    firstLineCutReached cfg ε M hn s u =ᵐ[boardClockMeasure n (cfg.B/n)]
      {ω | u<BoardFirstCandidate.firstTime hn ω} := by
  have hr := div_pos hB (show (0:ℝ)<n by exact_mod_cast hn)
  filter_upwards [actualFirstTime_ne_ae hn (cfg.B/n) hr u,
    BoardFirstCandidate.firstTime_ae_positive hn (cfg.B/n) hr] with ω hne hpos
  apply propext
  let z := WinnerMarkLaw.firstMarkedRace hn ω
  change (u≤s.val.2-(augTimedStep cfg ε M (s,z)).val.2) ↔ u<z.1.1
  change z.1.1≠u at hne
  rw [←birthElapsed_eq_remaining_drop cfg ε M (s,z)]
  simp only [birthElapsed,if_neg hd,augAdvance,cappedAdvance]
  constructor
  · intro h
    rcases hu.eq_or_lt with hzero | hpos
    · change 0<z.1.1 at hpos
      linarith
    · have hmin : u≤min (augGuardTime cfg ε M (augTimedInput cfg s)) z.1.1 :=
        (le_max_iff.mp h).resolve_left hpos.not_ge
      exact lt_of_le_of_ne ((le_min_iff.mp hmin).2) hne.symm
  · intro h
    exact le_max_of_le_right (le_min huT h.le)

theorem phaseLineForbiddenLaw_firstCutReached {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K)
    (u : ℝ) (hd : ¬birthDone cfg s) (hu : 0≤u) (huT : u≤augGuardTime cfg ε M (augTimedInput cfg s)) :
    (phaseLineForbiddenLaw cfg ε M K L N hn s).real (firstLineCutReached cfg ε M hn s u)=
      Real.exp (-((n:ℝ)*cfg.B*u))*selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L u := by
  rw [phaseLineForbiddenLaw_history_event cfg ε M K hKcfg hK L hsp N hN hn hB hm s ho hk 1 _
    (firstLineCutReached_history cfg ε M hn s u),
    Measure.restrict_congr_set (firstLineCutReached_ae_eq cfg ε M hn hB s u hd hu huT)]
  have hf (ω : BoardClockPath n) : lineStageDensity cfg K L N s (augRecycledPair cfg ε M hn s 1 ω).1=
      augTimedLineLikelihood cfg ε M L (s,WinnerMarkLaw.firstMarkedRace hn ω) := by
    unfold lineStageDensity
    change _*lineStageValue cfg K L N (augTimedStep cfg ε M (s,WinnerMarkLaw.firstMarkedRace hn ω))=_
    rw [lineStageValue_step_factor cfg ε M K hKcfg L hsp N hN s ho hk,←mul_assoc]
    change lineStageDensity cfg K L N s s * _=_
    rw [lineStageDensity_self cfg K L N s ho hk,one_mul]
  simp_rw [hf]
  rw [←integral_indicator (measurableSet_lt measurable_const (BoardFirstCandidate.firstTime_measurable hn))]
  exact augTimedLineLikelihood_survival_mean cfg ε M K hKcfg hK L hsp hn hB hm s (ho ▸ hN) hk hd u hu huT

theorem phaseLineForbiddenLaw_firstCutReached_ge {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K)
    (u : ℝ) (hd : ¬birthDone cfg s) (hu : 0≤u) (huT : u≤augGuardTime cfg ε M (augTimedInput cfg s)) :
    (boardClockMeasure n (cfg.B/n)).real (firstLineCutReached cfg ε M hn s u)≤
      (phaseLineForbiddenLaw cfg ε M K L N hn s).real (firstLineCutReached cfg ε M hn s u) := by
  rw [phaseLineForbiddenLaw_firstCutReached cfg ε M K hKcfg hK L hsp N hN hn hB hm s ho hk u hd hu huT,
    measureReal_def, measure_congr (firstLineCutReached_ae_eq cfg ε M hn hB s u hd hu huT),
    ←measureReal_def, BoardFirstCandidate.candidate_firstTime_survival hn cfg.B u hB hu]
  let x := (augTimedInput cfg s).1.1
  have he : x.val.Valid cfg.B := s.property.1.1
  have ht : u≤selectedGuardTime cfg x := huT.trans (augGuardTime_mem cfg ε M _ s.property.1.1).2
  have hs : x.val.process.stopped=false := by
    cases hh : x.val.process.stopped
    · rfl
    · exact (hd (Or.inr hh)).elim
  have hi := selected_specifiedLineIntensity_integral cfg x he K hKcfg hK L hs hsp
    (show occupancy x.val.process L≤1 from ho ▸ hN) hk u ⟨hu,ht⟩
  have h0 : 0≤∫t in (0:ℝ)..u,lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L :=
    intervalIntegral.integral_nonneg hu (fun t ht'=>lineIntensity_nonneg _ _ _ cfg.mask_nonneg
      (fun p=>((selectedCurve_spec cfg x he.2.1).2.2.1 t ⟨ht'.1,ht'.2.trans ht⟩).1.1 p |>.1) L)
  rw [hi] at h0
  exact le_mul_of_one_le_right (Real.exp_pos _).le (Real.one_le_exp_iff.mpr h0)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.firstLineCutReached_ae_eq
#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_firstCutReached
#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_firstCutReached_ge

