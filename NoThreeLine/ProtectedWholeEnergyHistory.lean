import NoThreeLine.ProtectedEnergyHistory

/-! Actual whole-credit and entropy compensated-increment energy on
every history event under the original whole-phase forbidden law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedTimedCreditTotal {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (s : ProtectedTimedState cfg) : ℝ :=
  protectedCreditTotal L E s.1.val.1.physical s.2

def protectedTimedEntropyTotal {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (s : ProtectedTimedState cfg) : ℝ :=
  protectedEntropyTotal L E cfg.B s.1.val.1.physical s.2

def protectedCreditSourceField {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (x : ExtendedState n×(Grid n→ℝ)) : ℝ :=
  protectedCreditTotalSource x.1 cfg.mask L E

def protectedEntropySourceField {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (x : ExtendedState n×(Grid n→ℝ)) : ℝ :=
  protectedEntropyTotalSource x.1 x.2 cfg.directions cfg.mask L E cfg.B

def protectedCreditEnergyField {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (x : ExtendedState n×(Grid n→ℝ)) : ℝ :=
  protectedCreditEnergyRate x.1 cfg.directions cfg.mask L E

def protectedEntropyEnergyField {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (x : ExtendedState n×(Grid n→ℝ)) : ℝ :=
  protectedEntropyEnergyRate x.1 cfg.directions cfg.mask L E cfg.B

theorem protectedTimedWholeTotal_measurable {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (E : Finset (Grid n)) :
    Measurable (protectedTimedCreditTotal cfg L E) ∧ Measurable (protectedTimedEntropyTotal cfg L E) :=
  ⟨Finset.measurable_sum _ (fun p _=>protectedTimedCredit_measurable cfg L p),
    Finset.measurable_sum _ (fun p _=>(protectedEntropy_measurable cfg.B).comp
      (protectedTimedCredit_measurable cfg L p))⟩

def compensatedProtectedCreditTotal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) : ℕ→BoardClockPath n→ℝ :=
  compensatedProtectedStateObservable cfg ε M L (protectedTimedCreditTotal cfg L E)
    (protectedCreditSourceField cfg L E) hn s

def compensatedProtectedEntropyTotal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) : ℕ→BoardClockPath n→ℝ :=
  compensatedProtectedStateObservable cfg ε M L (protectedTimedEntropyTotal cfg L E)
    (protectedEntropySourceField cfg L E) hn s

theorem protectedCreditEnergy_history_equal_integrals {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (A : Set (BoardClockPath n))
    (hA : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] A) :
    (∫ω in A,(compensatedProtectedCreditTotal cfg ε M L E hn s (k+1) ω-
      compensatedProtectedCreditTotal cfg ε M L E hn s k ω)^2
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      ∫ω in A,protectedClockStateSource cfg ε M (protectedCreditEnergyField cfg L E) hn
        (protectedRecycledPair cfg ε M L hn s k ω) ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  apply protectedStateEnergy_history_equal_integrals cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (protectedTimedCreditTotal cfg L E) (protectedTimedWholeTotal_measurable cfg L E).1
    (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E)
    ((protectedCreditTotalSource_measurable cfg.mask L E).comp measurable_fst)
    ((protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).1.comp measurable_fst)
    ((E.card:ℝ)*(2*cfg.B)) ((E.card:ℝ)*((cfg.B/n)*cfg.B))
    (protectedWholeEnergyCap n cfg.B E.card) (by positivity)
    (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
    (fun v hv=>(protectedWholeTotal_norm_bounds v.1.val.1.physical v.2 cfg.directions L hsp E hE cfg.B hB v.1.property.1.1 hv).1)
    (fun e saved he _=>(protectedWholeSource_norm_bounds e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).1)
    (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).1) _ hm s ho hk hsv k A hA
  intro v hv hkv hvs
  simp_rw [protectedPairCompensatedIncrement_actual]
  exact protected_credit_first_energy_variance cfg ε M K hKcfg hK L hsp E hE hn hB hm v hv hkv hvs

theorem protectedEntropyEnergy_history_equal_integrals {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (A : Set (BoardClockPath n))
    (hA : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] A) :
    (∫ω in A,(compensatedProtectedEntropyTotal cfg ε M L E hn s (k+1) ω-
      compensatedProtectedEntropyTotal cfg ε M L E hn s k ω)^2
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      ∫ω in A,protectedClockStateSource cfg ε M (protectedEntropyEnergyField cfg L E) hn
        (protectedRecycledPair cfg ε M L hn s k ω) ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  apply protectedStateEnergy_history_equal_integrals cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (protectedTimedEntropyTotal cfg L E) (protectedTimedWholeTotal_measurable cfg L E).2
    (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E)
    (protectedEntropyTotalSource_measurable cfg.directions cfg.mask L E cfg.B)
    ((protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).2.comp measurable_fst)
    ((E.card:ℝ)*(2*cfg.B)) ((E.card:ℝ)*protectedEntropySourceCap n cfg.B)
    (protectedWholeEnergyCap n cfg.B E.card)
    (mul_nonneg (Nat.cast_nonneg _) (protectedEntropySourceCap_nonneg n cfg.B hB.le))
    (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
    (fun v hv=>(protectedWholeTotal_norm_bounds v.1.val.1.physical v.2 cfg.directions L hsp E hE cfg.B hB v.1.property.1.1 hv).2)
    (fun e saved he _=>(protectedWholeSource_norm_bounds e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2)
    (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2) _ hm s ho hk hsv k A hA
  intro v hv hkv hvs
  simp_rw [protectedPairCompensatedIncrement_actual]
  exact protected_entropy_first_energy_variance cfg ε M K hKcfg hK L hsp E hE hn hB hm v hv hkv hvs

end NoThreeLine
#print axioms NoThreeLine.protectedCreditEnergy_history_equal_integrals
#print axioms NoThreeLine.protectedEntropyEnergy_history_equal_integrals
