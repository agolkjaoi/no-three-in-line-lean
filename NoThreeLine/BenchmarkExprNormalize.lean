import NoThreeLine.PositiveFullCertificate

/-! Proof-preserving simplification for large explicit geometric expressions.
In particular scale-zero discards its child before traversing it. -/
set_option autoImplicit false

namespace NoThreeLine

deriving instance DecidableEq for Expr

def Expr.smartAdd (x y : Expr) : Expr :=
  match x,y with
  | .atom a,.atom b => .atom (a.add b)
  | .atom a,y => if a = ⟨0,0⟩ then y else .add (.atom a) y
  | x,.atom b => if b = ⟨0,0⟩ then x else .add x (.atom b)
  | x,y => .add x y

def Expr.smartScale (q : ℚ) (x : Expr) : Expr :=
  if q = 0 then .atom ⟨0,0⟩ else
    match x with
    | .atom a => .atom (a.scale q)
    | x => if q = 1 then x else .scale q x

def Expr.normalize : Expr → Expr
  | .atom a => .atom a
  | .add x y => (x.normalize).smartAdd y.normalize
  | .scale q x => if q = 0 then .atom ⟨0,0⟩ else (x.normalize).smartScale q
  | .min x y => .min x.normalize y.normalize
  | .max x y => .max x.normalize y.normalize

theorem Expr.smartAdd_eval (x y : Expr) (u : ℝ) :
    (x.smartAdd y).eval u = x.eval u + y.eval u := by
  cases x <;> cases y <;> simp only [smartAdd]
  all_goals first
    | exact Coeff.eval_add _ _ _
    | rfl
    | (split_ifs <;> simp_all [Expr.eval,Coeff.eval])

theorem Expr.smartScale_eval (q : ℚ) (x : Expr) (u : ℝ) :
    (x.smartScale q).eval u = (q : ℝ) * x.eval u := by
  by_cases hq : q = 0
  · simp [smartScale,hq,Expr.eval,Coeff.eval]
  · cases x <;> simp only [smartScale,if_neg hq]
    · exact Coeff.eval_scale _ _ _
    all_goals by_cases h1 : q = 1 <;> simp [h1,Expr.eval]

theorem Expr.normalize_eval (e : Expr) (u : ℝ) : e.normalize.eval u = e.eval u := by
  induction e with
  | atom c => rfl
  | add x y hx hy => simp only [normalize,smartAdd_eval,Expr.eval,hx,hy]
  | scale q x hx =>
      simp only [normalize]
      split_ifs with hq
      · simp [hq,Expr.eval,Coeff.eval]
      · simp only [smartScale_eval,Expr.eval,hx]
  | min x y hx hy => simp only [normalize,Expr.eval,hx,hy]
  | max x y hx hy => simp only [normalize,Expr.eval,hx,hy]

theorem normalized_positive_certificate_sound {n m k : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (positive : Fin m → QEdge) (negative : Fin k → QEdge)
    (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List ℚ) (B : ℚ) (e : Expr)
    (hd : fullDataCheck R w (qCompleteEdges positive negative) Q M = true)
    (hn : ∀ j, (negative j).jump ≤ 0)
    (he : (fullExpr R w positive Q M).normalize = e)
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
      rw [← Expr.normalize_eval (fullExpr R w positive Q M) u,he] at hb
      exact hb)
  exact hdom.trans hi.2

end NoThreeLine

#print axioms NoThreeLine.Expr.normalize_eval
#print axioms NoThreeLine.normalized_positive_certificate_sound
