import NoThreeLine.SectionMaskRate
import NoThreeLine.AcceptedCommonGrid

/-! Actual accepted masks are binary. A fixed finite phase family therefore
has an exact finite-cell decomposition, using its original support sets.
No positive lower bound on masks or type densities is required. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open scoped BigOperators

namespace NoThreeLine

theorem rectangleUnionMask_binary {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (V H : Finset ℝ) (x y : ℝ) :
    rectangleUnionMask S R V H x y=0 ∨ rectangleUnionMask S R V H x y=1 := by
  classical
  unfold rectangleUnionMask eraseGrid
  split_ifs <;> simp <;> tauto

theorem AcceptedPhase.mask_binary {L : ℕ} (a : AcceptedPhase L) (G : ℕ)
    (V H : Finset ℝ) (r : Fin 4) (x y : ℝ) :
    a.mask G V H r x y=0 ∨ a.mask G V H r x y=1 := by
  unfold AcceptedPhase.mask
  split_ifs
  · exact rectangleUnionMask_binary _ _ _ _ _ _
  · simp

theorem AcceptedPhase.boardInput_binary {n : ℕ} (a : AcceptedPhase 8) (q : Grid n) :
    a.boardInput q=0 ∨ a.boardInput q=1 := a.mask_binary _ _ _ _ _ _

namespace BirthWitness
open AuxiliaryODE PrimitiveLines

def binaryMaskSupport {n : ℕ} (mask : Grid n → ℝ) : Finset (Grid n) :=
  Finset.univ.filter (fun q=>mask q=1)

theorem binaryMask_eq_indicator {n : ℕ} (mask : Grid n → ℝ)
    (hmask : ∀q, mask q=0 ∨ mask q=1) :
    mask = fun q=>if q∈binaryMaskSupport mask then 1 else 0 := by
  classical
  funext q
  rcases hmask q with hq | hq <;> simp [binaryMaskSupport,hq]

theorem binary_phase_mask_cells {n J : ℕ} (mask : Fin J → Grid n → ℝ)
    (hmask : ∀j q,mask j q=0 ∨ mask j q=1) (j : Fin J) :
    mask j = sectionCellMask (fun i=>binaryMaskSupport (mask i)) (fun i=>if i=j then 1 else 0) := by
  classical
  rw [binaryMask_eq_indicator (mask j) (hmask j)]
  funext q
  unfold sectionCellMask
  rw [Finset.sum_eq_single j]
  · simp
  · intro i _ hij
    simp [hij]
  · simp

theorem accepted_phase_mask_cells {n J : ℕ} (a : Fin J → AcceptedPhase 8) (j : Fin J) :
    (a j).boardInput (n:=n) = sectionCellMask
      (fun i=>binaryMaskSupport ((a i).boardInput (n:=n))) (fun i=>if i=j then 1 else 0) :=
  binary_phase_mask_cells (fun i=>(a i).boardInput) (fun i q=>(a i).boardInput_binary q) j

theorem physicalLineCreditRate_binary_budget {n : ℕ} (hn : 0<n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (hmask : ∀q,mask q=0 ∨ mask q=1)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val)
    (a : AugmentedState n) (B δ : ℝ) (hB : 0≤B) (ha : a.Valid B)
    (hsec : actualLineSectionMass L p (binaryMaskSupport mask) a ≤
      (((L.val∩binaryMaskSupport mask).erase p).card:ℝ)+δ*(n:ℝ)) :
    physicalLineCreditRate Γ mask L a.physical ≤
      (∑q∈L.val.erase p,mask q)/n+δ+B/n := by
  classical
  let cells : Unit → Finset (Grid n) := fun _=>binaryMaskSupport mask
  let c : Unit → ℝ := fun _=>1
  have heq : sectionCellMask cells c=mask := by
    conv_rhs => rw [binaryMask_eq_indicator mask hmask]
    funext q
    simp [sectionCellMask,cells,c]
  have hm : ∀q,0≤sectionCellMask cells c q ∧ sectionCellMask cells c q≤1 := by
    rw [heq]
    intro q
    rcases hmask q with h | h <;> simp [h]
  have hc : ∀i,0≤c i := fun _=>zero_le_one
  have hh := physicalLineCreditRate_cell_budget hn Γ cells c hc hm L p hpL a B δ hB ha (fun _=>hsec)
  rw [heq] at hh
  have hcard : (∑q∈L.val.erase p,mask q)=(((L.val∩binaryMaskSupport mask).erase p).card:ℝ) := by
    conv_lhs => rw [binaryMask_eq_indicator mask hmask]
    rw [←Finset.sum_filter]
    have hs : (L.val.erase p).filter (fun q=>q∈binaryMaskSupport mask)=(L.val∩binaryMaskSupport mask).erase p := by
      ext q
      simp only [Finset.mem_filter,Finset.mem_erase,Finset.mem_inter]
      tauto
    rw [hs]
    simp
  rw [hcard]
  simpa [cells,c] using hh

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.AcceptedPhase.boardInput_binary
#print axioms NoThreeLine.BirthWitness.accepted_phase_mask_cells
#print axioms NoThreeLine.BirthWitness.physicalLineCreditRate_binary_budget
