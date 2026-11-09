import NoThreeLine.BenchmarkBoundRelation

/-! A trace may skip the unchosen child of an upper min or a lower max.
Every other child needed for a valid directed bound is checked recursively.
The trace is untrusted input; mismatched constructors return `none`. -/
set_option autoImplicit false
namespace NoThreeLine.OneSided

inductive BoundTrace where
  | exact
  | add : BoundTrace → BoundTrace → BoundTrace
  | scale : BoundTrace → BoundTrace
  | minLeft : BoundTrace → BoundTrace
  | minRight : BoundTrace → BoundTrace
  | maxLeft : BoundTrace → BoundTrace
  | maxRight : BoundTrace → BoundTrace
  | minBoth : BoundTrace → BoundTrace → BoundTrace
  | maxBoth : BoundTrace → BoundTrace → BoundTrace
  deriving Repr

def checkBound : Expr → BoundTrace → Bool → ℚ → ℚ → Option Coeff
  | e, .exact, _, r, s => e.check r s
  | .add x y, .add tx ty, upper, r, s =>
      (checkBound x tx upper r s).bind fun a =>
      (checkBound y ty upper r s).bind fun b => some (a.add b)
  | .scale q x, .scale tx, upper, r, s =>
      if q=0 then some ⟨0,0⟩ else
      (checkBound x tx (if 0≤q then upper else !upper) r s).bind fun a => some (a.scale q)
  | .min x _, .minLeft tx, true, r, s => checkBound x tx true r s
  | .min _ y, .minRight ty, true, r, s => checkBound y ty true r s
  | .max x _, .maxLeft tx, false, r, s => checkBound x tx false r s
  | .max _ y, .maxRight ty, false, r, s => checkBound y ty false r s
  | .min x y, .minBoth tx ty, upper, r, s =>
      (checkBound x tx upper r s).bind fun a =>
      (checkBound y ty upper r s).bind fun b => checkMin a b r s
  | .max x y, .maxBoth tx ty, upper, r, s =>
      (checkBound x tx upper r s).bind fun a =>
      (checkBound y ty upper r s).bind fun b => checkMax a b r s
  | _, _, _, _, _ => none

theorem checkBound_sound_of_pos (e : Expr) (t : BoundTrace) (upper : Bool)
    (r s : ℚ) (c : Coeff) (u : ℝ) (hru : (r : ℝ)≤u) (hus : u≤(s : ℝ)) (hu : 0<u)
    (hcheck : checkBound e t upper r s=some c) : BoundRel upper (e.eval u) (c.eval u) := by
  induction t generalizing e upper c with
  | exact =>
      have hc : e.check r s=some c := by cases e <;> exact hcheck
      rw [Expr.check_sound_of_pos e r s c u hru hus hu hc]
      exact boundRel_refl upper _
  | add tx ty ihx ihy =>
      cases e <;> simp only [checkBound,reduceCtorEq] at hcheck
      simp only [Option.bind_eq_some_iff,Option.some.injEq] at hcheck
      obtain ⟨a,ha,b,hb,rfl⟩ := hcheck
      rw [Expr.eval,Coeff.eval_add]
      exact boundRel_add upper _ _ _ _ (ihx _ upper a ha) (ihy _ upper b hb)
  | scale tx ih =>
      cases e <;> simp only [checkBound,reduceCtorEq] at hcheck
      rename_i q x
      by_cases hq : q=0
      · rw [if_pos hq] at hcheck
        have he := Option.some.inj hcheck
        subst c
        subst q
        cases upper <;> simp [BoundRel,Expr.eval,Coeff.eval]
      · rw [if_neg hq] at hcheck
        simp only [Option.bind_eq_some_iff,Option.some.injEq] at hcheck
        obtain ⟨a,ha,rfl⟩ := hcheck
        rw [Expr.eval,Coeff.eval_scale]
        exact boundRel_scale upper q _ _ (ih x _ a ha)
  | minLeft tx ih =>
      cases e <;> cases upper <;> simp only [checkBound,reduceCtorEq] at hcheck
      change min _ _≤c.eval u
      exact (min_le_left _ _).trans (ih _ true c hcheck)
  | minRight ty ih =>
      cases e <;> cases upper <;> simp only [checkBound,reduceCtorEq] at hcheck
      change min _ _≤c.eval u
      exact (min_le_right _ _).trans (ih _ true c hcheck)
  | maxLeft tx ih =>
      cases e <;> cases upper <;> simp only [checkBound,reduceCtorEq] at hcheck
      change c.eval u≤max _ _
      exact (ih _ false c hcheck).trans (le_max_left _ _)
  | maxRight ty ih =>
      cases e <;> cases upper <;> simp only [checkBound,reduceCtorEq] at hcheck
      change c.eval u≤max _ _
      exact (ih _ false c hcheck).trans (le_max_right _ _)
  | minBoth tx ty ihx ihy =>
      cases e <;> simp only [checkBound,reduceCtorEq] at hcheck
      simp only [Option.bind_eq_some_iff] at hcheck
      obtain ⟨a,ha,b,hb,hc⟩ := hcheck
      rw [Expr.eval,←checkMin_sound a b c r s u hru hus hu hc]
      exact boundRel_min upper _ _ _ _ (ihx _ upper a ha) (ihy _ upper b hb)
  | maxBoth tx ty ihx ihy =>
      cases e <;> simp only [checkBound,reduceCtorEq] at hcheck
      simp only [Option.bind_eq_some_iff] at hcheck
      obtain ⟨a,ha,b,hb,hc⟩ := hcheck
      rw [Expr.eval,←checkMax_sound a b c r s u hru hus hu hc]
      exact boundRel_max upper _ _ _ _ (ihx _ upper a ha) (ihy _ upper b hb)

theorem checkUpper_sound (e : Expr) (t : BoundTrace) (r s : ℚ) (c : Coeff) (u : ℝ)
    (hr : 0≤r) (hru : (r : ℝ)<u) (hus : u≤(s : ℝ))
    (hcheck : checkBound e t true r s=some c) : e.eval u≤c.eval u :=
  checkBound_sound_of_pos e t true r s c u hru.le hus
    (lt_of_le_of_lt (by exact_mod_cast hr) hru) hcheck

theorem checkLower_sound (e : Expr) (t : BoundTrace) (r s : ℚ) (c : Coeff) (u : ℝ)
    (hr : 0≤r) (hru : (r : ℝ)<u) (hus : u≤(s : ℝ))
    (hcheck : checkBound e t false r s=some c) : c.eval u≤e.eval u :=
  checkBound_sound_of_pos e t false r s c u hru.le hus
    (lt_of_le_of_lt (by exact_mod_cast hr) hru) hcheck

def skipCrossing : Expr := .min (.atom ⟨3,0⟩) crossingExample

example : skipCrossing.check 0 1=none := by decide +kernel
example : checkBound skipCrossing (.minLeft .exact) true 0 1=some ⟨3,0⟩ := by decide +kernel
example : checkBound skipCrossing (.minLeft .exact) false 0 1=none := by decide +kernel
example : checkBound (.scale (-2) (.max (.atom ⟨1,0⟩) crossingExample))
    (.scale (.maxLeft .exact)) true 0 1=some ⟨-2,0⟩ := by decide +kernel
example : checkBound (.scale 0 crossingExample) (.scale (.minLeft .exact)) true 0 1=some ⟨0,0⟩ := by decide +kernel

end NoThreeLine.OneSided

#print axioms NoThreeLine.OneSided.checkUpper_sound
#print axioms NoThreeLine.OneSided.checkLower_sound
