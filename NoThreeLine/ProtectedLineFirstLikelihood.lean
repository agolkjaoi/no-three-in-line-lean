import NoThreeLine.ProtectedLineLikelihoodFlow
import NoThreeLine.LineCandidateSurvival

/-! Normalization of the actual one-step line-forbidden likelihood under
the original board clocks, including guard-capped time and real marks. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def augTimedLineLikelihood {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (x : AugTimedState cfg × CandidateData n) : ℝ :=
  if x.1.val.2≤0 ∨ x.1.val.1.physical.process.stopped=true then 1 else
    selectedLineLikelihood cfg (augTimedInput cfg x.1).1.1 L
      (augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1))*lineCandidateSurvival cfg ε M L x

theorem augTimedLineLikelihood_section_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (s : AugTimedState cfg) :
    Measurable (fun z=>augTimedLineLikelihood cfg ε M L (s,z)) := by
  unfold augTimedLineLikelihood
  dsimp only
  split_ifs
  · exact measurable_const
  · exact ((selectedLineLikelihood_measurable cfg (augTimedInput cfg s).1.1 L).comp
      ((augAdvance_measurable cfg ε M).comp (measurable_const.prodMk measurable_fst.fst))).mul
        ((lineCandidateSurvival_measurable cfg ε M L).comp (measurable_const.prodMk measurable_id))

theorem augTimedLineLikelihood_bounds {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (s : AugTimedState cfg) (hN : occupancy s.val.1.physical.process L≤1)
    (hk : s.val.1.physical.clocks L≤K) (z : CandidateData n) :
    0≤augTimedLineLikelihood cfg ε M L (s,z) ∧ augTimedLineLikelihood cfg ε M L (s,z)≤(2/(2-K))^2 := by
  have ha := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
  have hg := augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1
  have hb := selectedLineLikelihood_bounds cfg (augTimedInput cfg s).1.1 s.property.1.1
    K hKcfg hK L hsp hN hk _ ⟨ha.1,ha.2.trans hg.2⟩
  have hz := lineCandidateSurvival_bounds cfg ε M L (s,z)
  unfold augTimedLineLikelihood
  split_ifs
  · have hzero := (selectedLineLikelihood_bounds cfg (augTimedInput cfg s).1.1 s.property.1.1
      K hKcfg hK L hsp hN hk 0 ⟨le_rfl,(selectedCurve_spec cfg _ s.property.1.1.2.1).2.1.1⟩).2
    rw [selectedLineLikelihood_zero cfg _ s.property.1.1 L] at hzero
    exact ⟨zero_le_one,hzero⟩
  · exact ⟨mul_nonneg hb.1.le hz.1,(mul_le_of_le_one_right hb.1.le hz.2).trans hb.2⟩

theorem augTimedLineLikelihood_candidate_mean {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (hd : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true))
    (t : ℝ) (ht : 0<t) :
    (∑q : Grid n,∫z,augTimedLineLikelihood cfg ε M L (s,((t,q),z)) ∂markMeasure)/(n:ℝ)^2=
      if t≤augGuardTime cfg ε M (augTimedInput cfg s) then
        selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L t*
          (1-lineIntensity s.val.1.physical.process cfg.mask
            (selectedCurve cfg ((augTimedInput cfg s).1.1,t)) L/((n:ℝ)*cfg.B))
      else selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L
        (augGuardTime cfg ε M (augTimedInput cfg s)) := by
  classical
  simp only [augTimedLineLikelihood,if_neg hd,integral_const_mul,←Finset.mul_sum,mul_div_assoc]
  by_cases htg : t≤augGuardTime cfg ε M (augTimedInput cfg s)
  · have ha : augAdvance cfg ε M (augTimedInput cfg s,t)=t := by
      change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s)) t)=t
      rw [min_eq_right htg,max_eq_right ht.le]
    rw [if_pos htg,lineCandidateSurvival_candidate_mean cfg ε M L hn hB hm s t hd ⟨ht,htg⟩,ha]
    have hr : (∑q∈L.val,cappedBirthRate cfg ε M q (s,t))=
        lineIntensity s.val.1.physical.process cfg.mask (selectedCurve cfg ((augTimedInput cfg s).1.1,t)) L := by
      simp only [cappedBirthRate,cappedProcess,ha]
      rfl
    rw [hr]
  · have ha : augAdvance cfg ε M (augTimedInput cfg s,t)=augGuardTime cfg ε M (augTimedInput cfg s) := by
      change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s)) t)=_
      rw [min_eq_left (le_of_not_ge htg),max_eq_right (augGuardTime_mem cfg ε M _ s.property.1.1).1]
    rw [if_neg htg,ha]
    have hout (q : Grid n) (z : ℝ) : lineCandidateSurvival cfg ε M L (s,((t,q),z))=1 :=
      lineCandidateSurvival_outside_time cfg ε M L s t q z (fun h=>htg h.2.2)
    simp_rw [hout]
    have hn0 : (n:ℝ)≠0 := by exact_mod_cast Nat.ne_of_gt hn
    simp [Fintype.card_prod,Fintype.card_fin,Nat.cast_mul,pow_two,hn0]

theorem augTimedLineLikelihood_mean_one {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (hN : occupancy s.val.1.physical.process L≤1)
    (hk : s.val.1.physical.clocks L≤K) :
    (∫ω,augTimedLineLikelihood cfg ε M L (s,WinnerMarkLaw.firstMarkedRace hn ω)
      ∂boardClockMeasure n (cfg.B/n))=1 := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB hnR)
  by_cases hd : s.val.2≤0 ∨ s.val.1.physical.process.stopped=true
  · simp only [augTimedLineLikelihood,if_pos hd]
    simp
  · letI := isProbabilityMeasure_expMeasure (mul_pos hnR hB)
    have hf : Integrable (fun z : CandidateData n=>augTimedLineLikelihood cfg ε M L (s,z))
        (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure) :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        (augTimedLineLikelihood_section_measurable cfg ε M L s) ((2/(2-K))^2)
        (fun z=>augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s hN hk z)
    rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB _ hf]
    have heq := integral_congr_ae (Filter.Eventually.mono
      (expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos hnR hB))
      (fun t ht=>augTimedLineLikelihood_candidate_mean cfg ε M L hn hB hm s hd t ht))
    rw [heq]
    have hstop : s.val.1.physical.process.stopped=false := by
      cases hs : s.val.1.physical.process.stopped <;> simp_all
    exact selectedLineLikelihood_first_mean cfg (augTimedInput cfg s).1.1 s.property.1.1
      K hKcfg hK L hstop hsp hN hk ((n:ℝ)*cfg.B) _ (mul_pos hnR hB)
      (augGuardTime_mem cfg ε M _ s.property.1.1).1 (augGuardTime_mem cfg ε M _ s.property.1.1).2

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.augTimedLineLikelihood_mean_one
