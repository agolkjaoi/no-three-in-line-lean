import NoThreeLine.ProtectedStateSourceMartingale
import NoThreeLine.ProtectedWholeSquareAccumulation

/-! Actual whole credit and entropy squares minus their actual square
sources are martingales under the constructed whole-phase forbidden law.
The first-step means, region invariants and caps are supplied internally. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedTimedScalarSquare_norm_bounds_all {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val) (A : ℝ→ℝ) (D : ℝ)
    (hA : ∀c∈Icc (0:ℝ) (2*cfg.B),0≤A c ∧ A c≤D)
    (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    ‖protectedTimedScalarSquare cfg L E A s‖≤((E.card:ℝ)*D)^2 := by
  have hh := protectedScalarTotal_bounds L E A cfg.B D cfg.directions hsp hE
    s.1.val.1.physical s.1.property.1.1 s.2 hsv hA
  change ‖(protectedScalarTotal L E A s.1.val.1.physical s.2)^2‖≤_
  rw [norm_pow,Real.norm_eq_abs,abs_of_nonneg hh.1]
  exact pow_le_pow_left₀ hh.1 hh.2 2

theorem protectedCreditSquare_first_mean_add_running {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedScalarSquare cfg L E id (protectedRestartStep cfg ε M L hn (s,ω)).1
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      ∫ω,(protectedTimedScalarSquare cfg L E id s+
        protectedClockStateSource cfg ε M (fun x=>protectedCreditSquareSource x.1 x.2 cfg.directions cfg.mask L E) hn (s,ω)) ∂firstLineForbiddenLaw cfg ε M L hn s.1 := by
  letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm s.1 hN hk
  have hiR := protectedRunningCreditSquareSource_integrable cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  have hiC := protectedScalarSquare_firstForbidden_integrable cfg ε M K hKcfg hK L hsp E hE id
    measurable_id (2*cfg.B) (fun c hc=>hc) hn hB s hN hk hsv
  have hh := protected_credit_whole_square_first_compensation cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  rw [integral_sub hiC hiR] at hh
  change _=(∫ω,(protectedTimedScalarSquare cfg L E id s+
    protectedRunningCreditSquareSource cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω))
    ∂firstLineForbiddenLaw cfg ε M L hn s.1)
  rw [integral_add (integrable_const _) hiR]
  simp only [integral_const,measureReal_def,measure_univ,ENNReal.toReal_one,one_smul]
  linarith only [hh]

def compensatedProtectedCreditSquare {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  protectedTimedScalarSquare cfg L E id (protectedRecycledPair cfg ε M L hn s k ω).1-
    cumulativeProtectedCreditSquareSource cfg ε M L E hn s k ω

theorem compensatedProtectedCreditSquare_martingale {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Martingale (compensatedProtectedCreditSquare cfg ε M L E hn s) (protectedStateFiltration cfg ε M L hn s)
      (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  exact compensatedProtectedStateObservable_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (protectedTimedScalarSquare cfg L E id) (protectedTimedScalarSquare_measurable cfg L E id measurable_id)
    (fun x=>protectedCreditSquareSource x.1 x.2 cfg.directions cfg.mask L E) (protectedCreditSquareSource_measurable cfg.directions cfg.mask L E) (((E.card:ℝ)*(2*cfg.B))^2) (protectedWholeSquareSourceCap n cfg.B E.card ((cfg.B/n)*cfg.B))
    (protectedWholeSquareSourceCap_nonneg n cfg.B E.card ((cfg.B/n)*cfg.B) hB.le (mul_nonneg (div_nonneg hB.le (Nat.cast_nonneg n)) hB.le))
    (fun v hv=>protectedTimedScalarSquare_norm_bounds_all cfg L hsp E hE id (2*cfg.B) (fun c hc=>hc) v hv)
    (fun e saved he hv=>protectedCreditSquareSource_norm_bound e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩) hv)
    (fun v hNv hkv hv=>protectedCreditSquare_first_mean_add_running cfg ε M K hKcfg hK L hsp E hE hn hB hm v hNv hkv hv)
    hm s ho hk hsv

theorem compensatedProtectedCreditSquare_finite_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) :
    (∫ω,compensatedProtectedCreditSquare cfg ε M L E hn s k ω ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      protectedTimedScalarSquare cfg L E id s := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have ht := (compensatedProtectedCreditSquare_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv).setIntegral_eq
    (Nat.zero_le k) MeasurableSet.univ
  simpa [compensatedProtectedCreditSquare,cumulativeProtectedCreditSquareSource,cumulativeProtectedStateSource,
    protectedRecycledPair,RecycledBoardProcess.iterate] using ht.symm

theorem protectedEntropySquare_first_mean_add_running {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) (protectedRestartStep cfg ε M L hn (s,ω)).1
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      ∫ω,(protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) s+
        protectedClockStateSource cfg ε M (fun x=>protectedEntropySquareSource x.1 x.2 cfg.directions cfg.mask L E cfg.B) hn (s,ω)) ∂firstLineForbiddenLaw cfg ε M L hn s.1 := by
  letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm s.1 hN hk
  have hiR := protectedRunningEntropySquareSource_integrable cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  have hiC := protectedScalarSquare_firstForbidden_integrable cfg ε M K hKcfg hK L hsp E hE (protectedEntropy cfg.B)
    (protectedEntropy_continuous cfg.B).measurable (2*cfg.B) (fun c hc=>protectedEntropy_bounds cfg.B c hB hc.1 hc.2) hn hB s hN hk hsv
  have hh := protected_entropy_whole_square_first_compensation cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  rw [integral_sub hiC hiR] at hh
  change _=(∫ω,(protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) s+
    protectedRunningEntropySquareSource cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω))
    ∂firstLineForbiddenLaw cfg ε M L hn s.1)
  rw [integral_add (integrable_const _) hiR]
  simp only [integral_const,measureReal_def,measure_univ,ENNReal.toReal_one,one_smul]
  linarith only [hh]

def compensatedProtectedEntropySquare {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) (protectedRecycledPair cfg ε M L hn s k ω).1-
    cumulativeProtectedEntropySquareSource cfg ε M L E hn s k ω

theorem compensatedProtectedEntropySquare_martingale {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Martingale (compensatedProtectedEntropySquare cfg ε M L E hn s) (protectedStateFiltration cfg ε M L hn s)
      (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  exact compensatedProtectedStateObservable_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B)) (protectedTimedScalarSquare_measurable cfg L E (protectedEntropy cfg.B) (protectedEntropy_continuous cfg.B).measurable)
    (fun x=>protectedEntropySquareSource x.1 x.2 cfg.directions cfg.mask L E cfg.B) (protectedEntropySquareSource_measurable cfg.directions cfg.mask L E cfg.B) (((E.card:ℝ)*(2*cfg.B))^2) (protectedWholeSquareSourceCap n cfg.B E.card (protectedEntropySourceCap n cfg.B))
    (protectedWholeSquareSourceCap_nonneg n cfg.B E.card (protectedEntropySourceCap n cfg.B) hB.le (protectedEntropySourceCap_nonneg n cfg.B hB.le))
    (fun v hv=>protectedTimedScalarSquare_norm_bounds_all cfg L hsp E hE (protectedEntropy cfg.B) (2*cfg.B) (fun c hc=>protectedEntropy_bounds cfg.B c hB hc.1 hc.2) v hv)
    (fun e saved he hv=>protectedEntropySquareSource_norm_bound e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩) hv)
    (fun v hNv hkv hv=>protectedEntropySquare_first_mean_add_running cfg ε M K hKcfg hK L hsp E hE hn hB hm v hNv hkv hv)
    hm s ho hk hsv

theorem compensatedProtectedEntropySquare_finite_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) :
    (∫ω,compensatedProtectedEntropySquare cfg ε M L E hn s k ω ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) s := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have ht := (compensatedProtectedEntropySquare_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv).setIntegral_eq
    (Nat.zero_le k) MeasurableSet.univ
  simpa [compensatedProtectedEntropySquare,cumulativeProtectedEntropySquareSource,cumulativeProtectedStateSource,
    protectedRecycledPair,RecycledBoardProcess.iterate] using ht.symm

end NoThreeLine
#print axioms NoThreeLine.compensatedProtectedCreditSquare_martingale
#print axioms NoThreeLine.compensatedProtectedEntropySquare_martingale
#print axioms NoThreeLine.compensatedProtectedCreditSquare_finite_mean
#print axioms NoThreeLine.compensatedProtectedEntropySquare_finite_mean
