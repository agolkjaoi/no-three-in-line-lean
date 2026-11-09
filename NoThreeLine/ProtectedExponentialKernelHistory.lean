import NoThreeLine.ProtectedTwoStateForbiddenLE
import NoThreeLine.ProtectedPairExponential

/-! The actual two-state exponential kernel on every past history event
under the constructed whole-phase forbidden law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedExponentialKernel_history_integral_le {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (f : ProtectedTimedState cfg→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (hf : Measurable f) (hF : Measurable F) (hV : Measurable V)
    (θ D C W : ℝ) (hC : 0≤C) (hW : 0≤W)
    (hfD : ∀s : ProtectedTimedState cfg,(∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)→‖f s‖≤D)
    (hFC : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hVW : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖V (e,saved)‖≤W)
    (hfirst : ∀v : ProtectedTimedState cfg,occupancy v.1.val.1.physical.process L≤1→
      v.1.val.1.physical.clocks L≤K→(∀p∈E,0≤v.2 p ∧ v.2 p≤2*cfg.B)→
      (∫ω,protectedPairExponential cfg f F V θ (v,(protectedRestartStep cfg ε M L hn (v,ω)).1)
        ∂firstLineForbiddenLaw cfg ε M L hn v.1)≤Real.exp (θ*f v))
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (A : Set (BoardClockPath n))
    (hA : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] A) :
    (∫ω in A,protectedPairExponential cfg f F V θ
      ((protectedRecycledPair cfg ε M L hn s k ω).1,
        (protectedRecycledPair cfg ε M L hn s (k+1) ω).1)
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)≤
    ∫ω in A,Real.exp (θ*f (protectedRecycledPair cfg ε M L hn s k ω).1)
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  apply protectedTwoStateForbidden_history_integral_le cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (protectedPairExponential cfg f F V θ) (fun x=>Real.exp (θ*f x.1))
    (protectedPairExponential_measurable cfg f F V θ hf hF hV)
    (Real.measurable_exp.comp ((hf.comp measurable_fst).const_mul θ))
    (Real.exp (|θ| *(D+(cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W)))
    (Real.exp (|θ| *D)) _ _ _ hm s ho hk hsv k A hA
  · intro v _ hv ω
    exact protectedPairExponential_actual_bound cfg ε M L hsp E hE f F V θ D C W hC hW
      hfD hFC hVW hn v hv ω
  · intro v _ hv ω
    refine ⟨Real.exp_nonneg _,Real.exp_le_exp.mpr ?_⟩
    apply (le_abs_self _).trans
    rw [abs_mul]
    exact mul_le_mul_of_nonneg_left (by simpa only [Real.norm_eq_abs] using hfD v hv) (abs_nonneg θ)
  · intro v hv hkv hvs
    letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm v.1 hv hkv
    simpa using hfirst v hv hkv hvs

end NoThreeLine
#print axioms NoThreeLine.protectedExponentialKernel_history_integral_le
