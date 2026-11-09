import NoThreeLine.WitnessPhaseIndependence

/-! Finite scheduled phase accumulation of the actual S7 source on one
original clock board. A fixed direction set makes the mixed observable
the same function across boundaries. No source estimate is assumed. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem independent_pair_le_integrals {Ω S W : Type*}
    [MeasurableSpace Ω] [MeasurableSpace S] [MeasurableSpace W]
    (μ : Measure Ω) (ν : Measure W) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (s : Ω→S) (r : Ω→W) (hs : Measurable s) (hr : Measurable r)
    (hp : μ.map (fun ω=>(s ω,r ω))=(μ.map s).prod ν)
    (f g : S×W→ℝ) (hf : Measurable f) (hg : Measurable g)
    (hfi : Integrable f ((μ.map s).prod ν)) (hgi : Integrable g ((μ.map s).prod ν))
    (hm : ∀a,(∫w,f (a,w) ∂ν)≤∫w,g (a,w) ∂ν) :
    (∫ω,f (s ω,r ω) ∂μ)≤∫ω,g (s ω,r ω) ∂μ := by
  letI : IsProbabilityMeasure (μ.map s) := Measure.isProbabilityMeasure_map hs.aemeasurable
  calc
    _ = ∫x,f x ∂(μ.map s).prod ν := by
      rw [←hp,integral_map_of_stronglyMeasurable (hs.prodMk hr) hf.stronglyMeasurable]
    _ = ∫a,∫w,f (a,w) ∂ν ∂μ.map s := integral_prod _ hfi
    _ ≤ ∫a,∫w,g (a,w) ∂ν ∂μ.map s := integral_mono hfi.integral_prod_left hgi.integral_prod_left hm
    _ = ∫ω,g (s ω,r ω) ∂μ := by
      rw [←integral_prod _ hgi,←hp,integral_map_of_stronglyMeasurable (hs.prodMk hr) hg.stronglyMeasurable]

def scheduledSourceIncrement {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (j : ℕ) (ω : BoardClockPath n) : ℝ :=
  phaseRunningSource (cs j).config ε M (phaseEndpoint cs start j) e C D L hn
    (goodPhases cs ε M deadline start hn s j ω)

theorem scheduledSourceIncrement_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (j : ℕ) :
    Measurable (scheduledSourceIncrement cs ε M deadline start e C D L hn s j) :=
  (phaseRunningSource_measurable (cs j).config ε M _ e C D L hn).comp
    (goodPhases_measurable cs ε M deadline start hn s j)

theorem scheduledSourceIncrement_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (j : ℕ) (hK : (cs j).K<2) (ω : BoardClockPath n) :
    0≤scheduledSourceIncrement cs ε M deadline start e C D L hn s j ω ∧
      scheduledSourceIncrement cs ε M deadline start e C D L hn s j ω≤
        (cs j).horizon*sourceCap (cs j).directions C D B (cs j).K :=
  phaseRunningSource_bounds (cs j).config ε M _ e C D L hn (cs j).mask_le_one hK _

theorem scheduledSourceIncrement_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (j : ℕ) (hK : (cs j).K<2) :
    Integrable (scheduledSourceIncrement cs ε M deadline start e C D L hn s j) (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    (scheduledSourceIncrement_measurable cs ε M deadline start e C D L hn s j)
    ((cs j).horizon*sourceCap (cs j).directions C D B (cs j).K)
    (scheduledSourceIncrement_bounds cs ε M deadline start e C D L hn s j hK)

theorem goodPhases_mixed_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (k : ℕ) :
    Integrable (fun ω=>goodPhaseMixed Γ e C D L (goodPhases cs ε M deadline start hn s k ω).1)
      (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((goodPhaseMixed_measurable Γ e C D L).comp (goodPhases_measurable cs ε M deadline start hn s k).fst)
    (mixedCap C B) (fun _=>goodPhaseMixed_bounds Γ e C D L _)

theorem scheduled_mixed_source_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (k : ℕ)
    (hΓ : (cs k).directions=Γ) (hK : (cs k).K<2) (hCL : C⊆L) (hCD : Disjoint C D) :
    (∫ω,goodPhaseMixed Γ e C D L (goodPhases cs ε M deadline start hn s (k+1) ω).1
      ∂boardClockMeasure n (B/n))≤
        ∫ω,goodPhaseMixed Γ e C D L (goodPhases cs ε M deadline start hn s k ω).1+
          scheduledSourceIncrement cs ε M deadline start e C D L hn s k ω ∂boardClockMeasure n (B/n) := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let S := fun ω=>(goodPhases cs ε M deadline start hn s k ω).1
  let R := fun ω=>(goodPhases cs ε M deadline start hn s k ω).2
  have hs : Measurable S := (goodPhases_measurable cs ε M deadline start hn s k).fst
  have hr : Measurable R := (goodPhases_measurable cs ε M deadline start hn s k).snd
  letI : IsProbabilityMeasure (ν.map S) := Measure.isProbabilityMeasure_map hs.aemeasurable
  let f : GoodPhaseObservation n B×BoardClockPath n→ℝ := fun x=>
    goodPhaseMixed Γ e C D L (goodScheduledPair cs ε M deadline start hn k x).1
  let g : GoodPhaseObservation n B×BoardClockPath n→ℝ := fun x=>
    goodPhaseMixed Γ e C D L x.1+phaseRunningSource (cs k).config ε M (phaseEndpoint cs start k) e C D L hn x
  have hf : Measurable f := (goodPhaseMixed_measurable Γ e C D L).comp
    (goodScheduledPair_measurable cs ε M deadline start hn k).fst
  have hg : Measurable g := ((goodPhaseMixed_measurable Γ e C D L).comp measurable_fst).add
    (phaseRunningSource_measurable (cs k).config ε M _ e C D L hn)
  have hfi : Integrable f ((ν.map S).prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf
    (mixedCap C B) (fun _=>goodPhaseMixed_bounds Γ e C D L _)
  have hgi : Integrable g ((ν.map S).prod ν) := by
    apply GenericCreditIteration.bounded_nonnegative_integrable _ _ hg
      (mixedCap C B+(cs k).horizon*sourceCap (cs k).directions C D B (cs k).K)
    intro x
    have h1 := goodPhaseMixed_bounds Γ e C D L x.1
    have h2 := phaseRunningSource_bounds (cs k).config ε M (phaseEndpoint cs start k) e C D L hn
      (cs k).mask_le_one hK x
    exact ⟨add_nonneg h1.1 h2.1,add_le_add h1.2 h2.2⟩
  have hm (a : GoodPhaseObservation n B) : (∫w,f (a,w) ∂ν)≤∫w,g (a,w) ∂ν := by
    have hi : Integrable (fun w=>phaseRunningSource (cs k).config ε M (phaseEndpoint cs start k) e C D L hn (a,w)) ν :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        ((phaseRunningSource_measurable (cs k).config ε M _ e C D L hn).comp (measurable_const.prodMk measurable_id))
        ((cs k).horizon*sourceCap (cs k).directions C D B (cs k).K)
        (fun _=>phaseRunningSource_bounds (cs k).config ε M _ e C D L hn (cs k).mask_le_one hK _)
    change _≤∫w,goodPhaseMixed Γ e C D L a+phaseRunningSource (cs k).config ε M _ e C D L hn (a,w) ∂ν
    rw [integral_add (integrable_const _) hi,integral_const]
    simpa only [SharedPhase.config,hΓ,probReal_univ,one_smul] using
      scheduled_expected_mixed_running_bound cs ε M deadline start e C D L hn hB k hK hCL hCD a
  exact independent_pair_le_integrals ν ν S R hs hr (goodPhases_residual_product cs ε M deadline start hn hB s k)
    f g hf hg hfi hgi hm

def cumulativeScheduledSource {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,scheduledSourceIncrement cs ε M deadline start e C D L hn s j ω

theorem cumulativeScheduledSource_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) :
    Measurable (cumulativeScheduledSource cs ε M deadline start e C D L hn s k) :=
  Finset.measurable_sum _ (fun j _=>scheduledSourceIncrement_measurable cs ε M deadline start e C D L hn s j)

theorem cumulativeScheduledSource_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (hK : ∀j,(cs j).K<2) (s : GoodPhaseObservation n B) (k : ℕ) :
    Integrable (cumulativeScheduledSource cs ε M deadline start e C D L hn s k) (boardClockMeasure n (B/n)) :=
  integrable_finset_sum _ (fun j _=>scheduledSourceIncrement_integrable cs ε M deadline start e C D L hn hB s j (hK j))

theorem finitePhase_mixed_source_bound {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodPhaseObservation n B) (k : ℕ) :
    (∫ω,goodPhaseMixed Γ e C D L (goodPhases cs ε M deadline start hn s k ω).1
      ∂boardClockMeasure n (B/n))≤goodPhaseMixed Γ e C D L s+
        ∫ω,cumulativeScheduledSource cs ε M deadline start e C D L hn s k ω ∂boardClockMeasure n (B/n) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  induction k with
  | zero => simp [goodPhases,cumulativeScheduledSource]
  | succ k ih =>
    have hh := scheduled_mixed_source_mean cs ε M deadline start Γ e C D L hn hB s k (hΓ k) (hK k) hCL hCD
    rw [integral_add (goodPhases_mixed_integrable cs ε M deadline start Γ e C D L hn hB s k)
      (scheduledSourceIncrement_integrable cs ε M deadline start e C D L hn hB s k (hK k))] at hh
    have hsum (ω) : cumulativeScheduledSource cs ε M deadline start e C D L hn s (k+1) ω=
        cumulativeScheduledSource cs ε M deadline start e C D L hn s k ω+
          scheduledSourceIncrement cs ε M deadline start e C D L hn s k ω := Finset.sum_range_succ _ _
    simp_rw [hsum]
    rw [integral_add (cumulativeScheduledSource_integrable cs ε M deadline start e C D L hn hB hK s k)
      (scheduledSourceIncrement_integrable cs ε M deadline start e C D L hn hB s k (hK k))]
    linarith

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduled_mixed_source_mean
#print axioms NoThreeLine.BirthWitness.finitePhase_mixed_source_bound
