import NoThreeLine.ProtectedTwoStateStage

/-! Actual two-state kernel identities under the constructed whole-phase
forbidden law. Bounds are needed only on real transitions. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedTwoStateForbidden_history_equal_integrals {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (S : Finset (Grid n)) (hS : S⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (f g : ProtectedTimedState cfg×ProtectedTimedState cfg→ℝ)
    (hfm : Measurable f) (hgm : Measurable g) (D C : ℝ)
    (hfD : ∀v : ProtectedTimedState cfg,lineStageRegion cfg K L N v.1→
      (∀p∈S,0≤v.2 p ∧ v.2 p≤2*cfg.B)→∀ω,
      ‖f (v,(protectedRestartStep cfg ε M L hn (v,ω)).1)‖≤D)
    (hgC : ∀v : ProtectedTimedState cfg,lineStageRegion cfg K L N v.1→
      (∀p∈S,0≤v.2 p ∧ v.2 p≤2*cfg.B)→∀ω,
      ‖g (v,(protectedRestartStep cfg ε M L hn (v,ω)).1)‖≤C)
    (hfirst : ∀v : ProtectedTimedState cfg,occupancy v.1.val.1.physical.process L≤1→
      v.1.val.1.physical.clocks L≤K→(∀p∈S,0≤v.2 p ∧ v.2 p≤2*cfg.B)→
      (∫ω,f (v,(protectedRestartStep cfg ε M L hn (v,ω)).1)
        ∂firstLineForbiddenLaw cfg ε M L hn v.1)=
      ∫ω,g (v,(protectedRestartStep cfg ε M L hn (v,ω)).1)
        ∂firstLineForbiddenLaw cfg ε M L hn v.1)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈S,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (A : Set (BoardClockPath n))
    (hA : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] A) :
    (∫ω in A,f ((protectedRecycledPair cfg ε M L hn s k ω).1,
      (protectedRecycledPair cfg ε M L hn s (k+1) ω).1)
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
    ∫ω in A,g ((protectedRecycledPair cfg ε M L hn s k ω).1,
      (protectedRecycledPair cfg ε M L hn s (k+1) ω).1)
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  have hv (j : ℕ) (ω : BoardClockPath n) (p) (hp : p∈S) :=
    protectedRecycledPair_saved_bounds_all cfg ε M L hsp p (hS hp) hn s (hsv p hp) j ω
  have hr (j : ℕ) (ω : BoardClockPath n) :
      lineStageRegion cfg K L N (protectedRecycledPair cfg ε M L hn s j ω).1.1 := by
    rw [congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s j ω)]
    exact lineStageRegion_recycled cfg ε M K hKcfg L hsp N hN hn s.1 ⟨ho.ge,fun _=>hk⟩ j ω
  have hb (j : ℕ) (ω : BoardClockPath n) :
      ‖f ((protectedRecycledPair cfg ε M L hn s j ω).1,
        (protectedRecycledPair cfg ε M L hn s (j+1) ω).1)‖≤D :=
    hfD _ (hr j ω) (hv j ω) _
  have hc (j : ℕ) (ω : BoardClockPath n) :
      ‖g ((protectedRecycledPair cfg ε M L hn s j ω).1,
        (protectedRecycledPair cfg ε M L hn s (j+1) ω).1)‖≤C :=
    hgC _ (hr j ω) (hv j ω) _
  have hAn := (protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k) A hA
  have hbefore : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s (k+1)) inferInstance
      (fun ω=>(protectedRecycledPair cfg ε M L hn s k ω).1) :=
    (protectedState_measurable_history cfg ε M L hn s k).mono
      ((protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k)) le_rfl
  have hpair := hbefore.prodMk (protectedState_measurable_history cfg ε M L hn s (k+1))
  have hleft := phaseLineForbiddenLaw_protected_history_setIntegral cfg ε M K hKcfg hK L hsp N hN hn hB hm
    s ho hk (k+1) _ (hfm.comp hpair) D (hb k) A hAn
  have hright := phaseLineForbiddenLaw_protected_history_setIntegral cfg ε M K hKcfg hK L hsp N hN hn hB hm
    s ho hk (k+1) _ (hgm.comp hpair) C (hc k) A hAn
  simp only [Function.comp_apply] at hleft hright
  rw [hleft,hright]
  simp only [lineStageDensity,mul_assoc]
  rw [integral_const_mul,integral_const_mul]
  congr 1
  exact protectedTwoStateStage_history_equal_integrals cfg ε M K hKcfg hK L hsp N hN S hS hn hB
    f g hfm hgm D C hfD hgC hfirst s ⟨ho.ge,fun _=>hk⟩ hsv k A hA

end NoThreeLine
#print axioms NoThreeLine.protectedTwoStateForbidden_history_equal_integrals
