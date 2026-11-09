import Mathlib.Data.Real.Basic
import Mathlib.Tactic

set_option autoImplicit false

namespace NoThreeLine

/-- Exact coefficients of the branch `a + b / u`. -/
structure Coeff where
  a : ℚ
  b : ℚ
  deriving DecidableEq, Repr

def Coeff.add (x y : Coeff) : Coeff := ⟨x.a + y.a, x.b + y.b⟩
def Coeff.scale (q : ℚ) (x : Coeff) : Coeff := ⟨q * x.a, q * x.b⟩
noncomputable def Coeff.eval (c : Coeff) (u : ℝ) : ℝ := c.a + c.b / u

/-- The expression syntax used by rational rectangle envelopes. -/
inductive Expr where
  | atom : Coeff → Expr
  | add : Expr → Expr → Expr
  | scale : ℚ → Expr → Expr
  | min : Expr → Expr → Expr
  | max : Expr → Expr → Expr
  deriving Repr

noncomputable def Expr.eval : Expr → ℝ → ℝ
  | .atom c, u => c.eval u
  | .add x y, u => x.eval u + y.eval u
  | .scale q x, u => q * x.eval u
  | .min x y, u => Min.min (x.eval u) (y.eval u)
  | .max x y, u => Max.max (x.eval u) (y.eval u)

/-- Both endpoint tests use the numerator; they are meaningful even at `r = 0`. -/
def Coeff.leOn (x y : Coeff) (r s : ℚ) : Bool :=
  decide (0 ≤ (y.a - x.a) * r + (y.b - x.b) ∧
    0 ≤ (y.a - x.a) * s + (y.b - x.b))

/-- A failed comparison returns `none`, requesting a finer interval. -/
def Expr.check : Expr → ℚ → ℚ → Option Coeff
  | .atom c, _, _ => some c
  | .add x y, r, s => (x.check r s).bind fun cx =>
      (y.check r s).bind fun cy => some (cx.add cy)
  | .scale q x, r, s => (x.check r s).bind fun cx => some (cx.scale q)
  | .min x y, r, s => (x.check r s).bind fun cx =>
      (y.check r s).bind fun cy =>
      if cx.leOn cy r s then some cx
      else if cy.leOn cx r s then some cy
      else none
  | .max x y, r, s => (x.check r s).bind fun cx =>
      (y.check r s).bind fun cy =>
      if cx.leOn cy r s then some cy
      else if cy.leOn cx r s then some cx
      else none

theorem linear_nonneg_between (a b r s u : ℝ)
    (hr : r ≤ u) (hs : u ≤ s) (hl : 0 ≤ a * r + b) (hh : 0 ≤ a * s + b) :
    0 ≤ a * u + b := by
  by_cases ha : 0 ≤ a
  · nlinarith [mul_nonneg ha (sub_nonneg.mpr hr)]
  · nlinarith [mul_nonneg_of_nonpos_of_nonpos (le_of_not_ge ha) (sub_nonpos.mpr hs)]

theorem Coeff.leOn_sound_of_pos (x y : Coeff) (r s : ℚ) (u : ℝ)
    (hru : (r : ℝ) ≤ u) (hus : u ≤ (s : ℝ)) (hu : 0 < u)
    (hcheck : x.leOn y r s = true) : x.eval u ≤ y.eval u := by
  have hend : 0 ≤ (y.a - x.a) * r + (y.b - x.b) ∧
      0 ≤ (y.a - x.a) * s + (y.b - x.b) := by
    simpa only [Coeff.leOn, decide_eq_true_eq] using hcheck
  have hl : 0 ≤ ((y.a : ℝ) - x.a) * r + ((y.b : ℝ) - x.b) := by
    exact_mod_cast hend.1
  have hh : 0 ≤ ((y.a : ℝ) - x.a) * s + ((y.b : ℝ) - x.b) := by
    exact_mod_cast hend.2
  have hn := linear_nonneg_between ((y.a : ℝ) - x.a) ((y.b : ℝ) - x.b)
    r s u hru hus hl hh
  have he : y.eval u - x.eval u =
      (((y.a : ℝ) - x.a) * u + ((y.b : ℝ) - x.b)) / u := by
    unfold Coeff.eval
    field_simp
    ring
  have hd := div_nonneg hn hu.le
  rw [← he] at hd
  linarith

theorem Coeff.leOn_sound (x y : Coeff) (r s : ℚ) (u : ℝ)
    (hr : 0 ≤ r) (hru : (r : ℝ) < u) (hus : u ≤ (s : ℝ))
    (hcheck : x.leOn y r s = true) : x.eval u ≤ y.eval u :=
  Coeff.leOn_sound_of_pos x y r s u hru.le hus
    (lt_of_le_of_lt (by exact_mod_cast hr) hru) hcheck

theorem Coeff.eval_add (x y : Coeff) (u : ℝ) :
    (x.add y).eval u = x.eval u + y.eval u := by
  simp only [Coeff.add, Coeff.eval, Rat.cast_add]
  ring

theorem Coeff.eval_scale (q : ℚ) (x : Coeff) (u : ℝ) :
    (x.scale q).eval u = q * x.eval u := by
  simp only [Coeff.scale, Coeff.eval, Rat.cast_mul]
  ring

/-- Successful computation proves exact equality on the whole interval,
including the right endpoint and permitting a left endpoint of zero. -/
theorem Expr.check_sound_of_pos (e : Expr) (r s : ℚ) (c : Coeff) (u : ℝ)
    (hru : (r : ℝ) ≤ u) (hus : u ≤ (s : ℝ)) (hu : 0 < u)
    (hcheck : e.check r s = some c) : e.eval u = c.eval u := by
  induction e generalizing c with
  | atom x =>
      have he : x = c := Option.some.inj hcheck
      subst c
      rfl
  | add x y ihx ihy =>
      simp only [Expr.check, Option.bind_eq_some_iff, Option.some.injEq] at hcheck
      obtain ⟨cx, hx, cy, hy, hc⟩ := hcheck
      subst c
      rw [Expr.eval, ihx cx hx, ihy cy hy, Coeff.eval_add]
  | scale q x ih =>
      simp only [Expr.check, Option.bind_eq_some_iff, Option.some.injEq] at hcheck
      obtain ⟨cx, hx, hc⟩ := hcheck
      subst c
      rw [Expr.eval, ih cx hx, Coeff.eval_scale]
  | min x y ihx ihy =>
      simp only [Expr.check, Option.bind_eq_some_iff] at hcheck
      obtain ⟨cx, hx, cy, hy, hc⟩ := hcheck
      rw [Expr.eval, ihx cx hx, ihy cy hy]
      split_ifs at hc with hxy hyx
      · have he : cx = c := Option.some.inj hc
        subst c
        exact min_eq_left (Coeff.leOn_sound_of_pos cx cy r s u hru hus hu hxy)
      · have he : cy = c := Option.some.inj hc
        subst c
        exact min_eq_right (Coeff.leOn_sound_of_pos cy cx r s u hru hus hu hyx)
  | max x y ihx ihy =>
      simp only [Expr.check, Option.bind_eq_some_iff] at hcheck
      obtain ⟨cx, hx, cy, hy, hc⟩ := hcheck
      rw [Expr.eval, ihx cx hx, ihy cy hy]
      split_ifs at hc with hxy hyx
      · have he : cy = c := Option.some.inj hc
        subst c
        exact max_eq_right (Coeff.leOn_sound_of_pos cx cy r s u hru hus hu hxy)
      · have he : cx = c := Option.some.inj hc
        subst c
        exact max_eq_left (Coeff.leOn_sound_of_pos cy cx r s u hru hus hu hyx)

theorem Expr.check_sound (e : Expr) (r s : ℚ) (c : Coeff) (u : ℝ)
    (hr : 0 ≤ r) (hru : (r : ℝ) < u) (hus : u ≤ (s : ℝ))
    (hcheck : e.check r s = some c) : e.eval u = c.eval u :=
  Expr.check_sound_of_pos e r s c u hru.le hus
    (lt_of_le_of_lt (by exact_mod_cast hr) hru) hcheck

/-- A crossing cannot be certified by one branch. The arithmetic proofs below
are checked by the kernel; they use no native evaluation axiom. -/
def crossingExample : Expr := .max (.atom ⟨1, -1/4⟩) (.atom ⟨0, 0⟩)

theorem crossing_refused : crossingExample.check 0 1 = none := by
  norm_num [crossingExample, Expr.check, Coeff.leOn]
theorem zero_piece_accept : crossingExample.check 0 (1/4) = some ⟨0, 0⟩ := by
  norm_num [crossingExample, Expr.check, Coeff.leOn]
theorem positive_piece_accept : crossingExample.check (1/4) 1 = some ⟨1, -1/4⟩ := by
  norm_num [crossingExample, Expr.check, Coeff.leOn]

end NoThreeLine

#print axioms NoThreeLine.Coeff.leOn_sound
#print axioms NoThreeLine.Expr.check_sound
#print axioms NoThreeLine.Expr.check_sound_of_pos
#print axioms NoThreeLine.crossing_refused
#print axioms NoThreeLine.zero_piece_accept
#print axioms NoThreeLine.positive_piece_accept
