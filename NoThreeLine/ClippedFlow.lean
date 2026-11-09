import NoThreeLine.ClippedVectorField

/-! Arbitrary finite-horizon, jointly continuous flow for the bounded
extension. On every portion of a path inside the coordinate box its
derivative is exactly the manuscript's extended weight/k/r vector field. -/
set_option autoImplicit false
noncomputable section
open Set Metric
open scoped NNReal

namespace NoThreeLine.AuxiliaryODE

theorem finite_horizon_clipped_flow {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (C : ℝ) (hC : 0 ≤ C)
    (r T : ℝ≥0) :
    ∃ φ : Coordinates n × ℝ → Coordinates n,
      (∀ z ∈ closedBall (0 : Coordinates n) r, φ (z,0) = z ∧
        ∀ t ∈ Icc (0 : ℝ) T, HasDerivWithinAt (fun t => φ (z,t))
          (clippedVectorField s Γ mask C (φ (z,t))) (Icc (0 : ℝ) T) t) ∧
      ContinuousOn φ (closedBall (0 : Coordinates n) r ×ˢ Icc (0 : ℝ) T) := by
  obtain ⟨L,K,hL,hK⟩ := clippedVectorField_bounded_lipschitz s Γ mask C hC
  have hp : IsPicardLindelof (fun _ => clippedVectorField s Γ mask C)
      (tmin := 0) (tmax := T) ⟨0,⟨le_rfl,T.coe_nonneg⟩⟩
      (0 : Coordinates n) (r+L*T) r L K := by
    apply IsPicardLindelof.of_time_independent (fun z _ => hL z) hK.lipschitzOnWith
    simp only [NNReal.coe_add,NNReal.coe_mul,sub_zero,sub_self,max_eq_left T.coe_nonneg]
    linarith
  exact hp.exists_forall_mem_closedBall_eq_hasDerivWithinAt_continuousOn

/-- The bounded extension supplies an arbitrarily long curve, with the
actual RHS at every point that lies inside the box. No assumption of ODE
existence or pre-guard boundedness is used to supply the curve. -/
theorem finite_horizon_flow_actual_inside_box {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (C : ℝ) (hC : 0 ≤ C)
    (r T : ℝ≥0) :
    ∃ φ : Coordinates n × ℝ → Coordinates n,
      (∀ z ∈ closedBall (0 : Coordinates n) r, φ (z,0) = z ∧
        ∀ t ∈ Icc (0 : ℝ) T, ‖φ (z,t)‖ ≤ C →
          HasDerivWithinAt (fun t => φ (z,t)) (vectorField s Γ mask (φ (z,t))) (Icc (0 : ℝ) T) t) ∧
      ContinuousOn φ (closedBall (0 : Coordinates n) r ×ˢ Icc (0 : ℝ) T) := by
  obtain ⟨φ,hφ,hcont⟩ := finite_horizon_clipped_flow s Γ mask C hC r T
  refine ⟨φ,?_,hcont⟩
  intro z hz
  refine ⟨(hφ z hz).1,?_⟩
  intro t ht hbox
  simpa only [clippedVectorField_eq s Γ mask C (φ (z,t)) hbox] using (hφ z hz).2 t ht

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.finite_horizon_clipped_flow
#print axioms NoThreeLine.AuxiliaryODE.finite_horizon_flow_actual_inside_box
