import NoThreeLine.ScheduledCutCoarseProduct

/-! Independent arbitrary initial observations and the same original board.
The laws below push forward the actual recycled finite phase paths, including
all birth records and deadline retirements. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines

variable {n : ℕ} {B : ℝ}

theorem goodPhases_joint_measurable (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (k : ℕ) :
    Measurable (fun x : GoodPhaseObservation n B×BoardClockPath n=>
      goodPhases cs ε M deadline start hn x.1 k x.2) := by
  induction k with
  | zero => exact measurable_id
  | succ k ih => exact (goodScheduledPair_measurable cs ε M deadline start hn k).comp ih

def randomPhaseStateLaw (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (μ : Measure (GoodPhaseObservation n B)) (k : ℕ) : Measure (GoodPhaseObservation n B) :=
  (μ.prod (boardClockMeasure n (B/n))).map
    (fun x=>(goodPhases cs ε M deadline start hn x.1 k x.2).1)

theorem randomPhaseStateLaw_probability (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (μ : Measure (GoodPhaseObservation n B)) [IsProbabilityMeasure μ] (k : ℕ) :
    IsProbabilityMeasure (randomPhaseStateLaw cs ε M deadline start hn μ k) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact Measure.isProbabilityMeasure_map (goodPhases_joint_measurable cs ε M deadline start hn k).fst.aemeasurable

theorem goodPhases_mean_measurable (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (k : ℕ)
    (f : GoodPhaseObservation n B→ℝ) (hf : Measurable f) :
    Measurable (fun s=>∫ω,f (goodPhases cs ε M deadline start hn s k ω).1 ∂boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact (hf.comp (goodPhases_joint_measurable cs ε M deadline start hn k).fst).stronglyMeasurable.integral_prod_right'.measurable

theorem goodPhases_mean_integrable (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (μ : Measure (GoodPhaseObservation n B)) [IsProbabilityMeasure μ] (k : ℕ)
    (f : GoodPhaseObservation n B→ℝ) (hf : Measurable f) (cap : ℝ) (hb : ∀s,0≤f s ∧ f s≤cap) :
    Integrable (fun s=>∫ω,f (goodPhases cs ε M deadline start hn s k ω).1 ∂boardClockMeasure n (B/n)) μ := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  apply GenericCreditIteration.bounded_nonnegative_integrable _ _
    (goodPhases_mean_measurable cs ε M deadline start hn hB k f hf) cap
  intro s
  constructor
  · exact integral_nonneg (fun ω=>(hb _).1)
  · have hi := GenericCreditIteration.bounded_nonnegative_integrable (boardClockMeasure n (B/n)) _
      (hf.comp (goodPhases_measurable cs ε M deadline start hn s k).fst) cap (fun ω=>hb _)
    have hh := integral_mono hi (integrable_const cap) (fun ω=>(hb _).2)
    simpa only [Function.comp_def,integral_const,probReal_univ,one_smul] using hh

theorem randomPhaseStateLaw_integral (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (μ : Measure (GoodPhaseObservation n B)) [IsProbabilityMeasure μ] (k : ℕ)
    (f : GoodPhaseObservation n B→ℝ) (hf : Measurable f) (cap : ℝ) (hb : ∀s,0≤f s ∧ f s≤cap) :
    (∫s,f s ∂randomPhaseStateLaw cs ε M deadline start hn μ k)=
      ∫s,∫ω,f (goodPhases cs ε M deadline start hn s k ω).1 ∂boardClockMeasure n (B/n) ∂μ := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  unfold randomPhaseStateLaw
  rw [integral_map_of_stronglyMeasurable (goodPhases_joint_measurable cs ε M deadline start hn k).fst hf.stronglyMeasurable]
  exact integral_prod _ (GenericCreditIteration.bounded_nonnegative_integrable _ _
    (hf.comp (goodPhases_joint_measurable cs ε M deadline start hn k).fst) cap (fun x=>hb _))

theorem scheduledCutMean_eq_state_average (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (k : ℕ) (t : ℝ) :
    scheduledCutMean cs ε M deadline start e C D L hn s k t=
      ∫ω,elapsedMixedMean (cs k).config ε M (phaseEndpoint cs start k) e C D L hn
        (goodPhaseStart (cs k).config ε M (goodPhases cs ε M deadline start hn s k ω).1) t
          ∂boardClockMeasure n (B/n) := by
  rw [scheduledCutMean_eq_kernel cs ε M deadline start e C D L hn hB s k]
  unfold phaseKernelMixedMean goodPhaseStateLaw
  apply integral_map_of_stronglyMeasurable (goodPhases_measurable cs ε M deadline start hn s k).fst
  exact ((phaseKernelMixedMean_joint_integrand (cs k).config ε M (phaseEndpoint cs start k) e C D L hn hB).comp
    (measurable_id.prodMk measurable_const)).stronglyMeasurable

theorem randomScheduledCutMean_eq_kernel (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (μ : Measure (GoodPhaseObservation n B)) [IsProbabilityMeasure μ]
    (k : ℕ) (t : ℝ) :
    (∫s,scheduledCutMean cs ε M deadline start e C D L hn s k t ∂μ)=
      phaseKernelMixedMean (cs k).config ε M (phaseEndpoint cs start k) e C D L hn
        (randomPhaseStateLaw cs ε M deadline start hn μ k) t := by
  simp_rw [scheduledCutMean_eq_state_average cs ε M deadline start e C D L hn hB]
  let f := fun s : GoodPhaseObservation n B=>
    elapsedMixedMean (cs k).config ε M (phaseEndpoint cs start k) e C D L hn
      (goodPhaseStart (cs k).config ε M s) t
  have hf : Measurable f := by
    convert (phaseKernelMixedMean_joint_integrand (cs k).config ε M (phaseEndpoint cs start k)
      e C D L hn hB).comp (measurable_id.prodMk (measurable_const (a:=t))) using 1
    rfl
  have hb s : 0≤f s ∧ f s≤mixedCap C B := elapsedMixedMean_bounds (cs k).config ε M
    (phaseEndpoint cs start k) e C D L hn hB (goodPhaseStart (cs k).config ε M s) t
  exact (randomPhaseStateLaw_integral cs ε M deadline start hn hB μ k f hf _ hb).symm

theorem randomPhase_mixed_le_endpointKernel (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (μ : Measure (GoodPhaseObservation n B)) [IsProbabilityMeasure μ] (k : ℕ) :
    (∫s,goodPhaseMixed (cs k).directions e C D L s
      ∂randomPhaseStateLaw cs ε M deadline start hn μ (k+1))≤
      phaseKernelMixedMean (cs k).config ε M (phaseEndpoint cs start k) e C D L hn
        (randomPhaseStateLaw cs ε M deadline start hn μ k) (cs k).horizon := by
  let f := fun s : GoodPhaseObservation n B=>
    elapsedMixedMean (cs k).config ε M (phaseEndpoint cs start k) e C D L hn
      (goodPhaseStart (cs k).config ε M s) (cs k).horizon
  have hf : Measurable f := by
    convert (phaseKernelMixedMean_joint_integrand (cs k).config ε M (phaseEndpoint cs start k)
      e C D L hn hB).comp (measurable_id.prodMk (measurable_const (a:=((cs k).horizon : ℝ)))) using 1
    rfl
  have hb s : 0≤f s ∧ f s≤mixedCap C B := elapsedMixedMean_bounds (cs k).config ε M
    (phaseEndpoint cs start k) e C D L hn hB (goodPhaseStart (cs k).config ε M s) (cs k).horizon
  rw [randomPhaseStateLaw_integral cs ε M deadline start hn hB μ (k+1) _
    (goodPhaseMixed_measurable _ e C D L) _ (goodPhaseMixed_bounds _ e C D L)]
  change _≤∫s,f s ∂randomPhaseStateLaw cs ε M deadline start hn μ k
  rw [randomPhaseStateLaw_integral cs ε M deadline start hn hB μ k f hf _ hb]
  apply integral_mono
    (goodPhases_mean_integrable cs ε M deadline start hn hB μ (k+1) _
      (goodPhaseMixed_measurable _ e C D L) _ (goodPhaseMixed_bounds _ e C D L))
    (goodPhases_mean_integrable cs ε M deadline start hn hB μ k f hf _ hb)
  intro s
  have hh := finitePhase_mixed_le_endpointCutMean cs ε M deadline start e C D L hn hB s k
  rwa [scheduledCutMean_eq_state_average cs ε M deadline start e C D L hn hB s k] at hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.randomScheduledCutMean_eq_kernel
#print axioms NoThreeLine.BirthWitness.randomPhase_mixed_le_endpointKernel
