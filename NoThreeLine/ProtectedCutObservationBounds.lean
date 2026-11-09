import NoThreeLine.ProtectedCutObservation

/-! Uniform finite caps for the original and inserted-cut compensated
observations. These caps ensure integrability and are not tail estimates. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedCutObservation_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ D C W : ℝ) (hC : 0≤C) (hW : 0≤W)
    (hG : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖G (e,saved)‖≤D)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hV : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖V (e,saved)‖≤W)
    (cut : ProtectedTimedState cfg×ℝ→ℝ)
    (hu : ∀v a,0≤cut (v,a))
    (hug : ∀v a,cut (v,a)≤augGuardTime cfg ε M (augTimedInput cfg v.1))
    (hn : 0<n) (s : ProtectedTimedState cfg)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (param : ℕ→BoardClockPath n→ℝ) :
    ∃B : ℝ,∀k ω,
      (0≤protectedStateExponential cfg ε M L (fun v=>G (v.1.val.1.physical,v.2)) F V θ hn s k ω ∧
      protectedStateExponential cfg ε M L (fun v=>G (v.1.val.1.physical,v.2)) F V θ hn s k ω≤B) ∧
      (0≤protectedCutObservation cfg ε M L G F V θ cut hn s param k ω ∧
      protectedCutObservation cfg ε M L G F V θ cut hn s param k ω≤B) := by
  let P := Real.exp (|θ| *((cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W))
  let R := Real.exp (|θ| *D)
  let T := Real.exp (|θ| *(D+(cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W))
  refine ⟨max (P*R) (P*T),?_⟩
  intro k ω
  have hv (p) (hp : p∈E) :=
    protectedRecycledPair_saved_bounds_all cfg ε M L hsp p (hE hp) hn s (hsv p hp) k ω
  have hp := protectedPastExponential_bound cfg ε M L hsp E hE F V θ C W hC hW hF hV hn s hsv k ω
  have hp0 : 0≤protectedPastExponential cfg ε M L F V θ hn s k ω := Real.exp_nonneg _
  have hp' : protectedPastExponential cfg ε M L F V θ hn s k ω≤P := by
    simpa only [Real.norm_eq_abs,abs_of_nonneg hp0] using hp
  have hx : Real.exp (θ*G ((protectedRecycledPair cfg ε M L hn s k ω).1.1.val.1.physical,
      (protectedRecycledPair cfg ε M L hn s k ω).1.2))≤R := by
    apply Real.exp_le_exp.mpr
    apply (le_abs_self _).trans
    rw [abs_mul]
    exact mul_le_mul_of_nonneg_left (hG _ _ (protectedRecycledPair cfg ε M L hn s k ω).1.1.property.1.1 hv) (abs_nonneg θ)
  constructor
  · refine ⟨Real.exp_nonneg _,?_⟩
    rw [protectedStateExponential_factor]
    exact (mul_le_mul hp' hx (Real.exp_nonneg _) (Real.exp_nonneg _)).trans (le_max_left _ _)
  · refine ⟨protectedCutObservation_nonneg cfg ε M L G F V θ cut hn s param k ω,?_⟩
    have hz := protectedCutPairExponential_actual_bound cfg ε M L hsp E hE G F V θ D C W hC hW
      hG hF hV (fun v=>cut (v,param k ω)) hn
      (protectedRecycledPair cfg ε M L hn s k ω).1 hv (hu _ _) (hug _ _)
      (protectedRecycledPair cfg ε M L hn s k ω).2
    exact (mul_le_mul hp' hz.2 hz.1 (Real.exp_nonneg _)).trans (le_max_right _ _)

end NoThreeLine
#print axioms NoThreeLine.protectedCutObservation_bounds
