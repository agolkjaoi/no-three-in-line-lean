import NoThreeLine.BenchmarkAutoEnvelope
import NoThreeLine.BenchmarkBoundChecker

/-! A compact trace skips unneeded root branches. Its `auto` constructor
uses the checked directed envelope, so it need not expose every internal
max/min switch. Soundness is about directed inequalities, not equality. -/
set_option autoImplicit false
namespace NoThreeLine.AutoEnvelope
open OneSided

inductive AutoTrace where
  | auto
  | add : AutoTrace → AutoTrace → AutoTrace
  | scale : AutoTrace → AutoTrace
  | minLeft : AutoTrace → AutoTrace
  | minRight : AutoTrace → AutoTrace
  | maxLeft : AutoTrace → AutoTrace
  | maxRight : AutoTrace → AutoTrace
  | minBoth : AutoTrace → AutoTrace → AutoTrace
  | maxBoth : AutoTrace → AutoTrace → AutoTrace
  deriving Repr

def checkBound : Expr → AutoTrace → Bool → ℚ → ℚ → Option Coeff
  | e, .auto, upper, r, s => e.autoBound upper r s
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

theorem checkBound_sound_of_pos (e : Expr) (t : AutoTrace) (upper : Bool)
    (r s : ℚ) (c : Coeff) (u : ℝ) (hru : (r : ℝ)≤u) (hus : u≤(s : ℝ)) (hu : 0<u)
    (hcheck : checkBound e t upper r s=some c) : BoundRel upper (e.eval u) (c.eval u) := by
  induction t generalizing e upper c with
  | auto =>
      have hc : e.autoBound upper r s=some c := by cases e <;> exact hcheck
      exact Expr.autoBound_sound e upper r s c u hru hus hu hc
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

theorem checkUpper_sound (e : Expr) (t : AutoTrace) (r s : ℚ) (c : Coeff) (u : ℝ)
    (hr : 0≤r) (hru : (r : ℝ)<u) (hus : u≤(s : ℝ))
    (hcheck : checkBound e t true r s=some c) : e.eval u≤c.eval u :=
  checkBound_sound_of_pos e t true r s c u hru.le hus
    (lt_of_le_of_lt (by exact_mod_cast hr) hru) hcheck

theorem checkLower_sound (e : Expr) (t : AutoTrace) (r s : ℚ) (c : Coeff) (u : ℝ)
    (hr : 0≤r) (hru : (r : ℝ)<u) (hus : u≤(s : ℝ))
    (hcheck : checkBound e t false r s=some c) : c.eval u≤e.eval u :=
  checkBound_sound_of_pos e t false r s c u hru.le hus
    (lt_of_le_of_lt (by exact_mod_cast hr) hru) hcheck

end NoThreeLine.AutoEnvelope
#print axioms NoThreeLine.AutoEnvelope.checkUpper_sound
#print axioms NoThreeLine.AutoEnvelope.checkLower_sound
