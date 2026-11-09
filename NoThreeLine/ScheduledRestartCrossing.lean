import NoThreeLine.RestartedCrossingWeighted
import NoThreeLine.ScheduledLineRestartLaw

/-! Average the stage-one crossing estimate over the actual first-birth
exit distribution. The original and restarted measures use the same exit
payload marginal, with no multiplier for the number of exit histories. -/
set_option autoImplicit false
set_option maxHeartbeats 2200000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def scheduledRestartProtectedExceedance {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (J : ℕ)
    (s : ProtectedPhaseState n B) : Set (BoardClockPath n) :=
  {ω | (scheduledCrossingRemainderPair cs ε M deadline start L 1 E A hn b J
    (scheduledLineExitIterate cs ε M deadline start L 0 hn J s J ω)).1.2=true}

theorem scheduledLineRestartLaw_protected_firstCrossing_ge {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (J : ℕ) (hKcfg : ∀i,(cs i).K≤K) (hK : K<2) (hsp : ∀i,specified (cs i).directions L)
    (s : ProtectedPhaseState n B) :
    (boardClockMeasure n (B/n)).real (scheduledRestartProtectedExceedance cs ε M deadline start L E A hn b J s)≤
      (scheduledLineRestartLaw cs ε M K deadline start L hn J s).real
        (scheduledRestartProtectedExceedance cs ε M deadline start L E A hn b J s) := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let ν := scheduledLineRestartLaw cs ε M K deadline start L hn J s
  let r := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J
  have hr : Measurable r := scheduledLineExitIterate_measurable cs ε M deadline start L 0 hn J s J
  let ρ := μ.map (fun w=>(r w).1)
  letI : IsProbabilityMeasure ρ := Measure.isProbabilityMeasure_map hr.fst.aemeasurable
  let X := (ℕ×ProtectedPhaseState n B)×BoardClockPath n
  let D := scheduledRemainderDensity cs ε M K deadline start L 1 hn J
  have hD : Measurable D := scheduledRemainderDensity_measurable cs ε M K deadline start L 1 hn J
  have hDB (x : X) := scheduledRemainderDensity_bounds cs ε M K hK deadline start L 1 (by omega) hn J x
  let H := fun x : X=>(scheduledCrossingRemainderPair cs ε M deadline start L 1 E A hn b J x).1.2
  have hH : Measurable H := (scheduledCrossingRemainderPair_measurable cs ε M deadline start L 1 E A hA hn b J).fst.snd
  let f := fun x : X=>crossingFlagValue 1 (H x)
  have hf : Measurable f := crossingFlagValue_measurable.comp (measurable_const.prodMk hH)
  have hfB (x : X) : 0≤f x ∧ f x≤1 := crossingFlagValue_bounds (by norm_num) (H x)
  have hfI := GenericCreditIteration.bounded_nonnegative_integrable (ρ.prod μ) f hf 1 hfB
  have hdfI : Integrable (D*f) (ρ.prod μ) := by
    apply GenericCreditIteration.bounded_nonnegative_integrable _ _ (hD.mul hf) (max 1 ((2/(2-K))^2))
    intro x
    exact ⟨mul_nonneg (hDB x).1 (hfB x).1,
      (mul_le_of_le_one_right (hDB x).1 (hfB x).2).trans (hDB x).2⟩
  have hm := independent_history_setIntegral μ μ (fun w=>(r w).1) (fun w=>(r w).2)
    hr.fst hr.snd (by simpa only [Prod.eta,ρ] using
      scheduledLineExitIterate_map cs ε M deadline start L 0 hn hB J s J)
    f (fun a=>∫w,f (a,w) ∂μ) hf hf.stronglyMeasurable.integral_prod_right'.measurable hfI
    (fun _=>rfl) univ MeasurableSet.univ
  have hP : (∫w,f (r w) ∂μ)=∫a,∫w,f (a,w) ∂μ ∂ρ := by
    simp only [preimage_univ,setIntegral_univ,Prod.eta] at hm
    rw [hm,integral_map hr.fst.aemeasurable
      hf.stronglyMeasurable.integral_prod_right'.aestronglyMeasurable]
  have hQ := scheduledLineRestartLaw_integral cs ε M K hK deadline start L hn hB J s f hf 1
    (fun x=>by rw [Real.norm_eq_abs,abs_of_nonneg (hfB x).1]; exact (hfB x).2)
  have hsection (a : ℕ×ProtectedPhaseState n B) :
      (∫w,f (a,w) ∂μ)≤∫w,f (a,w) ∂savedCreditMeasure μ (fun w=>D (a,w)) := by
    have hh : Measurable (fun w=>H (a,w)) := hH.comp (measurable_const.prodMk measurable_id)
    change (∫w,crossingFlagValue 1 (H (a,w)) ∂μ)≤
      ∫w,crossingFlagValue 1 (H (a,w)) ∂savedCreditMeasure μ (fun w=>D (a,w))
    rw [crossingFlagValue_integral μ _ hh,crossingFlagValue_integral _ _ hh,
      setIntegral_const,setIntegral_const,smul_eq_mul,smul_eq_mul,mul_one,mul_one]
    exact scheduledRemainderLaw_crossing_ge cs ε M K deadline start L 1 E A hA hn hB b J
      hKcfg hK hsp (by omega) a
  have hrewrite (a : ℕ×ProtectedPhaseState n B) :
      (∫w,f (a,w) ∂savedCreditMeasure μ (fun w=>D (a,w)))=∫w,(D*f) (a,w) ∂μ :=
    savedCreditMeasure_integral μ _ (hD.comp (measurable_const.prodMk measurable_id))
      (fun w=>(hDB (a,w)).1) (fun w=>f (a,w))
  change (∫w,f (r w) ∂ν)=∫a,∫w,f (a,w) ∂savedCreditMeasure μ (fun w=>D (a,w)) ∂ρ at hQ
  simp_rw [hrewrite] at hQ hsection
  have h := integral_mono hfI.integral_prod_left hdfI.integral_prod_left hsection
  rw [←hP,←hQ] at h
  have htest : Measurable (fun w=>H (r w)) := hH.comp hr
  change (∫w,crossingFlagValue 1 (H (r w)) ∂μ)≤∫w,crossingFlagValue 1 (H (r w)) ∂ν at h
  rw [crossingFlagValue_integral μ _ htest,crossingFlagValue_integral ν _ htest,
    setIntegral_const,setIntegral_const,smul_eq_mul,smul_eq_mul,mul_one,mul_one] at h
  exact h

end NoThreeLine

#print axioms NoThreeLine.scheduledLineRestartLaw_protected_firstCrossing_ge

