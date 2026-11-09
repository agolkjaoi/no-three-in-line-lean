import NoThreeLine.Target
import Mathlib.Data.Int.GCD
import Mathlib.Data.Finset.Image
import Mathlib.Tactic

/-! Integer parametrization of primitive lattice lines. The parameter is
constructed from Bezout coefficients, rather than assumed to exist. -/
set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine.PrimitiveLines

abbrev ZPoint := ℤ × ℤ

def Primitive (d : ZPoint) : Prop := Nat.gcd d.1.natAbs d.2.natAbs = 1

def det (d w : ZPoint) : ℤ := d.1*w.2-d.2*w.1

def linePoint (p d : ZPoint) (k : ℤ) : ZPoint :=
  (p.1+k*d.1,p.2+k*d.2)

def parameter (p d q : ZPoint) : ℤ :=
  Int.gcdA d.1 d.2*(q.1-p.1) + Int.gcdB d.1 d.2*(q.2-p.2)

theorem primitive_bezout (d : ZPoint) (hd : Primitive d) :
    d.1*Int.gcdA d.1 d.2 + d.2*Int.gcdB d.1 d.2 = 1 := by
  have he := Int.gcd_eq_gcd_ab d.1 d.2
  have hg : Int.gcd d.1 d.2 = 1 := hd
  rw [hg] at he
  simpa using he.symm

theorem primitive_ne_zero (d : ZPoint) (hd : Primitive d) : d ≠ (0,0) := by
  intro he
  have hb := primitive_bezout d hd
  simp [he] at hb

theorem parameter_linePoint (p d : ZPoint) (hd : Primitive d) (k : ℤ) :
    parameter p d (linePoint p d k) = k := by
  have hb := primitive_bezout d hd
  dsimp [parameter, linePoint]
  linear_combination k*hb

theorem linePoint_injective (p d : ZPoint) (hd : Primitive d) :
    Function.Injective (linePoint p d) :=
  (show Function.LeftInverse (parameter p d) (linePoint p d) from
    parameter_linePoint p d hd).injective

theorem linePoint_parameter (p d q : ZPoint) (hd : Primitive d)
    (hq : det d (q-p)=0) : q=linePoint p d (parameter p d q) := by
  have hb := primitive_bezout d hd
  dsimp [det] at hq
  apply Prod.ext
  · dsimp [linePoint, parameter]
    linear_combination -(q.1-p.1)*hb - Int.gcdB d.1 d.2*hq
  · dsimp [linePoint, parameter]
    linear_combination -(q.2-p.2)*hb + Int.gcdA d.1 d.2*hq

theorem det_linePoint (p d : ZPoint) (k : ℤ) : det d (linePoint p d k-p)=0 := by
  dsimp [det, linePoint]
  ring

/-- Every integral point on a primitive line has exactly one integer index. -/
theorem det_zero_iff_existsUnique (p d q : ZPoint) (hd : Primitive d) :
    det d (q-p)=0 ↔ ∃! k : ℤ, q=linePoint p d k := by
  constructor
  · intro hq
    refine ⟨parameter p d q, linePoint_parameter p d q hd hq, ?_⟩
    intro k hk
    have he := congrArg (parameter p d) hk
    rw [parameter_linePoint p d hd k] at he
    exact he.symm
  · rintro ⟨k,hk,_⟩
    rw [hk]
    exact det_linePoint p d k

def gridEmbed {n : ℕ} (q : Grid n) : ZPoint := (q.1.val,q.2.val)

theorem orientedArea_eq_det {n : ℕ} (p q r : Grid n) :
    orientedArea p q r = det (gridEmbed q-gridEmbed p) (gridEmbed r-gridEmbed p) := rfl

theorem gridEmbed_injective (n : ℕ) : Function.Injective (@gridEmbed n) := by
  intro q r he
  apply Prod.ext
  · apply Fin.ext
    have hx := congrArg Prod.fst he
    dsimp [gridEmbed] at hx
    exact_mod_cast hx
  · apply Fin.ext
    have hy := congrArg Prod.snd he
    dsimp [gridEmbed] at hy
    exact_mod_cast hy

def InGrid (n : ℕ) (z : ZPoint) : Prop :=
  0 ≤ z.1 ∧ z.1 < n ∧ 0 ≤ z.2 ∧ z.2 < n

theorem gridEmbed_inGrid {n : ℕ} (q : Grid n) : InGrid n (gridEmbed q) := by
  dsimp [InGrid, gridEmbed]
  exact ⟨by positivity, by exact_mod_cast q.1.isLt,
    by positivity, by exact_mod_cast q.2.isLt⟩

def gridPoint (n : ℕ) (z : ZPoint) (hz : InGrid n z) : Grid n :=
  (⟨z.1.toNat, by
    have he : (z.1.toNat:ℤ) < n := by simpa only [Int.toNat_of_nonneg hz.1] using hz.2.1
    exact_mod_cast he⟩,
   ⟨z.2.toNat, by
    have he : (z.2.toNat:ℤ) < n := by simpa only [Int.toNat_of_nonneg hz.2.2.1] using hz.2.2.2
    exact_mod_cast he⟩)

theorem gridEmbed_gridPoint (n : ℕ) (z : ZPoint) (hz : InGrid n z) :
    gridEmbed (gridPoint n z hz) = z := by
  apply Prod.ext <;> simp only [gridPoint, gridEmbed]
  · exact Int.toNat_of_nonneg hz.1
  · exact Int.toNat_of_nonneg hz.2.2.1

def gridLinePoints (n : ℕ) (p d : ZPoint) : Finset (Grid n) := by
  classical
  exact Finset.univ.filter (fun q => det d (gridEmbed q-p)=0)

theorem mem_gridLinePoints {n : ℕ} (p d : ZPoint) (q : Grid n) :
    q ∈ gridLinePoints n p d ↔ det d (gridEmbed q-p)=0 := by
  simp [gridLinePoints]

def gridLineParameters (n : ℕ) (p d : ZPoint) : Finset ℤ :=
  (gridLinePoints n p d).image (fun q => parameter p d (gridEmbed q))

theorem mem_gridLineParameters (n : ℕ) (p d : ZPoint) (hd : Primitive d) (k : ℤ) :
    k ∈ gridLineParameters n p d ↔ InGrid n (linePoint p d k) := by
  classical
  constructor
  · intro hk
    obtain ⟨q,hq,rfl⟩ := Finset.mem_image.mp hk
    have he := linePoint_parameter p d (gridEmbed q) hd ((mem_gridLinePoints p d q).mp hq)
    rw [← he]
    exact gridEmbed_inGrid q
  · intro hk
    let q := gridPoint n (linePoint p d k) hk
    have hq : gridEmbed q = linePoint p d k := gridEmbed_gridPoint n _ hk
    apply Finset.mem_image.mpr
    refine ⟨q,?_,?_⟩
    · apply (mem_gridLinePoints p d q).mpr
      rw [hq]
      exact det_linePoint p d k
    · rw [hq, parameter_linePoint p d hd k]

theorem parameter_injective_on_gridLine (n : ℕ) (p d : ZPoint) (hd : Primitive d) :
    Set.InjOn (fun q : Grid n => parameter p d (gridEmbed q)) (gridLinePoints n p d) := by
  intro q hq r hr he
  dsimp only at he
  apply gridEmbed_injective n
  rw [linePoint_parameter p d (gridEmbed q) hd ((mem_gridLinePoints p d q).mp hq),
      linePoint_parameter p d (gridEmbed r) hd ((mem_gridLinePoints p d r).mp hr), he]

theorem gridLine_card_eq_parameters (n : ℕ) (p d : ZPoint) (hd : Primitive d) :
    (gridLinePoints n p d).card = (gridLineParameters n p d).card := by
  symm
  exact Finset.card_image_of_injOn (parameter_injective_on_gridLine n p d hd)

/-- Exact reindexing for every weight; no sum estimate is an input. -/
theorem sum_gridLine_eq_parameters (n : ℕ) (p d : ZPoint) (hd : Primitive d)
    (f : ZPoint → ℝ) :
    (∑ q ∈ gridLinePoints n p d, f (gridEmbed q)) =
      ∑ k ∈ gridLineParameters n p d, f (linePoint p d k) := by
  classical
  rw [gridLineParameters, Finset.sum_image (parameter_injective_on_gridLine n p d hd)]
  apply Finset.sum_congr rfl
  intro q hq
  rw [← linePoint_parameter p d (gridEmbed q) hd ((mem_gridLinePoints p d q).mp hq)]

def parity (z : ZPoint) : ZPoint := (z.1%2,z.2%2)

theorem linePoint_parity (p d : ZPoint) (k : ℤ) :
    parity (linePoint p d k) =
      ((p.1%2 + (k%2)*(d.1%2))%2, (p.2%2+(k%2)*(d.2%2))%2) := by
  apply Prod.ext <;> simp [parity, linePoint, Int.add_emod, Int.mul_emod]

theorem linePoint_parity_even (p d : ZPoint) (k : ℤ) (hk : k%2=0) :
    parity (linePoint p d k)=parity p := by
  rw [linePoint_parity]
  simp [parity, hk]

theorem linePoint_parity_odd (p d : ZPoint) (k : ℤ) (hk : k%2=1) :
    parity (linePoint p d k)=parity (p+d) := by
  rw [linePoint_parity]
  simp [parity, hk, Int.add_emod]

theorem primitive_parity_ne_zero (d : ZPoint) (hd : Primitive d) : parity d ≠ (0,0) := by
  intro he
  have hx := congrArg Prod.fst he
  have hy := congrArg Prod.snd he
  dsimp [parity] at hx hy
  have hb := congrArg (fun z : ℤ => z%2) (primitive_bezout d hd)
  simp [Int.add_emod, Int.mul_emod, hx, hy] at hb

theorem primitive_parity_step_ne (p d : ZPoint) (hd : Primitive d) :
    parity (p+d) ≠ parity p := by
  intro he
  have hx := congrArg Prod.fst he
  have hy := congrArg Prod.snd he
  dsimp [parity] at hx hy
  apply primitive_parity_ne_zero d hd
  apply Prod.ext <;> dsimp [parity] <;> omega

def gridOfParameter (n : ℕ) (p d : ZPoint) (hd : Primitive d) (k : ℤ)
    (hk : k ∈ gridLineParameters n p d) : Grid n :=
  gridPoint n (linePoint p d k) ((mem_gridLineParameters n p d hd k).mp hk)

theorem gridEmbed_gridOfParameter (n : ℕ) (p d : ZPoint) (hd : Primitive d) (k : ℤ)
    (hk : k ∈ gridLineParameters n p d) :
    gridEmbed (gridOfParameter n p d hd k hk) = linePoint p d k :=
  gridEmbed_gridPoint n _ _

theorem gridOfParameter_mem (n : ℕ) (p d : ZPoint) (hd : Primitive d) (k : ℤ)
    (hk : k ∈ gridLineParameters n p d) :
    gridOfParameter n p d hd k hk ∈ gridLinePoints n p d := by
  apply (mem_gridLinePoints p d _).mpr
  rw [gridEmbed_gridOfParameter]
  exact det_linePoint p d k

/-- The explicit finite equivalence and its explicit inverse. -/
def gridLineEquiv (n : ℕ) (p d : ZPoint) (hd : Primitive d) :
    {q : Grid n // q ∈ gridLinePoints n p d} ≃
      {k : ℤ // k ∈ gridLineParameters n p d} where
  toFun q := ⟨parameter p d (gridEmbed q.val), Finset.mem_image.mpr ⟨q.val,q.property,rfl⟩⟩
  invFun k := ⟨gridOfParameter n p d hd k.val k.property,
    gridOfParameter_mem n p d hd k.val k.property⟩
  left_inv q := by
    apply Subtype.ext
    apply gridEmbed_injective n
    rw [gridEmbed_gridOfParameter]
    exact (linePoint_parameter p d (gridEmbed q.val) hd
      ((mem_gridLinePoints p d q.val).mp q.property)).symm
  right_inv k := by
    apply Subtype.ext
    dsimp only
    rw [gridEmbed_gridOfParameter, parameter_linePoint p d hd]

theorem linePoint_zero (p d : ZPoint) : linePoint p d 0 = p := by simp [linePoint]

theorem root_mem_gridLine {n : ℕ} (p : Grid n) (d : ZPoint) :
    p ∈ gridLinePoints n (gridEmbed p) d := by
  apply (mem_gridLinePoints _ _ _).mpr
  simp [det]

theorem zero_mem_gridLineParameters {n : ℕ} (p : Grid n) (d : ZPoint) (hd : Primitive d) :
    0 ∈ gridLineParameters n (gridEmbed p) d := by
  apply (mem_gridLineParameters _ _ _ hd _).mpr
  rw [linePoint_zero]
  exact gridEmbed_inGrid p

theorem sum_gridLine_erase_eq_parameters {n : ℕ} (p : Grid n) (d : ZPoint)
    (hd : Primitive d) (f : ZPoint → ℝ) :
    (∑ q ∈ (gridLinePoints n (gridEmbed p) d).erase p, f (gridEmbed q)) =
      ∑ k ∈ (gridLineParameters n (gridEmbed p) d).erase 0,
        f (linePoint (gridEmbed p) d k) := by
  classical
  have hg := Finset.sum_erase_add (gridLinePoints n (gridEmbed p) d)
    (fun q => f (gridEmbed q)) (root_mem_gridLine p d)
  have hk := Finset.sum_erase_add (gridLineParameters n (gridEmbed p) d)
    (fun k => f (linePoint (gridEmbed p) d k)) (zero_mem_gridLineParameters p d hd)
  rw [linePoint_zero] at hk
  have he := sum_gridLine_eq_parameters n (gridEmbed p) d hd f
  linarith

/-- Reindexing also preserves the actual two parity types of the line. -/
theorem sum_gridLine_erase_parity_split {n : ℕ} (p : Grid n) (d : ZPoint)
    (hd : Primitive d) (F : ZPoint → ZPoint → ℝ) :
    (∑ q ∈ (gridLinePoints n (gridEmbed p) d).erase p,
        F (parity (gridEmbed q)) (gridEmbed q)) =
      (∑ k ∈ ((gridLineParameters n (gridEmbed p) d).erase 0).filter (fun k => k%2=0),
        F (parity (gridEmbed p)) (linePoint (gridEmbed p) d k)) +
      ∑ k ∈ ((gridLineParameters n (gridEmbed p) d).erase 0).filter (fun k => k%2=1),
        F (parity (gridEmbed p+d)) (linePoint (gridEmbed p) d k) := by
  classical
  rw [sum_gridLine_erase_eq_parameters p d hd (fun z => F (parity z) z)]
  have hcase (k : ℤ) : F (parity (linePoint (gridEmbed p) d k)) (linePoint (gridEmbed p) d k) =
      if k%2=0 then F (parity (gridEmbed p)) (linePoint (gridEmbed p) d k)
      else F (parity (gridEmbed p+d)) (linePoint (gridEmbed p) d k) := by
    by_cases hk : k%2=0
    · rw [if_pos hk, linePoint_parity_even _ _ _ hk]
    · rw [if_neg hk, linePoint_parity_odd _ _ _ (by omega)]
  simp_rw [hcase]
  rw [Finset.sum_ite]
  congr 1
  apply Finset.sum_congr
  · ext k
    simp only [Finset.mem_filter]
    apply and_congr_right
    intro _
    omega
  · intro k _
    rfl

end NoThreeLine.PrimitiveLines

#print axioms NoThreeLine.PrimitiveLines.det_zero_iff_existsUnique
#print axioms NoThreeLine.PrimitiveLines.mem_gridLineParameters
#print axioms NoThreeLine.PrimitiveLines.sum_gridLine_eq_parameters
#print axioms NoThreeLine.PrimitiveLines.linePoint_parity
#print axioms NoThreeLine.PrimitiveLines.gridLineEquiv
#print axioms NoThreeLine.PrimitiveLines.sum_gridLine_erase_parity_split
