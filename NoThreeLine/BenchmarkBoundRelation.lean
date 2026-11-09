import NoThreeLine.BranchChecker

/-! Directed expression bounds. `true` means an upper bound and `false` a
lower bound. Negative rational scaling reverses this direction. -/
set_option autoImplicit false
namespace NoThreeLine.OneSided

def BoundRel (upper : Bool) (value bound : ℝ) : Prop :=
  if upper then value≤bound else bound≤value

theorem boundRel_refl (upper : Bool) (v : ℝ) : BoundRel upper v v := by
  cases upper <;> simp [BoundRel]

theorem boundRel_add (upper : Bool) (x y a b : ℝ)
    (hx : BoundRel upper x a) (hy : BoundRel upper y b) :
    BoundRel upper (x+y) (a+b) := by
  cases upper <;> simp only [BoundRel,Bool.false_eq_true,if_false,if_true] at *
  all_goals exact add_le_add hx hy

theorem boundRel_min (upper : Bool) (x y a b : ℝ)
    (hx : BoundRel upper x a) (hy : BoundRel upper y b) :
    BoundRel upper (min x y) (min a b) := by
  cases upper <;> simp only [BoundRel,Bool.false_eq_true,if_false,if_true] at *
  all_goals exact min_le_min hx hy

theorem boundRel_max (upper : Bool) (x y a b : ℝ)
    (hx : BoundRel upper x a) (hy : BoundRel upper y b) :
    BoundRel upper (max x y) (max a b) := by
  cases upper <;> simp only [BoundRel,Bool.false_eq_true,if_false,if_true] at *
  all_goals exact max_le_max hx hy

theorem boundRel_scale (upper : Bool) (q : ℚ) (x a : ℝ)
    (h : BoundRel (if 0≤q then upper else !upper) x a) :
    BoundRel upper ((q : ℝ)*x) ((q : ℝ)*a) := by
  by_cases hq : 0≤q
  · have hq' : (0 : ℝ)≤q := by exact_mod_cast hq
    cases upper <;> simp [hq,BoundRel] at h ⊢
    all_goals exact mul_le_mul_of_nonneg_left h hq'
  · have hq' : (q : ℝ)≤0 := by exact_mod_cast (le_of_not_ge hq)
    cases upper <;> simp [hq,BoundRel] at h ⊢
    all_goals exact mul_le_mul_of_nonpos_left h hq'

def checkMin (a b : Coeff) (r s : ℚ) : Option Coeff :=
  (Expr.min (.atom a) (.atom b)).check r s

def checkMax (a b : Coeff) (r s : ℚ) : Option Coeff :=
  (Expr.max (.atom a) (.atom b)).check r s

theorem checkMin_sound (a b c : Coeff) (r s : ℚ) (u : ℝ)
    (hru : (r : ℝ)≤u) (hus : u≤(s : ℝ)) (hu : 0<u)
    (h : checkMin a b r s=some c) : min (a.eval u) (b.eval u)=c.eval u :=
  Expr.check_sound_of_pos (.min (.atom a) (.atom b)) r s c u hru hus hu h

theorem checkMax_sound (a b c : Coeff) (r s : ℚ) (u : ℝ)
    (hru : (r : ℝ)≤u) (hus : u≤(s : ℝ)) (hu : 0<u)
    (h : checkMax a b r s=some c) : max (a.eval u) (b.eval u)=c.eval u :=
  Expr.check_sound_of_pos (.max (.atom a) (.atom b)) r s c u hru hus hu h

end NoThreeLine.OneSided

#print axioms NoThreeLine.OneSided.boundRel_scale
