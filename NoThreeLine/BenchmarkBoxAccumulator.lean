import NoThreeLine.BenchmarkRangeFacts
import NoThreeLine.CoarseReferenceGrid

/-! Reconstruction of compressed, integer-grid rectangles as exact natural
cell coefficients. Range updates visit only rows that belong to a rectangle.
Overlapping rectangles add their weights; no separation is silently assumed. -/
set_option autoImplicit false
namespace NoThreeLine.BenchmarkPrefix
open BenchmarkNatTree

def cellKey (p : Grid 128) : ℕ := p.1.val*128+p.2.val

theorem cellKey_lt (p : Grid 128) : cellKey p<2^14 := by
  have := p.1.isLt
  have := p.2.isLt
  change p.1.val*128+p.2.val<16384
  omega

def boxUnits (R : GridBox) (w : ℕ) (p : Grid 128) : ℕ :=
  if R.x0≤p.1.val ∧ p.1.val<R.x1 ∧ R.y0≤p.2.val ∧ p.2.val<R.y1 then w else 0

def rowIndices (R : GridBox) : List ℕ :=
  (List.range 128).filter (fun x => decide (R.x0≤x ∧ x<R.x1))

def boxRanges (R : GridBox) (w : ℕ) : List RangeUpdate :=
  (rowIndices R).map (fun x => ⟨x*128+R.y0,x*128+R.y1,w⟩)

theorem rangeContribution_rows (R : GridBox) (hR : R.y1≤128) (w : ℕ)
    (p : Grid 128) (xs : List ℕ) :
    rangeContribution (cellKey p) (xs.map (fun x => ⟨x*128+R.y0,x*128+R.y1,w⟩)) =
      contribution p.1.val (xs.map (fun x => (x,if R.y0≤p.2.val ∧ p.2.val<R.y1 then w else 0))) := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
      simp only [List.map_cons,rangeContribution,contribution,ih]
      have he : (x*128+R.y0≤cellKey p ∧ cellKey p<x*128+R.y1) ↔
          (p.1.val=x ∧ R.y0≤p.2.val ∧ p.2.val<R.y1) := by
        have := p.2.isLt
        unfold cellKey
        omega
      by_cases hx : p.1.val=x <;>
        by_cases hy : R.y0≤p.2.val ∧ p.2.val<R.y1 <;> simp [he,hx,hy]

theorem boxRanges_contribution (R : GridBox) (hR : R.y1≤128) (w : ℕ)
    (p : Grid 128) : rangeContribution (cellKey p) (boxRanges R w)=boxUnits R w p := by
  unfold boxRanges
  rw [rangeContribution_rows R hR]
  have hn : (rowIndices R).Nodup := List.Nodup.filter _ List.nodup_range
  rw [contribution_map_nodup (fun x : ℕ => x) (fun _ _ h => h) _ _ _ hn]
  simp only [rowIndices,List.mem_filter,List.mem_range,decide_eq_true_eq,p.1.isLt,true_and]
  by_cases hx : R.x0≤p.1.val ∧ p.1.val<R.x1 <;>
    by_cases hy : R.y0≤p.2.val ∧ p.2.val<R.y1 <;>
      simp [boxUnits,hx,hy]

def boxesRanges (xs : List (GridBox × ℕ)) : List RangeUpdate :=
  xs.flatMap (fun x => boxRanges x.1 x.2)

def boxesUnits (xs : List (GridBox × ℕ)) (p : Grid 128) : ℕ :=
  (xs.map (fun x => boxUnits x.1 x.2 p)).sum

theorem boxesRanges_contribution (xs : List (GridBox × ℕ))
    (h : ∀ x∈xs, x.1.y1≤128) (p : Grid 128) :
    rangeContribution (cellKey p) (boxesRanges xs)=boxesUnits xs p := by
  unfold boxesRanges boxesUnits
  rw [rangeContribution_flatMap]
  congr 1
  apply List.map_congr_left
  intro x hx
  exact boxRanges_contribution x.1 (h x hx) x.2 p

theorem checked_boxes (xs : List (GridBox × ℕ)) (t : BenchmarkNatTree)
    (hR : ∀ x∈xs, x.1.y1≤128)
    (hc : checkRanges 14 (.uniform 0) (boxesRanges xs) t=true) (p : Grid 128) :
    get 14 t (cellKey p)=boxesUnits xs p := by
  rw [checkRanges_sound _ _ _ _ hc _ (cellKey_lt p),boxesRanges_contribution xs hR]
  simp [BenchmarkNatTree.get]

end NoThreeLine.BenchmarkPrefix

#print axioms NoThreeLine.BenchmarkPrefix.checked_boxes
