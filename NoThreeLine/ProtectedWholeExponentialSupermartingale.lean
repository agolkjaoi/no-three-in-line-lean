import NoThreeLine.ProtectedExponentialSupermartingale

/-! Concrete whole-credit and entropy exponential supermartingales under the
same actual whole-phase forbidden law, with every one-step mean supplied internally. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedCreditExponential_supermartingale {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (θ : ℝ) (hθ : 0≤θ) :
    Supermartingale (protectedStateExponential cfg ε M L (protectedTimedCreditTotal cfg L E)
      (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E) θ hn s)
      (protectedStateFiltration cfg ε M L hn s) (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  apply protectedStateExponential_supermartingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (protectedTimedCreditTotal cfg L E) (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E)
    (protectedTimedWholeTotal_measurable cfg L E).1
    ((protectedCreditTotalSource_measurable cfg.mask L E).comp measurable_fst)
    ((protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).1.comp measurable_fst)
    θ ((E.card:ℝ)*(2*cfg.B)) ((E.card:ℝ)*((cfg.B/n)*cfg.B)) (protectedWholeEnergyCap n cfg.B E.card)
    (by positivity) (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
    (fun v hv=>(protectedWholeTotal_norm_bounds v.1.val.1.physical v.2 cfg.directions L hsp E hE cfg.B hB v.1.property.1.1 hv).1)
    (fun e saved he _=>(protectedWholeSource_norm_bounds e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).1)
    (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).1) _ hm s ho hk hsv
  intro v hv hkv hvs
  exact protectedPairCreditExponential_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm v hv hkv hvs θ hθ

theorem protectedEntropyExponential_supermartingale {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (θ : ℝ) (hθ : 0≤θ) :
    Supermartingale (protectedStateExponential cfg ε M L (protectedTimedEntropyTotal cfg L E)
      (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E) θ hn s)
      (protectedStateFiltration cfg ε M L hn s) (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  apply protectedStateExponential_supermartingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (protectedTimedEntropyTotal cfg L E) (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E)
    (protectedTimedWholeTotal_measurable cfg L E).2
    (protectedEntropyTotalSource_measurable cfg.directions cfg.mask L E cfg.B)
    ((protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).2.comp measurable_fst)
    θ ((E.card:ℝ)*(2*cfg.B)) ((E.card:ℝ)*protectedEntropySourceCap n cfg.B) (protectedWholeEnergyCap n cfg.B E.card)
    (mul_nonneg (Nat.cast_nonneg _) (protectedEntropySourceCap_nonneg n cfg.B hB.le)) (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
    (fun v hv=>(protectedWholeTotal_norm_bounds v.1.val.1.physical v.2 cfg.directions L hsp E hE cfg.B hB v.1.property.1.1 hv).2)
    (fun e saved he _=>(protectedWholeSource_norm_bounds e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2)
    (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2) _ hm s ho hk hsv
  intro v hv hkv hvs
  exact protectedPairEntropyExponential_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm v hv hkv hvs θ hθ

end NoThreeLine
#print axioms NoThreeLine.protectedCreditExponential_supermartingale
#print axioms NoThreeLine.protectedEntropyExponential_supermartingale
