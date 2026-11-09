import NoThreeLine.BirthCountingEvent
import NoThreeLine.EtaMixedActualSegment

/-! The actual capped physical curve and its point birth rate. Clamping is
only an extension outside the flow interval; inside the guard it is identity. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def cappedProcess {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × ℝ) : ProcessState n :=
  (selectedTrajectory cfg ((augTimedInput cfg x.1).1.1,
    augAdvance cfg ε M (augTimedInput cfg x.1,x.2))).process

theorem cappedProcess_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (cappedProcess cfg ε M) :=
  (ExtendedState.measurable_process n).comp ((selectedTrajectory_measurable cfg).comp
    ((((augTimedInput_measurable cfg).comp measurable_fst).fst.fst).prodMk
      ((augAdvance_measurable cfg ε M).comp
        (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd))))

theorem augPreState_process_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (z : CandidateData n) :
    (augPreState cfg ε M (augTimedInput cfg s,z)).physical.process=cappedProcess cfg ε M (s,z.1.1) := rfl

theorem cappedProcess_weight_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (t : ℝ) (p : Grid n) :
    0≤((cappedProcess cfg ε M (s,t)).accounts p).weight ∧
      ((cappedProcess cfg ε M (s,t)).accounts p).weight≤cfg.B := by
  have ha := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 t
  have hv := selectedTrajectory_valid cfg (augTimedInput cfg s).1.1 s.property.1.1 _
    ⟨ha.1,ha.2.trans (augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1).2⟩
  exact hv.2.1.1 p

theorem cappedProcess_eq_flow {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (t : ℝ) (ht : t∈Icc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg s))) :
    cappedProcess cfg ε M (s,t)=(selectedTrajectory cfg ((augTimedInput cfg s).1.1,t)).process := by
  have ha : augAdvance cfg ε M (augTimedInput cfg s,t)=t := by
    change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s)) t)=t
    rw [min_eq_right ht.2,max_eq_right ht.1]
  simp only [cappedProcess,ha]

def cappedBirthRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (x : AugTimedState cfg × ℝ) : ℝ := (cappedProcess cfg ε M x).birthRate cfg.mask p

theorem process_birthRate_measurable {n : ℕ} (mask : Grid n → ℝ) (p : Grid n) :
    Measurable (fun s : ProcessState n => s.birthRate mask p) := by
  unfold ProcessState.birthRate
  apply Measurable.ite
  · exact (((ProcessState.measurable_stopped n).eq measurable_const).and
      ((CreditAccount.measurable_status.comp (ProcessState.measurable_account n p)).eq measurable_const)).setOf
  · exact ((CreditAccount.measurable_weight.comp (ProcessState.measurable_account n p)).const_mul _).div_const n
  · exact measurable_const

theorem cappedBirthRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (cappedBirthRate cfg ε M p) :=
  (process_birthRate_measurable cfg.mask p).comp (cappedProcess_measurable cfg ε M)

theorem cappedBirthRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (x : AugTimedState cfg × ℝ) :
    0≤cappedBirthRate cfg ε M p x ∧ cappedBirthRate cfg ε M p x≤cfg.B/n := by
  have hα := (cappedProcess cfg ε M x).acceptance_bounds cfg.mask cfg.B hB
    (fun q=>⟨cfg.mask_nonneg q,hm q⟩) (fun q _=>cappedProcess_weight_bounds cfg ε M x.1 x.2 q) p
  unfold cappedBirthRate
  rw [← ProcessState.candidate_rate_times_acceptance _ cfg.mask cfg.B hB.ne' p]
  have hb : 0≤cfg.B/(n:ℝ) := div_nonneg hB.le (by positivity)
  exact ⟨mul_nonneg hb hα.1,mul_le_of_le_one_right hb hα.2⟩

theorem indicator_factor_of_iff (P W Q : Prop) [Decidable P] [Decidable W] [Decidable Q]
    (h : P ↔ W ∧ Q) : (if P then (1:ℝ) else 0) = if W then (if Q then 1 else 0) else 0 := by
  by_cases hw : W
  · rw [if_pos hw]
    by_cases hq : Q
    · rw [if_pos hq,if_pos (h.mpr ⟨hw,hq⟩)]
    · rw [if_neg hq,if_neg (fun hp=>hq (h.mp hp).2)]
  · rw [if_neg hw,if_neg (fun hp=>hw (h.mp hp).1)]

theorem birthIndicator_time_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p q : Grid n)
    (s : AugTimedState cfg) (t z : ℝ) :
    birthIndicator cfg ε M p (s,((t,q),z))=
      if ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) ∧
          0<t ∧ t≤augGuardTime cfg ε M (augTimedInput cfg s) then
        markBirthIndicator (cappedProcess cfg ε M (s,t)) cfg.mask cfg.B p q z else 0 := by
  classical
  unfold birthIndicator markBirthIndicator
  apply indicator_factor_of_iff
  simp only [timedBirth,segmentBirth,augPreState_process_eq,eligibleBirth]
  tauto

theorem birthIndicator_mark_mean {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (t : ℝ) :
    (∑ q : Grid n, ∫z,birthIndicator cfg ε M p (s,((t,q),z)) ∂markMeasure)=
      if ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) ∧
          0<t ∧ t≤augGuardTime cfg ε M (augTimedInput cfg s) then
        (cappedProcess cfg ε M (s,t)).acceptance cfg.mask cfg.B p else 0 := by
  classical
  simp_rw [birthIndicator_time_eq]
  split_ifs with h
  · simp_rw [markBirthIndicator_mean _ cfg.mask cfg.B hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
      (fun q _=>cappedProcess_weight_bounds cfg ε M s t q) p]
    simp
  · simp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cappedBirthRate_bounds
#print axioms NoThreeLine.BirthWitness.birthIndicator_mark_mean
