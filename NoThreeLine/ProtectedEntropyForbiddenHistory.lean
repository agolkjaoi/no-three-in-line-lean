import NoThreeLine.ProtectedForbiddenHistory
import NoThreeLine.ProtectedEntropyStageHistory

/-! The actual signed entropy compensation identity on every event
in the whole-phase saved-ledger history under its constructed law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedEntropyForbidden_history_compensation {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (E : Set (BoardClockPath n))
    (hE : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] E) :
    (∫ω in E,protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s (k+1) ω).1
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      ∫ω in E,(protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1+
        protectedClockRunningEntropySource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω))
        ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  have hEn := (protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k) E hE
  have hc (j : ℕ) := (protectedTimedEntropy_measurable cfg L p).comp
    (protectedState_measurable_history cfg ε M L hn s j)
  have hb (j : ℕ) (ω : BoardClockPath n) :
      0≤protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s j ω).1 ∧
        protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s j ω).1≤2*cfg.B :=
    protectedTimedEntropy_bounds_all cfg L hsp p hpL hB _
      (protectedRecycledPair_saved_bounds_all cfg ε M L hsp p hpL hn s hsv j ω)
  have hcn : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s (k+1)) inferInstance
      (fun ω=>protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1) :=
    (hc k).mono ((protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k)) le_rfl
  have hleft := phaseLineForbiddenLaw_protected_history_setIntegral cfg ε M K hKcfg hK L hsp N hN hn hB hm
    s ho hk (k+1) _ (hc (k+1)) (2*cfg.B)
    (fun ω=>by simpa only [Function.comp_apply,Real.norm_eq_abs,abs_of_nonneg (hb (k+1) ω).1] using (hb (k+1) ω).2) E hEn
  have hright := phaseLineForbiddenLaw_protected_history_setIntegral cfg ε M K hKcfg hK L hsp N hN hn hB hm
    s ho hk (k+1) _ (hcn.add (protectedClockRunningEntropySource_measurable_history cfg ε M L p hn s k))
    (2*cfg.B+(cfg.horizon:ℝ)*protectedEntropySourceCap n cfg.B)
    (fun ω=>by
      have hr := protectedRunningEntropySource_bounds_all cfg ε M L hsp p hpL hB hm
        (protectedRecycledPair cfg ε M L hn s k ω).1
        (WinnerMarkLaw.firstMarkedRace hn (protectedRecycledPair cfg ε M L hn s k ω).2)
      exact (norm_add_le _ _).trans (add_le_add (by
        simpa only [Function.comp_apply,Real.norm_eq_abs,abs_of_nonneg (hb k ω).1] using (hb k ω).2) hr)) E hEn
  simp only [Function.comp_apply,Pi.add_apply] at hleft hright
  rw [hleft,hright]
  exact protectedEntropyDensity_history_equal_integrals cfg ε M K hKcfg hK L hsp N hN p hpL hn hB hm
    s ⟨ho.ge,fun _=>hk⟩ hsv k E hE

end NoThreeLine
#print axioms NoThreeLine.protectedEntropyForbidden_history_compensation
