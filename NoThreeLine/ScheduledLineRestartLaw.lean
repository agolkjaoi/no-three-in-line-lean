import NoThreeLine.ScheduledLineExitLaw
import NoThreeLine.ScheduledRemainderDensity

/-! The scheduled restart law on the original board. Its mixture
components start at the actual timed exit, and its marginal on the
exit payload is the original one. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

def scheduledLineRestartLaw {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B) : Measure (BoardClockPath n) :=
  savedCreditMeasure (boardClockMeasure n (B/n)) (fun ω=>
    scheduledRemainderDensity cs ε M K deadline start L 1 hn J
      (scheduledLineExitIterate cs ε M deadline start L 0 hn J s J ω))

theorem scheduledLineExitIterate_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B) (k : ℕ) :
    Measurable (scheduledLineExitIterate cs ε M deadline start L N hn J s k) :=
  iterate_measurable _ (scheduledLineExitStep_measurable cs ε M deadline start L N hn J) _ k

theorem scheduledLineRestartLaw_integral {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (hK : K<2) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (hn : 0<n) (hB : 0<B) (J : ℕ) (s : ProtectedPhaseState n B)
    (f : (ℕ × ProtectedPhaseState n B) × BoardClockPath n→ℝ) (hf : Measurable f)
    (C : ℝ) (hb : ∀x,‖f x‖≤C) :
    let ν := boardClockMeasure n (B/n)
    let r := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J
    let D := scheduledRemainderDensity cs ε M K deadline start L 1 hn J
    (∫ω,f (r ω) ∂scheduledLineRestartLaw cs ε M K deadline start L hn J s)=
      ∫a,∫w,f (a,w) ∂savedCreditMeasure ν (fun w=>D (a,w)) ∂ν.map (fun ω=>(r ω).1) := by
  let ν := boardClockMeasure n (B/n)
  let r := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J
  let D := scheduledRemainderDensity cs ε M K deadline start L 1 hn J
  let ρ := ν.map (fun ω=>(r ω).1)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hr : Measurable r := scheduledLineExitIterate_measurable cs ε M deadline start L 0 hn J s J
  letI : IsProbabilityMeasure ρ := Measure.isProbabilityMeasure_map hr.fst.aemeasurable
  have hD : Measurable D := scheduledRemainderDensity_measurable cs ε M K deadline start L 1 hn J
  have hDb (x : (ℕ × ProtectedPhaseState n B) × BoardClockPath n) :=
    scheduledRemainderDensity_bounds cs ε M K hK deadline start L 1 (by omega) hn J x
  apply savedCreditMeasure_product_mixture ν ρ ν r hr
    (scheduledLineExitIterate_map cs ε M deadline start L 0 hn hB J s J)
    D hD (fun x=>(hDb x).1) f hf
  apply (integrable_const (max 1 ((2/(2-K))^2)*C)).mono' (hD.mul hf).aestronglyMeasurable
  exact ae_of_all _ (fun x=>by
    change ‖D x*f x‖≤max 1 ((2/(2-K))^2)*C
    rw [norm_mul,Real.norm_eq_abs,abs_of_nonneg (show 0≤D x from (hDb x).1)]
    exact mul_le_mul (hDb x).2 (hb x) (norm_nonneg _) (zero_le_one.trans (le_max_left _ _)))

theorem scheduledRemainderSection_probability {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (J : ℕ) (a : ℕ × ProtectedPhaseState n B) :
    IsProbabilityMeasure (savedCreditMeasure (boardClockMeasure n (B/n))
      (fun w=>scheduledRemainderDensity cs ε M K deadline start L N hn J (a,w))) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hD := (scheduledRemainderDensity_measurable cs ε M K deadline start L N hn J).comp
    (measurable_const.prodMk measurable_id : Measurable (fun w : BoardClockPath n=>(a,w)))
  have hb (w : BoardClockPath n) := scheduledRemainderDensity_bounds cs ε M K hK deadline start L N hN hn J (a,w)
  exact savedCreditMeasure_probability _ _
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ hD _ hb) (fun w=>(hb w).1)
    (scheduledRemainderDensity_mean_one cs ε M K deadline start hn hB hKcfg hK L hsp N hN J a)

theorem scheduledLineRestartLaw_probability {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (J : ℕ) (s : ProtectedPhaseState n B) :
    IsProbabilityMeasure (scheduledLineRestartLaw cs ε M K deadline start L hn J s) := by
  let ν := boardClockMeasure n (B/n)
  let r := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J
  let D := scheduledRemainderDensity cs ε M K deadline start L 1 hn J
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hr : Measurable r := scheduledLineExitIterate_measurable cs ε M deadline start L 0 hn J s J
  letI : IsProbabilityMeasure (ν.map (fun ω=>(r ω).1)) := Measure.isProbabilityMeasure_map hr.fst.aemeasurable
  have hD : Measurable (fun ω=>D (r ω)) :=
    (scheduledRemainderDensity_measurable cs ε M K deadline start L 1 hn J).comp hr
  have hb (ω : BoardClockPath n) := scheduledRemainderDensity_bounds cs ε M K hK deadline start L 1 (by omega) hn J (r ω)
  apply savedCreditMeasure_probability ν (fun ω=>D (r ω))
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ hD _ hb) (fun ω=>(hb ω).1)
  have h := scheduledLineRestartLaw_integral cs ε M K hK deadline start L hn hB J s
    (fun _=>1) measurable_const 1 (fun _=>by simp)
  change (∫ω,(1:ℝ) ∂savedCreditMeasure ν (fun ω=>D (r ω)))=
    ∫a,∫w,(1:ℝ) ∂savedCreditMeasure ν (fun w=>D (a,w)) ∂ν.map (fun ω=>(r ω).1) at h
  rw [savedCreditMeasure_integral ν (fun ω=>D (r ω)) hD (fun ω=>(hb ω).1) (fun _=>1)] at h
  simp only [mul_one] at h
  rw [h]
  have hi (a : ℕ × ProtectedPhaseState n B) :
      (∫w,(1:ℝ) ∂savedCreditMeasure ν (fun w=>D (a,w)))=1 := by
    letI := scheduledRemainderSection_probability cs ε M K deadline start hn hB hKcfg hK L hsp
      1 (by omega) J a
    simp [D,ν]
  simp_rw [hi]
  simp

theorem scheduledLineRestartLaw_exit_integral {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (J : ℕ) (s : ProtectedPhaseState n B) (g : ℕ × ProtectedPhaseState n B→ℝ)
    (hg : Measurable g) (C : ℝ) (hb : ∀a,‖g a‖≤C) :
    let r := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J
    (∫ω,g (r ω).1 ∂scheduledLineRestartLaw cs ε M K deadline start L hn J s)=
      ∫ω,g (r ω).1 ∂boardClockMeasure n (B/n) := by
  let ν := boardClockMeasure n (B/n)
  let r := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J
  let D := scheduledRemainderDensity cs ε M K deadline start L 1 hn J
  have hr : Measurable r := scheduledLineExitIterate_measurable cs ε M deadline start L 0 hn J s J
  have hi (a : ℕ × ProtectedPhaseState n B) :
      (∫w,g a ∂savedCreditMeasure ν (fun w=>D (a,w)))=g a := by
    letI := scheduledRemainderSection_probability cs ε M K deadline start hn hB hKcfg hK L hsp
      1 (by omega) J a
    simp [D,ν]
  calc
    _ = ∫a,∫w,g a ∂savedCreditMeasure ν (fun w=>D (a,w)) ∂ν.map (fun ω=>(r ω).1) :=
      scheduledLineRestartLaw_integral cs ε M K hK deadline start L hn hB J s
        (fun x=>g x.1) (hg.comp measurable_fst) C (fun x=>hb x.1)
    _ = ∫a,g a ∂ν.map (fun ω=>(r ω).1) := by simp_rw [hi]
    _ = _ := integral_map hr.fst.aemeasurable hg.aestronglyMeasurable

end NoThreeLine

#print axioms NoThreeLine.scheduledLineRestartLaw_probability
#print axioms NoThreeLine.scheduledLineRestartLaw_exit_integral
