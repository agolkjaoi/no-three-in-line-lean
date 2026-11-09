import NoThreeLine.AcceptedSectionMasks
import NoThreeLine.ScheduledProtectedClockTail

/-! Binary phase masks give an exact finite-cell clock budget. The
deterministic input counts every point on the specified line. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def specifiedClockScheduleInput {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (L : LineIndex n) (J : ℕ) : ℝ :=
  ∑j∈Finset.range J,(cs j).horizon*((∑q∈L.val,(cs j).mask q)/n)

def clockMaskCells {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (J : ℕ) (i : Fin J) : Finset (Grid n) :=
  binaryMaskSupport (cs i.val).mask

def clockMaskCellWeight {J : ℕ} (j : ℕ) (i : Fin J) : ℝ := if i.val=j then 1 else 0

def clockMaskCellCap {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (L : LineIndex n) (δ : ℝ) (J : ℕ) (i : Fin J) : ℝ :=
  ((L.val∩clockMaskCells cs J i).card:ℝ)+δ*n

theorem binaryMask_line_card {n : ℕ} (L : LineIndex n) (mask : Grid n→ℝ)
    (hm : ∀q,mask q=0 ∨ mask q=1) :
    ((L.val∩binaryMaskSupport mask).card:ℝ)=∑q∈L.val,mask q := by
  classical
  have hfilter : L.val.filter (fun q=>q∈binaryMaskSupport mask)=L.val∩binaryMaskSupport mask := by
    ext q
    simp
  calc
    _ = ∑q∈L.val,if q∈binaryMaskSupport mask then (1:ℝ) else 0 := by
      rw [←Finset.sum_filter,hfilter]
      simp
    _ = _ := Finset.sum_congr rfl (fun q _=>congrFun (binaryMask_eq_indicator mask hm) q |>.symm)

theorem clockMaskCellWeight_nonneg {J : ℕ} (j : ℕ) (i : Fin J) :
    0≤clockMaskCellWeight j i := by
  unfold clockMaskCellWeight
  split <;> norm_num

theorem clockMaskCellCap_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (L : LineIndex n) (δ : ℝ) (hδ : 0≤δ) (J : ℕ) (i : Fin J) : 0≤clockMaskCellCap cs L δ J i :=
  add_nonneg (Nat.cast_nonneg _) (mul_nonneg hδ (Nat.cast_nonneg n))

theorem clockMaskCells_decomposition {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (J : ℕ) (hbin : ∀j<J,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1) (j : ℕ) (hj : j<J) :
    (cs j).config.mask=sectionCellMask (clockMaskCells cs J) (clockMaskCellWeight j) := by
  let masks := fun i : Fin J=>(cs i.val).mask
  let i : Fin J := ⟨j,hj⟩
  have h := binary_phase_mask_cells masks (fun i q=>hbin i.val i.isLt q) i
  have he : (fun t : Fin J=>if t=i then (1:ℝ) else 0)=clockMaskCellWeight j := by
    funext t
    have ht : t=i ↔ t.val=j := Fin.ext_iff
    simp only [clockMaskCellWeight,ht]
  rw [he] at h
  exact h

theorem clockMaskCells_budget_eq {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (L : LineIndex n)
    (hn : 0<n) (δ start : ℝ) (J : ℕ) (hbin : ∀j<J,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1) :
    (∑j∈Finset.range J,(cs j).horizon*((∑i,clockMaskCellWeight j i*clockMaskCellCap cs L δ J i)/n))=
      specifiedClockScheduleInput cs L J+(phaseEndpoint cs start J-start)*δ := by
  classical
  have hN : (n:ℝ)≠0 := ne_of_gt (by exact_mod_cast hn)
  have he (j : ℕ) (hj : j∈Finset.range J) :
      (∑i,clockMaskCellWeight j i*clockMaskCellCap cs L δ J i)/n=
        (∑q∈L.val,(cs j).mask q)/n+δ := by
    let i : Fin J := ⟨j,Finset.mem_range.mp hj⟩
    rw [Finset.sum_eq_single i]
    · simp only [clockMaskCellWeight, i, if_true,one_mul,clockMaskCellCap,clockMaskCells]
      rw [binaryMask_line_card L (cs j).mask (hbin j (Finset.mem_range.mp hj)),add_div]
      field_simp
    · intro t _ hti
      have ht : t.val≠j := fun hv=>hti (Fin.ext hv)
      simp [clockMaskCellWeight,ht]
    · simp
  rw [Finset.sum_congr rfl (fun j hj=>congrArg (fun r : ℝ=>(cs j).horizon*r) (he j hj))]
  simp only [specifiedClockScheduleInput,phaseEndpoint,NNReal.coe_sum,add_sub_cancel_left,
    mul_add,Finset.sum_add_distrib,Finset.sum_mul]

end NoThreeLine

#print axioms NoThreeLine.clockMaskCells_decomposition
#print axioms NoThreeLine.clockMaskCells_budget_eq

