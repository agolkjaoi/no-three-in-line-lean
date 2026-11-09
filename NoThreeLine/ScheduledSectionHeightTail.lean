import NoThreeLine.ScheduledSectionMaximumTail
import NoThreeLine.SectionHeightBounds

/-! A finite union over the actual nonspecified board lines through one
root, for one fixed cell/type subset. The sum is reindexed into the real
primitive-height shells; no time or phase counting factor occurs. -/
set_option autoImplicit false
set_option maxHeartbeats 1900000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections SectionHeight

def scheduledCellMaximumBefore {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (Γ : Finset ZPoint) (p : Grid n)
    (E : Finset (Grid n)) (δ : ℝ) (hn : 0 < n) (hB : 1 ≤ B) (J : ℕ) : Set (BoardClockPath n) :=
  ⋃ L : RootBoardLineIndex p, if specified Γ L.val then ∅ else
    scheduledSectionMaximumBefore cs ε M deadline start L.val p E
      ((((L.val.val ∩ E).erase p).card:ℝ)+δ*(n:ℝ)) hn (initialPhaseSection B hB p deadline start) J

theorem scheduledCellMaximumBefore_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (Γ : Finset ZPoint) (p : Grid n) (E : Finset (Grid n)) (δ : ℝ) (hn : 0 < n) (hB : 1 ≤ B) (J : ℕ) :
    MeasurableSet (scheduledCellMaximumBefore cs ε M deadline start Γ p E δ hn hB J) := by
  classical
  apply MeasurableSet.iUnion
  intro L
  split_ifs
  · exact MeasurableSet.empty
  · exact scheduledSectionMaximumBefore_measurableSet cs ε M deadline start L.val p E _ hn _ J

theorem initial_phaseSectionPoint_cell_height_tail {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (Γ : Finset ZPoint) (p : Grid n) (E : Finset (Grid n)) (δ : ℝ) (hδ : 0 < δ)
    (hn : 0 < n) (hB : 1 ≤ B)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (m : ℕ) (hm : 0 < m) (J : ℕ) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      (scheduledCellMaximumBefore cs ε M deadline start Γ p E δ hn hB J) ≤
        (∑ h ∈ Finset.Ico 1 n, (4*(h:ℝ))*heightMomentEnvelope n B δ m h)/(1-ε)^(m+1).choose 2 := by
  classical
  let ν := phasePointMeasure cs ε M deadline start hn hB p J
  let Z (L : RootBoardLineIndex p) : Set (BoardClockPath n) := if specified Γ L.val then ∅ else
    scheduledSectionMaximumBefore cs ε M deadline start L.val p E
      ((((L.val.val ∩ E).erase p).card:ℝ)+δ*(n:ℝ)) hn (initialPhaseSection B hB p deadline start) J
  let D := (1-ε)^(m+1).choose 2
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hnR : 0 < (n:ℝ) := by exact_mod_cast hn
  have hD : 0 < D := pow_pos (sub_pos.mpr hε) _
  have hb (L : RootBoardLineIndex p) : ν.real (Z L) ≤ heightMomentEnvelope n B δ m (rootLineHeight p L)/D := by
    by_cases hspec : specified Γ L.val
    · simp only [Z,if_pos hspec,measureReal_empty]
      exact div_nonneg (heightMomentEnvelope_nonneg n B δ (zero_le_one.trans hB) hδ.le m _) hD.le
    let ℓ : ℝ := ((L.val.val ∩ E).erase p).card
    have hℓ : 0 ≤ ℓ := Nat.cast_nonneg _
    have hA : 0 < ℓ+δ*(n:ℝ) := by positivity
    have ht := initial_phaseSectionPoint_maximum_tail L.val p E (ℓ+δ*(n:ℝ)) hA
      (le_add_of_nonneg_right (mul_nonneg hδ.le hnR.le)) Γ hspec L.property cs ε M deadline start hn hB hp
      hΓ hK hε0 hε m hm J
    have hheight := section_moment_height_bound n (rootLineHeight p L) hn
      (Finset.mem_Ico.mp (rootLineHeight_mem p L)).1 B ℓ δ (zero_le_one.trans hB) hℓ hδ
      (rootLine_section_card_le p L E) m
    simp only [Z,if_neg hspec]
    apply ht.trans
    rw [div_right_comm]
    exact div_le_div_of_nonneg_right hheight hD.le
  calc
    _ ≤ ∑ L : RootBoardLineIndex p, ν.real (Z L) := measureReal_iUnion_fintype_le _
    _ ≤ ∑ L : RootBoardLineIndex p, heightMomentEnvelope n B δ m (rootLineHeight p L)/D :=
      Finset.sum_le_sum (fun L _ => hb L)
    _ = (∑ L : RootBoardLineIndex p, heightMomentEnvelope n B δ m (rootLineHeight p L))/D :=
      (Finset.sum_div _ _ _).symm
    _ ≤ _ := div_le_div_of_nonneg_right
      (sum_rootLine_height_le p (heightMomentEnvelope n B δ m)
        (fun h _ => heightMomentEnvelope_nonneg n B δ (zero_le_one.trans hB) hδ.le m h)) hD.le

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledCellMaximumBefore_measurableSet
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_cell_height_tail
