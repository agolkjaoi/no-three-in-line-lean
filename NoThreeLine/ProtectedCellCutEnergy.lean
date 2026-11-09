import NoThreeLine.ProtectedCellCutDrift

/-! The actual protected energy is dominated by the actual entropy
cost at a cut, including the completed prefix and the live segment. -/
set_option autoImplicit false
set_option maxHeartbeats 2350000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedLocalEnergy_le_cost_of_ready {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (L : LineIndex n) (E : Finset (Grid n))
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hE : E⊆L.val) (hsp : specified cfg.directions L) (hKcfg : cfg.K≤K) (hK : K<2)
    (v : ProtectedTimedState cfg) (hdone : ¬birthDone cfg v.1)
    (hN : occupancy v.1.val.1.physical.process L≤1) (hk : v.1.val.1.physical.clocks L≤K)
    (hready : v.1.val.1.AuxReady cfg.directions ε ((n:ℝ)^γ))
    (t : ℝ) (ht : t∈Icc (0:ℝ) (augGuardTime cfg ε ((n:ℝ)^γ) (augTimedInput cfg v.1))) :
    ((1-Real.log 2)*protectedLocalStateSource cfg (protectedCreditEnergyField cfg L E) (v,t)≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (v,t)) ∧
    ((1-Real.log 2)*protectedLocalStateSource cfg (protectedEntropyEnergyField cfg L E) (v,t)≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*
        protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (v,t)) := by
  let x := (augTimedInput cfg v.1).1.1
  let c := fun u=>protectedCreditEnergyRate (selectedTrajectory cfg (x,u)) cfg.directions cfg.mask L E
  let h := fun u=>protectedEntropyEnergyRate (selectedTrajectory cfg (x,u)) cfg.directions cfg.mask L E cfg.B
  let w := fun u=>protectedWholeCostRate (selectedTrajectory cfg (x,u)) cfg.directions cfg.mask L E
  let α := 1-Real.log 2
  let D := (1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ
  let DH := D*(entropyLogConstant d)^2*(Real.log n)^2
  have hc : Continuous c := (protectedCreditEnergyRate_withCoordinates_continuous x.val cfg.directions cfg.mask L E).comp
    (selectedLedgerCurve_continuous cfg x)
  have hh : Continuous h := (protectedEntropyEnergyRate_withCoordinates_continuous x.val cfg.directions cfg.mask L E cfg.B).comp
    (selectedLedgerCurve_continuous cfg x)
  have hw : Continuous w := (protectedWholeCostRate_withCoordinates_continuous x.val cfg.directions cfg.mask L E).comp
    (selectedLedgerCurve_continuous cfg x)
  have hs := Bool.eq_false_iff.mpr (not_or.mp hdone).2
  have hi (q : Grid n) : virtualMass v.1.val.1.physical.process cfg.directions
      v.1.val.1.physical.coordinates L q≤(n:ℝ)^γ :=
    ((outside_virtualGuard _ _ _ _).mp (not_or.mp (hready.resolve_left (by simp [hs]))).2 L q).le
  have hpoint (u : ℝ) (hu : u∈Icc (0:ℝ) t) : α*c u≤D*w u ∧ α*h u≤DH*w u :=
    selectedProtectedWhole_energy_cost_bounds cfg ε K d γ (augTimedInput cfg v.1) v.1.property.1.1 L E
      hn hB hd hdγ hBd hE hs hsp hN hKcfg hk hK hi u ⟨hu.1,hu.2.trans ht.2⟩
  have hC := intervalIntegral.integral_mono_on (μ:=volume) ht.1 ((continuous_const.mul hc).intervalIntegrable 0 t)
    ((continuous_const.mul hw).intervalIntegrable 0 t) (fun u hu=>(hpoint u hu).1)
  have hH := intervalIntegral.integral_mono_on (μ:=volume) ht.1 ((continuous_const.mul hh).intervalIntegrable 0 t)
    ((continuous_const.mul hw).intervalIntegrable 0 t) (fun u hu=>(hpoint u hu).2)
  simp only [Pi.mul_apply,intervalIntegral.integral_const_mul] at hC hH
  simpa only [protectedLocalStateSource,max_eq_right ht.1,protectedCreditEnergyField,protectedEntropyEnergyField,
    protectedWholeCostField,α,D,DH,c,h,w] using And.intro hC hH

theorem protectedCumulativeCutEnergy_le_cost_ae {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hKcfg : cfg.K≤K) (hK : K<2) (hn0 : 0<n) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hready : s.1.val.1.AuxReady cfg.directions ε ((n:ℝ)^γ)) :
    ∀ᵐω∂phaseLineForbiddenLaw cfg ε ((n:ℝ)^γ) K L N hn0 s.1,∀k,
    let v := (protectedRecycledPair cfg ε ((n:ℝ)^γ) L hn0 s k ω).1
    ∀t∈Icc (0:ℝ) (augGuardTime cfg ε ((n:ℝ)^γ) (augTimedInput cfg v.1)),¬birthDone cfg v.1 →
    ((1-Real.log 2)*cumulativeProtectedCutSource cfg ε ((n:ℝ)^γ) L (protectedCreditEnergyField cfg L E) hn0 s k ω t≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*
        cumulativeProtectedCutSource cfg ε ((n:ℝ)^γ) L (protectedWholeCostField cfg L E) hn0 s k ω t) ∧
    ((1-Real.log 2)*cumulativeProtectedCutSource cfg ε ((n:ℝ)^γ) L (protectedEntropyEnergyField cfg L E) hn0 s k ω t≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*
        cumulativeProtectedCutSource cfg ε ((n:ℝ)^γ) L (protectedWholeCostField cfg L E) hn0 s k ω t) := by
  filter_upwards [protectedCumulativeEnergy_le_cost_ae cfg ε K d γ L hsp N hN E hE hn hB hd hdγ hBd
    hKcfg hK hn0 s ho hk hready,
    phaseLineForbiddenLaw_all_occupancy cfg ε ((n:ℝ)^γ) K hKcfg L hsp N hN hn0
      (zero_lt_one.trans_le hB) s.1 ho hk] with ω hprefix hocc
  intro k v t ht hdone
  let M := (n:ℝ)^γ
  have he := congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn0 s k ω)
  have hv : occupancy v.1.val.1.physical.process L=N := by
    change occupancy (protectedRecycledPair cfg ε M L hn0 s k ω).1.1.val.1.physical.process L=N
    rw [he]
    exact hocc k
  have hreg := lineStageRegion_recycled cfg ε M K hKcfg L hsp N hN hn0 s.1 ⟨ho.ge,fun _=>hk⟩ k ω
  have hvk : v.1.val.1.physical.clocks L≤K := by
    change (protectedRecycledPair cfg ε M L hn0 s k ω).1.1.val.1.physical.clocks L≤K
    rw [he]
    exact hreg.2 (hocc k)
  have hlocal := protectedLocalEnergy_le_cost_of_ready cfg ε K d γ L E hn hB hd hdγ hBd hE hsp
    hKcfg hK v hdone (hv ▸ hN) hvk (protectedRecycledPair_auxReady cfg ε M L hn0 s hready k ω) t ht
  unfold cumulativeProtectedCutSource
  simp only [mul_add]
  exact ⟨add_le_add (hprefix k).1 hlocal.1,add_le_add (hprefix k).2 hlocal.2⟩

end NoThreeLine

#print axioms NoThreeLine.protectedCumulativeCutEnergy_le_cost_ae

