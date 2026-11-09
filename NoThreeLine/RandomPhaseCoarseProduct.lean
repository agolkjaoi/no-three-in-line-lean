import NoThreeLine.RandomPhasePrefix

/-! Full finite-phase and intermediate-cut coarse product bounds with an
arbitrary initial law, independent of the original board. Only the initial
hierarchy is an input; each subsequent estimate is derived from the real
phase kernel, real residual board and real deadline retirement. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines

variable {n : ℕ} {B : ℝ}

theorem random_finitePhase_coarse_subsets_product (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (A L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hAL : A⊆L) (μ : Measure (GoodPhaseObservation n B)) [IsProbabilityMeasure μ] (c : Grid n→ℝ)
    (hinit : ∀E⊆A,(∫s,goodPhaseMixed Γ e (A\E) E L s ∂μ)≤∏q∈E,c q) :
    ∀k,∀E⊆A,
      (∫s,goodPhaseMixed Γ e (A\E) E L s ∂randomPhaseStateLaw cs ε M deadline start hn μ k)≤
        ∏q∈E,(c q+accumulatedPhaseCoarsePrice cs start e k q) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  intro k
  induction k with
  | zero =>
    intro E hEA
    rw [randomPhaseStateLaw_integral cs ε M deadline start hn hB μ 0 _
      (goodPhaseMixed_measurable Γ e (A\E) E L) _ (goodPhaseMixed_bounds Γ e (A\E) E L)]
    simpa only [goodPhases,accumulatedPhaseCoarsePrice,Finset.range_zero,Finset.sum_empty,add_zero,
      integral_const,probReal_univ,one_smul] using hinit E hEA
  | succ k ih =>
    intro E hEA
    let μk := randomPhaseStateLaw cs ε M deadline start hn μ k
    letI : IsProbabilityMeasure μk := randomPhaseStateLaw_probability cs ε M deadline start hn hB μ k
    have hprev : ∀F⊆A,(∫s,goodPhaseMixed (cs k).config.directions e (A\F) F L s ∂μk)≤
        ∏q∈F,(c q+accumulatedPhaseCoarsePrice cs start e k q) := by
      intro F hFA
      change (∫s,goodPhaseMixed (cs k).directions e (A\F) F L s ∂μk)≤_
      rw [hΓ k]
      exact ih F hFA
    have hphase := phaseKernelMixedMean_subsets_coarse_product (cs k).config ε M (phaseEndpoint cs start k)
      e A L hn hB (cs k).mask_le_one (hK k) hAL μk
      (fun q=>c q+accumulatedPhaseCoarsePrice cs start e k q) hprev E hEA (cs k).horizon
      ⟨(cs k).horizon.coe_nonneg,le_rfl⟩
    have hpost := randomPhase_mixed_le_endpointKernel cs ε M deadline start e (A\E) E L hn hB μ k
    rw [hΓ k] at hpost
    apply hpost.trans (hphase.trans_eq _)
    apply Finset.prod_congr rfl
    intro q _
    rw [accumulatedPhaseCoarsePrice_succ]
    ring

theorem random_scheduledCut_coarse_subsets_product (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (A L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hAL : A⊆L) (μ : Measure (GoodPhaseObservation n B)) [IsProbabilityMeasure μ] (c : Grid n→ℝ)
    (hinit : ∀E⊆A,(∫s,goodPhaseMixed Γ e (A\E) E L s ∂μ)≤∏q∈E,c q)
    (k : ℕ) (E : Finset (Grid n)) (hEA : E⊆A) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    (∫s,scheduledCutMean cs ε M deadline start e (A\E) E L hn s k t ∂μ)≤
      ∏q∈E,(c q+accumulatedPhaseCoarsePrice cs start e k q+
        ∫u in (0:ℝ)..t,phaseCoarseCoefficient (cs k).config (phaseEndpoint cs start k) e q u) := by
  let μk := randomPhaseStateLaw cs ε M deadline start hn μ k
  letI : IsProbabilityMeasure μk := randomPhaseStateLaw_probability cs ε M deadline start hn hB μ k
  have hprev : ∀F⊆A,(∫s,goodPhaseMixed (cs k).config.directions e (A\F) F L s ∂μk)≤
      ∏q∈F,(c q+accumulatedPhaseCoarsePrice cs start e k q) := by
    intro F hFA
    change (∫s,goodPhaseMixed (cs k).directions e (A\F) F L s ∂μk)≤_
    rw [hΓ k]
    exact random_finitePhase_coarse_subsets_product cs ε M deadline start Γ e A L hn hB hΓ hK hAL
      μ c hinit k F hFA
  rw [randomScheduledCutMean_eq_kernel cs ε M deadline start e (A\E) E L hn hB μ k t]
  exact phaseKernelMixedMean_subsets_coarse_product (cs k).config ε M (phaseEndpoint cs start k) e A L hn hB
    (cs k).mask_le_one (hK k) hAL μk (fun q=>c q+accumulatedPhaseCoarsePrice cs start e k q) hprev E hEA t ht

theorem random_scheduledCut_coarse_product (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCD : Disjoint C D) (hCDL : C∪D⊆L)
    (μ : Measure (GoodPhaseObservation n B)) [IsProbabilityMeasure μ] (c : Grid n→ℝ)
    (hinit : ∀E⊆C∪D,(∫s,goodPhaseMixed Γ e ((C∪D)\E) E L s ∂μ)≤∏q∈E,c q)
    (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    (∫s,scheduledCutMean cs ε M deadline start e C D L hn s k t ∂μ)≤
      ∏q∈D,(c q+accumulatedPhaseCoarsePrice cs start e k q+
        ∫u in (0:ℝ)..t,phaseCoarseCoefficient (cs k).config (phaseEndpoint cs start k) e q u) := by
  have hh := random_scheduledCut_coarse_subsets_product cs ε M deadline start Γ e (C∪D) L hn hB
    hΓ hK hCDL μ c hinit k D Finset.subset_union_right t ht
  have hset : (C∪D)\D=C := by
    ext p
    simp only [Finset.mem_sdiff,Finset.mem_union]
    exact ⟨fun h=>h.1.resolve_right h.2,fun h=>⟨Or.inl h,fun hp=>Finset.disjoint_left.mp hCD h hp⟩⟩
  rwa [hset] at hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.random_finitePhase_coarse_subsets_product
#print axioms NoThreeLine.BirthWitness.random_scheduledCut_coarse_product
