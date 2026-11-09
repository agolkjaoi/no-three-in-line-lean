import NoThreeLine.ProtectedParameterCutKernel
import NoThreeLine.ProtectedStateExponential
import NoThreeLine.HistoryWeightedIntegralLE
import NoThreeLine.ProtectedParameterCutExponential
import NoThreeLine.ProtectedCutPairMean

/-! Multiply an actual parameterized cut kernel by its past compensation.
The parameter and past factor remain in the same history and full-phase law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedParameterCutKernel_past_integral_le {n : ℕ}
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
    (∫ω in A,protectedPastExponential cfg ε M L F V θ hn s k ω*
      protectedParameterCutExponential cfg G F V θ cut
      (((protectedRecycledPair cfg ε M L hn s k ω).1,
        (protectedRecycledPair cfg ε M L hn s (k+1) ω).1),param ω)
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)≤
    ∫ω in A,protectedStateExponential cfg ε M L
      (fun v=>G (v.1.val.1.physical,v.2)) F V θ hn s k ω
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  let Q := phaseLineForbiddenLaw cfg ε M K L N hn s.1
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  let P := Real.exp (|θ| *((cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W))
  let R := Real.exp (|θ| *D)
  have hstate : Measurable (fun v : ProtectedTimedState cfg=>G (v.1.val.1.physical,v.2)) :=
    hG.comp (((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)).prodMk measurable_snd)
  have hv (j : ℕ) (ω : BoardClockPath n) (p) (hp : p∈E) :=
    protectedRecycledPair_saved_bounds_all cfg ε M L hsp p (hE hp) hn s (hsv p hp) j ω
  have hPast (ω : BoardClockPath n) : ‖protectedPastExponential cfg ε M L F V θ hn s k ω‖≤P :=
    protectedPastExponential_bound cfg ε M L hsp E hE F V θ C W hC hW hFC hVW hn s hsv k ω
  let b := fun ω=>protectedParameterCutExponential cfg G F V θ cut
    (((protectedRecycledPair cfg ε M L hn s k ω).1,
      (protectedRecycledPair cfg ε M L hn s (k+1) ω).1),param ω)
  let c := fun ω=>Real.exp (θ*G ((protectedRecycledPair cfg ε M L hn s k ω).1.1.val.1.physical,
    (protectedRecycledPair cfg ε M L hn s k ω).1.2))
  have hpambient := hp.mono ((protectedStateFiltration cfg ε M L hn s).le k) le_rfl
  have hbm : Measurable b :=
    (protectedParameterCutExponential_measurable cfg G F V θ cut hG hF hV hcut).comp
      (((protectedRecycledPair_measurable cfg ε M L hn s k).fst.prodMk
        (protectedRecycledPair_measurable cfg ε M L hn s (k+1)).fst).prodMk hpambient)
  have hb (ω : BoardClockPath n) : ‖b ω‖≤
      Real.exp (|θ| *(D+(cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W)) := by
    have h := protectedCutPairExponential_actual_bound cfg ε M L hsp E hE G F V θ D C W hC hW
      hGD hFC hVW (fun v=>cut (v,param ω)) hn
      (protectedRecycledPair cfg ε M L hn s k ω).1 (hv k ω)
      (hu _ _) (hug _ _) (protectedRecycledPair cfg ε M L hn s k ω).2
    have h0 : 0≤b ω := h.1
    rw [Real.norm_eq_abs,abs_of_nonneg h0]
    exact h.2
  have hbi : Integrable b Q := (integrable_const _).mono' hbm.aestronglyMeasurable (ae_of_all _ hb)
  have hc (ω : BoardClockPath n) : ‖c ω‖≤R := by
    rw [Real.norm_eq_abs,abs_of_pos (Real.exp_pos _)]
    apply Real.exp_le_exp.mpr
    apply (le_abs_self _).trans
    rw [abs_mul]
    exact mul_le_mul_of_nonneg_left (hGD _ _ (protectedRecycledPair cfg ε M L hn s k ω).1.1.property.1.1 (hv k ω)) (abs_nonneg θ)
  have hci : Integrable c Q := (integrable_const R).mono'
    (Real.measurable_exp.comp ((hstate.comp (protectedRecycledPair_measurable cfg ε M L hn s k).fst).const_mul θ)).aestronglyMeasurable
    (ae_of_all _ hc)
  have hle := history_weighted_setIntegral_le Q (protectedStateFiltration cfg ε M L hn s k)
    ((protectedStateFiltration cfg ε M L hn s).le k)
    (protectedPastExponential cfg ε M L F V θ hn s k)
    (protectedPastExponential_measurable_history cfg ε M L F V θ hF hV hn s k)
    P hPast (fun _=>Real.exp_nonneg _) b c hbi hci
    (protectedParameterCutKernel_history_integral_le cfg ε M K hKcfg hK L hsp N hN E hE hn hB
      G F V hG hF hV cut hcut hu hug θ D C W hC hW hGD hFC hVW hfirst hm s ho hk hsv k param hp) A hA
  simpa only [protectedStateExponential_factor] using hle

end NoThreeLine
#print axioms NoThreeLine.protectedParameterCutKernel_past_integral_le
