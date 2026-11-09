import NoThreeLine.ProtectedCutPairExponential
import NoThreeLine.ProtectedLocalCutBounds

/-! A uniform finite cap for a reconstructed local-cut observation,
using the actual transition in one branch and the actual flow in the other. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedCutPairExponential_nonneg {n : ℕ} (cfg : FlowConfig n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ) (cut : ProtectedTimedState cfg→ℝ)
    (x : ProtectedTimedState cfg×ProtectedTimedState cfg) :
    0≤protectedCutPairExponential cfg G F V θ cut x := by
  unfold protectedCutPairExponential
  split_ifs <;> exact Real.exp_nonneg _

theorem protectedCutPairExponential_actual_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ D C W : ℝ) (hC : 0≤C) (hW : 0≤W)
    (hG : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖G (e,saved)‖≤D)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hV : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖V (e,saved)‖≤W)
    (cut : ProtectedTimedState cfg→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (hu : 0≤cut s) (hug : cut s≤augGuardTime cfg ε M (augTimedInput cfg s.1))
    (ω : BoardClockPath n) :
    0≤protectedCutPairExponential cfg G F V θ cut (s,(protectedRestartStep cfg ε M L hn (s,ω)).1) ∧
    protectedCutPairExponential cfg G F V θ cut (s,(protectedRestartStep cfg ε M L hn (s,ω)).1)≤
      Real.exp (|θ| *(D+(cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W)) := by
  refine ⟨protectedCutPairExponential_nonneg cfg G F V θ cut _,?_⟩
  unfold protectedCutPairExponential
  split_ifs
  · exact (protectedPairExponential_actual_bound cfg ε M L hsp E hE _ F V θ D C W hC hW
      (fun v hv=>hG _ _ v.1.property.1.1 hv) hF hV hn s hsv ω).2
  · have hb := protectedLocalStateExponential_bound cfg ε M E G F V θ D C W hC hW hG hF hV s hsv (cut s) hu hug
    simpa only [protectedLocalStateExponential,Real.norm_eq_abs,abs_of_pos (Real.exp_pos _)] using hb

end NoThreeLine
#print axioms NoThreeLine.protectedCutPairExponential_actual_bound
