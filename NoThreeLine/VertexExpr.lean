import NoThreeLine.VertexEnvelope
import NoThreeLine.RectangleExpr

/-! Executable rational shared-vertex aggregation and the U1 expression
compiler. Lists are enumerated directly; no Finset.toList or real equality
oracle occurs in the executable definitions. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators

namespace NoThreeLine

def qVertexPoint (R : QRect) (k : Fin 4) : ℚ × ℚ :=
  ![(R.x0,R.y0),(R.x1,R.y0),(R.x0,R.y1),(R.x1,R.y1)] k

def qVertexSign (k : Fin 4) : ℚ := ![-1,1,1,-1] k

def qCornerLocation {n : ℕ} (R : Fin n → QRect) (z : Fin n × Fin 4) : ℚ × ℚ :=
  qVertexPoint (R z.1) z.2

def qCornerCoefficient {n : ℕ} (w : Fin n → ℚ) (z : Fin n × Fin 4) : ℚ :=
  w z.1 * qVertexSign z.2

def qVertexKeys {n : ℕ} (R : Fin n → QRect) : List (ℚ × ℚ) :=
  ((List.ofFn fun i : Fin n => List.ofFn fun k : Fin 4 => qVertexPoint (R i) k).flatten).dedup

def qVertexCoefficient {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) (p : ℚ × ℚ) : ℚ :=
  ∑ z : Fin n × Fin 4, if qCornerLocation R z = p then qCornerCoefficient w z else 0

def qVertexEndpointExpr {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) (a b : ℚ) : Expr :=
  Expr.sum ((qVertexKeys R).map fun p => .scale (qVertexCoefficient R w p)
    (.max (.atom ⟨0,0⟩) (.atom ⟨p.1-a,b-p.2⟩)))

def qVertexTentExpr (Q : QRect) (p : ℚ × ℚ) : Expr :=
  .max (.atom ⟨0,0⟩)
    (.min (.atom ⟨Q.x1-p.1,p.2-Q.y0⟩)
      (.min (.atom ⟨p.1-Q.x0,Q.y1-p.2⟩)
        (.atom ⟨(Q.x1-Q.x0)/4,(Q.y1-Q.y0)/4⟩)))

def qVertexEnvelopeExpr {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) (Q : QRect) : Expr :=
  .add (.max (qVertexEndpointExpr R w Q.x1 Q.y0) (qVertexEndpointExpr R w Q.x0 Q.y1))
    (Expr.sum ((qVertexKeys R).map fun p =>
      .scale (max 0 (-qVertexCoefficient R w p)) (qVertexTentExpr Q p)))

noncomputable section

def qPointReal (p : ℚ × ℚ) : ℝ × ℝ := (p.1,p.2)

theorem qPointReal_injective : Function.Injective qPointReal := by
  intro p q h
  apply Prod.ext
  · have h1 : (p.1 : ℝ) = (q.1 : ℝ) := congrArg Prod.fst h
    exact_mod_cast h1
  · have h2 : (p.2 : ℝ) = (q.2 : ℝ) := congrArg Prod.snd h
    exact_mod_cast h2

theorem qVertexKeys_nodup {n : ℕ} (R : Fin n → QRect) : (qVertexKeys R).Nodup := by
  exact List.nodup_dedup _

theorem mem_qVertexKeys {n : ℕ} (R : Fin n → QRect) (p : ℚ × ℚ) :
    p ∈ qVertexKeys R ↔ ∃ i : Fin n, ∃ k : Fin 4, qVertexPoint (R i) k = p := by
  rw [qVertexKeys,List.mem_dedup,List.mem_flatten]
  constructor
  · rintro ⟨xs,hxs,hp⟩
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp hxs
    obtain ⟨k,hk⟩ := List.mem_ofFn.mp hp
    exact ⟨i,k,hk⟩
  · rintro ⟨i,k,hk⟩
    exact ⟨List.ofFn (fun k => qVertexPoint (R i) k),
      List.mem_ofFn.mpr ⟨i,rfl⟩,List.mem_ofFn.mpr ⟨k,hk⟩⟩

theorem qVertexKeys_toFinset {n : ℕ} (R : Fin n → QRect) :
    (qVertexKeys R).toFinset = (Finset.univ : Finset (Fin n × Fin 4)).image (qCornerLocation R) := by
  ext p
  simp only [List.mem_toFinset,mem_qVertexKeys,Finset.mem_image,Finset.mem_univ,true_and]
  constructor
  · rintro ⟨i,k,h⟩
    exact ⟨(i,k),h⟩
  · rintro ⟨⟨i,k⟩,h⟩
    exact ⟨i,k,h⟩

theorem qCornerLocation_real {n : ℕ} (R : Fin n → QRect) (z : Fin n × Fin 4) :
    qPointReal (qCornerLocation R z) = cornerLocation (fun i => (R i).real) z := by
  rcases z with ⟨i,k⟩
  fin_cases k <;> rfl

theorem qVertexSign_cast (k : Fin 4) : (qVertexSign k : ℝ) = Rect.vertexSign k := by
  fin_cases k <;> norm_num [qVertexSign,Rect.vertexSign]

theorem qCornerCoefficient_cast {n : ℕ} (w : Fin n → ℚ) (z : Fin n × Fin 4) :
    (qCornerCoefficient w z : ℝ) = cornerCoefficient (fun i => (w i : ℝ)) z := by
  simp only [qCornerCoefficient,cornerCoefficient,Rat.cast_mul,qVertexSign_cast]

theorem qVertexCoefficient_cast {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) (p : ℚ × ℚ) :
    (qVertexCoefficient R w p : ℝ) =
      ∑ z ∈ (Finset.univ : Finset (Fin n × Fin 4)).filter (fun z => qCornerLocation R z = p),
        (qCornerCoefficient w z : ℝ) := by
  unfold qVertexCoefficient
  push_cast
  rw [Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro z _
  split_ifs <;> simp only [Rat.cast_zero]

theorem qVertexKeys_real {n : ℕ} (R : Fin n → QRect) :
    (qVertexKeys R).toFinset.image qPointReal = vertexSet Finset.univ (fun i => (R i).real) := by
  classical
  rw [qVertexKeys_toFinset,Finset.image_image]
  unfold vertexSet cornerIndex
  have hprod : (Finset.univ : Finset (Fin n)).product (Finset.univ : Finset (Fin 4)) =
      (Finset.univ : Finset (Fin n × Fin 4)) := by
    ext z
    simp [Finset.product_eq_sprod]
  rw [hprod]
  apply Finset.image_congr
  intro z _
  exact qCornerLocation_real R z

theorem qVertexCoefficient_real {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ) (p : ℚ × ℚ) :
    (qVertexCoefficient R w p : ℝ) =
      vertexCoefficient Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ)) (qPointReal p) := by
  classical
  rw [qVertexCoefficient_cast]
  unfold vertexCoefficient cornerIndex
  have hprod : (Finset.univ : Finset (Fin n)).product (Finset.univ : Finset (Fin 4)) =
      (Finset.univ : Finset (Fin n × Fin 4)) := by
    ext z
    simp [Finset.product_eq_sprod]
  rw [hprod]
  apply Finset.sum_congr
  · ext z
    simp only [Finset.mem_filter,Finset.mem_univ,true_and]
    rw [← qCornerLocation_real]
    exact qPointReal_injective.eq_iff.symm
  · intro z _
    exact qCornerCoefficient_cast w z

theorem sum_qVertexKeys_real {n : ℕ} (R : Fin n → QRect) (f : ℝ × ℝ → ℝ) :
    (∑ p ∈ (qVertexKeys R).toFinset, f (qPointReal p)) =
      ∑ p ∈ vertexSet Finset.univ (fun i => (R i).real), f p := by
  classical
  rw [← qVertexKeys_real,Finset.sum_image]
  intro p _ q _ h
  exact qPointReal_injective h

theorem Expr.eval_sum_map_nodup {α : Type*} [DecidableEq α] (xs : List α)
    (h : xs.Nodup) (e : α → Expr) (u : ℝ) :
    (Expr.sum (xs.map e)).eval u = ∑ p ∈ xs.toFinset, (e p).eval u := by
  rw [Expr.eval_sum,List.map_map]
  exact (List.sum_toFinset (fun p => (e p).eval u) h).symm

theorem qVertexEndpointExpr_eval {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (a b : ℚ) (u : ℝ) :
    (qVertexEndpointExpr R w a b).eval u =
      vertexEndpointValue Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ)) a b u := by
  rw [qVertexEndpointExpr,Expr.eval_sum_map_nodup _ (qVertexKeys_nodup R)]
  calc
    _ = ∑ p ∈ (qVertexKeys R).toFinset,
        vertexCoefficient Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ)) (qPointReal p) *
          max 0 ((qPointReal p).1-(a:ℝ)+((b:ℝ)-(qPointReal p).2)/u) := by
      apply Finset.sum_congr rfl
      intro p _
      simp [Expr.eval,Coeff.eval,qVertexCoefficient_real,qPointReal]
    _ = _ := sum_qVertexKeys_real R (fun p =>
      vertexCoefficient Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ)) p *
        max 0 (p.1-(a:ℝ)+((b:ℝ)-p.2)/u))

theorem qVertexTentExpr_eval (Q : QRect) (p : ℚ × ℚ) (u : ℝ) :
    (qVertexTentExpr Q p).eval u = rootVertexTent Q.real (qPointReal p) u := by
  simp [qVertexTentExpr,Expr.eval,Coeff.eval,rootVertexTent,QRect.real,qPointReal,
    div_mul_eq_div_div]

theorem qVertexEnvelopeExpr_eval {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (Q : QRect) (u : ℝ) :
    (qVertexEnvelopeExpr R w Q).eval u =
      algebraicVertexBoxEnvelope Finset.univ (fun i => (R i).real)
        (fun i => (w i : ℝ)) Q.real u := by
  change max ((qVertexEndpointExpr R w Q.x1 Q.y0).eval u)
      ((qVertexEndpointExpr R w Q.x0 Q.y1).eval u) +
      (Expr.sum ((qVertexKeys R).map fun p =>
        .scale (max 0 (-qVertexCoefficient R w p)) (qVertexTentExpr Q p))).eval u = _
  rw [qVertexEndpointExpr_eval,qVertexEndpointExpr_eval,
    Expr.eval_sum_map_nodup _ (qVertexKeys_nodup R)]
  unfold algebraicVertexBoxEnvelope
  congr 1
  calc
    _ = ∑ p ∈ (qVertexKeys R).toFinset,
        max 0 (-vertexCoefficient Finset.univ (fun i => (R i).real)
          (fun i => (w i : ℝ)) (qPointReal p)) * rootVertexTent Q.real (qPointReal p) u := by
      apply Finset.sum_congr rfl
      intro p _
      simp [Expr.eval,qVertexTentExpr_eval,qVertexCoefficient_real]
    _ = _ := sum_qVertexKeys_real R (fun p =>
      max 0 (-vertexCoefficient Finset.univ (fun i => (R i).real)
        (fun i => (w i : ℝ)) p) * rootVertexTent Q.real p u)

theorem QRect.real_ordered (R : QRect) (h : R.x0 ≤ R.x1 ∧ R.y0 ≤ R.y1) :
    R.real.x0 ≤ R.real.x1 ∧ R.real.y0 ≤ R.real.y1 := by
  change (R.x0 : ℝ) ≤ (R.x1 : ℝ) ∧ (R.y0 : ℝ) ≤ (R.y1 : ℝ)
  exact_mod_cast h

theorem qVertexEndpointExpr_eval_chord {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (a b : ℚ) (u : ℝ)
    (hR : ∀ i, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1) (hu : 0 < u) :
    (qVertexEndpointExpr R w a b).eval u = actualChord R w a b u := by
  rw [qVertexEndpointExpr_eval]
  exact (rectangleField_chord_at_root_eq_vertices Finset.univ (fun i => (R i).real)
    (fun i => (w i : ℝ)) a b u (fun i _ => (R i).real_ordered (hR i)) hu).symm

/-- Actual rectangular-field soundness for the executable rational U1 compiler.
No vertex-table soundness or geometric upper bound is supplied as an assumption. -/
theorem actualChord_le_qVertexEnvelopeExpr {n : ℕ} (R : Fin n → QRect) (w : Fin n → ℚ)
    (Q : QRect) (x y u : ℝ)
    (hR : ∀ i, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hx : x ∈ Icc (Q.x0 : ℝ) Q.x1) (hy : y ∈ Icc (Q.y0 : ℝ) Q.y1) (hu : 0 < u) :
    actualChord R w x y u ≤ (qVertexEnvelopeExpr R w Q).eval u := by
  rw [qVertexEnvelopeExpr_eval]
  exact rectangleField_chord_le_algebraicVertexBoxEnvelope Finset.univ
    (fun i => (R i).real) (fun i => (w i : ℝ)) Q.real x y u
    (fun i _ => (R i).real_ordered (hR i)) hx hy hu

end
end NoThreeLine

#print axioms NoThreeLine.qVertexKeys_real
#print axioms NoThreeLine.qVertexCoefficient_real
#print axioms NoThreeLine.qVertexEnvelopeExpr_eval
#print axioms NoThreeLine.actualChord_le_qVertexEnvelopeExpr
