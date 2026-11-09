import NoThreeLine.JumpExpr
import NoThreeLine.FullEnvelope
import NoThreeLine.Partition
import NoThreeLine.ChordIntegral

/-! End-to-end finite rational certificates for the original min(U1,U2,M)
geometric envelope. Every nonanalytic premise is an executable data check. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators Interval

namespace NoThreeLine

def fullExpr {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) : Expr :=
  .min (qVertexEnvelopeExpr R w Q)
    (.min (qJumpEnvelopeExpr R w E Q) (.atom ⟨M,0⟩))

theorem fullExpr_eval {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (u : ℝ) :
    (fullExpr R w E Q M).eval u =
      fullBoxEnvelope Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ))
        Finset.univ (fun j => (E j).real) Q.real M u := by
  simp only [fullExpr, Expr.eval, Coeff.eval, Rat.cast_zero, zero_div, add_zero,
    qVertexEnvelopeExpr_eval, qJumpEnvelopeExpr_eval, fullBoxEnvelope]

def QRect.unitBoxCheck (R : QRect) : Bool :=
  decide (0 ≤ R.x0 ∧ R.x0 ≤ R.x1 ∧ R.x1 ≤ 1 ∧
    0 ≤ R.y0 ∧ R.y0 ≤ R.y1 ∧ R.y1 ≤ 1)

def QRect.separationCheck (R Q : QRect) : Bool :=
  decide (R.x1 ≤ Q.x0 ∨ Q.x1 ≤ R.x0 ∨ R.y1 ≤ Q.y0 ∨ Q.y1 ≤ R.y0)

theorem QRect.unitBoxCheck_sound (R : QRect) (h : R.unitBoxCheck = true) :
    R.real.InUnitSquare := by
  have hh : 0 ≤ R.x0 ∧ R.x0 ≤ R.x1 ∧ R.x1 ≤ 1 ∧
      0 ≤ R.y0 ∧ R.y0 ≤ R.y1 ∧ R.y1 ≤ 1 := by
    simpa only [QRect.unitBoxCheck, decide_eq_true_eq] using h
  dsimp only [Rect.InUnitSquare, QRect.real]
  exact_mod_cast hh

theorem QRect.separationCheck_sound (R Q : QRect) (h : R.separationCheck Q = true) :
    R.real.Separated Q.real := by
  have hh : R.x1 ≤ Q.x0 ∨ Q.x1 ≤ R.x0 ∨ R.y1 ≤ Q.y0 ∨ Q.y1 ≤ R.y0 := by
    simpa only [QRect.separationCheck, decide_eq_true_eq] using h
  dsimp only [Rect.Separated, QRect.real]
  exact_mod_cast hh

/-- The two finite edge checks retain all signed coefficients. The root box
is checked for order, while every data cell is checked inside the unit square. -/
def fullDataCheck {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) : Bool :=
  decide (0 ≤ M ∧
    (∀ i, (R i).unitBoxCheck = true) ∧
    (∀ i, 0 ≤ w i ∧ w i ≤ M) ∧
    (∀ i j, i ≠ j → (R i).separationCheck (R j) = true) ∧
    qEdgeDataValid E = true ∧ qEdgesMatchCheck R w E = true ∧
    (Q.x0 ≤ Q.x1 ∧ Q.y0 ≤ Q.y1))

/-- Structural real-data facts, each supplied by the preceding rational check.
This structure contains no bounds on fields, chords, or integrals. -/
structure FullDataFacts {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) : Prop where
  cap_nonneg : (0 : ℝ) ≤ M
  separated : RectanglesSeparated Finset.univ (fun i => (R i).real)
  weights : ∀ i ∈ (Finset.univ : Finset (Fin n)), (0 : ℝ) ≤ w i ∧ (w i : ℝ) ≤ M
  cells_unit : ∀ i ∈ (Finset.univ : Finset (Fin n)), (R i).real.InUnitSquare
  edges_match : EdgesMatch Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ))
    Finset.univ (fun j => (E j).real)
  edges_ordered : ∀ j ∈ (Finset.univ : Finset (Fin m)), (E j).real.left ≤ (E j).real.right
  root_ordered : Q.real.x0 ≤ Q.real.x1 ∧ Q.real.y0 ≤ Q.real.y1

theorem fullDataCheck_sound {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (h : fullDataCheck R w E Q M = true) :
    FullDataFacts R w E Q M := by
  have hd : 0 ≤ M ∧
      (∀ i, (R i).unitBoxCheck = true) ∧
      (∀ i, 0 ≤ w i ∧ w i ≤ M) ∧
      (∀ i j, i ≠ j → (R i).separationCheck (R j) = true) ∧
      qEdgeDataValid E = true ∧ qEdgesMatchCheck R w E = true ∧
      (Q.x0 ≤ Q.x1 ∧ Q.y0 ≤ Q.y1) := by
    simpa only [fullDataCheck, decide_eq_true_eq] using h
  rcases hd with ⟨hM,hU,hw,hsep,hE,hm,hQ⟩
  refine ⟨by exact_mod_cast hM, ?_, ?_, ?_, qEdgesMatchCheck_sound R w E hm, ?_, ?_⟩
  · intro i _ j _ hne
    exact QRect.separationCheck_sound (R i) (R j) (hsep i j hne)
  · intro i _
    exact ⟨by exact_mod_cast (hw i).1, by exact_mod_cast (hw i).2⟩
  · intro i _
    exact QRect.unitBoxCheck_sound (R i) (hU i)
  · intro j _
    exact qEdgeDataValid_sound E hE j
  · dsimp only [QRect.real]
    exact_mod_cast hQ

/-- Checked data imply both nonnegativity of the actual chord and the full
geometric envelope bound, uniformly on the closed root box. -/
theorem fullExpr_chord_bounds {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (x y u : ℝ)
    (hd : fullDataCheck R w E Q M = true)
    (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1) (hu : 0 < u) :
    0 ≤ actualChord R w x y u ∧
      actualChord R w x y u ≤ (fullExpr R w E Q M).eval u ∧
      (fullExpr R w E Q M).eval u ≤ (M : ℝ) := by
  have hf := fullDataCheck_sound R w E Q M hd
  rw [fullExpr_eval]
  exact fullBoxEnvelope_sound Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ))
    Finset.univ (fun j => (E j).real) Q.real M x y u hf.cap_nonneg hf.separated
    hf.weights hf.cells_unit hf.edges_match hf.edges_ordered hx hy hu

/-- From explicit finite rational input checks and a checked partition of the
original min(U1,U2,M), derive the actual chord-square integral bound. -/
theorem full_certificate_sound {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List ℚ) (B : ℚ)
    (hd : fullDataCheck R w E Q M = true)
    (hc : checkUnitIntegral (fullExpr R w E Q M) S cuts = some B)
    (x y : ℝ) (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1) :
    (∫ u in (0 : ℝ)..1, (actualChord R w x y u)^2) ≤ (B : ℝ) := by
  have hf := fullDataCheck_sound R w E Q M hd
  have hi := checkUnitIntegral_sound (fullExpr R w E Q M) S cuts B hc
  have hdom := fieldChord_square_integral_le Finset.univ (fun i => (R i).real)
    (fun i => (w i : ℝ)) x y (fullExpr R w E Q M).eval
    (fun i hi => (hf.weights i hi).1) hi.1
    (fun u hu => (fullExpr_chord_bounds R w E Q M x y u hd hx hy hu.1).2.1)
  exact hdom.trans hi.2

/-- Finite common grid boundaries are permitted in the actual field. -/
theorem erased_full_certificate_sound {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List ℚ) (B : ℚ)
    (hd : fullDataCheck R w E Q M = true)
    (hc : checkUnitIntegral (fullExpr R w E Q M) S cuts = some B)
    (x y : ℝ) (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1)
    (vertical horizontal : Finset ℝ) :
    (∫ u in (0 : ℝ)..1, (∫ t : ℝ, eraseGrid vertical horizontal
      (rectangleField Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ)))
      t (y-u*x+u*t))^2) ≤ (B : ℝ) := by
  rw [erased_fieldChord_square_integral_eq]
  exact full_certificate_sound R w E Q M S cuts B hd hc x y hx hy

def checkFullCertificate {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List ℚ) : Option ℚ :=
  if fullDataCheck R w E Q M then checkUnitIntegral (fullExpr R w E Q M) S cuts else none

theorem checkFullCertificate_sound {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List ℚ) (B : ℚ)
    (hc : checkFullCertificate R w E Q M S cuts = some B)
    (x y : ℝ) (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1) :
    (∫ u in (0 : ℝ)..1, (actualChord R w x y u)^2) ≤ (B : ℝ) := by
  unfold checkFullCertificate at hc
  split_ifs at hc with hd
  exact full_certificate_sound R w E Q M S cuts B hd hc x y hx hy

theorem checkFullCertificate_erased_sound {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (Q : QRect) (M : ℚ) (S : ℕ) (cuts : List ℚ) (B : ℚ)
    (hc : checkFullCertificate R w E Q M S cuts = some B)
    (x y : ℝ) (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1)
    (vertical horizontal : Finset ℝ) :
    (∫ u in (0 : ℝ)..1, (∫ t : ℝ, eraseGrid vertical horizontal
      (rectangleField Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ)))
      t (y-u*x+u*t))^2) ≤ (B : ℝ) := by
  unfold checkFullCertificate at hc
  split_ifs at hc with hd
  exact erased_full_certificate_sound R w E Q M S cuts B hd hc x y hx hy vertical horizontal

def fullUnitRoot : QRect := ⟨0,1,0,1⟩

theorem full_unit_data_checked :
    fullDataCheck jumpMatchUnitRect jumpMatchUnitWeight jumpMatchUnitEdges fullUnitRoot 1 = true := by
  norm_num [fullDataCheck, jump_matching_example, QRect.unitBoxCheck,
    QRect.separationCheck, qEdgeDataValid, jumpMatchUnitRect, jumpMatchUnitWeight,
    jumpMatchUnitEdges, fullUnitRoot, Fin.forall_fin_succ]
  exact jump_matching_example

theorem full_unit_partition_checked :
    checkUnitIntegral (fullExpr jumpMatchUnitRect jumpMatchUnitWeight jumpMatchUnitEdges
      fullUnitRoot 1) 3 [1/3,1] = some 1 := by
  norm_num [checkUnitIntegral, checkPartition, fullExpr, qVertexEnvelopeExpr,
    qVertexEndpointExpr, qVertexTentExpr, qVertexKeys, qVertexPoint, qVertexCoefficient,
    qCornerLocation, qCornerCoefficient, qVertexSign, qJumpEnvelopeExpr, qEdgeBandSumExpr,
    QEdge.boxBandExpr, Expr.sum, List.ofFn_succ, Fintype.sum_prod_type, Fin.sum_univ_succ,
    Expr.check, Coeff.leOn, Coeff.add, Coeff.scale, BranchValid, branchBound, roundUp,
    qAlpha, qBeta, jumpMatchUnitRect, jumpMatchUnitWeight, jumpMatchUnitEdges, fullUnitRoot]

theorem full_unit_checked :
    checkFullCertificate jumpMatchUnitRect jumpMatchUnitWeight jumpMatchUnitEdges
      fullUnitRoot 1 3 [1/3,1] = some 1 := by
  simp only [checkFullCertificate, full_unit_data_checked, ↓reduceIte, full_unit_partition_checked]

theorem full_unit_actual_integral (x y : ℝ) (hx : x ∈ Icc (0 : ℝ) 1)
    (hy : y ∈ Icc (0 : ℝ) 1) :
    (∫ u in (0 : ℝ)..1, (actualChord jumpMatchUnitRect jumpMatchUnitWeight x y u)^2) ≤ 1 := by
  have hi := checkFullCertificate_sound jumpMatchUnitRect jumpMatchUnitWeight jumpMatchUnitEdges
    fullUnitRoot 1 3 [1/3,1] 1 full_unit_checked x y (by simpa [fullUnitRoot] using hx)
    (by simpa [fullUnitRoot] using hy)
  simpa using hi

end NoThreeLine

#print axioms NoThreeLine.fullExpr_eval
#print axioms NoThreeLine.fullDataCheck_sound
#print axioms NoThreeLine.fullExpr_chord_bounds
#print axioms NoThreeLine.full_certificate_sound
#print axioms NoThreeLine.erased_full_certificate_sound
#print axioms NoThreeLine.checkFullCertificate_sound
#print axioms NoThreeLine.checkFullCertificate_erased_sound
#print axioms NoThreeLine.full_unit_checked
#print axioms NoThreeLine.full_unit_actual_integral
