import NoThreeLine.CoarseReferenceGrid
import NoThreeLine.ScheduleGeometry
import Mathlib.Algebra.Order.Floor.Semiring

/-! Exact refinement of a coarse integer rectangle into 128 by 128 cells.
Equality is after the common 32768-grid erasure: an open compressed rectangle
may contain coarse seams, whereas the separate open cells do not. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.BenchmarkPrefix

def cellInBox (R : GridBox) (cell : Grid 128) : Prop :=
  R.x0 ≤ cell.1.val ∧ cell.1.val < R.x1 ∧ R.y0 ≤ cell.2.val ∧ cell.2.val < R.y1

instance (R : GridBox) (cell : Grid 128) : Decidable (cellInBox R cell) := by
  unfold cellInBox
  infer_instance

def refinedWeight (R : GridBox) (w : ℝ) (cell : Grid 128) : ℝ :=
  if cellInBox R cell then w else 0

theorem refinedWeight_nat_div (R : GridBox) (units : ℕ) (cell : Grid 128) :
    ((if cellInBox R cell then units else 0 : ℕ) : ℝ) / 100000000 =
      refinedWeight R ((units : ℝ) / 100000000) cell := by
  by_cases h : cellInBox R cell <;> simp [refinedWeight,h]

theorem coarse_line_mem_common (k : ℕ) (hk : k ≤ 128) :
    (k : ℝ)/128 ∈ commonGridLines 32768 := by
  refine Finset.mem_image.mpr ⟨k*256,Finset.mem_range.mpr (by omega),?_⟩
  push_cast
  ring

theorem qrect128_contains_iff (R : GridBox) (x y : ℝ) :
    (R.qrect 128).real.contains x y ↔
      (R.x0 : ℝ) < 128*x ∧ 128*x < R.x1 ∧ (R.y0 : ℝ) < 128*y ∧ 128*y < R.y1 := by
  norm_num [Rect.contains,QRect.real,GridBox.qrect]
  constructor <;> rintro ⟨ha,hb,hc,hd⟩ <;> refine ⟨?_,?_,?_,?_⟩ <;> linarith

theorem coarseGridRect_eq_unitCell (cell : Grid 128) :
    coarseGridRect cell = (GridBox.qrect 128
      ⟨cell.1.val,cell.1.val+1,cell.2.val,cell.2.val+1⟩).real := by
  unfold coarseGridRect coarseGridBox GridBox.qrect QRect.real
  congr 1 <;> push_cast <;> ring

theorem coarse_contains_iff (cell : Grid 128) (x y : ℝ) :
    (coarseGridRect cell).contains x y ↔
      (cell.1.val : ℝ) < 128*x ∧ 128*x < (cell.1.val : ℝ)+1 ∧
      (cell.2.val : ℝ) < 128*y ∧ 128*y < (cell.2.val : ℝ)+1 := by
  rw [coarseGridRect_eq_unitCell,qrect128_contains_iff]
  norm_num

theorem contained_cell_implies_box (R : GridBox) (cell : Grid 128)
    (hc : cellInBox R cell) (x y : ℝ) (hp : (coarseGridRect cell).contains x y) :
    (R.qrect 128).real.contains x y := by
  have h0 : (R.x0 : ℝ) ≤ cell.1.val := by exact_mod_cast hc.1
  have h1 : (cell.1.val : ℝ)+1 ≤ R.x1 := by exact_mod_cast (Nat.succ_le_iff.mpr hc.2.1)
  have h2 : (R.y0 : ℝ) ≤ cell.2.val := by exact_mod_cast hc.2.2.1
  have h3 : (cell.2.val : ℝ)+1 ≤ R.y1 := by exact_mod_cast (Nat.succ_le_iff.mpr hc.2.2.2)
  rw [qrect128_contains_iff]
  rcases (coarse_contains_iff cell x y).mp hp with ⟨ha,hb,hc',hd⟩
  exact ⟨h0.trans_lt ha,hb.trans_le h1,h2.trans_lt hc',hd.trans_le h3⟩

theorem coarse_axis_witness (a b : ℕ) (hb : b ≤ 128) (x : ℝ)
    (hx : x ∉ commonGridLines 32768) (ha : (a : ℝ) < 128*x) (hbx : 128*x < b) :
    ∃ i : Fin 128, a ≤ i.val ∧ i.val < b ∧
      (i.val : ℝ) < 128*x ∧ 128*x < (i.val : ℝ)+1 := by
  have hnonneg : 0 ≤ 128*x := (Nat.cast_nonneg a).trans ha.le
  have hfloorlt : Nat.floor (128*x) < b := (Nat.floor_lt hnonneg).mpr hbx
  let i : Fin 128 := ⟨Nat.floor (128*x),hfloorlt.trans_le hb⟩
  have hlo : a ≤ i.val := Nat.le_floor ha.le
  have hle : (i.val : ℝ) ≤ 128*x := Nat.floor_le hnonneg
  have hne : (i.val : ℝ) ≠ 128*x := by
    intro he
    have he' : x = (i.val : ℝ)/128 := by linarith
    apply hx
    rw [he']
    exact coarse_line_mem_common i.val i.isLt.le
  exact ⟨i,hlo,hfloorlt,lt_of_le_of_ne hle hne,Nat.lt_floor_add_one (128*x)⟩

theorem box_contains_cell_off_grid (R : GridBox) (hR : R.Valid 128) (x y : ℝ)
    (hx : x ∉ commonGridLines 32768) (hy : y ∉ commonGridLines 32768)
    (hp : (R.qrect 128).real.contains x y) :
    ∃ cell : Grid 128, cellInBox R cell ∧ (coarseGridRect cell).contains x y := by
  rcases (qrect128_contains_iff R x y).mp hp with ⟨ha,hb,hc,hd⟩
  obtain ⟨i,hi0,hi1,hix0,hix1⟩ := coarse_axis_witness R.x0 R.x1 hR.2.1 x hx ha hb
  obtain ⟨j,hj0,hj1,hjy0,hjy1⟩ := coarse_axis_witness R.y0 R.y1 hR.2.2.2 y hy hc hd
  refine ⟨(i,j),⟨hi0,hi1,hj0,hj1⟩,?_⟩
  exact (coarse_contains_iff (i,j) x y).mpr ⟨hix0,hix1,hjy0,hjy1⟩

theorem field_univ_eq_weight_of_contains {ι : Type*} [Fintype ι]
    (R : ι → Rect) (w : ι → ℝ) (x y : ℝ)
    (hsep : RectanglesSeparated Finset.univ R) (i : ι) (hi : (R i).contains x y) :
    rectangleField Finset.univ R w x y = w i :=
  rectangleField_eq_weight_of_contains Finset.univ R w x y hsep i (Finset.mem_univ i) hi

theorem field_eq_refined_off_grid (R : GridBox) (hR : R.Valid 128) (w x y : ℝ)
    (hx : x ∉ commonGridLines 32768) (hy : y ∉ commonGridLines 32768) :
    (R.qrect 128).real.field w x y =
      rectangleField Finset.univ coarseGridRect (refinedWeight R w) x y := by
  classical
  by_cases hp : (R.qrect 128).real.contains x y
  · obtain ⟨cell,hc,hp'⟩ := box_contains_cell_off_grid R hR x y hx hy hp
    have he := field_univ_eq_weight_of_contains coarseGridRect (refinedWeight R w) x y
      coarseGridRect_separated cell hp'
    rw [he]
    simp [Rect.field,refinedWeight,hp,hc]
  · have hz : rectangleField Finset.univ coarseGridRect (refinedWeight R w) x y = 0 := by
      unfold rectangleField
      apply Finset.sum_eq_zero
      intro cell _
      by_cases hc : cellInBox R cell
      · have hn : ¬(coarseGridRect cell).contains x y :=
          fun h => hp (contained_cell_implies_box R cell hc x y h)
        simp [Rect.field,hn]
      · simp [refinedWeight,hc,Rect.field]
    rw [hz]
    simp [Rect.field,hp]

theorem coarse_refine_field (R : GridBox) (hR : R.Valid 128) (w : ℝ) :
    eraseGrid (commonGridLines 32768) (commonGridLines 32768) ((R.qrect 128).real.field w) =
      eraseGrid (commonGridLines 32768) (commonGridLines 32768)
        (rectangleField Finset.univ coarseGridRect (refinedWeight R w)) := by
  classical
  funext x y
  by_cases hb : x ∈ commonGridLines 32768 ∨ y ∈ commonGridLines 32768
  · simp [eraseGrid,hb]
  · simp only [eraseGrid,if_neg hb]
    exact field_eq_refined_off_grid R hR w x y (fun h => hb (Or.inl h)) (fun h => hb (Or.inr h))

theorem coarse_refine_rectangleField {ι : Type*} (S : Finset ι) (R : ι → GridBox)
    (w : ι → ℝ) (hR : ∀ i ∈ S, (R i).Valid 128) :
    eraseGrid (commonGridLines 32768) (commonGridLines 32768)
      (rectangleField S (fun i => ((R i).qrect 128).real) w) =
    eraseGrid (commonGridLines 32768) (commonGridLines 32768)
      (rectangleField Finset.univ coarseGridRect
        (fun cell => ∑ i ∈ S, refinedWeight (R i) (w i) cell)) := by
  classical
  funext x y
  have he := FinitePhase.maskedField_sum_weights Finset.univ coarseGridRect
    (commonGridLines 32768) (commonGridLines 32768) S (fun _ => (1 : ℝ))
    (fun i => refinedWeight (R i) (w i)) x y
  simp only [one_mul] at he
  rw [he]
  by_cases hb : x ∈ commonGridLines 32768 ∨ y ∈ commonGridLines 32768
  · simp [eraseGrid,hb]
  · simp only [eraseGrid,if_neg hb]
    unfold rectangleField
    apply Finset.sum_congr rfl
    intro i hi
    have hh := congrFun (congrFun (coarse_refine_field (R i) (hR i hi) (w i)) x) y
    simpa only [eraseGrid,if_neg hb,rectangleField] using hh

end NoThreeLine.BenchmarkPrefix

#print axioms NoThreeLine.BenchmarkPrefix.coarse_refine_field
#print axioms NoThreeLine.BenchmarkPrefix.coarse_refine_rectangleField
