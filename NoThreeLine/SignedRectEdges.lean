import NoThreeLine.JumpExpr

/-! Every rational rectangle has a signed bottom and top edge. This executable
construction retains negative jumps and automatically passes representation
matching. Cancellation/merging is a separate finite transformation. -/
set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine

def QRect.bottomEdge (R : QRect) (w : ℚ) : QEdge := ⟨R.x0,R.x1,R.y0,w⟩

def QRect.topEdge (R : QRect) (w : ℚ) : QEdge := ⟨R.x0,R.x1,R.y1,-w⟩

def qSignedRectEdges {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) :
    Fin (n+n) → QEdge :=
  Fin.addCases (fun i => (R i).bottomEdge (w i)) (fun i => (R i).topEdge (w i))

theorem qSignedRectEdges_coefficient {n : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (p : ℚ × ℚ) :
    qEdgeVertexCoefficient (qSignedRectEdges R w) p = qVertexCoefficient R w p := by
  unfold qEdgeVertexCoefficient qVertexCoefficient
  rw [Fintype.sum_prod_type,Fintype.sum_prod_type,Fin.sum_univ_add]
  simp only [qEdgeCornerLocation,qEdgeCornerCoefficient,qSignedRectEdges,
    Fin.addCases_left,Fin.addCases_right]
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i _
  simp only [Fin.sum_univ_two,Fin.sum_univ_four,qEdgeVertexPoint,qEdgeVertexSign,
    qCornerLocation,qCornerCoefficient,qVertexPoint,qVertexSign,
    QRect.bottomEdge,QRect.topEdge,Matrix.cons_val_zero,Matrix.cons_val_one,
    Matrix.cons_val_fin_one]
  simp
  ring

theorem qSignedRectEdges_match {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) :
    qEdgesMatchCheck R w (qSignedRectEdges R w) = true := by
  unfold qEdgesMatchCheck
  apply decide_eq_true_eq.mpr
  constructor <;> intro z <;> exact (qSignedRectEdges_coefficient R w _).symm

theorem qSignedRectEdges_valid {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (hR : ∀ i, (R i).x0 ≤ (R i).x1) :
    qEdgeDataValid (qSignedRectEdges R w) = true := by
  unfold qEdgeDataValid
  apply decide_eq_true_eq.mpr
  intro j
  refine Fin.addCases ?_ ?_ j
  · intro i
    simpa only [qSignedRectEdges,Fin.addCases_left,QRect.bottomEdge] using hR i
  · intro i
    simpa only [qSignedRectEdges,Fin.addCases_right,QRect.topEdge] using hR i

theorem qSignedRectEdges_real_match {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) :
    EdgesMatch Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ))
      Finset.univ (fun j => (qSignedRectEdges R w j).real) :=
  qEdgesMatchCheck_sound R w (qSignedRectEdges R w) (qSignedRectEdges_match R w)

end NoThreeLine

#print axioms NoThreeLine.qSignedRectEdges_coefficient
#print axioms NoThreeLine.qSignedRectEdges_match
#print axioms NoThreeLine.qSignedRectEdges_real_match
