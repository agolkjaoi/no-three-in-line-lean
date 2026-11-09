import NoThreeLine.VirtualRawHitTail
import NoThreeLine.SpecifiedBoardLineCount

/-! A finite union over actual specified lines and board points. Phase and
candidate indices have already been absorbed by the one saved snapshot. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines BirthWitness SpecifiedBoardCount

def anyRawVirtualHit {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃ (L : LineIndex n) (q : Grid n), ω ∈ phaseVirtualHitBefore cs ε M deadline start q hn
    (initialGoodPhaseRootObservation B hB q deadline start).val L J}

theorem anyRawVirtualHit_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (J : ℕ) :
    MeasurableSet (anyRawVirtualHit cs ε M deadline start hn hB J) := by
  simp only [anyRawVirtualHit, Set.setOf_exists]
  exact MeasurableSet.iUnion (fun L => MeasurableSet.iUnion (fun q =>
    phaseVirtualHitBefore_measurableSet cs ε M deadline start q hn _ L J))

theorem finite_specified_union_bound {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] {n : ℕ} (hn : 0<n) (Γ : Finset ZPoint)
    (E : LineIndex n → Grid n → Set Ω) (A : ℝ) (hA : 0≤A)
    (hs : ∀ L q ω, ω ∈ E L q → specified Γ L)
    (hb : ∀ L q, μ.real (E L q) ≤ A) :
    μ.real {ω | ∃ L q, ω ∈ E L q} ≤ (lineCountConstant Γ : ℝ)*(n:ℝ)^3*A := by
  have hsub : {ω | ∃ L q, ω ∈ E L q} ⊆
      ⋃ L ∈ specifiedBoardLines n Γ, ⋃ q, E L q := by
    rintro ω ⟨L,q,hω⟩
    exact Set.mem_iUnion.mpr ⟨L,Set.mem_iUnion.mpr
      ⟨Finset.mem_filter.mpr ⟨Finset.mem_univ _,hs L q ω hω⟩,Set.mem_iUnion.mpr ⟨q,hω⟩⟩⟩
  have hline : ((specifiedBoardLines n Γ).card : ℝ) ≤ (n:ℝ)*lineCountConstant Γ := by
    exact_mod_cast specifiedBoardLines_card_le n hn Γ
  calc
    _ ≤ μ.real (⋃ L ∈ specifiedBoardLines n Γ, ⋃ q, E L q) := measureReal_mono hsub (measure_ne_top μ _)
    _ ≤ ∑ L ∈ specifiedBoardLines n Γ, μ.real (⋃ q, E L q) := measureReal_biUnion_finset_le _ _
    _ ≤ ∑ L ∈ specifiedBoardLines n Γ, ∑ q, μ.real (E L q) :=
      Finset.sum_le_sum (fun L _ => measureReal_iUnion_fintype_le _)
    _ ≤ ∑ _L ∈ specifiedBoardLines n Γ, ∑ _q : Grid n, A :=
      Finset.sum_le_sum (fun L _ => Finset.sum_le_sum (fun q _ => hb L q))
    _ = ((specifiedBoardLines n Γ).card : ℝ)*(n:ℝ)^2*A := by
      simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, grid_card, Nat.cast_pow]
      ring
    _ ≤ ((n:ℝ)*lineCountConstant Γ)*(n:ℝ)^2*A :=
      mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right hline (sq_nonneg _)) hA
    _ = _ := by ring

theorem anyRawVirtualHit_C4_tail {n m : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ T ξ : ℝ)
    (hξ : 0<ξ) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (hm : 0<m) (hM : 0<M)
    (hΓ : ∀ j, (cs j).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀ j, (cs j).K≤K) (hρ : ∀ j, ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε≤1/2) (J : ℕ) (hT : phaseEndpoint cs start J-start≤T) :
    (boardClockMeasure n (B/n)).real (anyRawVirtualHit cs ε M deadline start hn hB J) ≤
      (lineCountConstant Γ : ℝ)*(n:ℝ)^3 *
        (momentConstant Γ K δ T ξ hξ m *
          (∑ a ∈ Finset.Icc 1 m, B^(m-a)*(n:ℝ)^((a:ℝ)*ξ)) / M^m) := by
  let A := momentConstant Γ K δ T ξ hξ m *
    (∑ a ∈ Finset.Icc 1 m, B^(m-a)*(n:ℝ)^((a:ℝ)*ξ)) / M^m
  have hT0 : 0≤T := (show 0≤phaseEndpoint cs start J-start by
    simpa only [add_zero] using scheduled_elapsed_nonneg cs start J 0 le_rfl).trans hT
  have hA : 0≤A := div_nonneg (mul_nonneg (momentConstant_pos Γ K δ T ξ hξ hδ hT0 m).le
    (Finset.sum_nonneg (fun a _ => mul_nonneg (pow_nonneg (zero_le_one.trans hB) _)
      (Real.rpow_nonneg (Nat.cast_nonneg _) _)))) (pow_nonneg hM.le _)
  letI := boardClockMeasure_probability n (B/n)
    (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  apply finite_specified_union_bound _ hn Γ _ A hA
  · intro L q ω hh
    exact (initial_rawHit_support cs ε M deadline start q hn hB hM Γ hΓ L J ω hh).1
  · intro L q
    by_cases hq : q ∉ L.val
    · exact initial_rawHit_C4_tail cs ε M deadline start K ρ δ T ξ hξ q hn hB Γ L hq hm hM
        hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε J hT
    · have he : phaseVirtualHitBefore cs ε M deadline start q hn
          (initialGoodPhaseRootObservation B hB q deadline start).val L J = ∅ := by
        apply Set.eq_empty_iff_forall_notMem.mpr
        intro ω hh
        exact hq (initial_rawHit_support cs ε M deadline start q hn hB hM Γ hΓ L J ω hh).2
      simpa only [he, measureReal_empty] using hA

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.finite_specified_union_bound
#print axioms NoThreeLine.VirtualWitness.anyRawVirtualHit_C4_tail
