import NoThreeLine.BirthFirstMean
import NoThreeLine.RunningIntegralRegularity
import NoThreeLine.AugmentedTimedProgress

/-! Integrate the actual point birth rate over the actual elapsed segment.
Its board expectation is the actual point-birth probability of that step. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def birthDone {n : ℕ} (cfg : FlowConfig n) (s : AugTimedState cfg) : Prop :=
  s.val.2≤0 ∨ s.val.1.physical.process.stopped=true

instance {n : ℕ} (cfg : FlowConfig n) (s : AugTimedState cfg) : Decidable (birthDone cfg s) :=
  inferInstanceAs (Decidable (_∨_))

theorem birthDone_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (birthDone cfg) :=
  (measurable_subtype_coe.snd.le' measurable_const).or
    (((ProcessState.measurable_stopped n).comp ((ExtendedState.measurable_process n).comp
      ((AugmentedState.measurable_physical n).comp measurable_subtype_coe.fst))).eq measurable_const)

theorem birthDone_iff {n : ℕ} (cfg : FlowConfig n) (s : AugTimedState cfg) :
    birthDone cfg s ↔ AugTimedDone cfg s := by
  constructor
  · rintro (h|h)
    · exact Or.inl (le_antisymm h s.property.2.1)
    · exact Or.inr h
  · rintro (h|h)
    · exact Or.inl h.le
    · exact Or.inr h

def birthElapsed {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × CandidateData n) : ℝ :=
  if birthDone cfg x.1 then 0 else augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1)

theorem birthElapsed_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (birthElapsed cfg ε M) :=
  Measurable.ite ((birthDone_measurable cfg).comp measurable_fst).setOf measurable_const
    ((augAdvance_measurable cfg ε M).comp
      (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd.fst.fst))

theorem birthElapsed_mem {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × CandidateData n) :
    birthElapsed cfg ε M x∈Icc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg x.1)) := by
  unfold birthElapsed
  split_ifs
  · exact ⟨le_rfl,(augGuardTime_mem cfg ε M _ x.1.property.1.1).1⟩
  · exact augAdvance_mem cfg ε M _ x.1.property.1.1 x.2.1.1

theorem birthElapsed_eq_remaining_drop {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × CandidateData n) :
    birthElapsed cfg ε M x=x.1.val.2-(augTimedStep cfg ε M x).val.2 := by
  change _=x.1.val.2-(augTimedStepPair cfg ε M x).2
  unfold birthElapsed birthDone augTimedStepPair
  split_ifs <;> ring

def birthRunningRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (x : AugTimedState cfg × CandidateData n) : ℝ :=
  ∫t in (0:ℝ)..birthElapsed cfg ε M x, cappedBirthRate cfg ε M p (x.1,t)

theorem birthRunningRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (birthRunningRate cfg ε M p) :=
  variable_running_integral_measurable _ (birthElapsed_measurable cfg ε M)
    (fun x=>(birthElapsed_mem cfg ε M x).1) _
    ((cappedBirthRate_measurable cfg ε M p).comp (measurable_fst.fst.prodMk measurable_snd))

theorem birthRunningRate_elapsed_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (x : AugTimedState cfg × CandidateData n) :
    0≤birthRunningRate cfg ε M p x ∧
      birthRunningRate cfg ε M p x≤birthElapsed cfg ε M x*(cfg.B/n) :=
  integral_initial_segment_bounds _ _ (birthElapsed_mem cfg ε M x).1 le_rfl _
    ((cappedBirthRate_measurable cfg ε M p).comp (measurable_const.prodMk measurable_id))
    (cfg.B/n) (div_nonneg hB.le (by positivity))
    (fun t _=>cappedBirthRate_bounds cfg ε M p hn hB hm (x.1,t))

theorem birthRunningRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (x : AugTimedState cfg × CandidateData n) :
    0≤birthRunningRate cfg ε M p x ∧ birthRunningRate cfg ε M p x≤(cfg.horizon:ℝ)*(cfg.B/n) := by
  have hb := birthRunningRate_elapsed_bound cfg ε M p hn hB hm x
  refine ⟨hb.1,hb.2.trans ?_⟩
  exact mul_le_mul_of_nonneg_right ((birthElapsed_mem cfg ε M x).2.trans
    ((augGuardTime_le_remaining cfg ε M _ x.1.property.2.1).trans x.1.property.2.2))
      (div_nonneg hB.le (by positivity))

theorem birthMeanIntegral_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (birthMeanIntegral cfg ε M p) := by
  have hcap : Measurable (fun s : AugTimedState cfg => augGuardTime cfg ε M (augTimedInput cfg s)) :=
    (augGuardTime_measurable cfg ε M).comp (augTimedInput_measurable cfg)
  apply Measurable.ite (birthDone_measurable cfg).setOf measurable_const
  exact variable_running_integral_measurable _ hcap
    (fun s=>(augGuardTime_mem cfg ε M _ s.property.1.1).1) _
    (((measurable_snd.const_mul ((n:ℝ)*cfg.B)).neg.exp).mul (cappedBirthRate_measurable cfg ε M p))

def clockBirthRunningRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n)
    (x : AugTimedState cfg × BoardClockPath n) : ℝ :=
  birthRunningRate cfg ε M p (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem clockBirthRunningRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n) :
    Measurable (clockBirthRunningRate cfg ε M p hn) :=
  (birthRunningRate_measurable cfg ε M p).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

theorem clockBirthRunningRate_mean {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) :
    (∫ω,clockBirthRunningRate cfg ε M p hn (s,ω) ∂boardClockMeasure n (cfg.B/n))=
      birthMeanIntegral cfg ε M p s := by
  by_cases hd : birthDone cfg s
  · change s.val.2≤0 ∨ s.val.1.physical.process.stopped=true at hd
    simp only [clockBirthRunningRate,birthRunningRate,birthElapsed,birthDone,if_pos hd,intervalIntegral.integral_same,
      integral_zero,birthMeanIntegral]
  · change ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) at hd
    have hi := exponential_running_integral ((n:ℝ)*cfg.B)
      (augGuardTime cfg ε M (augTimedInput cfg s)) (mul_pos (by exact_mod_cast hn) hB)
      (augGuardTime_mem cfg ε M _ s.property.1.1).1
      (fun t=>cappedBirthRate cfg ε M p (s,t))
      ((cappedBirthRate_measurable cfg ε M p).comp (measurable_const.prodMk measurable_id))
      (cfg.B/n) (div_nonneg hB.le (by positivity))
      (fun t _=>cappedBirthRate_bounds cfg ε M p hn hB hm (s,t))
    have hrun : Measurable (fun w : ℝ => ∫t in (0:ℝ)..max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s)) w),
        cappedBirthRate cfg ε M p (s,t)) :=
      running_integral_measurable _ _
        ((cappedBirthRate_measurable cfg ε M p).comp (measurable_const.prodMk measurable_id))
    rw [← BoardFirstCandidate.candidate_firstTime_map hn cfg.B hB,
      integral_map_of_stronglyMeasurable (BoardFirstCandidate.firstTime_measurable hn)
        hrun.stronglyMeasurable] at hi
    simpa only [clockBirthRunningRate,birthRunningRate,birthElapsed,birthDone,birthMeanIntegral,if_neg hd,
      augAdvance,cappedAdvance,augGuardTime,WinnerMarkLaw.firstMarkedRace,BoardWinnerLaw.firstRace] using hi

theorem first_birth_running_mean {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) :
    (∫ω,birthIndicator cfg ε M p (s,WinnerMarkLaw.firstMarkedRace hn ω) ∂boardClockMeasure n (cfg.B/n))=
      ∫ω,clockBirthRunningRate cfg ε M p hn (s,ω) ∂boardClockMeasure n (cfg.B/n) :=
  (first_birth_mean cfg ε M p hn hB hm s).trans (clockBirthRunningRate_mean cfg ε M p hn hB hm s).symm

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.birthElapsed_eq_remaining_drop
#print axioms NoThreeLine.BirthWitness.birthRunningRate_elapsed_bound
#print axioms NoThreeLine.BirthWitness.first_birth_running_mean
