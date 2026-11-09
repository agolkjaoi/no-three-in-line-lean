import NoThreeLine.RunningIntegralRegularity
import NoThreeLine.WitnessHistoryEstimate

/-! The actual S7 running source increment, integrated only over the real
elapsed time of this step. Its board expectation equals stepSourceIntegral. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def observedAdvance {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : TimedObservation cfg×CandidateData n) : ℝ :=
  if observationDone cfg x.1 then 0 else augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1)

theorem observedAdvance_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (observedAdvance cfg ε M) := Measurable.ite
      ((observationDone_measurable cfg).comp measurable_fst).setOf measurable_const
      ((augAdvance_measurable cfg ε M).comp
        (((augTimedInput_measurable cfg).comp measurable_fst.fst).prodMk measurable_snd.fst.fst))

theorem observedAdvance_mem {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : TimedObservation cfg×CandidateData n) :
    observedAdvance cfg ε M x∈Icc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg x.1.1)) := by
  unfold observedAdvance
  split_ifs
  · exact ⟨le_rfl,(augGuardTime_mem cfg ε M _ x.1.1.property.1.1).1⟩
  · exact augAdvance_mem cfg ε M _ x.1.1.property.1.1 x.2.1.1

theorem observedAdvance_eq_remaining_drop {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg×CandidateData n) :
    observedAdvance cfg ε M x=x.1.1.val.2-(observedStep cfg ε M start x).1.val.2 := by
  change _=x.1.1.val.2-(augTimedStepPair cfg ε M (x.1.1,x.2)).2
  unfold observedAdvance observationDone augTimedStepPair
  split_ifs <;> ring

def runningSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (x : TimedObservation cfg×CandidateData n) : ℝ :=
  ∫t in (0:ℝ)..observedAdvance cfg ε M x,
    selectedSourceSum cfg (augTimedInput cfg x.1.1).1 (recordedValue e x.1.2) C D L e
      (observationTime cfg start x.1.1) t

theorem runningSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) : Measurable (runningSource cfg ε M start e C D L) :=
  variable_running_integral_measurable _ (observedAdvance_measurable cfg ε M)
    (fun x=>(observedAdvance_mem cfg ε M x).1) _
    ((selectedSourceSum_joint_measurable cfg e start C D L).comp (measurable_fst.fst.prodMk measurable_snd))

theorem selectedSourceSum_guard_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (s : TimedObservation cfg) (C D L : Finset (Grid n))
    (hs : RecordsConsistent cfg s) (hx : ¬observationDone cfg s)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (t : ℝ)
    (ht : t∈Ioo (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg s.1))) :
    0≤selectedSourceSum cfg (augTimedInput cfg s.1).1 (recordedValue e s.2) C D L e
        (observationTime cfg start s.1) t ∧
      selectedSourceSum cfg (augTimedInput cfg s.1).1 (recordedValue e s.2) C D L e
        (observationTime cfg start s.1) t≤sourceCap cfg.directions C D cfg.B cfg.K := by
  by_cases hC : C⊆s.1.val.1.physical.process.activeEvents
  swap
  · rw [selectedSourceSum_zero_of_not_active cfg (augTimedInput cfg s.1).1 _ C D L e _ _ hC]
    exact ⟨le_rfl,sourceCap_nonneg _ _ _ _ _⟩
  have hstop : s.1.val.1.physical.process.stopped=false := by
    cases hh : s.1.val.1.physical.process.stopped
    · rfl
    · exact False.elim (hx (Or.inr hh))
  have hT := augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1
  apply sourceSum_bounds _ cfg.directions C D L cfg.mask _ cfg.B cfg.K
    (selectedWitnessCurve_valid cfg _ (recordedValue e s.2) (observedWitness_valid cfg e s hs)
      t ⟨ht.1.le,ht.2.le.trans hT.2⟩)
    (fun q=>⟨cfg.mask_nonneg q,hm q⟩) (fun q=>e.bounds q _) hK
  intro q _ J hj hsp
  exact (shared_clock_selected_lt cfg (augTimedInput cfg s.1).1.1 C q s.1.property.1.1 hstop hC t
    ⟨ht.1.le,ht.2.trans_le hT.2⟩ J hj hsp).le

theorem runningSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (x : TimedObservation cfg×CandidateData n)
    (hs : RecordsConsistent cfg x.1) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) :
    0≤runningSource cfg ε M start e C D L x ∧ runningSource cfg ε M start e C D L x≤
      (cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K := by
  by_cases hx : observationDone cfg x.1
  · simp only [runningSource,observedAdvance,if_pos hx,intervalIntegral.integral_same]
    exact ⟨le_rfl,mul_nonneg cfg.horizon.coe_nonneg (sourceCap_nonneg _ _ _ _ _)⟩
  · have ha := observedAdvance_mem cfg ε M x
    have hb := integral_initial_segment_bounds _ _ ha.1 ha.2 _
      (selectedSourceSum_measurable cfg (augTimedInput cfg x.1.1).1 _ C D L e _)
      (sourceCap cfg.directions C D cfg.B cfg.K) (sourceCap_nonneg _ _ _ _ _)
      (selectedSourceSum_guard_bounds cfg ε M start e x.1 C D L hs hx hm hK)
    refine ⟨hb.1,hb.2.trans ?_⟩
    exact mul_le_mul_of_nonneg_right
      ((augGuardTime_le_remaining cfg ε M _ x.1.1.property.2.1).trans x.1.1.property.2.2)
      (sourceCap_nonneg _ _ _ _ _)

def clockRunningSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (x : TimedObservation cfg×BoardClockPath n) : ℝ :=
  runningSource cfg ε M start e C D L (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem clockRunningSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) : Measurable (clockRunningSource cfg ε M start e C D L hn) :=
  (runningSource_measurable cfg ε M start e C D L).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

theorem clockRunningSource_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (s : TimedObservation cfg) (hs : RecordsConsistent cfg s) :
    (∫ω,clockRunningSource cfg ε M start e C D L hn (s,ω) ∂boardClockMeasure n (cfg.B/n))=
      stepSourceIntegral cfg ε M start e C D L s := by
  by_cases hx : observationDone cfg s
  · simp only [clockRunningSource,runningSource,observedAdvance,if_pos hx,
      intervalIntegral.integral_same,integral_zero,stepSourceIntegral]
  · let T := augGuardTime cfg ε M (augTimedInput cfg s.1)
    let S := selectedSourceSum cfg (augTimedInput cfg s.1).1 (recordedValue e s.2) C D L e
      (observationTime cfg start s.1)
    have hS := selectedSourceSum_measurable cfg (augTimedInput cfg s.1).1 (recordedValue e s.2) C D L e (observationTime cfg start s.1)
    have hi := exponential_running_integral ((n:ℝ)*cfg.B) T (mul_pos (by exact_mod_cast hn) hB)
      (augGuardTime_mem cfg ε M _ s.1.property.1.1).1 S hS
      (sourceCap cfg.directions C D cfg.B cfg.K) (sourceCap_nonneg _ _ _ _ _)
      (selectedSourceSum_guard_bounds cfg ε M start e s C D L hs hx hm hK)
    rw [←BoardFirstCandidate.candidate_firstTime_map hn cfg.B hB,
      integral_map_of_stronglyMeasurable (BoardFirstCandidate.firstTime_measurable hn)
        (running_integral_measurable T S hS).stronglyMeasurable] at hi
    simpa only [clockRunningSource,runningSource,observedAdvance,stepSourceIntegral,if_neg hx,
      observedSourceIntegral,T,S,augAdvance,cappedAdvance,augGuardTime,WinnerMarkLaw.firstMarkedRace,
      BoardWinnerLaw.firstRace] using hi

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedAdvance_eq_remaining_drop
#print axioms NoThreeLine.BirthWitness.runningSource_measurable
#print axioms NoThreeLine.BirthWitness.clockRunningSource_mean
