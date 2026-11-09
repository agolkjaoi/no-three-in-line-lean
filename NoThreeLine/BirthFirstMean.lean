import NoThreeLine.CappedBirthRate
import NoThreeLine.ExponentialFirstStep

/-! The actual first marked candidate gives the exponential-weighted birth
rate integral. No intensity or stochastic compensation assumption is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def birthMeanIntegral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (s : AugTimedState cfg) : ℝ :=
  if s.val.2≤0 ∨ s.val.1.physical.process.stopped=true then 0 else
    ∫t in (0:ℝ)..augGuardTime cfg ε M (augTimedInput cfg s),
      Real.exp (-(((n:ℝ)*cfg.B)*t))*cappedBirthRate cfg ε M p (s,t)

theorem first_birth_mean {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) :
    (∫ω,birthIndicator cfg ε M p (s,WinnerMarkLaw.firstMarkedRace hn ω)
      ∂boardClockMeasure n (cfg.B/n))=birthMeanIntegral cfg ε M p s := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  letI := isProbabilityMeasure_expMeasure (mul_pos hnR hB)
  have hf : Integrable (fun z : CandidateData n => birthIndicator cfg ε M p (s,z))
      (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((birthIndicator_measurable cfg ε M p).comp (measurable_const.prodMk measurable_id)) 1
      (fun z=>birthIndicator_bounds cfg ε M p (s,z))
  rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB _ hf]
  simp_rw [birthIndicator_mark_mean cfg ε M p hB hm s]
  unfold birthMeanIntegral
  by_cases hd : s.val.2≤0 ∨ s.val.1.physical.process.stopped=true
  · simp only [hd,not_true_eq_false,false_and,if_false,zero_div,integral_zero,if_true]
  · simp only [hd,not_false_eq_true,true_and,if_false]
    let T := augGuardTime cfg ε M (augTimedInput cfg s)
    let α := fun t => (cappedProcess cfg ε M (s,t)).acceptance cfg.mask cfg.B p
    change (∫t, (if 0<t ∧ t≤T then α t else 0)/(n:ℝ)^2 ∂expMeasure ((n:ℝ)*cfg.B)) = _
    calc
      _ = ∫t in Ioc 0 T, α t/(n:ℝ)^2 ∂expMeasure ((n:ℝ)*cfg.B) := by
        rw [← integral_indicator measurableSet_Ioc]
        congr 1
        funext t
        by_cases ht : 0<t ∧ t≤T
        · rw [if_pos ht,indicator_of_mem (show t∈Ioc (0:ℝ) T from ht)]
        · rw [if_neg ht,indicator_of_notMem (show t∉Ioc (0:ℝ) T from ht),zero_div]
      _ = ∫t in Ioc 0 T, ((n:ℝ)*cfg.B)*Real.exp (-(((n:ℝ)*cfg.B)*t))*(α t/(n:ℝ)^2) :=
        expMeasure_integral_Ioc _ T (mul_pos hnR hB) _
      _ = ∫t in Ioc 0 T, Real.exp (-(((n:ℝ)*cfg.B)*t))*cappedBirthRate cfg ε M p (s,t) := by
        apply setIntegral_congr_fun measurableSet_Ioc
        intro t _
        have hr := (cappedProcess cfg ε M (s,t)).candidate_rate_times_acceptance cfg.mask cfg.B hB.ne' p
        change ((n:ℝ)*cfg.B)*Real.exp (-(((n:ℝ)*cfg.B)*t))*(α t/(n:ℝ)^2) =
          Real.exp (-(((n:ℝ)*cfg.B)*t))*(cappedProcess cfg ε M (s,t)).birthRate cfg.mask p
        rw [← hr]
        change ((n:ℝ)*cfg.B)*Real.exp (-(((n:ℝ)*cfg.B)*t))*(α t/(n:ℝ)^2) =
          Real.exp (-(((n:ℝ)*cfg.B)*t))*(cfg.B/n*α t)
        field_simp [ne_of_gt hnR]
        <;> ring
      _ = _ := (intervalIntegral.integral_of_le (augGuardTime_mem cfg ε M _ s.property.1.1).1).symm

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.first_birth_mean
