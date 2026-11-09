import NoThreeLine.IntegerHingeScan

/-! Exact rational binding of integer knots/coefficients to real rectangle
corner data. The binding is executable and proves equality with qChordValue;
the integer scan is therefore an optimization of the same geometric test. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine

def qVertexSign (k : Fin 4) : ℚ := ![-1,1,1,-1] k

def integerCornerList {N : ℕ} (t : Fin N→Fin 4→IntegerHinge) : List IntegerHinge :=
  (List.ofFn fun i=>List.ofFn (t i)).flatten

def integerCornerBindingCheck {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ)
    (u grid den : ℚ) (t : Fin N→Fin 4→IntegerHinge) : Bool :=
  decide (0<u ∧ 0<grid ∧ 0<den ∧ ∀i,(R i).x0≤(R i).x1 ∧ (R i).y0≤(R i).y1 ∧
    ∀k,((t i k).1:ℚ)=(R i).qIntercept u k*grid ∧
      ((t i k).2:ℚ)=((w i/u)*qVertexSign k/grid)*den)

theorem qVertexSign_cast (k : Fin 4) : (qVertexSign k:ℝ)=Rect.vertexSign k := by
  fin_cases k <;> simp [qVertexSign,Rect.vertexSign]

theorem integerCornerList_value {N : ℕ} (t : Fin N→Fin 4→IntegerHinge) (z : ℤ) :
    integerHingeValue (integerCornerList t) z=∑i,∑k,(t i k).2*max 0 (z-(t i k).1) := by
  simp [integerHingeValue,integerCornerList,List.map_flatten,List.sum_flatten,
    List.map_ofFn,List.sum_ofFn,Function.comp_def,Fin.sum_univ_succ]

theorem real_hinge_integer_rescale (z knot coeff : ℤ) (v a grid den : ℝ)
    (hg : 0<grid) (hd : 0<den) (hk : (knot:ℝ)=v*grid) (hc : (coeff:ℝ)=a/grid*den) :
    a*max 0 ((z:ℝ)/grid-v)=((coeff:ℝ)*max 0 ((z:ℝ)-(knot:ℝ)))/den := by
  have he : (z:ℝ)/grid-v=((z:ℝ)-(knot:ℝ))/grid := by rw [hk]; field_simp <;> ring
  rw [he]
  by_cases hz : 0≤(z:ℝ)-(knot:ℝ)
  · rw [max_eq_right hz,max_eq_right (div_nonneg hz hg.le),hc]
    field_simp
  · have hzn : (z:ℝ)-(knot:ℝ)≤0 := (not_le.mp hz).le
    rw [max_eq_left hzn,max_eq_left (div_nonpos_of_nonpos_of_nonneg hzn hg.le)]
    simp

theorem integerCornerBinding_integral {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ)
    (u grid den : ℚ) (t : Fin N→Fin 4→IntegerHinge)
    (hcheck : integerCornerBindingCheck R w u grid den t=true) (z : ℤ) :
    (∫x:ℝ,rectangleField Finset.univ (fun i=>(R i).real) (fun i=>(w i:ℝ)) x
      ((z:ℝ)/(grid:ℝ)+(u:ℝ)*x))=(integerHingeValue (integerCornerList t) z:ℝ)/(den:ℝ) := by
  have hc : 0<u ∧ 0<grid ∧ 0<den ∧ ∀i,(R i).x0≤(R i).x1 ∧ (R i).y0≤(R i).y1 ∧
      ∀k,((t i k).1:ℚ)=(R i).qIntercept u k*grid ∧
        ((t i k).2:ℚ)=((w i/u)*qVertexSign k/grid)*den := by
    simpa only [integerCornerBindingCheck,decide_eq_true_eq] using hcheck
  rw [rectangleField_chord_eq_vertexSum _ _ _ _ _
    (fun i _=>⟨by change ((R i).x0:ℝ)≤((R i).x1:ℝ); exact_mod_cast (hc.2.2.2 i).1,
      by change ((R i).y0:ℝ)≤((R i).y1:ℝ); exact_mod_cast (hc.2.2.2 i).2.1⟩)
    (by exact_mod_cast hc.1)]
  rw [integerCornerList_value]
  push_cast
  rw [Finset.mul_sum,Finset.sum_div]
  apply Finset.sum_congr rfl
  intro i _
  unfold Rect.vertexSum
  rw [Finset.mul_sum,Finset.mul_sum,Finset.sum_div]
  apply Finset.sum_congr rfl
  intro k _
  have hk : ((t i k).1:ℝ)=((R i).qIntercept u k:ℝ)*(grid:ℝ) := by
    exact_mod_cast (hc.2.2.2 i).2.2 k |>.1
  have hcoef : ((t i k).2:ℝ)=((w i:ℝ)/(u:ℝ)*Rect.vertexSign k/(grid:ℝ))*(den:ℝ) := by
    have h := congrArg (fun q:ℚ=>(q:ℝ)) ((hc.2.2.2 i).2.2 k).2
    simpa only [Rat.cast_intCast,Rat.cast_mul,Rat.cast_div,qVertexSign_cast] using h
  have h := real_hinge_integer_rescale z (t i k).1 (t i k).2 ((R i).qIntercept u k:ℝ)
    ((w i:ℝ)/(u:ℝ)*Rect.vertexSign k) (grid:ℝ) (den:ℝ)
    (by exact_mod_cast hc.2.1) (by exact_mod_cast hc.2.2.1) hk hcoef
  have he : (z:ℝ)/(grid:ℝ)-((R i).qIntercept u k:ℝ)=
      (z:ℝ)/(grid:ℝ)-((R i).real.vertex k).2+(u:ℝ)*((R i).real.vertex k).1 := by
    rw [QRect.qIntercept_cast]
    ring
  rw [he] at h
  convert h using 1 <;> ring

theorem integerCornerBinding_qChordValue {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ)
    (u grid den : ℚ) (t : Fin N→Fin 4→IntegerHinge)
    (hcheck : integerCornerBindingCheck R w u grid den t=true) (z : ℤ) :
    qChordValue R w ((z:ℚ)/grid) u=(integerHingeValue (integerCornerList t) z:ℚ)/den := by
  have hu : 0<u := by
    have h := hcheck
    simp only [integerCornerBindingCheck,decide_eq_true_eq] at h
    exact h.1
  have h := integerCornerBinding_integral R w u grid den t hcheck z
  have he := qChordValue_cast R w ((z:ℚ)/grid) u hu
  push_cast at he
  have hr := he.trans h
  exact_mod_cast hr

end NoThreeLine
#print axioms NoThreeLine.integerCornerList_value
#print axioms NoThreeLine.integerCornerBinding_integral
#print axioms NoThreeLine.integerCornerBinding_qChordValue
