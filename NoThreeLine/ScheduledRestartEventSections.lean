import NoThreeLine.ScheduledRestartCrossing

/-! Integrate an arbitrary measurable restart event through the actual
exit distribution, under both the original board and the restart law. -/
set_option autoImplicit false
set_option maxHeartbeats 2350000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine

theorem measureReal_flag_eq_integral {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (H : Ω→Bool) (hH : Measurable H) :
    μ.real {ω | H ω=true}=(∫ω,crossingFlagValue 1 (H ω) ∂μ) := by
  rw [crossingFlagValue_integral μ _ hH,setIntegral_const,smul_eq_mul,mul_one]

theorem scheduledRestartEvent_real_sections {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (hK : K<2) (deadline : Grid n→ℝ) (start : ℝ) (L : AuxiliaryODE.LineIndex n)
    (hn : 0<n) (hB : 0<B) (J : ℕ) (s : ProtectedPhaseState n B)
    (H : (ℕ×ProtectedPhaseState n B)×BoardClockPath n→Bool) (hH : Measurable H) :
    let μ := boardClockMeasure n (B/n)
    let ν := scheduledLineRestartLaw cs ε M K deadline start L hn J s
    let r := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J
    let ρ := μ.map (fun ω=>(r ω).1)
    let Q := fun a=>savedCreditMeasure μ (fun w=>scheduledRemainderDensity cs ε M K deadline start L 1 hn J (a,w))
    let Psec := fun a=>μ.real {w | H (a,w)=true}
    let Qsec := fun a=>(Q a).real {w | H (a,w)=true}
    μ.real {ω | H (r ω)=true}=(∫a,Psec a ∂ρ) ∧
      ν.real {ω | H (r ω)=true}=(∫a,Qsec a ∂ρ) ∧ Integrable Psec ρ ∧ Integrable Qsec ρ := by
  let μ := boardClockMeasure n (B/n)
  let ν := scheduledLineRestartLaw cs ε M K deadline start L hn J s
  let r := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J
  let ρ := μ.map (fun ω=>(r ω).1)
  let D := scheduledRemainderDensity cs ε M K deadline start L 1 hn J
  let Q := fun a=>savedCreditMeasure μ (fun w=>D (a,w))
  let f := fun x=>crossingFlagValue 1 (H x)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hr : Measurable r := scheduledLineExitIterate_measurable cs ε M deadline start L 0 hn J s J
  letI : IsProbabilityMeasure ρ := Measure.isProbabilityMeasure_map hr.fst.aemeasurable
  have hf : Measurable f := crossingFlagValue_measurable.comp (measurable_const.prodMk hH)
  have hfb (x) : 0≤f x ∧ f x≤1 := crossingFlagValue_bounds (by norm_num) (H x)
  have hfI := GenericCreditIteration.bounded_nonnegative_integrable (ρ.prod μ) f hf 1 hfb
  have hD : Measurable D := scheduledRemainderDensity_measurable cs ε M K deadline start L 1 hn J
  have hDb (x) := scheduledRemainderDensity_bounds cs ε M K hK deadline start L 1 (by omega) hn J x
  have hdI : Integrable (D*f) (ρ.prod μ) := by
    apply GenericCreditIteration.bounded_nonnegative_integrable _ _ (hD.mul hf) (max 1 ((2/(2-K))^2))
    intro x
    exact ⟨mul_nonneg (hDb x).1 (hfb x).1,
      (mul_le_of_le_one_right (hDb x).1 (hfb x).2).trans (hDb x).2⟩
  have hsection (a : ℕ×ProtectedPhaseState n B) :
      (Q a).real {w | H (a,w)=true}=(∫w,(D*f) (a,w) ∂μ) := by
    rw [measureReal_flag_eq_integral (Q a) (fun w=>H (a,w))
      (hH.comp (measurable_const.prodMk measurable_id))]
    exact savedCreditMeasure_integral μ _ (hD.comp (measurable_const.prodMk measurable_id))
      (fun w=>(hDb (a,w)).1) (fun w=>f (a,w))
  have hplain (a : ℕ×ProtectedPhaseState n B) :
      μ.real {w | H (a,w)=true}=(∫w,f (a,w) ∂μ) :=
    measureReal_flag_eq_integral μ _ (hH.comp (measurable_const.prodMk measurable_id))
  change μ.real {ω | H (r ω)=true}=(∫a,μ.real {w | H (a,w)=true} ∂ρ) ∧
      ν.real {ω | H (r ω)=true}=(∫a,(Q a).real {w | H (a,w)=true} ∂ρ) ∧
      Integrable (fun a=>μ.real {w | H (a,w)=true}) ρ ∧
      Integrable (fun a=>(Q a).real {w | H (a,w)=true}) ρ
  simp_rw [hsection,hplain]
  refine ⟨?_,?_,hfI.integral_prod_left,hdI.integral_prod_left⟩
  · rw [measureReal_flag_eq_integral μ (fun w=>H (r w)) (hH.comp hr)]
    change (∫w,f (r w) ∂μ)=_
    rw [←integral_map_of_stronglyMeasurable hr hf.stronglyMeasurable]
    have hm : μ.map r=ρ.prod μ := scheduledLineExitIterate_map cs ε M deadline start L 0 hn hB J s J
    rw [hm,integral_prod _ hfI]
  · rw [measureReal_flag_eq_integral ν (fun w=>H (r w)) (hH.comp hr)]
    have h := scheduledLineRestartLaw_integral cs ε M K hK deadline start L hn hB J s f hf 1
      (fun x=>by rw [Real.norm_eq_abs,abs_of_nonneg (hfb x).1]; exact (hfb x).2)
    change (∫w,f (r w) ∂ν)=∫a,∫w,f (a,w) ∂Q a ∂ρ at h
    have he (a : ℕ×ProtectedPhaseState n B) :
        (∫w,f (a,w) ∂Q a)=(∫w,(D*f) (a,w) ∂μ) :=
      savedCreditMeasure_integral μ _ (hD.comp (measurable_const.prodMk measurable_id))
        (fun w=>(hDb (a,w)).1) (fun w=>f (a,w))
    simpa only [he] using h

end NoThreeLine

#print axioms NoThreeLine.scheduledRestartEvent_real_sections

