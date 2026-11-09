import NoThreeLine.ProtectedParameterForbiddenLE
import NoThreeLine.ProtectedParameterCutExponential
import NoThreeLine.ProtectedCutPairMean

/-! Insert a jointly measurable incoming cut with a real, past-measurable
parameter into the actual whole-phase forbidden-history law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedParameterCutKernel_history_integral_le {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (hG : Measurable G) (hF : Measurable F) (hV : Measurable V)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hcut : Measurable cut)
    (hu : ∀v a,0≤cut (v,a))
    (hug : ∀v a,cut (v,a)≤augGuardTime cfg ε M (augTimedInput cfg v.1))
    (θ D C W : ℝ) (hC : 0≤C) (hW : 0≤W)
    (hGD : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖G (e,saved)‖≤D)
    (hFC : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hVW : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖V (e,saved)‖≤W)
    (hfirst : ∀v : ProtectedTimedState cfg,occupancy v.1.val.1.physical.process L≤1→
      v.1.val.1.physical.clocks L≤K→(∀p∈E,0≤v.2 p ∧ v.2 p≤2*cfg.B)→∀a : ℝ,
      (∫ω,protectedParameterCutExponential cfg G F V θ cut
        ((v,(protectedRestartStep cfg ε M L hn (v,ω)).1),a)
        ∂firstLineForbiddenLaw cfg ε M L hn v.1)≤Real.exp (θ*G (v.1.val.1.physical,v.2)))
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (param : BoardClockPath n→ℝ)
    (hp : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance param)
    (A : Set (BoardClockPath n)) (hA : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] A) :
    (∫ω in A,protectedParameterCutExponential cfg G F V θ cut
      (((protectedRecycledPair cfg ε M L hn s k ω).1,
        (protectedRecycledPair cfg ε M L hn s (k+1) ω).1),param ω)
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)≤
    ∫ω in A,Real.exp (θ*G ((protectedRecycledPair cfg ε M L hn s k ω).1.1.val.1.physical,
      (protectedRecycledPair cfg ε M L hn s k ω).1.2))
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  have hstate : Measurable (fun v : ProtectedTimedState cfg=>G (v.1.val.1.physical,v.2)) :=
    hG.comp (((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)).prodMk measurable_snd)
  apply protectedParameterForbidden_history_integral_le cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (protectedParameterCutExponential cfg G F V θ cut)
    (fun x=>Real.exp (θ*G (x.1.1.1.val.1.physical,x.1.1.2)))
    (protectedParameterCutExponential_measurable cfg G F V θ cut hG hF hV hcut)
    (Real.measurable_exp.comp ((hstate.comp measurable_fst.fst).const_mul θ))
    (Real.exp (|θ| *(D+(cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W)))
    (Real.exp (|θ| *D)) _ _ _ hm s ho hk hsv k param hp A hA
  · intro v _ hv a ω
    exact protectedCutPairExponential_actual_bound cfg ε M L hsp E hE G F V θ D C W hC hW
      hGD hFC hVW (fun v=>cut (v,a)) hn v hv (hu v a) (hug v a) ω
  · intro v _ hv a ω
    refine ⟨Real.exp_nonneg _,Real.exp_le_exp.mpr ?_⟩
    apply (le_abs_self _).trans
    rw [abs_mul]
    exact mul_le_mul_of_nonneg_left (by simpa only [Real.norm_eq_abs] using hGD _ _ v.1.property.1.1 hv) (abs_nonneg θ)
  · intro v hv hkv hvs a
    letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm v.1 hv hkv
    simpa using hfirst v hv hkv hvs a

end NoThreeLine
#print axioms NoThreeLine.protectedParameterCutKernel_history_integral_le
