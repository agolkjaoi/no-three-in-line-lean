import NoThreeLine.ProtectedParameterCutPast

/-! Concrete actual cut observations with past compensation. The remaining
cost parameter, cumulative source, and cumulative energy use the same history. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedCreditParameterCut_past_integral_le {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hcut : Measurable cut)
    (hu : ∀v a,0≤cut (v,a))
    (hug : ∀v a,cut (v,a)≤augGuardTime cfg ε M (augTimedInput cfg v.1))
    (θ : ℝ) (hθ : 0≤θ) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (param : BoardClockPath n→ℝ)
    (hp : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance param)
    (A : Set (BoardClockPath n)) (hA : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] A) :
    (∫ω in A,protectedPastExponential cfg ε M L (protectedCreditSourceField cfg L E)
      (protectedCreditEnergyField cfg L E) θ hn s k ω*
      protectedParameterCutExponential cfg (fun x=>protectedCreditTotal L E x.1 x.2)
      (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E) θ cut
      (((protectedRecycledPair cfg ε M L hn s k ω).1,
        (protectedRecycledPair cfg ε M L hn s (k+1) ω).1),param ω)
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)≤
    ∫ω in A,protectedStateExponential cfg ε M L (protectedTimedCreditTotal cfg L E)
      (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E) θ hn s k ω
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  apply protectedParameterCutKernel_past_integral_le cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (fun x=>protectedCreditTotal L E x.1 x.2) (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E)
    (Finset.measurable_sum _ (fun p _=>protectedLineCredit_measurable L p))
    ((protectedCreditTotalSource_measurable cfg.mask L E).comp measurable_fst)
    ((protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).1.comp measurable_fst)
    cut hcut hu hug θ ((E.card:ℝ)*(2*cfg.B)) ((E.card:ℝ)*((cfg.B/n)*cfg.B)) (protectedWholeEnergyCap n cfg.B E.card)
    (by positivity) (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
    (fun e saved he hsv=>(protectedWholeTotal_norm_bounds e saved cfg.directions L hsp E hE cfg.B hB he hsv).1)
    (fun e saved he _=>(protectedWholeSource_norm_bounds e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).1)
    (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).1) _ hm s ho hk hsv k param hp A hA
  intro v hv hkv hvs a
  exact protectedCutPairCreditExponential_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm
    (fun v=>cut (v,a)) v hv hkv hvs θ hθ (hu v a) (hug v a)

theorem protectedEntropyParameterCut_past_integral_le {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hcut : Measurable cut)
    (hu : ∀v a,0≤cut (v,a))
    (hug : ∀v a,cut (v,a)≤augGuardTime cfg ε M (augTimedInput cfg v.1))
    (θ : ℝ) (hθ : 0≤θ) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (param : BoardClockPath n→ℝ)
    (hp : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance param)
    (A : Set (BoardClockPath n)) (hA : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] A) :
    (∫ω in A,protectedPastExponential cfg ε M L (protectedEntropySourceField cfg L E)
      (protectedEntropyEnergyField cfg L E) θ hn s k ω*
      protectedParameterCutExponential cfg (fun x=>protectedEntropyTotal L E cfg.B x.1 x.2)
      (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E) θ cut
      (((protectedRecycledPair cfg ε M L hn s k ω).1,
        (protectedRecycledPair cfg ε M L hn s (k+1) ω).1),param ω)
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)≤
    ∫ω in A,protectedStateExponential cfg ε M L (protectedTimedEntropyTotal cfg L E)
      (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E) θ hn s k ω
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  apply protectedParameterCutKernel_past_integral_le cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (fun x=>protectedEntropyTotal L E cfg.B x.1 x.2) (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E)
    (Finset.measurable_sum _ (fun p _=>(protectedEntropy_measurable cfg.B).comp (protectedLineCredit_measurable L p)))
    (protectedEntropyTotalSource_measurable cfg.directions cfg.mask L E cfg.B)
    ((protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).2.comp measurable_fst)
    cut hcut hu hug θ ((E.card:ℝ)*(2*cfg.B)) ((E.card:ℝ)*protectedEntropySourceCap n cfg.B) (protectedWholeEnergyCap n cfg.B E.card)
    (mul_nonneg (Nat.cast_nonneg _) (protectedEntropySourceCap_nonneg n cfg.B hB.le)) (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
    (fun e saved he hsv=>(protectedWholeTotal_norm_bounds e saved cfg.directions L hsp E hE cfg.B hB he hsv).2)
    (fun e saved he _=>(protectedWholeSource_norm_bounds e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2)
    (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2) _ hm s ho hk hsv k param hp A hA
  intro v hv hkv hvs a
  exact protectedCutPairEntropyExponential_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm
    (fun v=>cut (v,a)) v hv hkv hvs θ hθ (hu v a) (hug v a)

end NoThreeLine
#print axioms NoThreeLine.protectedCreditParameterCut_past_integral_le
#print axioms NoThreeLine.protectedEntropyParameterCut_past_integral_le
