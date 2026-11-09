import NoThreeLine.ProtectedWholeEnergy
import NoThreeLine.ProtectedWholeSquareBounds

/-! Actual elapsed whole-event energy is bounded by elapsed entropy cost.
The virtual bound on the entire executed interval comes from the real guard. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem selectedProtectedWhole_energy_cost_bounds {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (L : LineIndex n) (E : Finset (Grid n))
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hE : E⊆L.val) (hs : x.1.1.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.1.1.val.process L≤1) (hKcfg : cfg.K≤K) (hclock : x.1.1.val.clocks L≤K) (hK : K<2)
    (hinit : ∀q,virtualMass x.1.1.val.process cfg.directions x.1.1.val.coordinates L q≤(n:ℝ)^γ)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (augGuardTime cfg ε ((n:ℝ)^γ) x)) :
    let e := selectedTrajectory cfg (x.1.1,t)
    ((1-Real.log 2)*protectedCreditEnergyRate e cfg.directions cfg.mask L E≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*protectedWholeCostRate e cfg.directions cfg.mask L E) ∧
    ((1-Real.log 2)*protectedEntropyEnergyRate e cfg.directions cfg.mask L E cfg.B≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*
        protectedWholeCostRate e cfg.directions cfg.mask L E) := by
  let q : Grid n := (⟨0,by omega⟩,⟨0,by omega⟩)
  have ha : augAdvance cfg ε ((n:ℝ)^γ) (x,t)=t := by
    change max 0 (min (augGuardTime cfg ε ((n:ℝ)^γ) x) t)=t
    rw [min_eq_right ht.2,max_eq_right ht.1]
  have hpre : (augPreState cfg ε ((n:ℝ)^γ) (x,((t,q),0))).physical=selectedTrajectory cfg (x.1.1,t) := by
    change selectedTrajectory cfg (x.1.1,augAdvance cfg ε ((n:ℝ)^γ) (x,t))=_
    rw [ha]
  have h := protectedWhole_augPre_square_cost_bounds cfg ε K d γ x he L E (fun _=>0) (fun _ _=>false)
    hn hB hd hdγ hBd hE hs hsp hN hKcfg hclock hK hinit ((t,q),0)
  dsimp only at h ⊢
  rw [hpre] at h
  have hv := selectedTrajectory_valid cfg x.1.1 he t
    ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε ((n:ℝ)^γ) x he).2⟩
  rw [protectedCreditTotal_jumpSquare_eq_deletion _ (fun _=>0) cfg.directions cfg.mask (fun _ _=>false) L E hv.1 hs,
    protectedEntropyTotal_jumpSquare_eq_deletion _ (fun _=>0) cfg.directions cfg.mask (fun _ _=>false) L E cfg.B hv.1 hs] at h
  exact h

theorem protectedRunningWhole_energy_cost_bounds {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (s : AugTimedState cfg) (L : LineIndex n) (E : Finset (Grid n))
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hE : E⊆L.val) (hs : s.val.1.physical.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy s.val.1.physical.process L≤1) (hKcfg : cfg.K≤K) (hclock : s.val.1.physical.clocks L≤K) (hK : K<2)
    (hinit : ∀q,virtualMass s.val.1.physical.process cfg.directions s.val.1.physical.coordinates L q≤(n:ℝ)^γ)
    (z : CandidateData n) :
    let x := (augTimedInput cfg s).1.1
    let cost := protectedRunningScalarSource cfg ε ((n:ℝ)^γ) s
      (fun t=>protectedWholeCostRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E) z
    ((1-Real.log 2)*protectedRunningScalarSource cfg ε ((n:ℝ)^γ) s
      (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E) z≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*cost) ∧
    ((1-Real.log 2)*protectedRunningScalarSource cfg ε ((n:ℝ)^γ) s
      (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E cfg.B) z≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*cost) := by
  let x := (augTimedInput cfg s).1.1
  have hC : Continuous (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E) :=
    (protectedCreditEnergyRate_withCoordinates_continuous s.val.1.physical cfg.directions cfg.mask L E).comp
      (selectedLedgerCurve_continuous cfg x)
  have hH : Continuous (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E cfg.B) :=
    (protectedEntropyEnergyRate_withCoordinates_continuous s.val.1.physical cfg.directions cfg.mask L E cfg.B).comp
      (selectedLedgerCurve_continuous cfg x)
  have hG : Continuous (fun t=>protectedWholeCostRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E) :=
    (protectedWholeCostRate_withCoordinates_continuous s.val.1.physical cfg.directions cfg.mask L E).comp
      (selectedLedgerCurve_continuous cfg x)
  have hb (t : ℝ) (ht : t∈Icc (0:ℝ) (birthElapsed cfg ε ((n:ℝ)^γ) (s,z))) :=
    selectedProtectedWhole_energy_cost_bounds cfg ε K d γ (augTimedInput cfg s) s.property.1.1 L E
      hn hB hd hdγ hBd hE hs hsp hN hKcfg hclock hK hinit t
      ⟨ht.1,ht.2.trans (birthElapsed_mem cfg ε ((n:ℝ)^γ) (s,z)).2⟩
  exact ⟨protectedRunningScalarSource_scaled_mono cfg ε ((n:ℝ)^γ) s _ _ hC hG _ _ z (fun t ht=>(hb t ht).1),
    protectedRunningScalarSource_scaled_mono cfg ε ((n:ℝ)^γ) s _ _ hH hG _ _ z (fun t ht=>(hb t ht).2)⟩

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedWhole_energy_cost_bounds
#print axioms NoThreeLine.protectedRunningWhole_energy_cost_bounds
