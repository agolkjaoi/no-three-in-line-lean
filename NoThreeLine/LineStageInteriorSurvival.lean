import NoThreeLine.ProtectedFirstSurvival
import NoThreeLine.LineStageConditionalLikelihood
import NoThreeLine.BirthRunningRate
import NoThreeLine.PhasePointLaw

/-! The whole-phase line law at a strict interior cut of the first
actual segment. The cut is observable from remaining-time differences;
the density before a candidate includes the actual selected-flow hazard. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def firstLineInteriorSurvival {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (s : AugTimedState cfg) (u : ℝ) : Set (BoardClockPath n) :=
  {ω | u<s.val.2-(augRecycledPair cfg ε M hn s 1 ω).1.val.2}

theorem firstLineInteriorSurvival_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (s : AugTimedState cfg) (u : ℝ) :
    MeasurableSet[augRecycledStateFiltration cfg ε M hn s 1]
      (firstLineInteriorSurvival cfg ε M hn s u) :=
  measurableSet_lt measurable_const (measurable_const.sub
    (measurable_subtype_coe.snd.comp (StateHistory.state_measurable
      (fun k ω=>(augRecycledPair cfg ε M hn s k ω).1)
      (fun k=>(augRecycledPair_measurable cfg ε M hn s k).fst) 1)))

theorem firstLineInteriorSurvival_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (s : AugTimedState cfg) (u : ℝ)
    (hd : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true))
    (hu : 0≤u) (huT : u<augGuardTime cfg ε M (augTimedInput cfg s)) :
    firstLineInteriorSurvival cfg ε M hn s u={ω | u<(WinnerMarkLaw.firstMarkedRace hn ω).1.1} := by
  ext ω
  let z := WinnerMarkLaw.firstMarkedRace hn ω
  change (u<s.val.2-(augTimedStep cfg ε M (s,z)).val.2) ↔ u<z.1.1
  rw [← birthElapsed_eq_remaining_drop cfg ε M (s,z)]
  simp only [birthElapsed,birthDone,if_neg hd,augAdvance,cappedAdvance,lt_max_iff,lt_min_iff,
    not_lt_of_ge hu,false_or]
  change (u<augGuardTime cfg ε M (augTimedInput cfg s) ∧ u<z.1.1) ↔ _
  simp only [huT,true_and]

theorem phaseLineForbiddenLaw_firstInterior_survival {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K)
    (hd : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true))
    (u : ℝ) (hu : 0≤u) (huT : u<augGuardTime cfg ε M (augTimedInput cfg s)) :
    (phaseLineForbiddenLaw cfg ε M K L N hn s).real (firstLineInteriorSurvival cfg ε M hn s u)=
      Real.exp (-((n:ℝ)*cfg.B*u))*selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L u := by
  rw [phaseLineForbiddenLaw_history_event cfg ε M K hKcfg hK L hsp N hN hn hB hm s ho hk 1 _
    (firstLineInteriorSurvival_history cfg ε M hn s u),
    firstLineInteriorSurvival_eq cfg ε M hn s u hd hu huT]
  have hf (ω : BoardClockPath n) : lineStageDensity cfg K L N s (augRecycledPair cfg ε M hn s 1 ω).1=
      augTimedLineLikelihood cfg ε M L (s,WinnerMarkLaw.firstMarkedRace hn ω) := by
    unfold lineStageDensity
    change _*lineStageValue cfg K L N (augTimedStep cfg ε M (s,WinnerMarkLaw.firstMarkedRace hn ω))=_
    rw [lineStageValue_step_factor cfg ε M K hKcfg L hsp N hN s ho hk,←mul_assoc]
    change lineStageDensity cfg K L N s s * _=_
    rw [lineStageDensity_self cfg K L N s ho hk,one_mul]
  simp_rw [hf]
  rw [←integral_indicator (measurableSet_lt measurable_const (WinnerMarkLaw.firstMarkedRace_measurable hn).fst.fst)]
  exact augTimedLineLikelihood_survival_mean cfg ε M K hKcfg hK L hsp hn hB hm s (ho ▸ hN) hk hd u hu huT.le

theorem phaseLineForbiddenLaw_firstInterior_ge {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K)
    (hd : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true))
    (u : ℝ) (hu : 0≤u) (huT : u<augGuardTime cfg ε M (augTimedInput cfg s)) :
    (boardClockMeasure n (cfg.B/n)).real (firstLineInteriorSurvival cfg ε M hn s u)≤
      (phaseLineForbiddenLaw cfg ε M K L N hn s).real (firstLineInteriorSurvival cfg ε M hn s u) := by
  rw [phaseLineForbiddenLaw_firstInterior_survival cfg ε M K hKcfg hK L hsp N hN hn hB hm s ho hk hd u hu huT,
    firstLineInteriorSurvival_eq cfg ε M hn s u hd hu huT]
  change (boardClockMeasure n (cfg.B/n)).real {ω | u<BoardFirstCandidate.firstTime hn ω}≤_
  rw [BoardFirstCandidate.candidate_firstTime_survival hn cfg.B u hB hu]
  let x := (augTimedInput cfg s).1.1
  have he : x.val.Valid cfg.B := s.property.1.1
  have ht : u≤selectedGuardTime cfg x := huT.le.trans (augGuardTime_mem cfg ε M _ s.property.1.1).2
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

#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_firstInterior_survival
#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_firstInterior_ge
