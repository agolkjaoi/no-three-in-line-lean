import NoThreeLine.ProtectedWholeEnergyTerminal
import NoThreeLine.ProtectedRunningEnergyCost
import NoThreeLine.AugmentedGuardReachability

/-! Actual guard readiness propagates through the original recycled path.
Under the actual forbidden law it supplies every incoming virtual bound;
the executed whole-event energy is therefore dominated by actual cost. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem augRecycledPair_auxReady {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (s : AugTimedState cfg) (hs : s.val.1.AuxReady cfg.directions ε M)
    (k : ℕ) (ω : BoardClockPath n) :
    (augRecycledPair cfg ε M hn s k ω).1.val.1.AuxReady cfg.directions ε M := by
  induction k with
  | zero => exact hs
  | succ k ih => exact augTimedStep_auxReady cfg ε M _ _ ih

theorem protectedRecycledPair_auxReady {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (s : ProtectedTimedState cfg)
    (hs : s.1.val.1.AuxReady cfg.directions ε M) (k : ℕ) (ω : BoardClockPath n) :
    (protectedRecycledPair cfg ε M L hn s k ω).1.1.val.1.AuxReady cfg.directions ε M := by
  rw [congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s k ω)]
  exact augRecycledPair_auxReady cfg ε M hn s.1 hs k ω

def protectedWholeCostField {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (v : ExtendedState n×(Grid n→ℝ)) : ℝ :=
  protectedWholeCostRate v.1 cfg.directions cfg.mask L E

theorem protectedClockEnergy_le_cost_of_ready {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (L : LineIndex n) (E : Finset (Grid n))
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hE : E⊆L.val) (hsp : specified cfg.directions L) (hKcfg : cfg.K≤K) (hK : K<2)
    (hn0 : 0<n) (v : ProtectedTimedState cfg) (ω : BoardClockPath n)
    (hN : occupancy v.1.val.1.physical.process L≤1) (hk : v.1.val.1.physical.clocks L≤K)
    (hready : v.1.val.1.AuxReady cfg.directions ε ((n:ℝ)^γ)) :
    ((1-Real.log 2)*protectedClockStateSource cfg ε ((n:ℝ)^γ) (protectedCreditEnergyField cfg L E) hn0 (v,ω)≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*
        protectedClockStateSource cfg ε ((n:ℝ)^γ) (protectedWholeCostField cfg L E) hn0 (v,ω)) ∧
    ((1-Real.log 2)*protectedClockStateSource cfg ε ((n:ℝ)^γ) (protectedEntropyEnergyField cfg L E) hn0 (v,ω)≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*
        protectedClockStateSource cfg ε ((n:ℝ)^γ) (protectedWholeCostField cfg L E) hn0 (v,ω)) := by
  by_cases hs : v.1.val.1.physical.process.stopped=true
  · simp only [protectedClockStateSource,protectedRunningScalarSource,hs,or_true,if_true,mul_zero,le_refl,and_self]
  · have hs0 : v.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr hs
    have hg := hready.resolve_left hs
    have hinit (q : Grid n) : virtualMass v.1.val.1.physical.process cfg.directions
        v.1.val.1.physical.coordinates L q≤(n:ℝ)^γ :=
      ((outside_virtualGuard _ _ _ _).mp (not_or.mp hg).2 L q).le
    exact protectedRunningWhole_energy_cost_bounds cfg ε K d γ v.1 L E hn hB hd hdγ hBd hE hs0 hsp hN
      hKcfg hk hK hinit (WinnerMarkLaw.firstMarkedRace hn0 ω)

theorem protectedCumulativeEnergy_le_cost_ae {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hKcfg : cfg.K≤K) (hK : K<2) (hn0 : 0<n) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hready : s.1.val.1.AuxReady cfg.directions ε ((n:ℝ)^γ)) :
    ∀ᵐω∂phaseLineForbiddenLaw cfg ε ((n:ℝ)^γ) K L N hn0 s.1,∀k,
    ((1-Real.log 2)*cumulativeProtectedStateSource cfg ε ((n:ℝ)^γ) L (protectedCreditEnergyField cfg L E) hn0 s k ω≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*
        cumulativeProtectedStateSource cfg ε ((n:ℝ)^γ) L (protectedWholeCostField cfg L E) hn0 s k ω) ∧
    ((1-Real.log 2)*cumulativeProtectedStateSource cfg ε ((n:ℝ)^γ) L (protectedEntropyEnergyField cfg L E) hn0 s k ω≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*
        cumulativeProtectedStateSource cfg ε ((n:ℝ)^γ) L (protectedWholeCostField cfg L E) hn0 s k ω) := by
  have hB0 : 0<cfg.B := by linarith
  filter_upwards [phaseLineForbiddenLaw_all_occupancy cfg ε ((n:ℝ)^γ) K hKcfg L hsp N hN hn0 hB0 s.1 ho hk] with ω hω
  have hb (j : ℕ) := lineStageRegion_recycled cfg ε ((n:ℝ)^γ) K hKcfg L hsp N hN hn0 s.1
    ⟨ho.ge,fun _=>hk⟩ j ω
  have hstep (j : ℕ) := protectedClockEnergy_le_cost_of_ready cfg ε K d γ L E hn hB hd hdγ hBd hE hsp hKcfg hK hn0
    (protectedRecycledPair cfg ε ((n:ℝ)^γ) L hn0 s j ω).1
    (protectedRecycledPair cfg ε ((n:ℝ)^γ) L hn0 s j ω).2
    (by rw [congrArg Prod.fst (protectedRecycledPair_projection cfg ε ((n:ℝ)^γ) L hn0 s j ω),hω j]; exact hN)
    (by rw [congrArg Prod.fst (protectedRecycledPair_projection cfg ε ((n:ℝ)^γ) L hn0 s j ω)]; exact (hb j).2 (hω j))
    (protectedRecycledPair_auxReady cfg ε ((n:ℝ)^γ) L hn0 s hready j ω)
  intro k
  unfold cumulativeProtectedStateSource
  simp only [Finset.mul_sum]
  exact ⟨Finset.sum_le_sum (fun j _=>(hstep j).1),Finset.sum_le_sum (fun j _=>(hstep j).2)⟩

end NoThreeLine
#print axioms NoThreeLine.protectedCumulativeEnergy_le_cost_ae
