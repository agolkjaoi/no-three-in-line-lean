import NoThreeLine.FrozenOutsideCapacityInput
import NoThreeLine.FrozenSpecifiedClockBound
import NoThreeLine481.CapacityRows

/-! Transfer the common coarse field's line capacities to any
nonnegative terminal exposure dominated by the shortened field. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine AuxiliaryODE PrimitiveLines FiniteDirections FinitePhase
  FrozenCapacity GridChord SectionHeight SpecifiedBoardCount

private theorem terminalLineInput_le_chord {n : ℕ} (u : Grid n → ℝ)
    (hn : 0 < n)
    (hdom : ∀ q, u q ≤ (249/250:ℝ) *
      typedBoardWeight Finset.univ (fun i => (cellRect i).real) capacityTypedWeight q)
    (p : Grid n) (L : RootBoardLineIndex p) :
    (∑ q ∈ L.val.val, u q)/(n:ℝ) ≤
      (249/250:ℝ)*(shellChord Finset.univ (fun i => (cellRect i).real)
        capacityTypedWeight p (rootBoardLineDirection p L)/(2*(rootLineHeight p L:ℝ))) +
      ((249/250)*12312)/(n:ℝ) := by
  have hb := fullLineInput_le_scaled_chord Finset.univ
    (fun i => (cellRect i).real) capacityTypedWeight p L u 12 (249/250)
    hn (by norm_num) (by norm_num) cellRect_separated
    (fun z i _ => capacityTypedWeight_abs_le z i)
    (fun i _ => cellRect_inUnit i) (fun q _ => hdom q)
  norm_num at hb ⊢
  exact hb

theorem specifiedClockCap_of_coarse_domination {n : ℕ} (u : Grid n → ℝ)
    (hn : 2^24 ≤ n)
    (hdom : ∀ q, u q ≤ (249/250:ℝ) *
      typedBoardWeight Finset.univ (fun i => (cellRect i).real) capacityTypedWeight q)
    (L : LineIndex n) (hL : L ∈ specifiedBoardLines n gamma16) :
    (∑ q ∈ L.val, u q)/(n:ℝ) ≤ (255/128:ℝ)-1/10000 := by
  classical
  have hspec := (Finset.mem_filter.mp hL).2
  obtain ⟨p, hp, _⟩ := hspec
  let R : RootBoardLineIndex p := ⟨L, hp⟩
  have hspec' : specified gamma16 R.val := (Finset.mem_filter.mp hL).2
  have hc := frozen_specified_chord_capacity p R ((specified_gamma16_iff_height p R).mp hspec')
  have hmin : (16777216:ℝ) ≤ n := by exact_mod_cast hn
  have hnR : (0:ℝ) < n := by linarith
  calc
    _ ≤ (249/250:ℝ)*(shellChord Finset.univ (fun i => (cellRect i).real)
        capacityTypedWeight p (rootBoardLineDirection p R)/(2*(rootLineHeight p R:ℝ))) +
        ((249/250)*12312)/(n:ℝ) := terminalLineInput_le_chord u (by omega) hdom p R
    _ ≤ (249/250:ℝ)*(639781503/320000000) + ((249/250)*12312)/(n:ℝ) :=
      add_le_add (mul_le_mul_of_nonneg_left hc (by norm_num)) le_rfl
    _ ≤ _ := by
      apply (le_sub_iff_add_le').mp
      apply (div_le_iff₀ hnR).mpr
      nlinarith only [hmin]

theorem ordinaryTagCap_of_coarse_domination {n : ℕ} (u : Grid n → ℝ)
    (hn : 1610950 ≤ n) (hu : ∀ q, 0 ≤ u q)
    (hdom : ∀ q, u q ≤ (249/250:ℝ) *
      typedBoardWeight Finset.univ (fun i => (cellRect i).real) capacityTypedWeight q)
    (p : Grid n) (L : RootBoardLineIndex p) (hL : ¬specified gamma16 L.val) :
    (∑ q ∈ L.val.val.erase p, u q)/(n:ℝ) ≤ (4/5:ℝ) := by
  have hs := Finset.sum_le_sum_of_subset_of_nonneg
    (Finset.erase_subset p L.val.val) (fun q _ _ => hu q)
  have hnR : (0:ℝ) ≤ n := Nat.cast_nonneg _
  calc
    _ ≤ (∑ q ∈ L.val.val, u q)/(n:ℝ) :=
      div_le_div_of_nonneg_right hs hnR
    _ ≤ (249/250:ℝ)*(shellChord Finset.univ (fun i => (cellRect i).real)
        capacityTypedWeight p (rootBoardLineDirection p L)/(2*(rootLineHeight p L:ℝ))) +
        ((249/250)*12312)/(n:ℝ) := terminalLineInput_le_chord u (by omega) hdom p L
    _ ≤ (249/250:ℝ)*(30549893891/38400000000)+((249/250)*12312)/(n:ℝ) :=
      add_le_add (mul_le_mul_of_nonneg_left
        (outside_rootLine_capacity_of_rows all_low_rows_accepted p L hL) (by norm_num)) le_rfl
    _ ≤ _ := frozen_outside_discrete_margin hn

#print axioms specifiedClockCap_of_coarse_domination
#print axioms ordinaryTagCap_of_coarse_domination

end NoThreeLine481
