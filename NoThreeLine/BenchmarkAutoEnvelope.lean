import NoThreeLine.BenchmarkBoundRelation

/-! Executable directed bounds may cross an internal max/min switch.
The secant is only a candidate: both endpoint numerator comparisons are
checked before it is returned. Every rational operation remains in Lean. -/
set_option autoImplicit false
namespace NoThreeLine.OneSided

def secantCandidate (upper : Bool) (a b : Coeff) (r s : ℚ) : Coeff :=
  let nr := if upper then max (a.a*r+a.b) (b.a*r+b.b)
    else min (a.a*r+a.b) (b.a*r+b.b)
  let ns := if upper then max (a.a*s+a.b) (b.a*s+b.b)
    else min (a.a*s+a.b) (b.a*s+b.b)
  let slope := (ns-nr)/(s-r)
  ⟨slope,nr-slope*r⟩

def checkMaxUpper (a b : Coeff) (r s : ℚ) : Option Coeff :=
  if a.leOn b r s then some b else if b.leOn a r s then some a else
  let c := secantCandidate true a b r s
  if a.leOn c r s && b.leOn c r s then some c else none

def checkMinLower (a b : Coeff) (r s : ℚ) : Option Coeff :=
  if a.leOn b r s then some a else if b.leOn a r s then some b else
  let c := secantCandidate false a b r s
  if c.leOn a r s && c.leOn b r s then some c else none

theorem checkMaxUpper_sound (a b c : Coeff) (r s : ℚ) (u : ℝ)
    (hru : (r : ℝ)≤u) (hus : u≤(s : ℝ)) (hu : 0<u)
    (hc : checkMaxUpper a b r s=some c) : max (a.eval u) (b.eval u)≤c.eval u := by
  unfold checkMaxUpper at hc
  split_ifs at hc with hab hba
  · have he := Option.some.inj hc
    subst c
    exact max_le (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu hab) le_rfl
  · have he := Option.some.inj hc
    subst c
    exact max_le le_rfl (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu hba)
  · dsimp only at hc
    split_ifs at hc with h
    have he := Option.some.inj hc
    subst c
    simp only [Bool.and_eq_true] at h
    exact max_le (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu h.1)
      (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu h.2)

theorem checkMinLower_sound (a b c : Coeff) (r s : ℚ) (u : ℝ)
    (hru : (r : ℝ)≤u) (hus : u≤(s : ℝ)) (hu : 0<u)
    (hc : checkMinLower a b r s=some c) : c.eval u≤min (a.eval u) (b.eval u) := by
  unfold checkMinLower at hc
  split_ifs at hc with hab hba
  · have he := Option.some.inj hc
    subst c
    exact le_min le_rfl (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu hab)
  · have he := Option.some.inj hc
    subst c
    exact le_min (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu hba) le_rfl
  · dsimp only at hc
    split_ifs at hc with h
    have he := Option.some.inj hc
    subst c
    simp only [Bool.and_eq_true] at h
    exact le_min (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu h.1)
      (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu h.2)

def midpointLe (a b : Coeff) (r s : ℚ) : Bool :=
  decide (a.a*((r+s)/2)+a.b≤b.a*((r+s)/2)+b.b)

def autoMin (upper : Bool) (a b : Coeff) (r s : ℚ) : Option Coeff :=
  if upper then some (if midpointLe a b r s then a else b)
  else checkMinLower a b r s

def autoMax (upper : Bool) (a b : Coeff) (r s : ℚ) : Option Coeff :=
  if upper then checkMaxUpper a b r s
  else some (if midpointLe a b r s then b else a)

theorem autoMin_sound (upper : Bool) (a b c : Coeff) (r s : ℚ) (u : ℝ)
    (hru : (r : ℝ)≤u) (hus : u≤(s : ℝ)) (hu : 0<u)
    (hc : autoMin upper a b r s=some c) :
    BoundRel upper (min (a.eval u) (b.eval u)) (c.eval u) := by
  cases upper
  · exact checkMinLower_sound a b c r s u hru hus hu hc
  · change min (a.eval u) (b.eval u)≤c.eval u
    simp only [autoMin,if_true] at hc
    split_ifs at hc with h
    · have he := Option.some.inj hc
      subst c
      exact min_le_left _ _
    · have he := Option.some.inj hc
      subst c
      exact min_le_right _ _

theorem autoMax_sound (upper : Bool) (a b c : Coeff) (r s : ℚ) (u : ℝ)
    (hru : (r : ℝ)≤u) (hus : u≤(s : ℝ)) (hu : 0<u)
    (hc : autoMax upper a b r s=some c) :
    BoundRel upper (max (a.eval u) (b.eval u)) (c.eval u) := by
  cases upper
  · change c.eval u≤max (a.eval u) (b.eval u)
    simp only [autoMax,Bool.false_eq_true,if_false] at hc
    split_ifs at hc with h
    · have he := Option.some.inj hc
      subst c
      exact le_max_right _ _
    · have he := Option.some.inj hc
      subst c
      exact le_max_left _ _
  · exact checkMaxUpper_sound a b c r s u hru hus hu hc

theorem boundRel_trans (upper : Bool) (x y z : ℝ)
    (hxy : BoundRel upper x y) (hyz : BoundRel upper y z) : BoundRel upper x z := by
  cases upper
  · exact hyz.trans hxy
  · exact hxy.trans hyz

end OneSided
open OneSided

def Expr.autoBound : Expr → Bool → ℚ → ℚ → Option Coeff
  | .atom c, _, _, _ => some c
  | .add x y, upper, r, s =>
      (x.autoBound upper r s).bind fun a =>
      (y.autoBound upper r s).bind fun b => some (a.add b)
  | .scale q x, upper, r, s =>
      if q=0 then some ⟨0,0⟩ else
      (x.autoBound (if 0≤q then upper else !upper) r s).bind fun a => some (a.scale q)
  | .min x y, upper, r, s =>
      (x.autoBound upper r s).bind fun a =>
      (y.autoBound upper r s).bind fun b => autoMin upper a b r s
  | .max x y, upper, r, s =>
      (x.autoBound upper r s).bind fun a =>
      (y.autoBound upper r s).bind fun b => autoMax upper a b r s

theorem Expr.autoBound_sound (e : Expr) (upper : Bool) (r s : ℚ) (c : Coeff) (u : ℝ)
    (hru : (r : ℝ)≤u) (hus : u≤(s : ℝ)) (hu : 0<u)
    (hc : e.autoBound upper r s=some c) : BoundRel upper (e.eval u) (c.eval u) := by
  induction e generalizing upper c with
  | atom a =>
      have he := Option.some.inj hc
      subst c
      exact boundRel_refl upper _
  | add x y ihx ihy =>
      simp only [Expr.autoBound,Option.bind_eq_some_iff,Option.some.injEq] at hc
      obtain ⟨a,ha,b,hb,rfl⟩ := hc
      rw [Expr.eval,Coeff.eval_add]
      exact boundRel_add upper _ _ _ _ (ihx upper a ha) (ihy upper b hb)
  | scale q x ih =>
      simp only [Expr.autoBound] at hc
      by_cases hq : q=0
      · rw [if_pos hq] at hc
        have he := Option.some.inj hc
        subst c
        subst q
        cases upper <;> simp [BoundRel,Expr.eval,Coeff.eval]
      · rw [if_neg hq] at hc
        simp only [Option.bind_eq_some_iff,Option.some.injEq] at hc
        obtain ⟨a,ha,rfl⟩ := hc
        rw [Expr.eval,Coeff.eval_scale]
        exact boundRel_scale upper q _ _ (ih _ a ha)
  | min x y ihx ihy =>
      simp only [Expr.autoBound,Option.bind_eq_some_iff] at hc
      obtain ⟨a,ha,b,hb,hc⟩ := hc
      exact boundRel_trans upper _ _ _
        (boundRel_min upper _ _ _ _ (ihx upper a ha) (ihy upper b hb))
        (autoMin_sound upper a b c r s u hru hus hu hc)
  | max x y ihx ihy =>
      simp only [Expr.autoBound,Option.bind_eq_some_iff] at hc
      obtain ⟨a,ha,b,hb,hc⟩ := hc
      exact boundRel_trans upper _ _ _
        (boundRel_max upper _ _ _ _ (ihx upper a ha) (ihy upper b hb))
        (autoMax_sound upper a b c r s u hru hus hu hc)

example : (Expr.max (.atom ⟨1,0⟩) (.atom ⟨0,1⟩)).autoBound true (1/2) 2=
    some ⟨2/3,2/3⟩ := by decide +kernel
example : (Expr.min (.atom ⟨1,0⟩) (.atom ⟨0,1⟩)).autoBound false (1/2) 2=
    some ⟨1/3,1/3⟩ := by decide +kernel
example : (Expr.max (.atom ⟨1,0⟩) (.atom ⟨0,1⟩)).autoBound true 0 1=
    some ⟨0,1⟩ := by decide +kernel

end NoThreeLine
#print axioms NoThreeLine.Expr.autoBound_sound
