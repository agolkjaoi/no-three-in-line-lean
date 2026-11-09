import NoThreeLine.PositiveEdgeWitness
import Mathlib.Data.List.Sort

/-! A faster coefficient certificate: sort signed terms once, combine adjacent
equal locations and discard zero terms. Soundness uses only permutation and
additivity; the sorting order itself is not a mathematical assumption. -/
set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine

abbrev QVertexTerm := (ℚ × ℚ) × ℚ

def qTermValue (p : ℚ × ℚ) (t : QVertexTerm) : ℚ := if t.1 = p then t.2 else 0

def qMergeTerm (t : QVertexTerm) : List QVertexTerm → List QVertexTerm
  | [] => [t]
  | a :: rest => if t.1 = a.1 then (t.1,t.2+a.2) :: rest else t :: a :: rest

def qMergeRuns : List QVertexTerm → List QVertexTerm
  | [] => []
  | t :: ts => qMergeTerm t (qMergeRuns ts)

def qTermOrder (t a : QVertexTerm) : Bool :=
  decide (t.1.1 < a.1.1 ∨ (t.1.1 = a.1.1 ∧ t.1.2 ≤ a.1.2))

def qNormalizeTerms (ts : List QVertexTerm) : List QVertexTerm :=
  (qMergeRuns (ts.mergeSort qTermOrder)).filter (fun t => t.2 != 0)

theorem qMergeTerm_value (p : ℚ × ℚ) (t : QVertexTerm) (ts : List QVertexTerm) :
    ((qMergeTerm t ts).map (qTermValue p)).sum =
      qTermValue p t + (ts.map (qTermValue p)).sum := by
  cases ts with
  | nil => simp [qMergeTerm]
  | cons a rest =>
      simp only [qMergeTerm]
      split_ifs with h
      · simp only [List.map_cons,List.sum_cons,qTermValue]
        rw [h]
        split_ifs <;> ring
      · simp [List.map_cons,List.sum_cons]

theorem qMergeRuns_value (p : ℚ × ℚ) (ts : List QVertexTerm) :
    ((qMergeRuns ts).map (qTermValue p)).sum = (ts.map (qTermValue p)).sum := by
  induction ts with
  | nil => rfl
  | cons t ts ih => rw [qMergeRuns,qMergeTerm_value,ih,List.map_cons,List.sum_cons]

theorem qFilterZeroTerms_value (p : ℚ × ℚ) (ts : List QVertexTerm) :
    ((ts.filter (fun t => t.2 != 0)).map (qTermValue p)).sum =
      (ts.map (qTermValue p)).sum := by
  induction ts with
  | nil => rfl
  | cons t ts ih =>
      by_cases h : t.2 = 0
      · simp [h,ih,qTermValue]
      · simp [h,ih]

theorem qNormalizeTerms_value (p : ℚ × ℚ) (ts : List QVertexTerm) :
    ((qNormalizeTerms ts).map (qTermValue p)).sum =
      (ts.map (qTermValue p)).sum := by
  rw [qNormalizeTerms,qFilterZeroTerms_value,qMergeRuns_value]
  exact ((List.mergeSort_perm ts qTermOrder).map (qTermValue p)).sum_eq

def qRectangleTerms {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) : List QVertexTerm :=
  (List.ofFn fun i : Fin n => List.ofFn fun k : Fin 4 =>
    (qVertexPoint (R i) k,w i * qVertexSign k)).flatten

def qHorizontalEdgeTerms {m : ℕ} (E : Fin m → QEdge) : List QVertexTerm :=
  (List.ofFn fun j : Fin m => List.ofFn fun k : Fin 2 =>
    (qEdgeVertexPoint (E j) k,(E j).jump * qEdgeVertexSign k)).flatten

theorem qRectangleTerms_value {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) (p : ℚ × ℚ) :
    ((qRectangleTerms R w).map (qTermValue p)).sum = qVertexCoefficient R w p := by
  simp only [qRectangleTerms,List.map_flatten,List.map_ofFn,List.sum_flatten,List.sum_ofFn,
    qVertexCoefficient,Fintype.sum_prod_type,qCornerLocation,qCornerCoefficient,qTermValue,
    Function.comp_apply]

theorem qHorizontalEdgeTerms_value {m : ℕ} (E : Fin m → QEdge) (p : ℚ × ℚ) :
    ((qHorizontalEdgeTerms E).map (qTermValue p)).sum = qEdgeVertexCoefficient E p := by
  simp only [qHorizontalEdgeTerms,List.map_flatten,List.map_ofFn,List.sum_flatten,List.sum_ofFn,
    qEdgeVertexCoefficient,Fintype.sum_prod_type,qEdgeCornerLocation,qEdgeCornerCoefficient,qTermValue,
    Function.comp_apply]

def qFastEdgesMatchCheck {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) : Bool :=
  decide (qNormalizeTerms (qRectangleTerms R w) = qNormalizeTerms (qHorizontalEdgeTerms E))

theorem qFastEdgesMatchCheck_sound {n m : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (E : Fin m → QEdge) (h : qFastEdgesMatchCheck R w E = true) :
    qEdgesMatchCheck R w E = true := by
  have he : qNormalizeTerms (qRectangleTerms R w) =
      qNormalizeTerms (qHorizontalEdgeTerms E) := by
    simpa only [qFastEdgesMatchCheck,decide_eq_true_eq] using h
  have hall (p : ℚ × ℚ) : qVertexCoefficient R w p = qEdgeVertexCoefficient E p := by
    rw [← qRectangleTerms_value,← qHorizontalEdgeTerms_value,
      ← qNormalizeTerms_value p (qRectangleTerms R w),
      ← qNormalizeTerms_value p (qHorizontalEdgeTerms E),he]
  unfold qEdgesMatchCheck
  apply decide_eq_true_eq.mpr
  exact ⟨fun z => hall _,fun z => hall _⟩

end NoThreeLine

#print axioms NoThreeLine.qNormalizeTerms_value
#print axioms NoThreeLine.qFastEdgesMatchCheck_sound
