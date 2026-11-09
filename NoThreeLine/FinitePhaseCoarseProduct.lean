import NoThreeLine.CoarsePhaseKernelProduct
import NoThreeLine.FinitePhaseUnitProduct
import NoThreeLine.PhaseCutEndpoint

/-! Closed coarse-price product bounds over every finite scheduled phase
prefix on the same original board. Actual deadline retirement is included.
The canonical initialization supplies the entire initial hierarchy. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines

def accumulatedPhaseCoarsePrice {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start : ℝ)
    (e : Retention n) (k : ℕ) (q : Grid n) : ℝ :=
  ∑j∈Finset.range k,∫u in (0:ℝ)..(cs j).horizon,
    phaseCoarseCoefficient (cs j).config (phaseEndpoint cs start j) e q u

theorem accumulatedPhaseCoarsePrice_succ {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start : ℝ)
    (e : Retention n) (k : ℕ) (q : Grid n) :
    accumulatedPhaseCoarsePrice cs start e (k+1) q=accumulatedPhaseCoarsePrice cs start e k q+
      ∫u in (0:ℝ)..(cs k).horizon,phaseCoarseCoefficient (cs k).config (phaseEndpoint cs start k) e q u :=
  Finset.sum_range_succ _ _

theorem accumulatedPhaseCoarsePrice_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start : ℝ)
    (e : Retention n) (k : ℕ) (q : Grid n) : 0≤accumulatedPhaseCoarsePrice cs start e k q := by
  apply Finset.sum_nonneg
  intro j _
  exact intervalIntegral.integral_nonneg (cs j).horizon.coe_nonneg
    (fun u _=>(phaseCoarseCoefficient_bounds (cs j).config (phaseEndpoint cs start j) e (cs j).mask_le_one q u).1)

theorem finitePhase_coarse_subsets_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (A L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hAL : A⊆L) (s : GoodPhaseObservation n B) (c : Grid n→ℝ)
    (hinit : ∀E⊆A,goodPhaseMixed Γ e (A\E) E L s≤∏q∈E,c q) :
    ∀k,∀E⊆A,
      (∫ω,goodPhaseMixed Γ e (A\E) E L (goodPhases cs ε M deadline start hn s k ω).1
        ∂boardClockMeasure n (B/n))≤∏q∈E,(c q+accumulatedPhaseCoarsePrice cs start e k q) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  intro k
  induction k with
  | zero =>
    intro E hEA
    simpa only [goodPhases,accumulatedPhaseCoarsePrice,Finset.range_zero,Finset.sum_empty,add_zero,
      integral_const,probReal_univ,one_smul] using hinit E hEA
  | succ k ih =>
    intro E hEA
    let μ := goodPhaseStateLaw cs ε M deadline start hn s k
    letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s k
    have hprev : ∀F⊆A,(∫x,goodPhaseMixed (cs k).config.directions e (A\F) F L x ∂μ)≤
        ∏q∈F,(c q+accumulatedPhaseCoarsePrice cs start e k q) := by
      intro F hFA
      dsimp only [μ,goodPhaseStateLaw]
      rw [integral_map_of_stronglyMeasurable (goodPhases_measurable cs ε M deadline start hn s k).fst
        (goodPhaseMixed_measurable (cs k).config.directions e (A\F) F L).stronglyMeasurable]
      change (∫ω,goodPhaseMixed (cs k).directions e (A\F) F L
        (goodPhases cs ε M deadline start hn s k ω).1 ∂boardClockMeasure n (B/n))≤_
      rw [hΓ k]
      exact ih F hFA
    have hphase := phaseKernelMixedMean_subsets_coarse_product (cs k).config ε M (phaseEndpoint cs start k)
      e A L hn hB (cs k).mask_le_one (hK k) hAL
      μ (fun q=>c q+accumulatedPhaseCoarsePrice cs start e k q) hprev E hEA (cs k).horizon
      ⟨(cs k).horizon.coe_nonneg,le_rfl⟩
    have hpost := finitePhase_mixed_le_endpointCutMean cs ε M deadline start e (A\E) E L hn hB s k
    rw [hΓ k,scheduledCutMean_eq_kernel cs ε M deadline start e (A\E) E L hn hB s k] at hpost
    apply hpost.trans (hphase.trans_eq _)
    apply Finset.prod_congr rfl
    intro q _
    rw [accumulatedPhaseCoarsePrice_succ]
    ring

theorem initial_finitePhase_coarse_subsets_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (A L : Finset (Grid n))
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hAL : A⊆L) (k : ℕ) (E : Finset (Grid n)) (hEA : E⊆A) :
    (∫ω,goodPhaseMixed Γ e (A\E) E L
      (goodPhases cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) k ω).1
        ∂boardClockMeasure n (B/n))≤∏q∈E,accumulatedPhaseCoarsePrice cs start e k q := by
  have hh := finitePhase_coarse_subsets_product cs ε M deadline start Γ e A L hn (lt_of_lt_of_le zero_lt_one hB)
    hΓ hK hAL (initialGoodPhaseObservation B hB deadline start) (fun _=>0)
    (initialGoodPhase_unit_initial_bound cs ε M deadline start Γ e A L hB (hΓ 0)) k E hEA
  simpa only [zero_add] using hh

theorem initial_finitePhase_coarse_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCD : Disjoint C D) (hCDL : C∪D⊆L) (k : ℕ) :
    (∫ω,goodPhaseMixed Γ e C D L
      (goodPhases cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) k ω).1
        ∂boardClockMeasure n (B/n))≤∏q∈D,accumulatedPhaseCoarsePrice cs start e k q := by
  have hh := initial_finitePhase_coarse_subsets_product cs ε M deadline start Γ e (C∪D) L hn hB
    hΓ hK hCDL k D Finset.subset_union_right
  have hset : (C∪D)\D=C := by
    ext p
    simp only [Finset.mem_sdiff,Finset.mem_union]
    exact ⟨fun h=>h.1.resolve_right h.2,fun h=>⟨Or.inl h,fun hp=>Finset.disjoint_left.mp hCD h hp⟩⟩
  rwa [hset] at hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.finitePhase_coarse_subsets_product
#print axioms NoThreeLine.BirthWitness.initial_finitePhase_coarse_product
