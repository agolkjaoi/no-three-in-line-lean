import NoThreeLine.ProtectedStageHistory

/-! Convert actual density-weighted history identities to the constructed
whole-phase forbidden law. All observables use the existing ledger
filtration, including the actual running segment after each update. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem phaseLineForbiddenLaw_protected_history_setIntegral {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (ho : occupancy s.1.val.1.physical.process L=N)
    (hk : s.1.val.1.physical.clocks L≤K) (k : ℕ) (f : BoardClockPath n→ℝ)
    (hf : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance f)
    (A : ℝ) (hA : ∀ω,‖f ω‖≤A) (E : Set (BoardClockPath n))
    (hE : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] E) :
    (∫ω in E,f ω ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      ∫ω in E,lineStageDensity cfg K L N s.1 (protectedRecycledPair cfg ε M L hn s k ω).1.1*f ω
        ∂boardClockMeasure n (cfg.B/n) := by
  classical
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hE0 := (protectedStateFiltration cfg ε M L hn s).le k E hE
  have hf0 := hf.mono ((protectedStateFiltration cfg ε M L hn s).le k) le_rfl
  have hif := hf.indicator hE
  have hib (ω : BoardClockPath n) : ‖E.indicator f ω‖≤max A 0 := by
    by_cases hω : ω∈E
    · simpa only [indicator_of_mem hω] using (hA ω).trans (le_max_left A 0)
    · simp only [indicator_of_notMem hω,norm_zero]
      exact le_max_right _ _
  have hi : Integrable (fun ω=>terminalLineStageDensity cfg ε M K L N hn s.1 ω*(E.indicator f) ω)
      (boardClockMeasure n (cfg.B/n)) := by
    apply (integrable_const ((2/(2-K))^2*max A 0)).mono'
      (((terminalLineStageDensity_measurable cfg ε M K L N hn s.1).mul (hf0.indicator hE0)).aestronglyMeasurable)
    exact ae_of_all _ (fun ω=>by
      have hd := lineStageDensity_bounds cfg K hK L N hN s.1 (augRecycledTerminal cfg ε M hn s.1 ω) hk
      simp only [Pi.mul_apply]
      rw [norm_mul,Real.norm_eq_abs,terminalLineStageDensity,abs_of_nonneg hd.1]
      exact mul_le_mul hd.2 (hib ω) (norm_nonneg _) (sq_nonneg _))
  have hh := phaseLineForbiddenLaw_protected_history_integral cfg ε M K hKcfg hK L hsp N hN hn hB hm
    s ho hk k (E.indicator f) hif hi
  have he : (fun ω=>lineStageDensity cfg K L N s.1 (protectedRecycledPair cfg ε M L hn s k ω).1.1*
      E.indicator f ω)=E.indicator (fun ω=>
        lineStageDensity cfg K L N s.1 (protectedRecycledPair cfg ε M L hn s k ω).1.1*f ω) := by
    funext ω
    by_cases hω : ω∈E <;> simp [hω]
  rw [he,integral_indicator hE0,integral_indicator hE0] at hh
  exact hh

theorem protectedForbidden_history_compensation {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (E : Set (BoardClockPath n))
    (hE : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] E) :
    (∫ω in E,protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s (k+1) ω).1
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      ∫ω in E,(protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1+
        protectedClockRunningSource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω))
        ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  have hEn := (protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k) E hE
  have hc (j : ℕ) := (protectedTimedCredit_measurable cfg L p).comp
    (protectedState_measurable_history cfg ε M L hn s j)
  have hb (j : ℕ) (ω : BoardClockPath n) := protectedRecycledPair_credit_bounds_all cfg ε M L hsp p hpL hn s hsv j ω
  have hcn : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s (k+1)) inferInstance
      (fun ω=>protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1) :=
    (hc k).mono ((protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k)) le_rfl
  have hleft := phaseLineForbiddenLaw_protected_history_setIntegral cfg ε M K hKcfg hK L hsp N hN hn hB hm
    s ho hk (k+1) _ (hc (k+1)) (2*cfg.B)
    (fun ω=>by simpa only [Function.comp_apply,Real.norm_eq_abs,abs_of_nonneg (hb (k+1) ω).1] using (hb (k+1) ω).2) E hEn
  have hright := phaseLineForbiddenLaw_protected_history_setIntegral cfg ε M K hKcfg hK L hsp N hN hn hB hm
    s ho hk (k+1) _ (hcn.add (protectedClockRunningSource_measurable_history cfg ε M L p hn s k))
    (2*cfg.B+(cfg.horizon:ℝ)*((cfg.B/n)*cfg.B))
    (fun ω=>by
      have hr := protectedRunningSource_bounds_all cfg ε M L hsp p hpL hB.le hm
        ((protectedRecycledPair cfg ε M L hn s k ω).1.1,
          WinnerMarkLaw.firstMarkedRace hn (protectedRecycledPair cfg ε M L hn s k ω).2)
      simpa only [Pi.add_apply,protectedClockRunningSource,Real.norm_eq_abs,abs_of_nonneg (add_nonneg (hb k ω).1 hr.1)] using
        add_le_add (hb k ω).2 hr.2) E hEn
  simp only [Function.comp_apply,Pi.add_apply] at hleft hright
  rw [hleft,hright]
  exact protectedDensity_history_equal_integrals cfg ε M K hKcfg hK L hsp N hN p hpL hn hB hm
    s ⟨ho.ge,fun _=>hk⟩ hsv k E hE

end NoThreeLine

#print axioms NoThreeLine.phaseLineForbiddenLaw_protected_history_setIntegral
#print axioms NoThreeLine.protectedForbidden_history_compensation
