import NoThreeLine.RectangleExpr
import NoThreeLine.JumpBoxEnvelope
import NoThreeLine.VertexExpr

/-! Rational horizontal edges and executable expression trees for C03. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators

namespace NoThreeLine

structure QEdge where
  left : ℚ
  right : ℚ
  height : ℚ
  jump : ℚ
  deriving Repr, DecidableEq

noncomputable def QEdge.real (e : QEdge) : HEdge := ⟨e.left,e.right,e.height,e.jump⟩

def QEdge.boxBandExpr (e : QEdge) (Q : QRect) : Expr :=
  .max (.atom ⟨0,0⟩)
    (.add
      (.min (.atom ⟨e.right,0⟩) (.atom ⟨Q.x1,e.height-Q.y0⟩))
      (.scale (-1) (.max (.atom ⟨e.left,0⟩) (.atom ⟨Q.x0,e.height-Q.y1⟩))))

theorem QEdge.boxBandExpr_eval (e : QEdge) (Q : QRect) (u : ℝ) :
    (e.boxBandExpr Q).eval u = e.real.boxBand Q.real u := by
  simp [QEdge.boxBandExpr, Expr.eval, Coeff.eval, HEdge.boxBand,
    QEdge.real, QRect.real, sub_eq_add_neg]

def qEdgeBandSumExpr {m : ℕ} (E : Fin m → QEdge) (Q : QRect) : Expr :=
  Expr.sum (List.ofFn fun j => .scale (max 0 (E j).jump) ((E j).boxBandExpr Q))

theorem qEdgeBandSumExpr_eval {m : ℕ} (E : Fin m → QEdge) (Q : QRect) (u : ℝ) :
    (qEdgeBandSumExpr E Q).eval u =
      ∑ j, max 0 (E j).real.jump * (E j).real.boxBand Q.real u := by
  simp [qEdgeBandSumExpr, Expr.eval_sum, List.map_ofFn, List.sum_ofFn,
    Expr.eval, QEdge.boxBandExpr_eval, QEdge.real]

def qEdgeDataValid {m : ℕ} (E : Fin m → QEdge) : Bool :=
  decide (∀ j, (E j).left ≤ (E j).right)

theorem qEdgeDataValid_sound {m : ℕ} (E : Fin m → QEdge)
    (h : qEdgeDataValid E = true) : ∀ j, (E j).real.left ≤ (E j).real.right := by
  have hh : ∀ j, (E j).left ≤ (E j).right := by
    simpa only [qEdgeDataValid, decide_eq_true_eq] using h
  intro j
  change ((E j).left : ℝ) ≤ ((E j).right : ℝ)
  exact_mod_cast hh j

def qEdgeVertexPoint (e : QEdge) (k : Fin 2) : ℚ × ℚ :=
  ![(e.left,e.height),(e.right,e.height)] k
def qEdgeVertexSign (k : Fin 2) : ℚ := ![-1,1] k
def qEdgeCornerLocation {m : ℕ} (E : Fin m → QEdge) (z : Fin m × Fin 2) : ℚ × ℚ :=
  qEdgeVertexPoint (E z.1) z.2
def qEdgeCornerCoefficient {m : ℕ} (E : Fin m → QEdge) (z : Fin m × Fin 2) : ℚ :=
  (E z.1).jump * qEdgeVertexSign z.2
def qEdgeVertexCoefficient {m : ℕ} (E : Fin m → QEdge) (p : ℚ × ℚ) : ℚ :=
  ∑ z : Fin m × Fin 2, if qEdgeCornerLocation E z = p then qEdgeCornerCoefficient E z else 0

theorem qEdgeCornerLocation_cast {m : ℕ} (E : Fin m → QEdge) (z : Fin m × Fin 2) :
    edgeCornerLocation (fun j => (E j).real) z =
      (((qEdgeCornerLocation E z).1 : ℝ),((qEdgeCornerLocation E z).2 : ℝ)) := by
  rcases z with ⟨j,k⟩
  fin_cases k <;> rfl

theorem qEdgeCornerCoefficient_cast {m : ℕ} (E : Fin m → QEdge) (z : Fin m × Fin 2) :
    (qEdgeCornerCoefficient E z : ℝ) = edgeCornerCoefficient (fun j => (E j).real) z := by
  rcases z with ⟨j,k⟩
  fin_cases k <;>
    simp [qEdgeCornerCoefficient, qEdgeVertexSign, edgeCornerCoefficient,
      HEdge.vertexSign, QEdge.real]

theorem rat_pair_cast_eq_iff (p q : ℚ × ℚ) :
    ((p.1 : ℝ),(p.2 : ℝ)) = ((q.1 : ℝ),(q.2 : ℝ)) ↔ p = q := by
  simp [Prod.ext_iff]

theorem qEdgeVertexCoefficient_cast {m : ℕ} (E : Fin m → QEdge) (p : ℚ × ℚ) :
    (qEdgeVertexCoefficient E p : ℝ) =
      edgeVertexCoefficient Finset.univ (fun j => (E j).real) ((p.1 : ℝ),(p.2 : ℝ)) := by
  classical
  unfold qEdgeVertexCoefficient edgeVertexCoefficient
  rw [Finset.sum_filter]
  simp only [edgeCornerIndex, Finset.product_eq_sprod, Finset.univ_product_univ]
  push_cast
  apply Finset.sum_congr rfl
  intro z _
  simp only [qEdgeCornerLocation_cast, rat_pair_cast_eq_iff]
  split_ifs
  · exact qEdgeCornerCoefficient_cast E z
  · norm_num

theorem qEdgeCornerLocation_real {m : ℕ} (E : Fin m → QEdge) (z : Fin m × Fin 2) :
    qPointReal (qEdgeCornerLocation E z) = edgeCornerLocation (fun j => (E j).real) z :=
  (qEdgeCornerLocation_cast E z).symm

theorem qEdgeVertexCoefficient_real {m : ℕ} (E : Fin m → QEdge) (p : ℚ × ℚ) :
    (qEdgeVertexCoefficient E p : ℝ) =
      edgeVertexCoefficient Finset.univ (fun j => (E j).real) (qPointReal p) :=
  qEdgeVertexCoefficient_cast E p

/-- Check coefficient equality at every rectangle and edge corner. Duplicate
locations are deliberately allowed: each coefficient is the full signed sum
at that rational location, so cancellation is retained. -/
def qEdgesMatchCheck {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) : Bool :=
  decide ((∀ z : Fin n × Fin 4,
      qVertexCoefficient R w (qCornerLocation R z) =
        qEdgeVertexCoefficient E (qCornerLocation R z)) ∧
    (∀ z : Fin m × Fin 2,
      qVertexCoefficient R w (qEdgeCornerLocation E z) =
        qEdgeVertexCoefficient E (qEdgeCornerLocation E z)))

/-- This converts a purely rational finite check into the geometric matching
contract; no field, chord, or integral equality is among the assumptions. -/
theorem qEdgesMatchCheck_sound {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (hc : qEdgesMatchCheck R w E = true) :
    EdgesMatch Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ))
      Finset.univ (fun j => (E j).real) := by
  classical
  have hh : (∀ z : Fin n × Fin 4,
      qVertexCoefficient R w (qCornerLocation R z) =
        qEdgeVertexCoefficient E (qCornerLocation R z)) ∧
      (∀ z : Fin m × Fin 2,
      qVertexCoefficient R w (qEdgeCornerLocation E z) =
        qEdgeVertexCoefficient E (qEdgeCornerLocation E z)) := by
    simpa only [qEdgesMatchCheck, decide_eq_true_eq] using hc
  intro p hp
  rcases Finset.mem_union.mp hp with hp | hp
  · obtain ⟨z,hz,hp⟩ := Finset.mem_image.mp hp
    have he := congrArg (fun q : ℚ => (q : ℝ)) (hh.1 z)
    rw [qVertexCoefficient_real, qEdgeVertexCoefficient_real, qCornerLocation_real] at he
    simpa only [hp] using he
  · obtain ⟨z,hz,hp⟩ := Finset.mem_image.mp hp
    have he := congrArg (fun q : ℚ => (q : ℝ)) (hh.2 z)
    rw [qVertexCoefficient_real, qEdgeVertexCoefficient_real, qEdgeCornerLocation_real] at he
    simpa only [hp] using he

def qJumpEnvelopeExpr {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) : Expr :=
  .add (qVertexEndpointExpr R w Q.x1 Q.y0) (qEdgeBandSumExpr E Q)

theorem qJumpEnvelopeExpr_eval {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (u : ℝ) :
    (qJumpEnvelopeExpr R w E Q).eval u =
      algebraicJumpBoxEnvelope Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ))
        Finset.univ (fun j => (E j).real) Q.real u := by
  simp only [qJumpEnvelopeExpr, Expr.eval, qVertexEndpointExpr_eval,
    qEdgeBandSumExpr_eval, algebraicJumpBoxEnvelope, QRect.real]

/-- Executable C03 expression soundness for actual rational rectangle data.
The only representation premise is the successful finite rational checker. -/
theorem actualChord_le_qJumpEnvelopeExpr {n m : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (E : Fin m → QEdge) (Q : QRect) (x y u : ℝ)
    (hR : ∀ i, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hE : qEdgeDataValid E = true) (hm : qEdgesMatchCheck R w E = true)
    (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1) (hu : 0 < u) :
    actualChord R w x y u ≤ (qJumpEnvelopeExpr R w E Q).eval u := by
  have hR' : ∀ i ∈ (Finset.univ : Finset (Fin n)),
      (R i).real.x0 ≤ (R i).real.x1 ∧ (R i).real.y0 ≤ (R i).real.y1 := by
    intro i _
    change ((R i).x0 : ℝ) ≤ ((R i).x1 : ℝ) ∧ ((R i).y0 : ℝ) ≤ ((R i).y1 : ℝ)
    exact ⟨by exact_mod_cast (hR i).1, by exact_mod_cast (hR i).2⟩
  have hh := rectangleField_chord_le_jumpBoxEnvelope Finset.univ
    (fun i => (R i).real) (fun i => (w i : ℝ)) Finset.univ (fun j => (E j).real)
    (qEdgesMatchCheck_sound R w E hm) hR' (fun j _ => qEdgeDataValid_sound E hE j)
    Q.real x y u hx hy hu
  rw [jumpBoxEnvelope_eq_algebraic _ _ _ _ _ _ _ hR' hu] at hh
  rw [qJumpEnvelopeExpr_eval]
  exact hh

def jumpMatchUnitRect (_ : Fin 1) : QRect := ⟨0,1,0,1⟩
def jumpMatchUnitWeight (_ : Fin 1) : ℚ := 1
def jumpMatchUnitEdges : Fin 2 → QEdge := ![⟨0,1,0,1⟩,⟨0,1,1,-1⟩]
def jumpMatchWrongEdges : Fin 2 → QEdge := ![⟨0,1,0,1⟩,⟨0,1,1,1⟩]

/-- The top negative jump is part of representation matching, despite being
discarded from the positive-jump cost. -/
theorem jump_matching_example :
    qEdgesMatchCheck jumpMatchUnitRect jumpMatchUnitWeight jumpMatchUnitEdges = true := by
  norm_num [qEdgesMatchCheck, qVertexCoefficient, qEdgeVertexCoefficient,
    Fintype.sum_prod_type, Fin.sum_univ_succ, Fin.forall_fin_succ,
    jumpMatchUnitRect, jumpMatchUnitWeight, jumpMatchUnitEdges,
    qCornerLocation, qVertexPoint, qCornerCoefficient, qVertexSign,
    qEdgeCornerLocation, qEdgeVertexPoint, qEdgeCornerCoefficient, qEdgeVertexSign]

theorem jump_wrong_sign_rejected :
    qEdgesMatchCheck jumpMatchUnitRect jumpMatchUnitWeight jumpMatchWrongEdges = false := by
  norm_num [qEdgesMatchCheck, qVertexCoefficient, qEdgeVertexCoefficient,
    Fintype.sum_prod_type, Fin.sum_univ_succ, Fin.forall_fin_succ,
    jumpMatchUnitRect, jumpMatchUnitWeight, jumpMatchWrongEdges,
    qCornerLocation, qVertexPoint, qCornerCoefficient, qVertexSign,
    qEdgeCornerLocation, qEdgeVertexPoint, qEdgeCornerCoefficient, qEdgeVertexSign]

end NoThreeLine

#print axioms NoThreeLine.QEdge.boxBandExpr_eval
#print axioms NoThreeLine.qEdgeBandSumExpr_eval
#print axioms NoThreeLine.qEdgeVertexCoefficient_cast
#print axioms NoThreeLine.qEdgesMatchCheck_sound
#print axioms NoThreeLine.qJumpEnvelopeExpr_eval
#print axioms NoThreeLine.actualChord_le_qJumpEnvelopeExpr
#print axioms NoThreeLine.jump_matching_example
#print axioms NoThreeLine.jump_wrong_sign_rejected
