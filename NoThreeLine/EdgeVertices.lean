import NoThreeLine.JumpEnvelope
import NoThreeLine.VertexChord

set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section

namespace NoThreeLine

theorem step_length_positivePart (a b c : ℝ) (hab : a ≤ b) :
    max 0 (b-max a c) = max 0 (b-c) - max 0 (a-c) := by
  simp only [max_def]
  split_ifs <;> linarith

namespace HEdge

/-- Exact two-vertex formula for a horizontal step, including its sign. -/
theorem chord_eq_two_vertices (e : HEdge) (v u : ℝ)
    (he : e.left ≤ e.right) (hu : 0 < u) :
    e.chord v u = (e.jump/u) *
      (max 0 (v-e.height+u*e.right) - max 0 (v-e.height+u*e.left)) := by
  unfold chord
  rw [e.on_line v u hu, integral_indicator_const _ measurableSet_Ioo,
    Real.volume_real_Ioo, smul_eq_mul]
  rw [max_comm (e.right - max e.left ((e.height-v)/u)) 0,
    step_length_positivePart e.left e.right ((e.height-v)/u) he]
  simp_rw [positivePart_affine _ _ v u hu]
  field_simp

def vertex (e : HEdge) (k : Fin 2) : ℝ × ℝ := ![(e.left,e.height),(e.right,e.height)] k
def vertexSign (k : Fin 2) : ℝ := ![-1,1] k

def vertexSum (e : HEdge) (v u : ℝ) : ℝ :=
  ∑ k : Fin 2, vertexSign k * max 0 (v-(e.vertex k).2+u*(e.vertex k).1)

theorem chord_eq_vertexSum (e : HEdge) (v u : ℝ)
    (he : e.left ≤ e.right) (hu : 0 < u) :
    e.chord v u = (e.jump/u)*e.vertexSum v u := by
  rw [chord_eq_two_vertices e v u he hu]
  have hv : e.vertexSum v u =
      max 0 (v-e.height+u*e.right) - max 0 (v-e.height+u*e.left) := by
    simp [vertexSum,vertex,vertexSign,Fin.sum_univ_succ,sub_eq_add_neg,add_comm]
  rw [hv]

end HEdge

theorem jumpField_chord_eq_vertexSum {ι : Type*} (S : Finset ι) (E : ι → HEdge)
    (v u : ℝ) (he : ∀ i ∈ S, (E i).left ≤ (E i).right) (hu : 0 < u) :
    (∫ t : ℝ, jumpField S E t (v+u*t)) =
      (1/u) * ∑ i ∈ S, (E i).jump * (E i).vertexSum v u := by
  rw [jumpField_chord S E v u hu, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hi
  rw [(E i).chord_eq_vertexSum v u (he i hi) hu]
  ring

end NoThreeLine

#print axioms NoThreeLine.HEdge.chord_eq_two_vertices
#print axioms NoThreeLine.jumpField_chord_eq_vertexSum
