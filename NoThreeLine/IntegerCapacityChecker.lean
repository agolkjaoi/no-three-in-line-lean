import NoThreeLine.IntegerCornerBinding

/-! The integer prefix scan accepts only after exact corner binding, range
coverage and rational cap normalization are checked. Its success implies
the previously proved rational corner checker and the same real integral. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
open MeasureTheory
namespace NoThreeLine

def integerCapacityCheck {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ)
    (u grid den U : ℚ) (t : Fin N→Fin 4→IntegerHinge)
    (lo : ℤ) (steps : ℕ) (cap : ℤ) : Bool :=
  integerCornerBindingCheck R w u grid den t &&
    (decide (0≤U ∧ (∀i k,lo≤(t i k).1 ∧ (t i k).1≤lo+steps) ∧ (cap:ℚ)/den≤U) &&
      integerHingeRangeCheck (integerCornerList t) lo steps cap)

theorem integerCapacityCheck_corner {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ)
    (u grid den U : ℚ) (t : Fin N→Fin 4→IntegerHinge)
    (lo : ℤ) (steps : ℕ) (cap : ℤ)
    (hc : integerCapacityCheck R w u grid den U t lo steps cap=true) :
    capacityCornerCheck R w u U=true := by
  have hh : integerCornerBindingCheck R w u grid den t=true ∧
      (0≤U ∧ (∀i k,lo≤(t i k).1 ∧ (t i k).1≤lo+steps) ∧ (cap:ℚ)/den≤U) ∧
      integerHingeRangeCheck (integerCornerList t) lo steps cap=true := by
    simpa only [integerCapacityCheck,Bool.and_eq_true,decide_eq_true_eq] using hc
  have hb : 0<u ∧ 0<grid ∧ 0<den ∧ ∀i,(R i).x0≤(R i).x1 ∧ (R i).y0≤(R i).y1 ∧
      ∀k,((t i k).1:ℚ)=(R i).qIntercept u k*grid ∧
        ((t i k).2:ℚ)=((w i/u)*qVertexSign k/grid)*den := by
    simpa only [integerCornerBindingCheck,decide_eq_true_eq] using hh.1
  simp only [capacityCornerCheck,decide_eq_true_eq]
  refine ⟨hb.1,hh.2.1.1,fun i=>⟨(hb.2.2.2 i).1,(hb.2.2.2 i).2.1,fun k=>?_⟩⟩
  have hi : (R i).qIntercept u k=((t i k).1:ℚ)/grid :=
    (eq_div_iff hb.2.1.ne').mpr (((hb.2.2.2 i).2.2 k).1.symm)
  rw [hi,integerCornerBinding_qChordValue R w u grid den t hh.1]
  have hv := integerHingeRangeCheck_sound (integerCornerList t) lo steps cap hh.2.2 (t i k).1
    (hh.2.1.2.1 i k).1 (hh.2.1.2.1 i k).2
  exact (div_le_div_of_nonneg_right (by exact_mod_cast hv) hb.2.2.1.le).trans hh.2.1.2.2

theorem integerCapacityCheck_sound {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ)
    (u grid den U : ℚ) (t : Fin N→Fin 4→IntegerHinge)
    (lo : ℤ) (steps : ℕ) (cap : ℤ)
    (hc : integerCapacityCheck R w u grid den U t lo steps cap=true) (v : ℝ) :
    (∫x:ℝ,rectangleField Finset.univ (fun i=>(R i).real) (fun i=>(w i:ℝ)) x (v+(u:ℝ)*x))≤(U:ℝ) :=
  capacityCornerCheck_sound R w u U (integerCapacityCheck_corner R w u grid den U t lo steps cap hc) v

theorem integerCapacityCheck_chart_sound {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ)
    (f : Fin 4) (u grid den U : ℚ) (t : Fin N→Fin 4→IntegerHinge)
    (lo : ℤ) (steps : ℕ) (cap : ℤ)
    (hc : integerCapacityCheck (fun i=>(R i).qChart f) w u grid den U t lo steps cap=true)
    (x y : ℝ) :
    directionalChord f (rectangleField Finset.univ (fun i=>(R i).real) (fun i=>(w i:ℝ))) x y u≤(U:ℝ) :=
  capacityCornerCheck_chart_sound R w f u U
    (integerCapacityCheck_corner _ w u grid den U t lo steps cap hc) x y

end NoThreeLine
#print axioms NoThreeLine.integerCapacityCheck_corner
#print axioms NoThreeLine.integerCapacityCheck_sound
#print axioms NoThreeLine.integerCapacityCheck_chart_sound
