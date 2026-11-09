import NoThreeLine.RandomPhaseHierarchy

/-! The phase-cut kernel integrated against the actual inherited phase
state law equals the cut observable evaluated on the actual remaining
original board. The true unit-price Volterra estimate is then inherited. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def goodPhaseStateLaw {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) :
    Measure (GoodPhaseObservation n B) :=
  (boardClockMeasure n (B/n)).map (fun ω=>(goodPhases cs ε M deadline start hn s k ω).1)

theorem goodPhaseStateLaw_probability {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (k : ℕ) :
    IsProbabilityMeasure (goodPhaseStateLaw cs ε M deadline start hn s k) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact Measure.isProbabilityMeasure_map (goodPhases_measurable cs ε M deadline start hn s k).fst.aemeasurable

def scheduledCutMixed {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) (x : BoardClockPath n×ℝ) : ℝ :=
  let y := goodPhases cs ε M deadline start hn s k x.1
  phaseCutMixed (cs k).config ε M (phaseEndpoint cs start k) e C D L hn ((y.1,x.2),y.2)

theorem scheduledCutMixed_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) :
    Measurable (scheduledCutMixed cs ε M deadline start e C D L hn s k) := by
  have hg := (goodPhases_measurable cs ε M deadline start hn s k).comp
    (measurable_fst : Measurable (Prod.fst : BoardClockPath n×ℝ→_))
  exact (phaseCutMixed_measurable (cs k).config ε M _ e C D L hn).comp
    ((hg.fst.prodMk measurable_snd).prodMk hg.snd)

def scheduledCutMean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) (t : ℝ) : ℝ :=
  ∫ω,scheduledCutMixed cs ε M deadline start e C D L hn s k (ω,t) ∂boardClockMeasure n (B/n)

theorem scheduledCutMean_eq_kernel {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (k : ℕ) (t : ℝ) :
    scheduledCutMean cs ε M deadline start e C D L hn s k t=
      phaseKernelMixedMean (cs k).config ε M (phaseEndpoint cs start k) e C D L hn
        (goodPhaseStateLaw cs ε M deadline start hn s k) t := by
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s k
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s k
  let f : GoodPhaseObservation n B×BoardClockPath n→ℝ := fun x=>
    phaseCutMixed (cs k).config ε M (phaseEndpoint cs start k) e C D L hn ((x.1,t),x.2)
  have hf : Measurable f := (phaseCutMixed_measurable (cs k).config ε M _ e C D L hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  have hi : Integrable f (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf
    (mixedCap C B) (fun _=>phaseCutMixed_bounds (cs k).config ε M _ e C D L hn _)
  change (∫ω,f (goodPhases cs ε M deadline start hn s k ω) ∂ν)=_
  rw [←integral_map_of_stronglyMeasurable (goodPhases_measurable cs ε M deadline start hn s k) hf.stronglyMeasurable,
    goodPhases_residual_product cs ε M deadline start hn hB s k]
  change (∫x,f x ∂μ.prod ν)=_
  rw [integral_prod _ hi]
  simp only [f,phaseCutMixed_mean]
  rfl

theorem scheduledCutMean_unit_volterra {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (k : ℕ)
    (hK : (cs k).K<2) (hCL : C⊆L) (hCD : Disjoint C D)
    (hsep : SeparatedLabels (cs k).directions (C∪D)) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    scheduledCutMean cs ε M deadline start e C D L hn s k t≤
      (∫ω,goodPhaseMixed (cs k).directions e C D L (goodPhases cs ε M deadline start hn s k ω).1
        ∂boardClockMeasure n (B/n))+
      ∫u in (0:ℝ)..t,∑q∈D,phaseUnitCoefficient (cs k).config (phaseEndpoint cs start k) e q u*
        scheduledCutMean cs ε M deadline start e (insert q C) (D.erase q) L hn s k u := by
  let μ := goodPhaseStateLaw cs ε M deadline start hn s k
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s k
  have hh := phaseKernelMixedMean_unit_volterra (cs k).config ε M (phaseEndpoint cs start k) e C D L hn hB
    (cs k).mask_le_one hK hCL hCD hsep μ t ht
  have hm : (∫a,goodPhaseMixed (cs k).directions e C D L a ∂μ)=
      ∫ω,goodPhaseMixed (cs k).directions e C D L (goodPhases cs ε M deadline start hn s k ω).1
        ∂boardClockMeasure n (B/n) :=
    integral_map_of_stronglyMeasurable (goodPhases_measurable cs ε M deadline start hn s k).fst
      (goodPhaseMixed_measurable _ e C D L).stronglyMeasurable
  rw [hm] at hh
  simpa only [scheduledCutMean_eq_kernel cs ε M deadline start e _ _ L hn hB s k] using hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutMean_eq_kernel
#print axioms NoThreeLine.BirthWitness.scheduledCutMean_unit_volterra
