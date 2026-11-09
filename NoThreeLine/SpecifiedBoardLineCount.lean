import NoThreeLine.AuxiliaryODE
import Mathlib.Data.Int.Interval

/-! Count actual specified board lines by their integer determinant level.
Directions may be nonprimitive, duplicated geometrically, or zero. Only an
upper cover is counted, with a constant depending on the finite direction set. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.SpecifiedBoardCount
open AuxiliaryODE PrimitiveLines GridLines LineDrift

def directionSize (d : ZPoint) : ℕ := d.1.natAbs+d.2.natAbs

def lineCountConstant (Γ : Finset ZPoint) : ℕ :=
  Γ.sum (fun d => 2*directionSize d+1)

def levelLine (n : ℕ) (d : ZPoint) (c : ℤ) : Finset (Grid n) :=
  Finset.univ.filter (fun q => det d (gridEmbed q)=c)

def levelRange (n : ℕ) (d : ZPoint) : Finset ℤ :=
  Finset.Icc (-(n*directionSize d : ℕ) : ℤ) (n*directionSize d : ℕ)

def directionCover (n : ℕ) (d : ZPoint) : Finset (Finset (Grid n)) :=
  (levelRange n d).image (levelLine n d)

def specifiedCover (n : ℕ) (Γ : Finset ZPoint) : Finset (Finset (Grid n)) :=
  Γ.biUnion (directionCover n)

def specifiedBoardLines (n : ℕ) (Γ : Finset ZPoint) : Finset (LineIndex n) :=
  Finset.univ.filter (specified Γ)

theorem det_mem_levelRange {n : ℕ} (p : Grid n) (d : ZPoint) :
    det d (gridEmbed p) ∈ levelRange n d := by
  have hx : (p.1.val : ℤ) ≤ n := by exact_mod_cast p.1.isLt.le
  have hy : (p.2.val : ℤ) ≤ n := by exact_mod_cast p.2.isLt.le
  have hb : |det d (gridEmbed p)| ≤ (n*directionSize d : ℕ) := by
    calc
      _ ≤ |d.1| * (p.2.val : ℤ)+|d.2| * (p.1.val : ℤ) := by
        simpa only [det, gridEmbed, abs_mul, Int.abs_natCast] using
          abs_sub (d.1*(p.2.val : ℤ)) (d.2*(p.1.val : ℤ))
      _ ≤ |d.1| * (n : ℤ)+|d.2| * (n : ℤ) :=
        add_le_add (mul_le_mul_of_nonneg_left hy (abs_nonneg _))
          (mul_le_mul_of_nonneg_left hx (abs_nonneg _))
      _ = _ := by simp [directionSize, Int.natCast_natAbs]; ring
  exact Finset.mem_Icc.mpr (abs_le.mp hb)

theorem directionLine_eq_levelLine {n : ℕ} (p : Grid n) (d : ZPoint) :
    directionLine p d=levelLine n d (det d (gridEmbed p)) := by
  ext q
  simp only [directionLine, mem_gridLinePoints, levelLine, Finset.mem_filter,
    Finset.mem_univ, true_and]
  change d.1*((q.2.val : ℤ)-p.2.val)-d.2*((q.1.val : ℤ)-p.1.val)=0 ↔
    d.1*(q.2.val : ℤ)-d.2*(q.1.val : ℤ)=d.1*(p.2.val : ℤ)-d.2*(p.1.val : ℤ)
  constructor <;> intro h <;> nlinarith

theorem specified_mem_cover {n : ℕ} (Γ : Finset ZPoint) (L : LineIndex n)
    (hL : specified Γ L) : L.val ∈ specifiedCover n Γ := by
  obtain ⟨p,hp,hline⟩ := hL
  obtain ⟨d,hd,he⟩ := Finset.mem_image.mp (Finset.mem_inter.mp hline).1
  apply Finset.mem_biUnion.mpr
  refine ⟨d,(Finset.mem_filter.mp hd).1,?_⟩
  apply Finset.mem_image.mpr
  exact ⟨det d (gridEmbed p),det_mem_levelRange p d,
    (directionLine_eq_levelLine p d).symm.trans he⟩

theorem levelRange_card (n : ℕ) (d : ZPoint) :
    (levelRange n d).card=2*n*directionSize d+1 := by
  rw [levelRange, Int.card_Icc]
  rw [show 2*n*directionSize d+1=2*(n*directionSize d)+1 by ring]
  omega

theorem specifiedCover_card_le (n : ℕ) (hn : 0<n) (Γ : Finset ZPoint) :
    (specifiedCover n Γ).card ≤ n*lineCountConstant Γ := by
  calc
    _ ≤ ∑ d ∈ Γ, (directionCover n d).card := Finset.card_biUnion_le
    _ ≤ ∑ d ∈ Γ, n*(2*directionSize d+1) := by
      apply Finset.sum_le_sum
      intro d _
      apply (Finset.card_image_le.trans_eq (levelRange_card n d)).trans
      have : 2*n*directionSize d+1 ≤ n*(2*directionSize d+1) := by
        nlinarith
      exact this
    _ = n*lineCountConstant Γ := (Finset.mul_sum Γ (fun d => 2*directionSize d+1) n).symm

theorem specifiedBoardLines_card_le (n : ℕ) (hn : 0<n) (Γ : Finset ZPoint) :
    (specifiedBoardLines n Γ).card ≤ n*lineCountConstant Γ := by
  calc
    _ = ((specifiedBoardLines n Γ).image Subtype.val).card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ ≤ (specifiedCover n Γ).card := Finset.card_le_card (by
      intro L hL
      obtain ⟨L',hmem,he⟩ := Finset.mem_image.mp hL
      rw [← he]
      exact specified_mem_cover Γ L' (Finset.mem_filter.mp hmem).2)
    _ ≤ _ := specifiedCover_card_le n hn Γ

theorem grid_card (n : ℕ) : Fintype.card (Grid n)=n^2 := by
  simp [Grid, Fintype.card_prod, pow_two]

end NoThreeLine.SpecifiedBoardCount

#print axioms NoThreeLine.SpecifiedBoardCount.specifiedBoardLines_card_le
#print axioms NoThreeLine.SpecifiedBoardCount.grid_card
