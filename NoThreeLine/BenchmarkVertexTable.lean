import NoThreeLine.BenchmarkKernelNormalize

/-! Replace repeated geometric coefficient sums by a once-checked rational
table. The table is derived from actual rectangle corners, not assumed. -/
set_option autoImplicit false

namespace NoThreeLine

def qTermLookup : List QVertexTerm → (ℚ × ℚ) → ℚ
  | [],_ => 0
  | t :: ts,p => if t.1 = p then t.2 else qTermLookup ts p

theorem qTermValue_sum_zero (p : ℚ × ℚ) (ts : List QVertexTerm)
    (h : ∀ t ∈ ts, t.1 ≠ p) : (ts.map (qTermValue p)).sum = 0 := by
  induction ts with
  | nil => rfl
  | cons t ts ih =>
      have ht := h t (by simp)
      have hs := ih (fun a ha => h a (by simp [ha]))
      simp [qTermValue,ht,hs]

theorem qTermLookup_sum (ts : List QVertexTerm) (p : ℚ × ℚ)
    (h : (ts.map Prod.fst).Nodup) :
    qTermLookup ts p = (ts.map (qTermValue p)).sum := by
  induction ts with
  | nil => rfl
  | cons t ts ih =>
      have hh : t.1 ∉ ts.map Prod.fst ∧ (ts.map Prod.fst).Nodup :=
        List.nodup_cons.mp h
      by_cases hp : t.1 = p
      · have hz : (ts.map (qTermValue p)).sum = 0 := by
          apply qTermValue_sum_zero
          intro a ha he
          apply hh.1
          apply List.mem_map.mpr
          exact ⟨a,ha,he.trans hp.symm⟩
        simp [qTermLookup,qTermValue,hp,hz]
      · simp [qTermLookup,qTermValue,hp,ih hh.2]

theorem qVertexCoefficient_eq_lookup {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (fuel : ℕ) (ts : List QVertexTerm)
    (hn : qKernelNormalizeTerms fuel (qRectangleTerms R w) = ts)
    (hd : (ts.map Prod.fst).Nodup) (p : ℚ × ℚ) :
    qVertexCoefficient R w p = qTermLookup ts p := by
  rw [← qRectangleTerms_value,← qKernelNormalizeTerms_value p fuel,hn,
    qTermLookup_sum ts p hd]

def qTableEndpointExpr (keys : List (ℚ × ℚ)) (ts : List QVertexTerm) (a b : ℚ) : Expr :=
  Expr.sum (keys.map fun p => .scale (qTermLookup ts p)
    (.max (.atom ⟨0,0⟩) (.atom ⟨p.1-a,b-p.2⟩)))

def qTableVertexEnvelopeExpr (keys : List (ℚ × ℚ)) (ts : List QVertexTerm) (Q : QRect) : Expr :=
  .add (.max (qTableEndpointExpr keys ts Q.x1 Q.y0) (qTableEndpointExpr keys ts Q.x0 Q.y1))
    (Expr.sum (keys.map fun p => .scale (max 0 (-qTermLookup ts p)) (qVertexTentExpr Q p)))

def qTableFullExpr {m : ℕ} (keys : List (ℚ × ℚ)) (ts : List QVertexTerm)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) : Expr :=
  .min (qTableVertexEnvelopeExpr keys ts Q)
    (.min (.add (qTableEndpointExpr keys ts Q.x1 Q.y0) (qEdgeBandSumExpr E Q)) (.atom ⟨M,0⟩))

theorem fullExpr_eq_qTableFullExpr {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (fuel : ℕ)
    (keys : List (ℚ × ℚ)) (ts : List QVertexTerm)
    (hk : qVertexKeys R = keys)
    (hn : qKernelNormalizeTerms fuel (qRectangleTerms R w) = ts)
    (hd : (ts.map Prod.fst).Nodup) :
    fullExpr R w E Q M = qTableFullExpr keys ts E Q M := by
  have hc : qVertexCoefficient R w = qTermLookup ts :=
    funext (qVertexCoefficient_eq_lookup R w fuel ts hn hd)
  unfold fullExpr qVertexEnvelopeExpr qJumpEnvelopeExpr qVertexEndpointExpr
  rw [hk,hc]
  rfl

end NoThreeLine

#print axioms NoThreeLine.qVertexCoefficient_eq_lookup
#print axioms NoThreeLine.fullExpr_eq_qTableFullExpr
