import NoThreeLine.ScheduledSectionHeightTail
import NoThreeLine.SectionHeightSmall

/-! The actual canonical whole-line maximum is uniformly small under the
same full-J point measure. No direction/time union is replaced by n^2. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections SectionHeight

theorem exists_uniform_cellMaximum_threshold (δ d ζ κ : ℝ)
    (hδ : 0<δ) (hd : d<1) (hζ : 0<ζ) (hκ : 0<κ) :
    ∃ N : ℕ, 2≤N ∧ ∀ n : ℕ, N≤n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (Γ : Finset ZPoint) (p : Grid n) (E : Finset (Grid n)) (hn : 0<n) (hB : 1≤B) (J : ℕ),
        ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active →
        (∀j, (cs j).directions=Γ) → (∀j, (cs j).K<2) → B≤(n:ℝ)^d →
        (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J).real
          (scheduledCellMaximumBefore cs ((n:ℝ)^(-ζ)) M deadline start Γ p E δ hn hB J) < κ := by
  obtain ⟨m,hm,N,hN,hbound⟩ := exists_uniform_height_envelope_threshold δ d ζ κ hδ hd hζ hκ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start Γ p E hn hB J hp hΓ hK hBn
  have he0 : 0≤(n:ℝ)^(-ζ) := Real.rpow_nonneg (Nat.cast_nonneg n) _
  have he1 : (n:ℝ)^(-ζ)<1 := Real.rpow_lt_one_of_one_lt_of_neg
    (by exact_mod_cast (show 1<n by omega)) (neg_neg_of_pos hζ)
  exact (initial_phaseSectionPoint_cell_height_tail cs ((n:ℝ)^(-ζ)) M deadline start Γ p E δ hδ
    hn hB hp hΓ hK he0 he1 m (by omega) J).trans_lt
      (hbound n hNn B (zero_le_one.trans hB) hBn)

def scheduledFiniteCellMaximumBefore {n R : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (Γ : Finset ZPoint) (p : Grid n)
    (cells : Fin R → Finset (Grid n)) (δ : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ) : Set (BoardClockPath n) :=
  ⋃i:Fin R, scheduledCellMaximumBefore cs ε M deadline start Γ p (cells i) δ hn hB J

theorem scheduledFiniteCellMaximumBefore_measurableSet {n R : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (Γ : Finset ZPoint) (p : Grid n) (cells : Fin R → Finset (Grid n))
    (δ : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ) :
    MeasurableSet (scheduledFiniteCellMaximumBefore cs ε M deadline start Γ p cells δ hn hB J) :=
  MeasurableSet.iUnion (fun _ => scheduledCellMaximumBefore_measurableSet cs ε M deadline start Γ p _ δ hn hB J)

theorem exists_uniform_finiteCellMaximum_threshold (R : ℕ) (δ d ζ κ : ℝ)
    (hδ : 0<δ) (hd : d<1) (hζ : 0<ζ) (hκ : 0<κ) :
    ∃ N : ℕ, 2≤N ∧ ∀ n : ℕ, N≤n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (Γ : Finset ZPoint) (p : Grid n) (cells : Fin R → Finset (Grid n)) (hn : 0<n) (hB : 1≤B) (J : ℕ),
        ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active →
        (∀j, (cs j).directions=Γ) → (∀j, (cs j).K<2) → B≤(n:ℝ)^d →
        (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J).real
          (scheduledFiniteCellMaximumBefore cs ((n:ℝ)^(-ζ)) M deadline start Γ p cells δ hn hB J) < κ := by
  obtain ⟨N,hN,hbound⟩ := exists_uniform_cellMaximum_threshold δ d ζ (κ/((R:ℝ)+1))
    hδ hd hζ (by positivity)
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start Γ p cells hn hB J hp hΓ hK hBn
  let μ := phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs _ M deadline start hn hB p J
  calc
    _ ≤ ∑i:Fin R, μ.real (scheduledCellMaximumBefore cs ((n:ℝ)^(-ζ)) M deadline start Γ p (cells i) δ hn hB J) :=
      measureReal_iUnion_fintype_le _
    _ ≤ ∑_i:Fin R, κ/((R:ℝ)+1) := Finset.sum_le_sum (fun i _ =>
      (hbound n hNn B cs M deadline start Γ p (cells i) hn hB J hp hΓ hK hBn).le)
    _ = (R:ℝ)*κ/((R:ℝ)+1) := by simp; ring
    _ < κ := by
      apply (div_lt_iff₀ (by positivity : (0:ℝ)<(R:ℝ)+1)).mpr
      nlinarith

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.exists_uniform_cellMaximum_threshold
#print axioms NoThreeLine.BirthWitness.scheduledFiniteCellMaximumBefore_measurableSet
#print axioms NoThreeLine.BirthWitness.exists_uniform_finiteCellMaximum_threshold
