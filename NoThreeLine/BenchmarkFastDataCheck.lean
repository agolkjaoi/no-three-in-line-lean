import NoThreeLine.BenchmarkVertexNormalize
import NoThreeLine.PositiveFullCertificate

/-! Structural checks for large explicit fields, with one coefficient-table
normalization instead of repeated sums at every corner. -/
set_option autoImplicit false

namespace NoThreeLine

def qFastPositiveDataCheck {n m k : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (positive : Fin m → QEdge) (negative : Fin k → QEdge) (Q : QRect) (M : ℚ) : Bool :=
  decide (0 ≤ M ∧
    (∀ i, (R i).unitBoxCheck = true) ∧
    (∀ i, 0 ≤ w i ∧ w i ≤ M) ∧
    (∀ i j, i ≠ j → (R i).separationCheck (R j) = true) ∧
    qEdgeDataValid positive = true ∧ qEdgeDataValid negative = true ∧
    (∀ j, 0 ≤ (positive j).jump) ∧ (∀ j, (negative j).jump ≤ 0) ∧
    qFastEdgesMatchCheck R w (qCompleteEdges positive negative) = true ∧
    (Q.x0 ≤ Q.x1 ∧ Q.y0 ≤ Q.y1))

theorem qFastPositiveDataCheck_sound {n m k : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (positive : Fin m → QEdge) (negative : Fin k → QEdge) (Q : QRect) (M : ℚ)
    (h : qFastPositiveDataCheck R w positive negative Q M = true) :
    qPositiveEdgeWitnessCheck R w positive negative = true ∧
      fullDataCheck R w (qCompleteEdges positive negative) Q M = true := by
  have hh : 0 ≤ M ∧
      (∀ i, (R i).unitBoxCheck = true) ∧
      (∀ i, 0 ≤ w i ∧ w i ≤ M) ∧
      (∀ i j, i ≠ j → (R i).separationCheck (R j) = true) ∧
      qEdgeDataValid positive = true ∧ qEdgeDataValid negative = true ∧
      (∀ j, 0 ≤ (positive j).jump) ∧ (∀ j, (negative j).jump ≤ 0) ∧
      qFastEdgesMatchCheck R w (qCompleteEdges positive negative) = true ∧
      (Q.x0 ≤ Q.x1 ∧ Q.y0 ≤ Q.y1) := by
    simpa only [qFastPositiveDataCheck,decide_eq_true_eq] using h
  rcases hh with ⟨hM,hU,hw,hs,hp,hn,hpos,hneg,hmatch,hQ⟩
  have hm := qFastEdgesMatchCheck_sound R w (qCompleteEdges positive negative) hmatch
  constructor
  · simpa only [qPositiveEdgeWitnessCheck,decide_eq_true_eq] using
      And.intro hp (And.intro hn (And.intro hpos (And.intro hneg hm)))
  · simpa only [fullDataCheck,decide_eq_true_eq] using
      And.intro hM (And.intro hU (And.intro hw (And.intro hs
        (And.intro (qCompleteEdges_valid positive negative hp hn) (And.intro hm hQ)))))

end NoThreeLine

#print axioms NoThreeLine.qFastPositiveDataCheck_sound
