import NoThreeLine.ProtectedStateSourceStage

/-! The actual terminal forbidden density transports signed source
compensation on every real saved-ledger history event. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedClockStateSource_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (S : Finset (Grid n)) (F : ExtendedState n×(Grid n→ℝ)→ℝ) (C : ℝ) (hC : 0≤C)
    (hFC : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈S,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : ∀p∈S,0≤s.2 p ∧ s.2 p≤2*cfg.B) (ω : BoardClockPath n) :
    ‖protectedClockStateSource cfg ε M F hn (s,ω)‖≤(cfg.horizon:ℝ)*C := by
  have hr := protectedStateSource_elapsed_bound cfg ε M S F C hFC s hsv (WinnerMarkLaw.firstMarkedRace hn ω)
  have ht := (birthElapsed_mem cfg ε M (s.1,WinnerMarkLaw.firstMarkedRace hn ω)).2.trans
    ((augGuardTime_le_remaining cfg ε M (augTimedInput cfg s.1) s.1.property.2.1).trans s.1.property.2.2)
  exact hr.trans (mul_le_mul_of_nonneg_right ht hC)

theorem protectedStateSourceForbidden_history_compensation {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (S : Finset (Grid n)) (hS : S⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (f : ProtectedTimedState cfg→ℝ) (hfm : Measurable f)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hFm : Measurable F) (D C : ℝ) (hC : 0≤C)
    (hfD : ∀v : ProtectedTimedState cfg,(∀p∈S,0≤v.2 p ∧ v.2 p≤2*cfg.B)→‖f v‖≤D)
    (hFC : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈S,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hfirst : ∀v : ProtectedTimedState cfg,occupancy v.1.val.1.physical.process L≤1→
      v.1.val.1.physical.clocks L≤K→(∀p∈S,0≤v.2 p ∧ v.2 p≤2*cfg.B)→
      (∫ω,f (protectedRestartStep cfg ε M L hn (v,ω)).1 ∂firstLineForbiddenLaw cfg ε M L hn v.1)=
        ∫ω,(f v+protectedClockStateSource cfg ε M F hn (v,ω)) ∂firstLineForbiddenLaw cfg ε M L hn v.1)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈S,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (A : Set (BoardClockPath n))
    (hA : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] A) :
    (∫ω in A,f (protectedRecycledPair cfg ε M L hn s (k+1) ω).1
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      ∫ω in A,(f (protectedRecycledPair cfg ε M L hn s k ω).1+
        protectedClockStateSource cfg ε M F hn (protectedRecycledPair cfg ε M L hn s k ω))
        ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  have hv (j : ℕ) (ω : BoardClockPath n) (p) (hp : p∈S) :=
    protectedRecycledPair_saved_bounds_all cfg ε M L hsp p (hS hp) hn s (hsv p hp) j ω
  have hAn := (protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k) A hA
  have hf (j : ℕ) := hfm.comp (protectedState_measurable_history cfg ε M L hn s j)
  have hb (j : ℕ) (ω : BoardClockPath n) : ‖f (protectedRecycledPair cfg ε M L hn s j ω).1‖≤D :=
    hfD _ (hv j ω)
  have hfn : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s (k+1)) inferInstance
      (fun ω=>f (protectedRecycledPair cfg ε M L hn s k ω).1) :=
    (hf k).mono ((protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k)) le_rfl
  have hleft := phaseLineForbiddenLaw_protected_history_setIntegral cfg ε M K hKcfg hK L hsp N hN hn hB hm
    s ho hk (k+1) _ (hf (k+1)) D (hb (k+1)) A hAn
  have hright := phaseLineForbiddenLaw_protected_history_setIntegral cfg ε M K hKcfg hK L hsp N hN hn hB hm
    s ho hk (k+1) _ (hfn.add (protectedClockStateSource_measurable_history cfg ε M L F hFm hn s k))
    (D+(cfg.horizon:ℝ)*C)
    (fun ω=>(norm_add_le _ _).trans (add_le_add (hb k ω)
      (protectedClockStateSource_bound cfg ε M S F C hC hFC hn _ (hv k ω) _))) A hAn
  simp only [Function.comp_apply,Pi.add_apply] at hleft hright
  rw [hleft,hright]
  simp only [lineStageDensity,mul_assoc]
  rw [integral_const_mul,integral_const_mul]
  congr 1
  exact protectedStateSourceStage_history_equal_integrals cfg ε M K hKcfg hK L hsp N hN S hS hn hB
    f hfm F hFm D C hC hfD hFC hfirst s ⟨ho.ge,fun _=>hk⟩ hsv k A hA

end NoThreeLine
#print axioms NoThreeLine.protectedStateSourceForbidden_history_compensation
