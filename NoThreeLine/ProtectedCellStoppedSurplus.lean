import NoThreeLine.ProtectedCellStoppingWitness
import NoThreeLine.ProtectedCellCutEnergy

/-! Actual credit or entropy compensation at the first cost-localized
stop of an exceeding cell. -/
set_option autoImplicit false
set_option maxHeartbeats 3000000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness LineDrift

def protectedCellCutCompensated {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (F : ExtendedState n×(Grid n→ℝ)→ℝ)
    (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) (t : ℝ) : ℝ :=
  protectedStateFlowTotal cfg L E A ((protectedRecycledPair cfg ε M L hn s k ω).1,t)-
    cumulativeProtectedCutSource cfg ε M L F hn s k ω t

theorem protectedStateFlowTotal_zero {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (v : ProtectedTimedState cfg) :
    protectedStateFlowTotal cfg L E A (v,0)=protectedStateTotal cfg L E A v := by
  unfold protectedStateFlowTotal protectedStateTotal protectedScalarTotal
  apply Finset.sum_congr rfl
  intro p _
  exact congrArg A (selectedProtectedLedger_zero cfg (augTimedInput cfg v.1).1.1 v.1.property.1.1 L v.2 p)

theorem cumulativeProtectedCutSource_zero {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hn : 0<n)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeProtectedCutSource cfg ε M L F hn s k ω 0=
      cumulativeProtectedStateSource cfg ε M L F hn s k ω := by
  simp [cumulativeProtectedCutSource,protectedLocalStateSource]

def protectedCellCreditEnergyScale {n : ℕ} (cfg : FlowConfig n) (γ : ℝ) : ℝ :=
  (1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ

def protectedCellEntropyEnergyScale {n : ℕ} (cfg : FlowConfig n) (d γ : ℝ) : ℝ :=
  protectedCellCreditEnergyScale cfg γ*(entropyLogConstant d)^2*(Real.log n)^2

theorem protectedCell_crossing_stopped_surplus_ae {n : ℕ}
    (cfg : FlowConfig n) (ε K d γ : ℝ) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hKcfg : cfg.K≤K) (hK : K<2) (hm : ∀q,cfg.mask q≤1) (hn0 : 0<n)
    (s : ProtectedTimedState cfg) (ho : occupancy s.1.val.1.physical.process L=N)
    (hk : s.1.val.1.physical.clocks L≤K) (hready : s.1.val.1.AuxReady cfg.directions ε ((n:ℝ)^γ))
    (hsv : ∀q∈E,0≤s.2 q ∧ s.2 q≤2*cfg.B)
    (cap w rC rH : ℝ) (hcap : 0≤cap) (hw : 0≤w)
    (hC : protectedTimedCreditTotal cfg L E s+
      cfg.horizon*(((cfg.B/n)*(1-b N))*cap)+rC≤cap)
    (hH : protectedTimedEntropyTotal cfg L E s+
      cfg.horizon*(((cfg.B/n)*(1-b N))*((entropyLogConstant d*Real.log n)*max 1 cap))+rH≤w) :
    let M := (n:ℝ)^γ
    ∀ᵐω∂phaseLineForbiddenLaw cfg ε M K L N hn0 s.1,
      ω∈protectedActualExceedance cfg ε M L N E id hn0 s cap →
      let v := fun j=>(protectedRecycledPair cfg ε M L hn0 s j ω).1
      let delta := fun j=>(v j).1.val.2-(v (j+1)).1.val.2
      let cost := fun j=>cumulativeProtectedStateSource cfg ε M L (protectedWholeCostField cfg L E) hn0 s j ω
      let u := fun j=>protectedCellStopCut cfg ε M L E cap (v j,w-cost j)
      ∃k : ℕ,∃t : ℝ,(∀j<k,delta j≤u j) ∧ (t=0 ∨ (t=u k ∧ t<delta k)) ∧
        ((rC≤protectedCellCutCompensated cfg ε M L E id (protectedCreditSourceField cfg L E) hn0 s k ω t-
            protectedTimedCreditTotal cfg L E s ∧
          (1-Real.log 2)*cumulativeProtectedCutSource cfg ε M L (protectedCreditEnergyField cfg L E) hn0 s k ω t≤
            protectedCellCreditEnergyScale cfg γ*w) ∨
        (rH≤protectedCellCutCompensated cfg ε M L E (protectedEntropy cfg.B)
            (protectedEntropySourceField cfg L E) hn0 s k ω t-protectedTimedEntropyTotal cfg L E s ∧
          (1-Real.log 2)*cumulativeProtectedCutSource cfg ε M L (protectedEntropyEnergyField cfg L E) hn0 s k ω t≤
            protectedCellEntropyEnergyScale cfg d γ*w)) := by
  let M := (n:ℝ)^γ
  have hB0 := zero_lt_one.trans_le hB
  have hl := entropy_log_scale cfg.B d hn hB hd hBd
  have hβ : 0≤(cfg.B/n)*(1-b N) := mul_nonneg (div_nonneg hB0.le (Nat.cast_nonneg n)) (one_sub_b_bounds N hN).1
  filter_upwards [protectedCumulativeCutEnergy_le_cost_ae cfg ε K d γ L hsp N hN E hE
      hn hB hd hdγ hBd hKcfg hK hn0 s ho hk hready,
    protectedCumulativeEnergy_le_cost_ae cfg ε K d γ L hsp N hN E hE hn hB hd hdγ hBd
      hKcfg hK hn0 s ho hk hready,
    phaseLineForbiddenLaw_all_occupancy cfg ε M K hKcfg L hsp N hN hn0 hB0 s.1 ho hk]
    with ω hcutEnergy hstateEnergy hocc
  intro hcross
  let v := fun j=>(protectedRecycledPair cfg ε M L hn0 s j ω).1
  let delta := fun j=>(v j).1.val.2-(v (j+1)).1.val.2
  let cost := fun j=>cumulativeProtectedStateSource cfg ε M L (protectedWholeCostField cfg L E) hn0 s j ω
  let u := fun j=>protectedCellStopCut cfg ε M L E cap (v j,w-cost j)
  obtain ⟨k,hbefore,hprefix,hwk,hstop⟩ :=
    protectedCell_crossing_has_stoppingWitness cfg ε M L N E hn0 s cap w hw ω hcross
  have hvocc (j : ℕ) : occupancy (v j).1.val.1.physical.process L=N := by
    change occupancy (protectedRecycledPair cfg ε M L hn0 s j ω).1.1.val.1.physical.process L=N
    rw [congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn0 s j ω)]
    exact hocc j
  let S := fun F t=>cumulativeProtectedCutSource cfg ε M L F hn0 s k ω t
  let c := fun t=>protectedStateFlowTotal cfg L E id (v k,t)
  let h := fun t=>protectedStateFlowTotal cfg L E (protectedEntropy cfg.B) (v k,t)
  let W := fun t=>S (protectedWholeCostField cfg L E) t
  let FC := protectedCreditSourceField cfg L E
  let FH := protectedEntropySourceField cfg L E
  let VC := protectedCreditEnergyField cfg L E
  let VH := protectedEntropyEnergyField cfg L E
  let DC := protectedCellCreditEnergyScale cfg γ
  let DH := protectedCellEntropyEnergyScale cfg d γ
  have hDC : 0≤DC := by dsimp [DC,protectedCellCreditEnergyScale]; positivity
  have hDH : 0≤DH := by dsimp [DH,protectedCellEntropyEnergyScale]; positivity
  have hfinish (t : ℝ) (ht : t∈Icc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg (v k).1)))
      (hlocal : ∀r∈Ioo (0:ℝ) t,c r≤cap)
      (hW : W t≤w) (hcontact : cap≤c t ∨ W t=w)
      (hEcut : (1-Real.log 2)*S VC t≤DC*W t ∧ (1-Real.log 2)*S VH t≤DH*W t) :
      (rC≤c t-S FC t-protectedTimedCreditTotal cfg L E s ∧ (1-Real.log 2)*S VC t≤DC*w) ∨
      (rH≤h t-S FH t-protectedTimedEntropyTotal cfg L E s ∧ (1-Real.log 2)*S VH t≤DH*w) := by
    have hsrc := protectedCellPrefixCut_sources_le cfg ε M d L E hE hsp hn hB hd hBd hm hn0 s ω
      N hN hsv cap k (fun j _=>hvocc j) hprefix t ht hlocal
    have helapsed : s.1.val.2-(v k).1.val.2+t≤(cfg.horizon:ℝ) := by
      have hrem := ht.2.trans (augGuardTime_le_remaining cfg ε M _ (v k).1.property.2.1)
      have hh := s.1.property.2.2
      change t≤(v k).1.val.2 at hrem
      linarith
    rcases hcontact with hc | hW'
    · have hsrcC := hsrc.1.trans (mul_le_mul_of_nonneg_right helapsed (mul_nonneg hβ hcap))
      change S FC t≤_ at hsrcC
      exact Or.inl ⟨by linarith, hEcut.1.trans (mul_le_mul_of_nonneg_left hW hDC)⟩
    · have hsrcH := hsrc.2.trans (mul_le_mul_of_nonneg_right helapsed
        (mul_nonneg hβ (mul_nonneg (hl.1.trans hl.2) (zero_le_one.trans (le_max_left _ _)))))
      change S FH t+W t≤_ at hsrcH
      have hv := selectedTrajectory_valid cfg (augTimedInput cfg (v k).1).1.1
        (v k).1.property.1.1 t ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M _ (v k).1.property.1.1).2⟩
      have hsv' (q : Grid n) (hq : q∈E) : 0≤(v k).2 q ∧ (v k).2 q≤2*cfg.B :=
        protectedRecycledPair_saved_bounds_all cfg ε M L hsp q (hE hq) hn0 s (hsv q hq) k ω
      have hnonneg : 0≤h t :=
        (protectedEntropyTotal_nonneg_le_credit_log _ (v k).2 cfg.directions L E cfg.B d
          hn hB hd hBd hv hsp hE hsv').1
      exact Or.inr ⟨by linarith, hEcut.2.trans (mul_le_mul_of_nonneg_left hW hDH)⟩
  have hpre : ∀j<k,delta j≤u j := fun j hj=>(hbefore j hj).2.2
  rcases hstop with hb | ⟨hdone,hu,hlocal,hW,hcontact⟩
  · have ht : (0:ℝ)∈Icc 0 (augGuardTime cfg ε M (augTimedInput cfg (v k).1)) :=
      ⟨le_rfl,(augGuardTime_mem cfg ε M _ (v k).1.property.1.1).1⟩
    have hcost : W 0=cost k := cumulativeProtectedCutSource_zero cfg ε M L _ hn0 s k ω
    have hcz : c 0=protectedStateTotal cfg L E id (v k) := protectedStateFlowTotal_zero cfg L E id (v k)
    have hcontact : cap≤c 0 ∨ W 0=w := by rwa [hcz,hcost]
    have hEnergy : (1-Real.log 2)*S VC 0≤DC*W 0 ∧ (1-Real.log 2)*S VH 0≤DH*W 0 := by
      rw [hcost]
      simp only [S,cumulativeProtectedCutSource_zero]
      exact hstateEnergy k
    exact ⟨k,0,hpre,Or.inl rfl,hfinish 0 ht
      (fun _ hr=>(not_lt_of_ge hr.1.le hr.2).elim) (hcost.symm ▸ hwk) hcontact hEnergy⟩
  · have ht := protectedCellStopCut_bounds cfg ε M L E cap (v k,w-cost k)
    exact ⟨k,u k,hpre,Or.inr ⟨rfl,hu⟩,hfinish (u k) ht hlocal hW hcontact (hcutEnergy k (u k) ht hdone)⟩

end NoThreeLine

#print axioms NoThreeLine.protectedCell_crossing_stopped_surplus_ae

