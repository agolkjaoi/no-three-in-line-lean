import NoThreeLine.ScheduleTagInput

/-! Supply the high-height part of the deterministic outside input bound
from actual primitive line cardinality. No chord bound is postulated. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections SectionHeight

theorem sectionScheduleInput_le_card {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (L : LineIndex n) (p : Grid n) (J : ℕ) :
    sectionScheduleInput cs L p J ≤ phaseEndpoint cs 0 J*((L.val.erase p).card/(n:ℝ)) := by
  have hb (j : ℕ) : binaryLineInputRate (cs j).mask L p≤(L.val.erase p).card/(n:ℝ) := by
    apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
    calc
      (∑q∈L.val.erase p,(cs j).mask q) ≤ ∑_q∈L.val.erase p,(1:ℝ) :=
        Finset.sum_le_sum (fun q _=>(cs j).mask_le_one q)
      _ = _ := by simp
  calc
    _ ≤ ∑j∈Finset.range J,(cs j).horizon*((L.val.erase p).card/(n:ℝ)) :=
      Finset.sum_le_sum (fun j _=>mul_le_mul_of_nonneg_left (hb j) (cs j).horizon.coe_nonneg)
    _ = _ := by simp only [phaseEndpoint,NNReal.coe_sum,zero_add,Finset.sum_mul]

theorem sectionScheduleInput_le_height {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (p : Grid n) (L : RootBoardLineIndex p) (J : ℕ) (hn : 0<n) :
    sectionScheduleInput cs L.val p J ≤ 2*phaseEndpoint cs 0 J/(rootLineHeight p L:ℝ) := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  have hh : (0:ℝ)<rootLineHeight p L := by
    exact_mod_cast (show 0<rootLineHeight p L from (Finset.mem_Ico.mp (rootLineHeight_mem p L)).1)
  have hc : ((L.val.val.erase p).card:ℝ)≤2*(n:ℝ)/(rootLineHeight p L:ℝ) := by
    simpa only [Finset.inter_univ] using rootLine_section_card_le p L Finset.univ
  calc
    _ ≤ phaseEndpoint cs 0 J*((L.val.val.erase p).card/(n:ℝ)) := sectionScheduleInput_le_card cs L.val p J
    _ ≤ phaseEndpoint cs 0 J*((2*(n:ℝ)/(rootLineHeight p L:ℝ))/(n:ℝ)) :=
      mul_le_mul_of_nonneg_left (div_le_div_of_nonneg_right hc hnR.le) (phaseEndpoint_zero_nonneg cs J)
    _ = _ := by field_simp <;> ring

theorem sectionScheduleInput_le_of_height {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (p : Grid n) (L : RootBoardLineIndex p) (J H : ℕ) (hn : 0<n) (hH : 0<H)
    (hh : H≤rootLineHeight p L) (T lam : ℝ) (hT : 0≤T)
    (htime : phaseEndpoint cs 0 J≤T) (hbound : 2*T/(H:ℝ)≤lam) :
    sectionScheduleInput cs L.val p J≤lam := by
  have hHR : (0:ℝ)<H := by exact_mod_cast hH
  have hhh : (H:ℝ)≤rootLineHeight p L := by exact_mod_cast hh
  calc
    _ ≤ 2*phaseEndpoint cs 0 J/(rootLineHeight p L:ℝ) := sectionScheduleInput_le_height cs p L J hn
    _ ≤ 2*T/(rootLineHeight p L:ℝ) := div_le_div_of_nonneg_right
      (mul_le_mul_of_nonneg_left htime (by norm_num)) (Nat.cast_nonneg _)
    _ ≤ 2*T/(H:ℝ) := div_le_div_of_nonneg_left (mul_nonneg (by norm_num) hT) hHR hhh
    _ ≤ lam := hbound

theorem sectionScheduleInput_low_high {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (Γ : Finset ZPoint) (p : Grid n) (J H : ℕ) (hn : 0<n) (hH : 0<H)
    (T lam : ℝ) (hT : 0≤T) (htime : phaseEndpoint cs 0 J≤T) (hbound : 2*T/(H:ℝ)≤lam)
    (hlow : ∀L:RootBoardLineIndex p,¬specified Γ L.val → rootLineHeight p L<H →
      sectionScheduleInput cs L.val p J≤lam) :
    ∀L:RootBoardLineIndex p,¬specified Γ L.val → sectionScheduleInput cs L.val p J≤lam := by
  intro L hL
  by_cases hh : rootLineHeight p L<H
  · exact hlow L hL hh
  · exact sectionScheduleInput_le_of_height cs p L J H hn hH (Nat.le_of_not_gt hh) T lam hT htime hbound

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.sectionScheduleInput_le_height
#print axioms NoThreeLine.BirthWitness.sectionScheduleInput_low_high
