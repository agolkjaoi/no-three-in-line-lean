import NoThreeLine.SignedRectEdges

/-! A positive-only edge table becomes a valid C03 input when accompanied by
a nonpositive signed witness table. Matching is checked on the full signed
table; the witness contributes exactly zero to the positive-jump cost. -/
set_option autoImplicit false
open Set
open scoped BigOperators

namespace NoThreeLine

def qCompleteEdges {m k : ℕ} (positive : Fin m → QEdge) (negative : Fin k → QEdge) :
    Fin (m+k) → QEdge := Fin.addCases positive negative

def qPositiveEdgeWitnessCheck {n m k : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (positive : Fin m → QEdge) (negative : Fin k → QEdge) : Bool :=
  decide (qEdgeDataValid positive = true ∧ qEdgeDataValid negative = true ∧
    (∀ j, 0 ≤ (positive j).jump) ∧ (∀ j, (negative j).jump ≤ 0) ∧
    qEdgesMatchCheck R w (qCompleteEdges positive negative) = true)

theorem qCompleteEdges_valid {m k : ℕ} (positive : Fin m → QEdge)
    (negative : Fin k → QEdge) (hp : qEdgeDataValid positive = true)
    (hn : qEdgeDataValid negative = true) :
    qEdgeDataValid (qCompleteEdges positive negative) = true := by
  have hp' : ∀ j, (positive j).left ≤ (positive j).right := by
    simpa only [qEdgeDataValid,decide_eq_true_eq] using hp
  have hn' : ∀ j, (negative j).left ≤ (negative j).right := by
    simpa only [qEdgeDataValid,decide_eq_true_eq] using hn
  unfold qEdgeDataValid
  apply decide_eq_true_eq.mpr
  intro j
  refine Fin.addCases ?_ ?_ j
  · intro i
    simpa only [qCompleteEdges,Fin.addCases_left] using hp' i
  · intro i
    simpa only [qCompleteEdges,Fin.addCases_right] using hn' i

theorem qEdgeBandSumExpr_complete_eval {m k : ℕ} (positive : Fin m → QEdge)
    (negative : Fin k → QEdge) (Q : QRect) (u : ℝ)
    (hn : ∀ j, (negative j).jump ≤ 0) :
    (qEdgeBandSumExpr (qCompleteEdges positive negative) Q).eval u =
      (qEdgeBandSumExpr positive Q).eval u := by
  rw [qEdgeBandSumExpr_eval,qEdgeBandSumExpr_eval,Fin.sum_univ_add]
  simp only [qCompleteEdges,Fin.addCases_left,Fin.addCases_right]
  have hz : (∑ j : Fin k, max 0 (negative j).real.jump *
      (negative j).real.boxBand Q.real u) = 0 := by
    apply Finset.sum_eq_zero
    intro j _
    have h : (negative j).real.jump ≤ 0 := by
      change ((negative j).jump : ℝ) ≤ 0
      exact_mod_cast hn j
    rw [max_eq_left h,zero_mul]
  rw [hz,add_zero]

theorem qJumpEnvelopeExpr_complete_eval {n m k : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (positive : Fin m → QEdge) (negative : Fin k → QEdge)
    (Q : QRect) (u : ℝ) (hn : ∀ j, (negative j).jump ≤ 0) :
    (qJumpEnvelopeExpr R w (qCompleteEdges positive negative) Q).eval u =
      (qJumpEnvelopeExpr R w positive Q).eval u := by
  simp only [qJumpEnvelopeExpr,Expr.eval,qEdgeBandSumExpr_complete_eval positive negative Q u hn]

/-- The positive-only table supplies the cost, while the full signed completion
supplies representation soundness. No bound on the chord is assumed. -/
theorem actualChord_le_positive_edge_witness {n m k : ℕ} (R : Fin n → QRect)
    (w : Fin n → ℚ) (positive : Fin m → QEdge) (negative : Fin k → QEdge)
    (Q : QRect) (x y u : ℝ)
    (hR : ∀ i, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hc : qPositiveEdgeWitnessCheck R w positive negative = true)
    (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1) (hu : 0 < u) :
    actualChord R w x y u ≤ (qJumpEnvelopeExpr R w positive Q).eval u := by
  have hh : qEdgeDataValid positive = true ∧ qEdgeDataValid negative = true ∧
      (∀ j, 0 ≤ (positive j).jump) ∧ (∀ j, (negative j).jump ≤ 0) ∧
      qEdgesMatchCheck R w (qCompleteEdges positive negative) = true := by
    simpa only [qPositiveEdgeWitnessCheck,decide_eq_true_eq] using hc
  have h := actualChord_le_qJumpEnvelopeExpr R w (qCompleteEdges positive negative) Q x y u
    hR (qCompleteEdges_valid positive negative hh.1 hh.2.1) hh.2.2.2.2 hx hy hu
  rw [qJumpEnvelopeExpr_complete_eval R w positive negative Q u hh.2.2.2.1] at h
  exact h

/-- Raw rectangle bottom/top tables always supply a witness when weights are
nonnegative. A smaller cancelled table can instead pass the same finite check. -/
theorem rectangle_positive_edge_witness {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (hR : ∀ i, (R i).x0 ≤ (R i).x1) (hw : ∀ i, 0 ≤ w i) :
    qPositiveEdgeWitnessCheck R w (fun i => (R i).bottomEdge (w i))
      (fun i => (R i).topEdge (w i)) = true := by
  unfold qPositiveEdgeWitnessCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,hw,?_,qSignedRectEdges_match R w⟩
  · simpa only [qEdgeDataValid,decide_eq_true_eq,QRect.bottomEdge] using hR
  · simpa only [qEdgeDataValid,decide_eq_true_eq,QRect.topEdge] using hR
  · intro i
    exact neg_nonpos.mpr (hw i)

end NoThreeLine

#print axioms NoThreeLine.qEdgeBandSumExpr_complete_eval
#print axioms NoThreeLine.actualChord_le_positive_edge_witness
#print axioms NoThreeLine.rectangle_positive_edge_witness
