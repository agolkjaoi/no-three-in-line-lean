import NoThreeLine.ProtectedWholeEnergyHistory

/-! Actual compensated whole credit and whole entropy under the same
whole-phase forbidden law; uniform finite caps have no update-count factor. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem integral_add_source_of_centered_mean {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (X R : Ω→ℝ) (c : ℝ)
    (hXR : Integrable (fun ω=>X ω-R ω) μ) (hR : Integrable R μ)
    (hmean : (∫ω,(X ω-R ω) ∂μ)=c) :
    (∫ω,X ω ∂μ)=∫ω,(c+R ω) ∂μ := by
  have hiX : Integrable X μ := by
    have hi : Integrable (fun ω=>(X ω-R ω)+R ω) μ := hXR.add hR
    simpa only [sub_add_cancel] using hi
  rw [integral_sub hiX hR] at hmean
  rw [integral_add (integrable_const _) hR]
  simp only [integral_const,measureReal_def,measure_univ,ENNReal.toReal_one,one_smul]
  linarith only [hmean]

theorem protectedCreditTotal_first_add_source {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedCreditTotal cfg L E (protectedRestartStep cfg ε M L hn (s,ω)).1
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      ∫ω,(protectedTimedCreditTotal cfg L E s+
        protectedClockStateSource cfg ε M (protectedCreditSourceField cfg L E) hn (s,ω))
        ∂firstLineForbiddenLaw cfg ε M L hn s.1 := by
  letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm s.1 hN hk
  have hh := protectedCreditCenteredValue_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  have hr := protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1
    (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
    (selectedCreditSource_continuous cfg (augTimedInput cfg s.1).1.1 L E) hN hk
  exact integral_add_source_of_centered_mean _
    (fun ω=>protectedTimedCreditTotal cfg L E (protectedRestartStep cfg ε M L hn (s,ω)).1)
    (fun ω=>protectedClockStateSource cfg ε M (protectedCreditSourceField cfg L E) hn (s,ω))
    (protectedTimedCreditTotal cfg L E s) hh.1 hr hh.2

theorem protectedEntropyTotal_first_add_source {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedEntropyTotal cfg L E (protectedRestartStep cfg ε M L hn (s,ω)).1
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      ∫ω,(protectedTimedEntropyTotal cfg L E s+
        protectedClockStateSource cfg ε M (protectedEntropySourceField cfg L E) hn (s,ω))
        ∂firstLineForbiddenLaw cfg ε M L hn s.1 := by
  letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm s.1 hN hk
  have hh := protectedEntropyCenteredValue_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  have hr := protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1
    (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
    (selectedEntropySource_continuous cfg (augTimedInput cfg s.1).1.1 L E s.2 hB) hN hk
  exact integral_add_source_of_centered_mean _
    (fun ω=>protectedTimedEntropyTotal cfg L E (protectedRestartStep cfg ε M L hn (s,ω)).1)
    (fun ω=>protectedClockStateSource cfg ε M (protectedEntropySourceField cfg L E) hn (s,ω))
    (protectedTimedEntropyTotal cfg L E s) hh.1 hr hh.2

theorem compensatedProtectedCreditTotal_martingale {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Martingale (compensatedProtectedCreditTotal cfg ε M L E hn s)
      (protectedStateFiltration cfg ε M L hn s) (phaseLineForbiddenLaw cfg ε M K L N hn s.1) :=
  compensatedProtectedStateObservable_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (protectedTimedCreditTotal cfg L E) (protectedTimedWholeTotal_measurable cfg L E).1
    (protectedCreditSourceField cfg L E) ((protectedCreditTotalSource_measurable cfg.mask L E).comp measurable_fst)
    ((E.card:ℝ)*(2*cfg.B)) ((E.card:ℝ)*((cfg.B/n)*cfg.B)) (by positivity)
    (fun v hv=>(protectedWholeTotal_norm_bounds v.1.val.1.physical v.2 cfg.directions L hsp E hE cfg.B hB v.1.property.1.1 hv).1)
    (fun e saved he _=>(protectedWholeSource_norm_bounds e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).1)
    (fun v hv hk hvS=>protectedCreditTotal_first_add_source cfg ε M K hKcfg hK L hsp E hE hn hB hm v hv hk hvS)
    hm s ho hk hsv

theorem compensatedProtectedEntropyTotal_martingale {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Martingale (compensatedProtectedEntropyTotal cfg ε M L E hn s)
      (protectedStateFiltration cfg ε M L hn s) (phaseLineForbiddenLaw cfg ε M K L N hn s.1) :=
  compensatedProtectedStateObservable_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (protectedTimedEntropyTotal cfg L E) (protectedTimedWholeTotal_measurable cfg L E).2
    (protectedEntropySourceField cfg L E) (protectedEntropyTotalSource_measurable cfg.directions cfg.mask L E cfg.B)
    ((E.card:ℝ)*(2*cfg.B)) ((E.card:ℝ)*protectedEntropySourceCap n cfg.B)
    (mul_nonneg (Nat.cast_nonneg _) (protectedEntropySourceCap_nonneg n cfg.B hB.le))
    (fun v hv=>(protectedWholeTotal_norm_bounds v.1.val.1.physical v.2 cfg.directions L hsp E hE cfg.B hB v.1.property.1.1 hv).2)
    (fun e saved he _=>(protectedWholeSource_norm_bounds e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2)
    (fun v hv hk hvS=>protectedEntropyTotal_first_add_source cfg ε M K hKcfg hK L hsp E hE hn hB hm v hv hk hvS)
    hm s ho hk hsv

theorem compensatedProtectedStateObservable_norm_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (f : ProtectedTimedState cfg→ℝ) (F : ExtendedState n×(Grid n→ℝ)→ℝ) (D C : ℝ) (hC : 0≤C)
    (hf : ∀v : ProtectedTimedState cfg,(∀p∈E,0≤v.2 p ∧ v.2 p≤2*cfg.B)→‖f v‖≤D)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (k : ℕ) (ω : BoardClockPath n) :
    ‖compensatedProtectedStateObservable cfg ε M L f F hn s k ω‖≤D+(cfg.horizon:ℝ)*C :=
  (norm_sub_le _ _).trans (add_le_add
    (hf _ (fun p hp=>protectedRecycledPair_saved_bounds_all cfg ε M L hsp p (hE hp) hn s (hsv p hp) k ω))
    (cumulativeProtectedStateSource_bound cfg ε M L hsp E hE F C hC hF hn s hsv k ω))

theorem compensatedProtectedWholeTotal_norm_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (k : ℕ) (ω : BoardClockPath n) :
    ‖compensatedProtectedCreditTotal cfg ε M L E hn s k ω‖≤
      (E.card:ℝ)*(2*cfg.B)+(cfg.horizon:ℝ)*((E.card:ℝ)*((cfg.B/n)*cfg.B)) ∧
    ‖compensatedProtectedEntropyTotal cfg ε M L E hn s k ω‖≤
      (E.card:ℝ)*(2*cfg.B)+(cfg.horizon:ℝ)*((E.card:ℝ)*protectedEntropySourceCap n cfg.B) := by
  constructor
  · exact compensatedProtectedStateObservable_norm_bound cfg ε M L hsp E hE _ _ _ _ (by positivity)
      (fun v hv=>(protectedWholeTotal_norm_bounds v.1.val.1.physical v.2 cfg.directions L hsp E hE cfg.B hB v.1.property.1.1 hv).1)
      (fun e saved he _=>(protectedWholeSource_norm_bounds e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
        (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).1) hn s hsv k ω
  · exact compensatedProtectedStateObservable_norm_bound cfg ε M L hsp E hE _ _ _ _
      (mul_nonneg (Nat.cast_nonneg _) (protectedEntropySourceCap_nonneg n cfg.B hB.le))
      (fun v hv=>(protectedWholeTotal_norm_bounds v.1.val.1.physical v.2 cfg.directions L hsp E hE cfg.B hB v.1.property.1.1 hv).2)
      (fun e saved he _=>(protectedWholeSource_norm_bounds e saved cfg.directions cfg.mask L hsp E hE cfg.B hB he
        (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2) hn s hsv k ω

end NoThreeLine
#print axioms NoThreeLine.compensatedProtectedCreditTotal_martingale
#print axioms NoThreeLine.compensatedProtectedEntropyTotal_martingale
