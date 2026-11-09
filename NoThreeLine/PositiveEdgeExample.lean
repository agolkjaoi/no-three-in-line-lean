import NoThreeLine.PositiveEdgeWitness

/-! A shared horizontal boundary cancels before taking the positive part. -/
set_option autoImplicit false
open Set

namespace NoThreeLine

def edgeExampleRects : Fin 2 → QRect := ![⟨0,1,0,1/2⟩,⟨0,1,1/2,1⟩]
def edgeExampleWeights (_ : Fin 2) : ℚ := 1
def edgeExamplePositive (_ : Fin 1) : QEdge := ⟨0,1,0,1⟩
def edgeExampleNegative (_ : Fin 1) : QEdge := ⟨0,1,1,-1⟩

/-- The internal +1 and -1 at height 1/2 have been removed. Checking the two
remaining signed edges proves their representation of the two-cell field. -/
theorem edgeExample_checked :
    qPositiveEdgeWitnessCheck edgeExampleRects edgeExampleWeights
      edgeExamplePositive edgeExampleNegative = true := by
  norm_num [qPositiveEdgeWitnessCheck,qEdgeDataValid,qEdgesMatchCheck,
    qVertexCoefficient,qEdgeVertexCoefficient,Fintype.sum_prod_type,
    Fin.sum_univ_succ,Fin.forall_fin_succ,qCompleteEdges,Fin.addCases,
    edgeExampleRects,edgeExampleWeights,edgeExamplePositive,edgeExampleNegative,
    qCornerLocation,qVertexPoint,qCornerCoefficient,qVertexSign,
    qEdgeCornerLocation,qEdgeVertexPoint,qEdgeCornerCoefficient,qEdgeVertexSign]

theorem edgeExample_chord_bound (Q : QRect) (x y u : ℝ)
    (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1) (hu : 0 < u) :
    actualChord edgeExampleRects edgeExampleWeights x y u ≤
      (qJumpEnvelopeExpr edgeExampleRects edgeExampleWeights edgeExamplePositive Q).eval u := by
  apply actualChord_le_positive_edge_witness edgeExampleRects edgeExampleWeights
    edgeExamplePositive edgeExampleNegative Q x y u ?_ edgeExample_checked hx hy hu
  intro i
  fin_cases i <;> norm_num [edgeExampleRects]

end NoThreeLine

#print axioms NoThreeLine.edgeExample_checked
#print axioms NoThreeLine.edgeExample_chord_bound
