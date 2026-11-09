import NoThreeLine.ProtectedTwoStateForbidden
import NoThreeLine.ProtectedEnergyRegularity
import NoThreeLine.ProtectedStateSourceMartingale

/-! Transfer a real first-step energy variance identity to every event
in the actual protected history, under the same whole-phase Q law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem compensatedProtectedStateObservable_increment {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (f : ProtectedTimedState cfg→ℝ)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (k : ℕ) (ω : BoardClockPath n) :
    compensatedProtectedStateObservable cfg ε M L f F hn s (k+1) ω-
      compensatedProtectedStateObservable cfg ε M L f F hn s k ω=
      protectedPairCompensatedIncrement cfg f F
        ((protectedRecycledPair cfg ε M L hn s k ω).1,
          (protectedRecycledPair cfg ε M L hn s (k+1) ω).1) := by
  unfold compensatedProtectedStateObservable
  rw [cumulativeProtectedStateSource_succ]
  have hh := protectedPairCompensatedIncrement_actual cfg ε M L f F hn
    (protectedRecycledPair cfg ε M L hn s k ω).1 (protectedRecycledPair cfg ε M L hn s k ω).2
  change protectedPairCompensatedIncrement cfg f F
      ((protectedRecycledPair cfg ε M L hn s k ω).1,(protectedRecycledPair cfg ε M L hn s (k+1) ω).1)=
    f (protectedRecycledPair cfg ε M L hn s (k+1) ω).1-
      protectedClockStateSource cfg ε M F hn (protectedRecycledPair cfg ε M L hn s k ω)-
      f (protectedRecycledPair cfg ε M L hn s k ω).1 at hh
  rw [hh]
  ring

theorem protectedStateEnergy_history_equal_integrals {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (f : ProtectedTimedState cfg→ℝ) (hf : Measurable f)
    (F V : ExtendedState n×(Grid n→ℝ)→ℝ) (hF : Measurable F) (hV : Measurable V)
    (D C W : ℝ) (hC : 0≤C) (hW : 0≤W)
    (hfD : ∀v : ProtectedTimedState cfg,(∀p∈E,0≤v.2 p ∧ v.2 p≤2*cfg.B)→‖f v‖≤D)
    (hFC : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hVW : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖V (e,saved)‖≤W)
    (hfirst : ∀v : ProtectedTimedState cfg,occupancy v.1.val.1.physical.process L≤1→
      v.1.val.1.physical.clocks L≤K→(∀p∈E,0≤v.2 p ∧ v.2 p≤2*cfg.B)→
      (∫ω,(protectedPairCompensatedIncrement cfg f F
        (v,(protectedRestartStep cfg ε M L hn (v,ω)).1))^2
        ∂firstLineForbiddenLaw cfg ε M L hn v.1)=
      ∫ω,protectedClockStateSource cfg ε M V hn (v,ω)
        ∂firstLineForbiddenLaw cfg ε M L hn v.1)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (A : Set (BoardClockPath n))
    (hA : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] A) :
    (∫ω in A,(compensatedProtectedStateObservable cfg ε M L f F hn s (k+1) ω-
      compensatedProtectedStateObservable cfg ε M L f F hn s k ω)^2
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      ∫ω in A,protectedClockStateSource cfg ε M V hn (protectedRecycledPair cfg ε M L hn s k ω)
        ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  have hactual (v : ProtectedTimedState cfg) (ω : BoardClockPath n) :
      protectedStatePairGenericSource cfg V (v,(protectedRestartStep cfg ε M L hn (v,ω)).1)=
        protectedClockStateSource cfg ε M V hn (v,ω) :=
    protectedStatePairGenericSource_actual cfg ε M L V v (WinnerMarkLaw.firstMarkedRace hn ω)
  have hh := protectedTwoStateForbidden_history_equal_integrals cfg ε M K hKcfg hK L hsp N hN E hE hn hB
    (fun x=>(protectedPairCompensatedIncrement cfg f F x)^2) (protectedStatePairGenericSource cfg V)
    ((protectedPairCompensatedIncrement_measurable cfg f F hf hF).pow_const 2)
    (protectedStatePairGenericSource_measurable cfg V hV)
    ((2*D+(cfg.horizon:ℝ)*C)^2) ((cfg.horizon:ℝ)*W)
    (fun v _ hv ω=>by
      rw [norm_pow]
      exact pow_le_pow_left₀ (norm_nonneg _)
        (protectedPairCompensatedIncrement_actual_bound cfg ε M L hsp E hE f F D C hC hfD hFC hn v hv ω) 2)
    (fun v _ hv ω=>by
      rw [hactual]
      exact protectedClockStateSource_bound cfg ε M E V W hW hVW hn v hv ω)
    (fun v hv hk hvS=>by
      simp_rw [hactual]
      exact hfirst v hv hk hvS)
    hm s ho hk hsv k A hA
  simp_rw [compensatedProtectedStateObservable_increment]
  convert hh using 1
  congr 1
  funext ω
  exact (hactual _ _).symm

end NoThreeLine
#print axioms NoThreeLine.protectedStateEnergy_history_equal_integrals
