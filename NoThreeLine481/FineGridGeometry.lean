import NoThreeLine481.TerminalMass

/-! Fine cells, their coarse parents, and the evaluation of the ranked
prefix field at a lattice point with the manuscript's boundary convention. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine PrimitiveLines GridChord FiniteDirections FrozenCapacity GridArea

def fineBox (i : Grid 256) : GridBox := ⟨i.1.val,i.1.val+1,i.2.val,i.2.val+1⟩

def fineRect (i : Grid 256) : Rect := ((fineBox i).qrect 256).real

private theorem fineBox_valid (i : Grid 256) : (fineBox i).Valid 256 := by
  have := i.1.isLt
  have := i.2.isLt
  dsimp [fineBox, GridBox.Valid]
  omega

theorem fineRect_inUnit (i : Grid 256) : (fineRect i).InUnitSquare :=
  ((fineBox i).qrect 256).qUnit_real ((fineBox i).valid_qrect 256 (by decide) (fineBox_valid i))

@[irreducible] def gridCells (g : ℕ) : Finset (Grid g) := Finset.univ

theorem mem_gridCells {g : ℕ} (i : Grid g) : i ∈ gridCells g := by
  rw [gridCells]
  exact Finset.mem_univ _

abbrev fineCells : Finset (Grid 256) := gridCells 256

theorem mem_fineCells (i : Grid 256) : i ∈ fineCells := mem_gridCells i

theorem fineRect_separated : RectanglesSeparated fineCells fineRect := by
  intro i _ j _ hij
  have hneq : i.1.val ≠ j.1.val ∨ i.2.val ≠ j.2.val := by
    by_contra h
    push Not at h
    exact hij (Prod.ext (Fin.ext h.1) (Fin.ext h.2))
  have hsep : (fineBox i).Separated (fineBox j) := by
    dsimp [fineBox, GridBox.Separated]
    omega
  exact ((fineBox i).qrect 256).qSeparated_real _
    ((fineBox i).separated_qrect 256 (by decide) _ hsep)

def fineCoordinate {n : ℕ} (x : Fin n) : Fin 256 :=
  ⟨256*x.val/n, (Nat.div_lt_iff_lt_mul (Nat.zero_lt_of_lt x.isLt)).mpr (by
    have := x.isLt
    omega)⟩

def fineCell {n : ℕ} (q : Grid n) : Grid 256 := (fineCoordinate q.1, fineCoordinate q.2)

def coarseParent (i : Grid 256) : Fin 256 :=
  ⟨(i.1.val/16)*16+i.2.val/16, by
    have := i.1.isLt
    have := i.2.isLt
    omega⟩

def onFineGrid {n : ℕ} (q : Grid n) : Prop :=
  normX n (gridEmbed q) ∈ commonGridLines 256 ∨ normY n (gridEmbed q) ∈ commonGridLines 256

private theorem fineCoordinate_interval {n : ℕ} (x : Fin n) :
    ((fineCoordinate x).val:ℝ)/256 ≤ (x.val:ℝ)/n ∧
    (x.val:ℝ)/n < ((fineCoordinate x).val+1:ℝ)/256 := by
  have hn := Nat.zero_lt_of_lt x.isLt
  have hnR : (0:ℝ) < n := by exact_mod_cast hn
  have hlo : (fineCoordinate x).val*n ≤ 256*x.val := Nat.div_mul_le_self _ _
  have hhi : 256*x.val < ((fineCoordinate x).val+1)*n :=
    (Nat.div_lt_iff_lt_mul hn).mp (Nat.lt_succ_self _)
  constructor
  · apply (div_le_div_iff₀ (by norm_num) hnR).mpr
    rw [mul_comm (x.val:ℝ) 256]
    exact_mod_cast hlo
  · apply (div_lt_div_iff₀ hnR (by norm_num)).mpr
    rw [mul_comm (x.val:ℝ) 256]
    exact_mod_cast hhi

private theorem fineCoordinate_left_mem {n : ℕ} (x : Fin n) :
    ((fineCoordinate x).val:ℝ)/256 ∈ commonGridLines 256 := by
  unfold commonGridLines
  exact Finset.mem_image.mpr ⟨(fineCoordinate x).val,
    Finset.mem_range.mpr ((fineCoordinate x).isLt.trans (by decide)),rfl⟩

theorem fineCell_contains {n : ℕ} (q : Grid n) (hq : ¬onFineGrid q) :
    (fineRect (fineCell q)).contains (normX n (gridEmbed q)) (normY n (gridEmbed q)) := by
  have hx := fineCoordinate_interval q.1
  have hy := fineCoordinate_interval q.2
  have hxx : ((fineCoordinate q.1).val:ℝ)/256 ≠ (q.1.val:ℝ)/n := by
    intro he
    apply hq
    left
    simpa [normX,gridEmbed,← he] using fineCoordinate_left_mem q.1
  have hyy : ((fineCoordinate q.2).val:ℝ)/256 ≠ (q.2.val:ℝ)/n := by
    intro he
    apply hq
    right
    simpa [normY,gridEmbed,← he] using fineCoordinate_left_mem q.2
  simp only [fineRect, fineBox, fineCell, Rect.contains, GridBox.qrect, QRect.real, normX,
    normY, gridEmbed, Rat.cast_div, Rat.cast_natCast, Int.cast_natCast]
  push_cast
  exact ⟨lt_of_le_of_ne hx.1 hxx,hx.2,lt_of_le_of_ne hy.1 hyy,hy.2⟩

private theorem parentInterval (x : Fin 256) :
    ((x.val/16:ℕ):ℝ)/16 ≤ (x.val:ℝ)/256 ∧
    ((x.val:ℝ)+1)/256 ≤ (((x.val/16:ℕ):ℝ)+1)/16 := by
  have h1 : ((x.val/16:ℕ):ℝ)*16 ≤ x.val := by
    exact_mod_cast Nat.div_mul_le_self x.val 16
  have h2 : (x.val:ℝ)+1 ≤ (((x.val/16:ℕ):ℝ)+1)*16 := by
    exact_mod_cast (show x.val+1 ≤ (x.val/16+1)*16 by omega)
  constructor <;> linarith only [h1,h2]

theorem coarseParent_contains (i : Grid 256) (x y : ℝ) (hi : (fineRect i).contains x y) :
    (cellRect (coarseParent i)).real.contains x y := by
  have hx : (coarseParent i).val/16 = i.1.val/16 := by
    have := i.2.isLt
    change (i.1.val/16*16+i.2.val/16)/16 = _
    omega
  have hy : (coarseParent i).val%16 = i.2.val/16 := by
    have := i.2.isLt
    change (i.1.val/16*16+i.2.val/16)%16 = _
    omega
  have hxf := parentInterval i.1
  have hyf := parentInterval i.2
  simp only [fineRect,fineBox,GridBox.qrect,QRect.real,Rect.contains,Rat.cast_div,
    Rat.cast_natCast] at hi
  simp only [cellRect,QRect.real,Rect.contains,hx,hy,Rat.cast_div,Rat.cast_natCast]
  push_cast at hi ⊢
  exact ⟨hxf.1.trans_lt hi.1,hi.2.1.trans_le hxf.2,
    hyf.1.trans_lt hi.2.2.1,hi.2.2.2.trans_le hyf.2⟩

#print axioms fineRect_separated
#print axioms fineCell_contains
#print axioms coarseParent_contains

end NoThreeLine481
