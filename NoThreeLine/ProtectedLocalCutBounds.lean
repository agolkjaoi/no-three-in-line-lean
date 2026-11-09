import NoThreeLine.ProtectedIncomingCutExponential

/-! Finite uniform caps for actual local-flow sources and exponentials.
The incoming saved credits are unchanged along the selected flow. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedLocalStateSource_elapsed_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (E : Finset (Grid n)) (F : ExtendedState n×(Grid n→ℝ)→ℝ) (C : ℝ)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (u : ℝ) (hu : 0≤u) (hug : u≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    ‖protectedLocalStateSource cfg F (s,u)‖≤u*C := by
  unfold protectedLocalStateSource
  rw [max_eq_right hu]
  have hg := augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1
  have hb := intervalIntegral.norm_integral_le_of_norm_le_const
    (f:=fun t=>F (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t),s.2))
    (a:=0) (b:=u) (fun t ht=>by
      rw [uIoc_of_le hu] at ht
      exact hF _ s.2 (selectedTrajectory_valid cfg (augTimedInput cfg s.1).1.1
        s.1.property.1.1 t ⟨ht.1.le,ht.2.trans (hug.trans hg.2)⟩) hsv)
  simpa only [sub_zero,abs_of_nonneg hu,mul_comm] using hb

theorem protectedLocalStateSource_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (E : Finset (Grid n)) (F : ExtendedState n×(Grid n→ℝ)→ℝ) (C : ℝ) (hC : 0≤C)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (u : ℝ) (hu : 0≤u) (hug : u≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    ‖protectedLocalStateSource cfg F (s,u)‖≤(cfg.horizon:ℝ)*C := by
  have ht := hug.trans ((augGuardTime_le_remaining cfg ε M
    (augTimedInput cfg s.1) s.1.property.2.1).trans s.1.property.2.2)
  exact (protectedLocalStateSource_elapsed_bound cfg ε M E F C hF s hsv u hu hug).trans
    (mul_le_mul_of_nonneg_right ht hC)

theorem protectedLocalStateExponential_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (E : Finset (Grid n)) (G F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (θ D C W : ℝ) (hC : 0≤C) (hW : 0≤W)
    (hG : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖G (e,saved)‖≤D)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hV : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖V (e,saved)‖≤W)
    (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (u : ℝ) (hu : 0≤u) (hug : u≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    ‖protectedLocalStateExponential cfg G F V θ (s,u)‖≤
      Real.exp (|θ| *(D+(cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W)) := by
  have hg := augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1
  have hvalid := selectedTrajectory_valid cfg (augTimedInput cfg s.1).1.1
    s.1.property.1.1 u ⟨hu,hug.trans hg.2⟩
  have hnxt := hG _ s.2 hvalid hsv
  have hr := protectedLocalStateSource_bound cfg ε M E F C hC hF s hsv u hu hug
  have hv := protectedLocalStateSource_bound cfg ε M E V W hW hV s hsv u hu hug
  have hnrm := (norm_sub_le (G (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u),s.2))
    (protectedLocalStateSource cfg F (s,u))).trans (add_le_add hnxt hr)
  have hθ : θ*(G (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u),s.2)-
      protectedLocalStateSource cfg F (s,u))≤|θ| *(D+(cfg.horizon:ℝ)*C) := by
    apply (le_abs_self _).trans
    rw [abs_mul]
    exact mul_le_mul_of_nonneg_left (by simpa only [Real.norm_eq_abs] using hnrm) (abs_nonneg θ)
  have hc : 0≤θ^2/2 := by positivity
  have hv' : -((θ^2/2)*protectedLocalStateSource cfg V (s,u))≤
      (θ^2/2)*((cfg.horizon:ℝ)*W) := by
    apply (neg_le_abs _).trans
    rw [abs_mul,abs_of_nonneg hc]
    exact mul_le_mul_of_nonneg_left (by simpa only [Real.norm_eq_abs] using hv) hc
  unfold protectedLocalStateExponential
  rw [Real.norm_eq_abs,abs_of_nonneg (Real.exp_nonneg _)]
  exact Real.exp_le_exp.mpr (by linarith only [hθ,hv'])

end NoThreeLine
#print axioms NoThreeLine.protectedLocalStateSource_elapsed_bound
#print axioms NoThreeLine.protectedLocalStateSource_bound
#print axioms NoThreeLine.protectedLocalStateExponential_bound
