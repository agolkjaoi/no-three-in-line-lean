import NoThreeLine.FinitePhaseUnitProduct

/-! The closed unit-price product bound at an arbitrary cut inside any
finite scheduled phase. Earlier phases are run on the original board and
all inherited records are retained. The current cut uses its true residual. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem initial_scheduledCut_unit_subsets_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (A L : Finset (Grid n))
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hAL : A⊆L) (hsep : SeparatedLabels Γ A) (k : ℕ) (E : Finset (Grid n)) (hEA : E⊆A)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    scheduledCutMean cs ε M deadline start e (A\E) E L hn
      (initialGoodPhaseObservation B hB deadline start) k t≤
        ∏q∈E,(accumulatedPhaseUnitPrice cs start e k q+
          ∫u in (0:ℝ)..t,phaseUnitCoefficient (cs k).config (phaseEndpoint cs start k) e q u) := by
  let s := initialGoodPhaseObservation B hB deadline start
  let μ := goodPhaseStateLaw cs ε M deadline start hn s k
  have hB0 : 0<B := lt_of_lt_of_le zero_lt_one hB
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB0 s k
  have hprev : ∀F⊆A,(∫x,goodPhaseMixed (cs k).config.directions e (A\F) F L x ∂μ)≤
      ∏q∈F,accumulatedPhaseUnitPrice cs start e k q := by
    intro F hFA
    dsimp only [μ,goodPhaseStateLaw]
    rw [integral_map_of_stronglyMeasurable (goodPhases_measurable cs ε M deadline start hn s k).fst
      (goodPhaseMixed_measurable (cs k).config.directions e (A\F) F L).stronglyMeasurable]
    change (∫ω,goodPhaseMixed (cs k).directions e (A\F) F L
      (goodPhases cs ε M deadline start hn s k ω).1 ∂boardClockMeasure n (B/n))≤_
    rw [hΓ k]
    exact initial_finitePhase_unit_subsets_product cs ε M deadline start Γ e A L hn hB hΓ hK hAL hsep k F hFA
  rw [scheduledCutMean_eq_kernel cs ε M deadline start e (A\E) E L hn hB0 s k]
  exact phaseKernelMixedMean_subsets_product (cs k).config ε M (phaseEndpoint cs start k) e A L hn hB0
    (cs k).mask_le_one (hK k) hAL (by simpa only [SharedPhase.config,hΓ k] using hsep)
    μ (accumulatedPhaseUnitPrice cs start e k) hprev E hEA t ht

theorem initial_scheduledCut_unit_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCD : Disjoint C D) (hCDL : C∪D⊆L) (hsep : SeparatedLabels Γ (C∪D)) (k : ℕ)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    scheduledCutMean cs ε M deadline start e C D L hn
      (initialGoodPhaseObservation B hB deadline start) k t≤
        ∏q∈D,(accumulatedPhaseUnitPrice cs start e k q+
          ∫u in (0:ℝ)..t,phaseUnitCoefficient (cs k).config (phaseEndpoint cs start k) e q u) := by
  have hh := initial_scheduledCut_unit_subsets_product cs ε M deadline start Γ e (C∪D) L hn hB
    hΓ hK hCDL hsep k D Finset.subset_union_right t ht
  have hset : (C∪D)\D=C := by
    ext p
    simp only [Finset.mem_sdiff,Finset.mem_union]
    exact ⟨fun h=>h.1.resolve_right h.2,fun h=>⟨Or.inl h,fun hp=>Finset.disjoint_left.mp hCD h hp⟩⟩
  rwa [hset] at hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCut_unit_product
