import NoThreeLine.RootFreezeStep

/-! The actual first-board S7 inequality for the simultaneously frozen
root observer. No active-root premise is needed. Its source is zero after
the snapshot freezes; the physical process continues to be the original one. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator

theorem rawStepSaved_source_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (s : TimedObservation cfg) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hs : RecordsConsistent cfg s)
    (hCL : C⊆L) (hCD : Disjoint C D) (hE : EmptyLineCredit s.1.val.1.physical) (hK : cfg.K<2) :
    (∫ω,mixed cfg.directions C D L
      (savedWitness e (rawStepSaved cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)))
      ∂boardClockMeasure n (cfg.B/n))≤
      mixed cfg.directions C D L (observedWitness cfg e s)+stepSourceIntegral cfg ε M start e C D L s := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  by_cases hx : observationDone cfg s
  · simp only [rawStepSaved,if_pos hx,savedWitness_observation,stepSourceIntegral,
      integral_const,probReal_univ,one_smul,add_zero,le_refl]
  · rw [stepSourceIntegral,if_neg hx]
    by_cases hC : C⊆s.1.val.1.physical.process.activeEvents
    · have ha := observedWitness_valid cfg e s hs
      have hstop : s.1.val.1.physical.process.stopped=false := by
        cases hh : s.1.val.1.physical.process.stopped
        · rfl
        · exact False.elim (hx (Or.inr hh))
      have hi := actual_raw_guard_source_bound cfg ε M (observationTime cfg start s.1)
        (augTimedInput cfg s.1) e s.2 C D L hn hB hm ha hstop hC hCL hCD hE hK
      rw [selectedWitnessCurve_initial cfg (augTimedInput cfg s.1).1 _ ha.1.1] at hi
      convert hi using 1
      · apply integral_congr_ae
        exact Filter.Eventually.of_forall (fun ω=>by
          change mixed cfg.directions C D L
            (savedWitness e (rawStepSaved cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)))=_
          rw [rawStepSaved_witness cfg ε M start e (s,WinnerMarkLaw.firstMarkedRace hn ω) hx]
          rfl)
      · rfl
    · have hf (ω : BoardClockPath n) : mixed cfg.directions C D L
          (savedWitness e (rawStepSaved cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)))=0 := by
        apply mixed_eq_zero_of_not_active
        simp only [savedWitness,rawStepSaved,if_neg hx]
        intro h
        exact hC (h.trans (augRawOutcome_active_subset cfg ε M _))
      rw [mixed_eq_zero_of_not_active _ cfg.directions C D L hC,
        observedSourceIntegral_zero_of_not_active cfg ε M start e s C D L hC]
      simp only [hf,integral_zero,add_zero,le_refl]

def rootStepSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (s : RootObservation cfg) : ℝ :=
  if s.2.1=true then 0 else stepSourceIntegral cfg ε M start e C D L s.1

theorem rootStepSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) :
    Measurable (rootStepSource cfg ε M start e C D L) :=
  Measurable.ite (measurable_snd.fst.eq measurable_const).setOf measurable_const
    ((stepSourceIntegral_measurable cfg ε M start e C D L).comp measurable_fst)

theorem rootStepSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (p : Grid n) (s : RootObservation cfg) (C D L : Finset (Grid n))
    (hs : RootObserverInvariant cfg p s) (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) :
    0≤rootStepSource cfg ε M start e C D L s ∧
      rootStepSource cfg ε M start e C D L s≤(cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K := by
  unfold rootStepSource
  split_ifs
  · exact ⟨le_rfl,mul_nonneg cfg.horizon.coe_nonneg (sourceCap_nonneg _ _ _ _ _)⟩
  · exact stepSourceIntegral_bounds cfg ε M start e s.1 C D L hs.records hB hm hK

theorem rootObserverStep_source_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (p : Grid n) (s : RootObservation cfg) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hs : RootObserverInvariant cfg p s)
    (hCL : C⊆L) (hCD : Disjoint C D) (hE : EmptyLineCredit s.1.1.val.1.physical) (hK : cfg.K<2) :
    (∫ω,mixed cfg.directions C D L
      (savedWitness e (rootObserverStep cfg ε M start p (s,WinnerMarkLaw.firstMarkedRace hn ω)).2.2)
      ∂boardClockMeasure n (cfg.B/n))≤
      mixed cfg.directions C D L (savedWitness e s.2.2)+rootStepSource cfg ε M start e C D L s := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  by_cases hf : s.2.1=true
  · have heq (ω : BoardClockPath n) := rootObserverStep_preserves_frozen cfg ε M start p
      (s,WinnerMarkLaw.firstMarkedRace hn ω) hf
    simp only [heq,rootStepSource,if_pos hf,add_zero,integral_const,probReal_univ,one_smul,le_refl]
  · have hf' : s.2.1=false := Bool.eq_false_iff.mpr hf
    rw [rootStepSource,if_neg hf,hs.live hf',savedWitness_observation]
    apply le_trans _ (rawStepSaved_source_bound cfg ε M start e s.1 C D L hn hB hm hs.records hCL hCD hE hK)
    apply integral_mono
    · refine mixed_integrable _ _ ?_ cfg.directions C D L cfg.B ?_
      · exact (savedWitness_measurable e).comp
          (((rootObserverStep_measurable cfg ε M start p).comp
            (measurable_const.prodMk (WinnerMarkLaw.firstMarkedRace_measurable hn))).snd.snd)
      · intro ω
        exact savedWitness_valid cfg.B e _
          (rootObserverStep_invariant cfg ε M start p s _ hs).saved
    · refine mixed_integrable _ _ ?_ cfg.directions C D L cfg.B ?_
      · exact (savedWitness_measurable e).comp ((rawStepSaved_measurable cfg ε M start).comp
          (measurable_const.prodMk (WinnerMarkLaw.firstMarkedRace_measurable hn)))
      · intro ω
        exact savedWitness_valid cfg.B e _ (rawStepSaved_valid cfg ε M start _ hs.records)
    · intro ω
      exact rootObserverStep_mixed_le_raw cfg ε M start e p s _ C D L hs hf'

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rawStepSaved_source_bound
#print axioms NoThreeLine.BirthWitness.rootStepSource_measurable
#print axioms NoThreeLine.BirthWitness.rootObserverStep_source_bound
