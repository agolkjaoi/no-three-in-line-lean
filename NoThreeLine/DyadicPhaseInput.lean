import NoThreeLine.GridUnionCertificate

/-! Literal dyadic-leaf and symmetry semantics for accepted phase inputs.
Depth and source metadata remain finite data; the coordinate conversion is a
general rational identity, not a Python producer assumption. -/
set_option autoImplicit false
namespace NoThreeLine

structure DyadicLeaf where
  depth : ℕ
  x : ℕ
  y : ℕ
  deriving DecidableEq, Repr

def DyadicLeaf.Valid (L : ℕ) (b : DyadicLeaf) : Prop :=
  b.depth ≤ L ∧ b.x < 2^b.depth ∧ b.y < 2^b.depth
instance (L : ℕ) (b : DyadicLeaf) : Decidable (b.Valid L) := by
  unfold DyadicLeaf.Valid
  infer_instance

def dyadicGridBox (L sx sy : ℕ) (b : DyadicLeaf) : GridBox :=
  ⟨sx*2^L+b.x*2^(L-b.depth),sx*2^L+(b.x+1)*2^(L-b.depth),
   sy*2^L+b.y*2^(L-b.depth),sy*2^L+(b.y+1)*2^(L-b.depth)⟩

def dyadicQRect (g sx sy : ℕ) (b : DyadicLeaf) : QRect :=
  ⟨((sx : ℚ)+(b.x : ℚ)/2^b.depth)/g,
   ((sx : ℚ)+((b.x : ℚ)+1)/2^b.depth)/g,
   ((sy : ℚ)+(b.y : ℚ)/2^b.depth)/g,
   ((sy : ℚ)+((b.y : ℚ)+1)/2^b.depth)/g⟩

theorem dyadicGridBox_qrect (g L sx sy : ℕ) (b : DyadicLeaf)
    (hg : 0 < g) (hd : b.depth ≤ L) :
    (dyadicGridBox L sx sy b).qrect (g*2^L) = dyadicQRect g sx sy b := by
  have hgq : (g : ℚ) ≠ 0 := by exact_mod_cast ne_of_gt hg
  have hp : (2 : ℚ)^L = (2 : ℚ)^(L-b.depth)*(2 : ℚ)^b.depth := by
    rw [← pow_add,Nat.sub_add_cancel hd]
  simp only [dyadicGridBox,GridBox.qrect,dyadicQRect,
    Nat.cast_add,Nat.cast_mul,Nat.cast_pow,Nat.cast_ofNat,Nat.cast_one]
  congr 1 <;> field_simp <;> rw [hp] <;> ring

def GridBox.symmetry (G : ℕ) (R : GridBox) (f : Fin 4) : GridBox :=
  ![R,⟨R.y0,R.y1,R.x0,R.x1⟩,⟨G-R.x1,G-R.x0,G-R.y1,G-R.y0⟩,
    ⟨G-R.y1,G-R.y0,G-R.x1,G-R.x0⟩] f

def QRect.symmetry (R : QRect) (f : Fin 4) : QRect :=
  ![R,⟨R.y0,R.y1,R.x0,R.x1⟩,⟨1-R.x1,1-R.x0,1-R.y1,1-R.y0⟩,
    ⟨1-R.y1,1-R.y0,1-R.x1,1-R.x0⟩] f

theorem GridBox.symmetry_qrect (G : ℕ) (hg : 0 < G) (R : GridBox)
    (hR : R.Valid G) (f : Fin 4) :
    (R.symmetry G f).qrect G = (R.qrect G).symmetry f := by
  have hgq : (G : ℚ) ≠ 0 := by exact_mod_cast ne_of_gt hg
  fin_cases f <;>
    simp [GridBox.symmetry,QRect.symmetry,GridBox.qrect,
      Nat.cast_sub hR.2.1,Nat.cast_sub (hR.1.trans hR.2.1),
      Nat.cast_sub hR.2.2.2,Nat.cast_sub (hR.2.2.1.trans hR.2.2.2)] <;>
    (repeat' apply And.intro) <;> field_simp <;> ring

def phaseImageBoxes {N : ℕ} (G L sx sy : ℕ) (boxes : Fin N → DyadicLeaf)
    (i : Fin (N*4)) : GridBox :=
  (dyadicGridBox L sx sy (boxes ⟨i.val/4,by have := i.isLt; omega⟩)).symmetry G
    ⟨i.val%4,by omega⟩

end NoThreeLine

#print axioms NoThreeLine.dyadicGridBox_qrect
#print axioms NoThreeLine.GridBox.symmetry_qrect
