import NoThreeLine.CrossPhaseCutMixed

/-! A uniform-in-later-cut-time cross-phase source-free comparison on the original scheduled
board. Random incoming states and endpoint exceptions are integrated out
using their actual full-state residual product law. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem phase_cross_cut_mixed_le_ae_all_later {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (Γ : Finset ZPoint) (e : Retention n)
    (C L : Finset (Grid n)) (hCL : C⊆L) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K<2) (j k : ℕ)
    (μ : Measure (GoodPhaseObservation n B)) [IsProbabilityMeasure μ]
    (F : ℝ→TimedObservation (cs j).config→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐu : ℝ ∂volume,∀v : ℝ,u∈Ioo 0 ((cs j).horizon:ℝ)→
    (∫x,mixed Γ C ∅ L (observedWitness (cs (j+1+k)).config e
        (goodThroughPhaseCut cs ε M deadline start hn j k v x))*
      F u (phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,u),x.2))
      ∂μ.prod (boardClockMeasure n (B/n)))≤
    ∫x,mixed Γ C ∅ L (observedWitness (cs j).config e
        (phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,u),x.2)))*
      F u (phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,u),x.2))
      ∂μ.prod (boardClockMeasure n (B/n)) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let a := fun i (x : GoodPhaseObservation n B×BoardClockPath n)=>(cfg.horizon:ℝ)-
    (observedRecycledPair cfg ε M t₀ hn (goodPhaseStart cfg ε M x.1).val i x.2).1.1.val.2
  have ha (i : ℕ) : Measurable (a i) := measurable_const.sub
    ((observedRecycledPair_joint_measurable cfg ε M t₀ hn i).comp
      (((goodPhaseStart_measurable cfg ε M).comp measurable_fst).subtype_val.prodMk measurable_snd)).fst.fst.subtype_val.snd
  have he := ae_time_avoids_random_endpoints (μ.prod ν) a ha
  filter_upwards [he] with u hu v huI
  let U := fun x : GoodPhaseObservation n B×BoardClockPath n=>phaseCutObservation cfg ε M t₀ hn ((x.1,u),x.2)
  let V := goodThroughPhaseCut cs ε M deadline start hn j k v
  have hU : Measurable U := (phaseCutObservation_measurable cfg ε M t₀ hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  have hV : Measurable V := goodThroughPhaseCut_measurable cs ε M deadline start hn j k v
  let f := fun x=>mixed Γ C ∅ L (observedWitness (cs (j+1+k)).config e (V x))*F u (U x)
  let g := fun x=>mixed Γ C ∅ L (observedWitness cfg e (U x))*F u (U x)
  have hf : Measurable f := ((mixed_measurable Γ C ∅ L).comp
    ((observedWitness_measurable (cs (j+1+k)).config e).comp hV)).mul ((hF u).comp hU)
  have hg : Measurable g := ((mixed_measurable Γ C ∅ L).comp
    ((observedWitness_measurable cfg e).comp hU)).mul ((hF u).comp hU)
  have hv (x) : (observedWitness (cs (j+1+k)).config e (V x)).Valid B :=
    goodAfterPhaseCut_valid cs ε M deadline start hn j k v e _
  have huvalid (x) : (observedWitness cfg e (U x)).Valid B := by
    apply observedWitness_valid
    exact sourceCutTerminal_consistent cfg ε M t₀ _ _ hn _ _
  have hfi : Integrable f (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (mixedCap C B*A)
    (fun x=>⟨mul_nonneg (mixed_nonneg _ Γ C ∅ L B (hv x)) (hFA u (U x)).1,
      mul_le_mul (mixed_le_cap _ Γ C ∅ L B (hv x)) (hFA u (U x)).2 (hFA u (U x)).1 (mixedCap_nonneg C B)⟩)
  have hgi : Integrable g (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hg (mixedCap C B*A)
    (fun x=>⟨mul_nonneg (mixed_nonneg _ Γ C ∅ L B (huvalid x)) (hFA u (U x)).1,
      mul_le_mul (mixed_le_cap _ Γ C ∅ L B (huvalid x)) (hFA u (U x)).2 (hFA u (U x)).1 (mixedCap_nonneg C B)⟩)
  change (∫x,f x ∂μ.prod ν)≤∫x,g x ∂μ.prod ν
  rw [integral_prod _ hfi,integral_prod _ hgi]
  apply integral_mono_ae hfi.integral_prod_left hgi.integral_prod_left
  filter_upwards [Measure.ae_ae_of_ae_prod hu] with s hs
  have hδ : 0≤(cfg.horizon:ℝ)-u := sub_nonneg.mpr huI.2.le
  have hh := goodThroughPhaseCut_actual_cut_le_of_ae_avoid cs ε M deadline start ((cfg.horizon:ℝ)-u)
    hδ hn hB Γ e C L hCL hΓ hK j k v s (by linarith [huI.1]) (F u) (hF u) A (hFA u) (by
      filter_upwards [hs] with ω hω i
      intro h
      exact hω i (by dsimp only [a]; linarith))
  simpa only [f,g,U,V,phaseCutObservation,cfg,t₀,ν,elapsedCutAmount_coe _ _ huI.2.le] using hh

theorem scheduled_cross_phase_mixed_le_ae_all_later {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (Γ : Finset ZPoint) (e : Retention n)
    (C L : Finset (Grid n)) (hCL : C⊆L) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K<2) (j k : ℕ)
    (F : ℝ→TimedObservation (cs j).config→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐu : ℝ ∂volume,∀v : ℝ,u∈Ioo 0 ((cs j).horizon:ℝ)→
    (∫ω,mixed Γ C ∅ L (scheduledCutWitness cs ε M deadline start e hn s (j+1+k) (ω,v))*
      F u (scheduledCutObservation cs ε M deadline start hn s j (ω,u)) ∂boardClockMeasure n (B/n))≤
    ∫ω,mixed Γ C ∅ L (scheduledCutWitness cs ε M deadline start e hn s j (ω,u))*
      F u (scheduledCutObservation cs ε M deadline start hn s j (ω,u)) ∂boardClockMeasure n (B/n) := by
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s j
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s j
  have he := phase_cross_cut_mixed_le_ae_all_later cs ε M deadline start hn hB Γ e C L hCL hΓ hK j k μ F hF A hFA
  filter_upwards [he] with u hu v huI
  let U := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,u),x.2)
  let V := goodThroughPhaseCut cs ε M deadline start hn j k v
  let f := fun x=>mixed Γ C ∅ L (observedWitness (cs (j+1+k)).config e (V x))*F u (U x)
  let g := fun x=>mixed Γ C ∅ L (observedWitness (cs j).config e (U x))*F u (U x)
  have hU : Measurable U := (phaseCutObservation_measurable (cs j).config ε M _ hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  have hf : Measurable f := ((mixed_measurable Γ C ∅ L).comp
    ((observedWitness_measurable (cs (j+1+k)).config e).comp
      (goodThroughPhaseCut_measurable cs ε M deadline start hn j k v))).mul ((hF u).comp hU)
  have hg : Measurable g := ((mixed_measurable Γ C ∅ L).comp
    ((observedWitness_measurable (cs j).config e).comp hU)).mul ((hF u).comp hU)
  have hy := goodPhases_measurable cs ε M deadline start hn s j
  have hleft (ω) : f (goodPhases cs ε M deadline start hn s j ω)=
      mixed Γ C ∅ L (scheduledCutWitness cs ε M deadline start e hn s (j+1+k) (ω,v))*
        F u (scheduledCutObservation cs ε M deadline start hn s j (ω,u)) := by
    dsimp only [f,V]
    rw [goodThroughPhaseCut_original]
    rfl
  simp_rw [←hleft]
  change (∫ω,f (goodPhases cs ε M deadline start hn s j ω) ∂ν)≤
    ∫ω,g (goodPhases cs ε M deadline start hn s j ω) ∂ν
  rw [←integral_map_of_stronglyMeasurable hy hf.stronglyMeasurable,
    ←integral_map_of_stronglyMeasurable hy hg.stronglyMeasurable,
    goodPhases_residual_product cs ε M deadline start hn hB s j]
  exact hu v huI

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduled_cross_phase_mixed_le_ae_all_later
