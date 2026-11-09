import NoThreeLine.BenchmarkExprNormalize

/-! Exact simplification on a rational interval. Only atomic endpoint
comparisons remove min/max branches. This changes no coefficients, rounding
rule or integration domain, and includes intervals adjacent to zero. -/
set_option autoImplicit false

namespace NoThreeLine

def Expr.intervalMin (r s : ℚ) (x y : Expr) : Expr :=
  match x,y with
  | .atom a,.atom b => if a.leOn b r s then .atom a
      else if b.leOn a r s then .atom b else .min (.atom a) (.atom b)
  | x,y => .min x y

def Expr.intervalMax (r s : ℚ) (x y : Expr) : Expr :=
  match x,y with
  | .atom a,.atom b => if a.leOn b r s then .atom b
      else if b.leOn a r s then .atom a else .max (.atom a) (.atom b)
  | x,y => .max x y

def Expr.intervalNormalize (r s : ℚ) : Expr → Expr
  | .atom a => .atom a
  | .add x y => (x.intervalNormalize r s).smartAdd (y.intervalNormalize r s)
  | .scale q x => if q=0 then .atom ⟨0,0⟩ else (x.intervalNormalize r s).smartScale q
  | .min x y => (x.intervalNormalize r s).intervalMin r s (y.intervalNormalize r s)
  | .max x y => (x.intervalNormalize r s).intervalMax r s (y.intervalNormalize r s)

theorem Expr.intervalMin_eval (r s : ℚ) (x y : Expr) (u : ℝ)
    (hru : (r:ℝ)≤u) (hus : u≤(s:ℝ)) (hu : 0<u) :
    (x.intervalMin r s y).eval u = Min.min (x.eval u) (y.eval u) := by
  cases x <;> cases y <;> simp only [intervalMin] <;> try rfl
  split_ifs with hab hba
  · exact (min_eq_left (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu hab)).symm
  · exact (min_eq_right (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu hba)).symm
  · rfl

theorem Expr.intervalMax_eval (r s : ℚ) (x y : Expr) (u : ℝ)
    (hru : (r:ℝ)≤u) (hus : u≤(s:ℝ)) (hu : 0<u) :
    (x.intervalMax r s y).eval u = Max.max (x.eval u) (y.eval u) := by
  cases x <;> cases y <;> simp only [intervalMax] <;> try rfl
  split_ifs with hab hba
  · exact (max_eq_right (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu hab)).symm
  · exact (max_eq_left (Coeff.leOn_sound_of_pos _ _ r s u hru hus hu hba)).symm
  · rfl

theorem Expr.intervalNormalize_eval (r s : ℚ) (e : Expr) (u : ℝ)
    (hru : (r:ℝ)≤u) (hus : u≤(s:ℝ)) (hu : 0<u) :
    (e.intervalNormalize r s).eval u=e.eval u := by
  induction e with
  | atom c => rfl
  | add x y hx hy => simp only [intervalNormalize,smartAdd_eval,Expr.eval,hx,hy]
  | scale q x hx =>
      simp only [intervalNormalize]
      split_ifs with hq
      · simp [hq,Expr.eval,Coeff.eval]
      · simp only [smartScale_eval,Expr.eval,hx]
  | min x y hx hy => simp only [intervalNormalize,intervalMin_eval _ _ _ _ u hru hus hu,Expr.eval,hx,hy]
  | max x y hx hy => simp only [intervalNormalize,intervalMax_eval _ _ _ _ u hru hus hu,Expr.eval,hx,hy]

end NoThreeLine

#print axioms NoThreeLine.Expr.intervalNormalize_eval
