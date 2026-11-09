import NoThreeLine.BenchmarkExprNormalize

/-! Collapse globally fixed atomic min/max branches on 0<u<=1. This reduces
the full geometry expression without changing it on the integration domain. -/
set_option autoImplicit false
open scoped Interval

namespace NoThreeLine

def Expr.unitMin (x y : Expr) : Expr :=
  match x,y with
  | .atom a,.atom b => if a.leOn b 0 1 then .atom a
      else if b.leOn a 0 1 then .atom b else .min (.atom a) (.atom b)
  | x,y => .min x y

def Expr.unitMax (x y : Expr) : Expr :=
  match x,y with
  | .atom a,.atom b => if a.leOn b 0 1 then .atom b
      else if b.leOn a 0 1 then .atom a else .max (.atom a) (.atom b)
  | x,y => .max x y

def Expr.unitNormalize : Expr → Expr
  | .atom a => .atom a
  | .add x y => x.unitNormalize.smartAdd y.unitNormalize
  | .scale q x => if q = 0 then .atom ⟨0,0⟩ else x.unitNormalize.smartScale q
  | .min x y => x.unitNormalize.unitMin y.unitNormalize
  | .max x y => x.unitNormalize.unitMax y.unitNormalize

theorem Expr.unitMin_eval (x y : Expr) (u : ℝ) (hu : 0 < u) (hu1 : u ≤ 1) :
    (x.unitMin y).eval u = Min.min (x.eval u) (y.eval u) := by
  cases x <;> cases y <;> simp only [unitMin] <;> try rfl
  split_ifs with hab hba
  · exact (min_eq_left (Coeff.leOn_sound_of_pos _ _ 0 1 u (by simpa using hu.le)
      (by simpa using hu1) hu hab)).symm
  · exact (min_eq_right (Coeff.leOn_sound_of_pos _ _ 0 1 u (by simpa using hu.le)
      (by simpa using hu1) hu hba)).symm
  · rfl

theorem Expr.unitMax_eval (x y : Expr) (u : ℝ) (hu : 0 < u) (hu1 : u ≤ 1) :
    (x.unitMax y).eval u = Max.max (x.eval u) (y.eval u) := by
  cases x <;> cases y <;> simp only [unitMax] <;> try rfl
  split_ifs with hab hba
  · exact (max_eq_right (Coeff.leOn_sound_of_pos _ _ 0 1 u (by simpa using hu.le)
      (by simpa using hu1) hu hab)).symm
  · exact (max_eq_left (Coeff.leOn_sound_of_pos _ _ 0 1 u (by simpa using hu.le)
      (by simpa using hu1) hu hba)).symm
  · rfl

theorem Expr.unitNormalize_eval (e : Expr) (u : ℝ) (hu : 0 < u) (hu1 : u ≤ 1) :
    e.unitNormalize.eval u = e.eval u := by
  induction e with
  | atom c => rfl
  | add x y hx hy => simp only [unitNormalize,smartAdd_eval,Expr.eval,hx,hy]
  | scale q x hx =>
      simp only [unitNormalize]
      split_ifs with hq
      · simp [hq,Expr.eval,Coeff.eval]
      · simp only [smartScale_eval,Expr.eval,hx]
  | min x y hx hy => simp only [unitNormalize,unitMin_eval _ _ u hu hu1,Expr.eval,hx,hy]
  | max x y hx hy => simp only [unitNormalize,unitMax_eval _ _ u hu hu1,Expr.eval,hx,hy]

theorem unit_normalized_positive_certificate_sound {n m k : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (positive : Fin m → QEdge) (negative : Fin k → QEdge)
    (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List ℚ) (B : ℚ) (e : Expr)
    (hd : fullDataCheck R w (qCompleteEdges positive negative) Q M = true)
    (hn : ∀ j, (negative j).jump ≤ 0)
    (he : (fullExpr R w positive Q M).unitNormalize = e)
    (hc : checkUnitIntegral e S cuts = some B)
    (x y : ℝ) (hx : x ∈ Set.Icc (Q.x0 : ℝ) Q.x1)
    (hy : y ∈ Set.Icc (Q.y0 : ℝ) Q.y1) :
    (∫ u in (0 : ℝ)..1, (actualChord R w x y u)^2) ≤ (B : ℝ) := by
  have hf := fullDataCheck_sound R w (qCompleteEdges positive negative) Q M hd
  have hi := checkUnitIntegral_sound e S cuts B hc
  have hdom := fieldChord_square_integral_le Finset.univ (fun i => (R i).real)
    (fun i => (w i : ℝ)) x y e.eval
    (fun i _ => (hf.weights i (Finset.mem_univ _)).1) hi.1 (by
      intro u hu
      have hb := (fullExpr_chord_bounds R w (qCompleteEdges positive negative)
        Q M x y u hd hx hy hu.1).2.1
      rw [fullExpr_complete_eval R w positive negative Q M u hn] at hb
      rw [← Expr.unitNormalize_eval (fullExpr R w positive Q M) u hu.1 hu.2.le,he] at hb
      exact hb)
  exact hdom.trans hi.2

end NoThreeLine

#print axioms NoThreeLine.Expr.unitNormalize_eval
#print axioms NoThreeLine.unit_normalized_positive_certificate_sound
