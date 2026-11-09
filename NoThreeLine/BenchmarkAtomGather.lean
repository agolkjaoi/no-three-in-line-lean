import NoThreeLine.BenchmarkExprNormalize

/-! Gather all affine atoms in each sum into one coefficient, preserving
every non-additive operation. This is a structural executable transformation,
and its evaluation equality is unconditional, including u=0. -/
set_option autoImplicit false
namespace NoThreeLine

structure AtomSum where
  coeff : Coeff
  terms : List Expr
  deriving Repr

noncomputable def AtomSum.eval (f : AtomSum) (u : ℝ) : ℝ := f.coeff.eval u+(Expr.sum f.terms).eval u

def AtomSum.pack (f : AtomSum) : Expr := (Expr.atom f.coeff).smartAdd (Expr.sum f.terms)

def AtomSum.ofExpr : Expr → AtomSum
  | .atom c => ⟨c,[]⟩
  | e => ⟨⟨0,0⟩,[e]⟩

def AtomSum.add (f g : AtomSum) : AtomSum := ⟨f.coeff.add g.coeff,f.terms++g.terms⟩

theorem AtomSum.pack_eval (f : AtomSum) (u : ℝ) : f.pack.eval u=f.eval u := by
  simp only [pack,Expr.smartAdd_eval,Expr.eval,eval]

theorem AtomSum.ofExpr_eval (e : Expr) (u : ℝ) : (ofExpr e).eval u=e.eval u := by
  cases e <;> simp [ofExpr,eval,Expr.eval_sum,Expr.eval,Coeff.eval]

theorem AtomSum.add_eval (f g : AtomSum) (u : ℝ) : (f.add g).eval u=f.eval u+g.eval u := by
  simp only [add,eval,Coeff.eval_add,Expr.eval_sum,List.map_append,List.sum_append]
  ring

def Expr.gatherAtoms : Expr → AtomSum
  | .atom c => ⟨c,[]⟩
  | .add x y => x.gatherAtoms.add y.gatherAtoms
  | .scale q x => AtomSum.ofExpr (x.gatherAtoms.pack.smartScale q)
  | .min x y => AtomSum.ofExpr (.min x.gatherAtoms.pack y.gatherAtoms.pack)
  | .max x y => AtomSum.ofExpr (.max x.gatherAtoms.pack y.gatherAtoms.pack)

theorem Expr.gatherAtoms_eval (e : Expr) (u : ℝ) : e.gatherAtoms.eval u=e.eval u := by
  induction e with
  | atom c => simp [gatherAtoms,AtomSum.eval,Expr.eval_sum,Expr.eval]
  | add x y hx hy => simp only [gatherAtoms,AtomSum.add_eval,Expr.eval,hx,hy]
  | scale q x hx =>
      simp only [gatherAtoms,AtomSum.ofExpr_eval,Expr.smartScale_eval,AtomSum.pack_eval,Expr.eval,hx]
  | min x y hx hy =>
      simp only [gatherAtoms,AtomSum.ofExpr_eval,Expr.eval,AtomSum.pack_eval,hx,hy]
  | max x y hx hy =>
      simp only [gatherAtoms,AtomSum.ofExpr_eval,Expr.eval,AtomSum.pack_eval,hx,hy]

def Expr.atomNormalize (e : Expr) : Expr := e.gatherAtoms.pack

theorem Expr.atomNormalize_eval (e : Expr) (u : ℝ) : e.atomNormalize.eval u=e.eval u := by
  rw [atomNormalize,AtomSum.pack_eval,gatherAtoms_eval]

end NoThreeLine

#print axioms NoThreeLine.Expr.atomNormalize_eval
