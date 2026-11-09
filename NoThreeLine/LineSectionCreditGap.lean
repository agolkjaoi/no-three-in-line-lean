import NoThreeLine.LineSectionTerminalCapture
import NoThreeLine.ObservedCutSurvival

/-! The saved root credit need not equal the current credit after the extra
contact. Their difference, tested against the saved snapshot, has zero new
conditional mean. The interior branch uses the actual exponential survival
identity; this is not a pathwise identification of the two credits. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator

def lineSectionCreditGap {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (F : AugmentedState n → ℝ) (s : LineSectionObservation cfg) : ℝ :=
  (augTimedCredit cfg p s.1.1 - (s.2.2.physical.process.accounts p).credit) * F s.2.2

theorem lineSectionCreditGap_open {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (F : AugmentedState n → ℝ) (s : LineSectionObservation cfg)
    (hs : LineSectionInvariant cfg p s) (hf : s.2.1 = false) :
    lineSectionCreditGap cfg p F s = 0 := by
  simp only [lineSectionCreditGap,hs.live hf,augTimedCredit,sub_self,zero_mul]

theorem lineSectionObserverStep_credit_of_advance_le {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (z : CandidateData n) (hf : s.2.1 = false)
    (hle : augAdvance cfg ε M (augTimedInput cfg s.1.1,z.1.1) ≤
      selectedLineSectionTime cfg L p E A (augTimedInput cfg s.1.1).1.1) :
    ((lineSectionObserverStep cfg ε M start L p E A (s,z)).2.2.physical.process.accounts p).credit =
      augTimedCredit cfg p (lineSectionObserverStep cfg ε M start L p E A (s,z)).1.1 := by
  rw [lineSectionObserverStep_projection]
  by_cases hc : lineSectionStepClose cfg ε M start L p E A (s.1,z)
  · rw [lineSectionObserverStep_first_closure cfg ε M start L p E A (s,z) hf hc,
      lineSectionRawSnapshot_eq_raw cfg ε M start L p E A (s.1,z) hle]
    exact rawStepSaved_credit cfg ε M start (s.1,z) p
  · simp only [lineSectionObserverStep,hf,Bool.false_eq_true,if_false,if_neg hc,augTimedCredit]

theorem lineSectionCreditGap_step_of_advance_le {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (F : AugmentedState n → ℝ) (s : LineSectionObservation cfg) (z : CandidateData n)
    (hf : s.2.1 = false)
    (hle : augAdvance cfg ε M (augTimedInput cfg s.1.1,z.1.1) ≤
      selectedLineSectionTime cfg L p E A (augTimedInput cfg s.1.1).1.1) :
    lineSectionCreditGap cfg p F (lineSectionObserverStep cfg ε M start L p E A (s,z)) = 0 := by
  simp only [lineSectionCreditGap,
    lineSectionObserverStep_credit_of_advance_le cfg ε M start L p E A s z hf hle,sub_self,zero_mul]

theorem lineSectionCreditGap_step_mean {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (F : AugmentedState n → ℝ) (hn : 0 < n) (hB : 0 < cfg.B)
    (hm : ∀ q, cfg.mask q ≤ 1) (s : LineSectionObservation cfg)
    (hs : LineSectionInvariant cfg p s) :
    (∫ ω, lineSectionCreditGap cfg p F
      (lineSectionObserverStep cfg ε M start L p E A (s,WinnerMarkLaw.firstMarkedRace hn ω))
      ∂boardClockMeasure n (cfg.B/n)) = lineSectionCreditGap cfg p F s := by
  let μ := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let next := fun ω => observedStep cfg ε M start (s.1,WinnerMarkLaw.firstMarkedRace hn ω)
  let Z := fun ω => augTimedCredit cfg p (next ω).1
  have hZm : Measurable Z := (augTimedCredit_measurable cfg p).comp
    (((observedStep_measurable cfg ε M start).comp
      (measurable_const.prodMk (WinnerMarkLaw.firstMarkedRace_measurable hn))).fst)
  have hZi : Integrable Z μ := GenericCreditIteration.bounded_nonnegative_integrable μ Z hZm cfg.B
    (fun ω => augTimedCredit_bounds cfg p (next ω).1)
  by_cases hf : s.2.1 = true
  · have he (ω : BoardClockPath n) :=
      lineSectionObserverStep_preserves_frozen cfg ε M start L p E A (s,WinnerMarkLaw.firstMarkedRace hn ω) hf
    simp only [lineSectionCreditGap,lineSectionObserverStep_projection,he]
    rw [integral_mul_const,integral_sub hZi (integrable_const _)]
    have hc := augTimedClockStep_credit cfg ε M hn hB hm s.1.1 p
    change (∫ ω, Z ω ∂μ) = augTimedCredit cfg p s.1.1 at hc
    rw [hc,integral_const,probReal_univ,one_smul]
  · have hf' : s.2.1 = false := Bool.eq_false_iff.mpr hf
    rw [lineSectionCreditGap_open cfg p F s hs hf']
    let c := selectedLineSectionTime cfg L p E A (augTimedInput cfg s.1.1).1.1
    have hc0 : 0 ≤ c := (selectedLineSectionTime_bounds cfg L p E A _).1
    by_cases hG : c < augGuardTime cfg ε M (augTimedInput cfg s.1.1)
    · let a := selectedAugmentedCurve cfg (augTimedInput cfg s.1.1).1 c
      let V := {ω : BoardClockPath n | c < BoardFirstCandidate.firstTime hn ω}
      have hV : MeasurableSet V := measurableSet_lt measurable_const (BoardFirstCandidate.firstTime_measurable hn)
      have hd : ¬observationDone cfg s.1 := fun h => hs.open_root hf' (Or.inl h)
      have he (ω : BoardClockPath n) : lineSectionCreditGap cfg p F
          (lineSectionObserverStep cfg ε M start L p E A (s,WinnerMarkLaw.firstMarkedRace hn ω)) =
          V.indicator (fun ω => (Z ω - (a.physical.process.accounts p).credit) * F a) ω := by
        by_cases hv : ω ∈ V
        · have ht : c < augAdvance cfg ε M (augTimedInput cfg s.1.1,
              (WinnerMarkLaw.firstMarkedRace hn ω).1.1) :=
            (lt_min hG hv).trans_le (le_max_right _ _)
          have hp := lineSectionObserverStep_interior_contact cfg ε M start L p E A s _ hs hf' ht
          simp only [Set.indicator_of_mem hv,lineSectionCreditGap,lineSectionObserverStep_projection,hp.2.1]
          rfl
        · have hle : augAdvance cfg ε M (augTimedInput cfg s.1.1,
              (WinnerMarkLaw.firstMarkedRace hn ω).1.1) ≤ c :=
            max_le hc0 ((min_le_right _ _).trans (le_of_not_gt hv))
          rw [lineSectionCreditGap_step_of_advance_le cfg ε M start L p E A F s _ hf' hle,
            Set.indicator_of_notMem hv]
      simp_rw [he]
      rw [integral_indicator hV,integral_mul_const,integral_sub hZi.integrableOn (integrable_const _)]
      have hc := observedStep_survival_credit cfg ε M start hn hB hm s.1 hd p c ⟨hc0,hG.le⟩
      change (∫ ω in V, Z ω ∂μ) = Real.exp (-(n*cfg.B*c)) * (a.physical.process.accounts p).credit at hc
      rw [hc,setIntegral_const,smul_eq_mul,
        BoardFirstCandidate.candidate_firstTime_survival hn cfg.B c hB hc0,sub_self,zero_mul]
    · have hz (ω : BoardClockPath n) : lineSectionCreditGap cfg p F
          (lineSectionObserverStep cfg ε M start L p E A (s,WinnerMarkLaw.firstMarkedRace hn ω)) = 0 :=
        lineSectionCreditGap_step_of_advance_le cfg ε M start L p E A F s _ hf'
          ((augAdvance_mem cfg ε M (augTimedInput cfg s.1.1) s.1.1.property.1.1 _).2.trans (le_of_not_gt hG))
      simp only [hz,integral_zero]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineSectionObserverStep_credit_of_advance_le
#print axioms NoThreeLine.BirthWitness.lineSectionCreditGap_step_mean
