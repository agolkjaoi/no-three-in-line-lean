import NoThreeLine.CappedBirthRate
import NoThreeLine.MixedDriftDecomposition

/-! Survival of a specified line at one actual timed marked candidate.
The mark/label average is computed from the real acceptance rule. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def lineCandidateSurvival {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (x : AugTimedState cfg × CandidateData n) : ℝ :=
  if timedBirth cfg ε M x ∧ x.2.1.2∈L.val then 0 else 1

theorem lineCandidateSurvival_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) :
    Measurable (lineCandidateSurvival cfg ε M L) := by
  apply Measurable.ite _ measurable_const measurable_const
  exact ((timedBirth_measurable cfg ε M).and
    ((measurable_of_countable (fun q : Grid n=>q∈L.val)).comp measurable_snd.fst.snd)).setOf

theorem lineCandidateSurvival_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (x : AugTimedState cfg × CandidateData n) :
    0≤lineCandidateSurvival cfg ε M L x ∧ lineCandidateSurvival cfg ε M L x≤1 := by
  unfold lineCandidateSurvival
  split_ifs <;> norm_num

theorem lineCandidateSurvival_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (s : AugTimedState cfg) (t : ℝ) (q : Grid n) (z : ℝ) :
    lineCandidateSurvival cfg ε M L (s,((t,q),z))=
      1-(if q∈L.val then birthIndicator cfg ε M q (s,((t,q),z)) else 0) := by
  classical
  unfold lineCandidateSurvival birthIndicator
  by_cases h : timedBirth cfg ε M (s,((t,q),z)) <;> by_cases hq : q∈L.val <;> simp [h,hq]

theorem lineCandidateSurvival_mark_mean {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (t : ℝ) (q : Grid n) :
    (∫z,lineCandidateSurvival cfg ε M L (s,((t,q),z)) ∂markMeasure)=
      1-(if ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) ∧
          0<t ∧ t≤augGuardTime cfg ε M (augTimedInput cfg s) then
        if q∈L.val then (cappedProcess cfg ε M (s,t)).acceptance cfg.mask cfg.B q else 0 else 0) := by
  classical
  simp_rw [lineCandidateSurvival_eq]
  by_cases hq : q∈L.val
  · simp only [if_pos hq]
    have hi : Integrable (fun z=>birthIndicator cfg ε M q (s,((t,q),z))) markMeasure :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        ((birthIndicator_measurable cfg ε M q).comp
          (measurable_const.prodMk (measurable_const.prodMk measurable_id))) 1
        (fun z=>birthIndicator_bounds cfg ε M q _)
    rw [integral_sub (integrable_const 1) hi]
    simp_rw [birthIndicator_time_eq]
    by_cases ht : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) ∧
        0<t ∧ t≤augGuardTime cfg ε M (augTimedInput cfg s)
    · simp only [if_pos ht]
      rw [markBirthIndicator_mean _ cfg.mask cfg.B hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
        (fun q _=>cappedProcess_weight_bounds cfg ε M s t q) q q]
      simp
    · simp only [if_neg ht,integral_zero]
      simp
  · simp [hq]

theorem lineCandidateSurvival_candidate_mean {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (t : ℝ)
    (hd : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true))
    (ht : 0<t ∧ t≤augGuardTime cfg ε M (augTimedInput cfg s)) :
    (∑q : Grid n,∫z,lineCandidateSurvival cfg ε M L (s,((t,q),z)) ∂markMeasure)/(n:ℝ)^2=
      1-(∑p∈L.val,cappedBirthRate cfg ε M p (s,t))/((n:ℝ)*cfg.B) := by
  classical
  have htime : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) ∧
      0<t ∧ t≤augGuardTime cfg ε M (augTimedInput cfg s) := ⟨hd,ht⟩
  simp_rw [lineCandidateSurvival_mark_mean cfg ε M L hB hm s t,if_pos htime]
  rw [Finset.sum_sub_distrib]
  have hsum : (∑q : Grid n,if q∈L.val then (cappedProcess cfg ε M (s,t)).acceptance cfg.mask cfg.B q else 0)=
      ∑q∈L.val,(cappedProcess cfg ε M (s,t)).acceptance cfg.mask cfg.B q := by
    simp only [←Finset.sum_filter,Finset.filter_mem_eq_inter,Finset.univ_inter]
  rw [hsum]
  have hr : (∑q∈L.val,cappedBirthRate cfg ε M q (s,t))=
      (cfg.B/n)*(∑q∈L.val,(cappedProcess cfg ε M (s,t)).acceptance cfg.mask cfg.B q) := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro q hq
    exact ((cappedProcess cfg ε M (s,t)).candidate_rate_times_acceptance cfg.mask cfg.B hB.ne' q).symm
  rw [hr]
  simp only [Finset.sum_const,Finset.card_univ,Fintype.card_prod,Fintype.card_fin,nsmul_eq_mul,
    Nat.cast_mul,mul_one]
  have hn0 : (n:ℝ)≠0 := by exact_mod_cast Nat.ne_of_gt hn
  field_simp
  <;> ring

theorem lineCandidateSurvival_outside_time {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (s : AugTimedState cfg) (t : ℝ) (q : Grid n) (z : ℝ)
    (ht : ¬(¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) ∧
      0<t ∧ t≤augGuardTime cfg ε M (augTimedInput cfg s))) :
    lineCandidateSurvival cfg ε M L (s,((t,q),z))=1 := by
  rw [lineCandidateSurvival_eq,birthIndicator_time_eq,if_neg ht]
  split_ifs <;> ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineCandidateSurvival_candidate_mean
