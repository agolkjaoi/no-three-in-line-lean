import NoThreeLine.BenchmarkFastDataCheck

/-! Structurally recursive coefficient normalization. The library mergeSort
uses well-founded recursion, which does not reduce in the kernel on this
installation. Here both merge and a fuel-bounded sort are structural. Every
fuel value preserves coefficients; insufficient fuel can only prevent a match. -/
set_option autoImplicit false

namespace NoThreeLine

def qMergeHead (x : QVertexTerm) (xs : List QVertexTerm)
    (rest : List QVertexTerm → List QVertexTerm) : List QVertexTerm → List QVertexTerm
  | [] => x :: xs
  | y :: ys => if qTermOrder x y then x :: rest (y :: ys)
      else y :: qMergeHead x xs rest ys

def qKernelMerge : List QVertexTerm → List QVertexTerm → List QVertexTerm
  | [],ys => ys
  | x :: xs,ys => qMergeHead x xs (qKernelMerge xs) ys

def qKernelSort : ℕ → List QVertexTerm → List QVertexTerm
  | 0,ts => ts
  | fuel+1,ts => if ts.length ≤ 1 then ts else
      qKernelMerge (qKernelSort fuel (ts.take (ts.length/2)))
        (qKernelSort fuel (ts.drop (ts.length/2)))

def qKernelNormalizeTerms (fuel : ℕ) (ts : List QVertexTerm) : List QVertexTerm :=
  (qMergeRuns (qKernelSort fuel ts)).filter (fun t => t.2 != 0)

theorem qMergeHead_value (p : ℚ × ℚ) (x : QVertexTerm) (xs : List QVertexTerm)
    (rest : List QVertexTerm → List QVertexTerm)
    (hr : ∀ ys, ((rest ys).map (qTermValue p)).sum =
      (xs.map (qTermValue p)).sum + (ys.map (qTermValue p)).sum)
    (ys : List QVertexTerm) :
    ((qMergeHead x xs rest ys).map (qTermValue p)).sum =
      qTermValue p x + (xs.map (qTermValue p)).sum + (ys.map (qTermValue p)).sum := by
  induction ys with
  | nil => simp [qMergeHead]
  | cons y ys ih =>
      simp only [qMergeHead]
      split_ifs
      · simp only [List.map_cons,List.sum_cons,hr]
        ring
      · simp only [List.map_cons,List.sum_cons,ih]
        ring

theorem qKernelMerge_value (p : ℚ × ℚ) (xs ys : List QVertexTerm) :
    ((qKernelMerge xs ys).map (qTermValue p)).sum =
      (xs.map (qTermValue p)).sum + (ys.map (qTermValue p)).sum := by
  induction xs generalizing ys with
  | nil => simp [qKernelMerge]
  | cons x xs ih =>
      simpa only [qKernelMerge,List.map_cons,List.sum_cons] using
        qMergeHead_value p x xs (qKernelMerge xs) ih ys

theorem qKernelSort_value (p : ℚ × ℚ) (fuel : ℕ) (ts : List QVertexTerm) :
    ((qKernelSort fuel ts).map (qTermValue p)).sum =
      (ts.map (qTermValue p)).sum := by
  induction fuel generalizing ts with
  | zero => rfl
  | succ fuel ih =>
      simp only [qKernelSort]
      split_ifs
      · rfl
      · rw [qKernelMerge_value,ih,ih,← List.sum_append,← List.map_append,
          List.take_append_drop]

theorem qKernelNormalizeTerms_value (p : ℚ × ℚ) (fuel : ℕ) (ts : List QVertexTerm) :
    ((qKernelNormalizeTerms fuel ts).map (qTermValue p)).sum =
      (ts.map (qTermValue p)).sum := by
  rw [qKernelNormalizeTerms,qFilterZeroTerms_value,qMergeRuns_value,qKernelSort_value]

def qKernelEdgesMatchCheck {n m : ℕ} (fuel : ℕ) (R : Fin n → QRect)
    (w : Fin n → ℚ) (E : Fin m → QEdge) : Bool :=
  decide (qKernelNormalizeTerms fuel (qRectangleTerms R w) =
    qKernelNormalizeTerms fuel (qHorizontalEdgeTerms E))

theorem qKernelEdgesMatchCheck_sound {n m : ℕ} (fuel : ℕ) (R : Fin n → QRect)
    (w : Fin n → ℚ) (E : Fin m → QEdge)
    (h : qKernelEdgesMatchCheck fuel R w E = true) : qEdgesMatchCheck R w E = true := by
  have he : qKernelNormalizeTerms fuel (qRectangleTerms R w) =
      qKernelNormalizeTerms fuel (qHorizontalEdgeTerms E) := by
    simpa only [qKernelEdgesMatchCheck,decide_eq_true_eq] using h
  have hall (p : ℚ × ℚ) : qVertexCoefficient R w p = qEdgeVertexCoefficient E p := by
    rw [← qRectangleTerms_value,← qHorizontalEdgeTerms_value,
      ← qKernelNormalizeTerms_value p fuel (qRectangleTerms R w),
      ← qKernelNormalizeTerms_value p fuel (qHorizontalEdgeTerms E),he]
  unfold qEdgesMatchCheck
  apply decide_eq_true_eq.mpr
  exact ⟨fun z => hall _,fun z => hall _⟩

def qKernelPositiveDataCheck {n m k : ℕ} (fuel : ℕ) (R : Fin n → QRect) (w : Fin n → ℚ)
    (positive : Fin m → QEdge) (negative : Fin k → QEdge) (Q : QRect) (M : ℚ) : Bool :=
  decide (0 ≤ M ∧
    (∀ i, (R i).unitBoxCheck = true) ∧
    (∀ i, 0 ≤ w i ∧ w i ≤ M) ∧
    (∀ i j, i ≠ j → (R i).separationCheck (R j) = true) ∧
    qEdgeDataValid positive = true ∧ qEdgeDataValid negative = true ∧
    (∀ j, 0 ≤ (positive j).jump) ∧ (∀ j, (negative j).jump ≤ 0) ∧
    qKernelEdgesMatchCheck fuel R w (qCompleteEdges positive negative) = true ∧
    (Q.x0 ≤ Q.x1 ∧ Q.y0 ≤ Q.y1))

theorem qKernelPositiveDataCheck_sound {n m k : ℕ} (fuel : ℕ)
    (R : Fin n → QRect) (w : Fin n → ℚ)
    (positive : Fin m → QEdge) (negative : Fin k → QEdge) (Q : QRect) (M : ℚ)
    (h : qKernelPositiveDataCheck fuel R w positive negative Q M = true) :
    qPositiveEdgeWitnessCheck R w positive negative = true ∧
      fullDataCheck R w (qCompleteEdges positive negative) Q M = true := by
  have hh : 0 ≤ M ∧
      (∀ i, (R i).unitBoxCheck = true) ∧
      (∀ i, 0 ≤ w i ∧ w i ≤ M) ∧
      (∀ i j, i ≠ j → (R i).separationCheck (R j) = true) ∧
      qEdgeDataValid positive = true ∧ qEdgeDataValid negative = true ∧
      (∀ j, 0 ≤ (positive j).jump) ∧ (∀ j, (negative j).jump ≤ 0) ∧
      qKernelEdgesMatchCheck fuel R w (qCompleteEdges positive negative) = true ∧
      (Q.x0 ≤ Q.x1 ∧ Q.y0 ≤ Q.y1) := by
    simpa only [qKernelPositiveDataCheck,decide_eq_true_eq] using h
  rcases hh with ⟨hM,hU,hw,hs,hp,hn,hpos,hneg,hmatch,hQ⟩
  have hm := qKernelEdgesMatchCheck_sound fuel R w (qCompleteEdges positive negative) hmatch
  constructor
  · simpa only [qPositiveEdgeWitnessCheck,decide_eq_true_eq] using
      And.intro hp (And.intro hn (And.intro hpos (And.intro hneg hm)))
  · simpa only [fullDataCheck,decide_eq_true_eq] using
      And.intro hM (And.intro hU (And.intro hw (And.intro hs
        (And.intro (qCompleteEdges_valid positive negative hp hn) (And.intro hm hQ)))))

theorem qKernelNormalizeTerms_smoke :
    qKernelNormalizeTerms 4 [((0,0),1),((0,0),-1)] = [] := by decide +kernel

end NoThreeLine

#print axioms NoThreeLine.qKernelNormalizeTerms_value
#print axioms NoThreeLine.qKernelPositiveDataCheck_sound
#print axioms NoThreeLine.qKernelNormalizeTerms_smoke
