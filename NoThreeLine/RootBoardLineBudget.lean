import NoThreeLine.LineCreditErrorBudget
import NoThreeLine.MixedConnection

/-! Reindex actual board lines through a root into primitive directions.
The chosen direction map is injective because it recovers the full finite
line set. Thus the geometric budget applies to actual LineIndex sums. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteDirections
open PrimitiveLines GridLines AuxiliaryODE MixedConnection

abbrev RootBoardLineIndex {n : ℕ} (p : Grid n) := {L : LineIndex n // p∈L.val}

noncomputable instance rootBoardLineIndexFintype {n : ℕ} (p : Grid n) : Fintype (RootBoardLineIndex p) :=
  Fintype.ofFinite _

theorem rootBoardLine_direction_exists {n : ℕ} (p : Grid n) (L : RootBoardLineIndex p) :
    ∃d∈directionIndices n,L.val.val=gridLinePoints n (gridEmbed p) d.2 := by
  obtain ⟨q,hq,hpq⟩ := boardLine_has_other L.val p
  obtain ⟨d,hd,he⟩ := grid_point_direction p q hpq.symm
  refine ⟨d,hd,?_⟩
  rw [boardLine_eq L.val p q L.property hq hpq]
  ext r
  rw [mem_lineThrough,mem_gridLinePoints]
  exact (he r).symm

def rootBoardLineDirection {n : ℕ} (p : Grid n) (L : RootBoardLineIndex p) : Σ _h : ℕ,ZPoint :=
  Classical.choose (rootBoardLine_direction_exists p L)

theorem rootBoardLineDirection_mem {n : ℕ} (p : Grid n) (L : RootBoardLineIndex p) :
    rootBoardLineDirection p L∈directionIndices n := (Classical.choose_spec (rootBoardLine_direction_exists p L)).1

theorem rootBoardLineDirection_line {n : ℕ} (p : Grid n) (L : RootBoardLineIndex p) :
    L.val.val=gridLinePoints n (gridEmbed p) (rootBoardLineDirection p L).2 :=
  (Classical.choose_spec (rootBoardLine_direction_exists p L)).2

theorem rootBoardLineDirection_injective {n : ℕ} (p : Grid n) :
    Function.Injective (rootBoardLineDirection p) := by
  intro L K h
  apply Subtype.ext
  apply Subtype.ext
  rw [rootBoardLineDirection_line,rootBoardLineDirection_line,h]

theorem sum_rootBoardLine_le_directions {n : ℕ} (p : Grid n) (f : Finset (Grid n)→ℝ)
    (hf : ∀d∈directionIndices n,0≤f (gridLinePoints n (gridEmbed p) d.2)) :
    (∑L : RootBoardLineIndex p,f L.val.val)≤∑d∈directionIndices n,f (gridLinePoints n (gridEmbed p) d.2) := by
  classical
  have he : (∑L : RootBoardLineIndex p,f L.val.val)=
      ∑d∈Finset.univ.image (rootBoardLineDirection p),f (gridLinePoints n (gridEmbed p) d.2) := by
    rw [Finset.sum_image (fun L _ K _ h=>rootBoardLineDirection_injective p h)]
    apply Finset.sum_congr rfl
    intro L _
    rw [rootBoardLineDirection_line]
  rw [he]
  apply Finset.sum_le_sum_of_subset_of_nonneg
  · intro d hd
    obtain ⟨L,_,rfl⟩ := Finset.mem_image.mp hd
    exact rootBoardLineDirection_mem p L
  · intro d hd _
    exact hf d hd

def rootBoardLineErrorBudget {n : ℕ} (p : Grid n) (B : ℝ) : ℝ :=
  (∑L : RootBoardLineIndex p,((L.val.val.card:ℝ)^3+B*(L.val.val.card:ℝ)^2))/(n:ℝ)^3

theorem rootBoardLineErrorBudget_le {n : ℕ} (p : Grid n) (B : ℝ) (hB : 0≤B) :
    0≤rootBoardLineErrorBudget p B ∧ rootBoardLineErrorBudget p B≤lineCreditErrorBudget n (gridEmbed p) B := by
  constructor
  · unfold rootBoardLineErrorBudget
    positivity
  · apply div_le_div_of_nonneg_right _ (by positivity)
    exact sum_rootBoardLine_le_directions p (fun S=>(S.card:ℝ)^3+B*(S.card:ℝ)^2)
      (fun d _=>by positivity)

theorem rootBoardLineErrorBudget_bound {n : ℕ} (p : Grid n) (B : ℝ) (hB : 0≤B) :
    rootBoardLineErrorBudget p B≤64+16*(B/n)*(1+Real.log (n:ℝ)) :=
  (rootBoardLineErrorBudget_le p B hB).2.trans
    (lineCreditErrorBudget_bounds n (gridEmbed p) B ((Nat.zero_le p.1.val).trans_lt p.1.isLt) hB).2

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.sum_rootBoardLine_le_directions
#print axioms NoThreeLine.FiniteDirections.rootBoardLineErrorBudget_bound
