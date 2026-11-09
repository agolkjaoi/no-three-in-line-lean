import NoThreeLine.ProtectedEnergyCostTerminal

/-! Actual accumulated entropy cost controls the all-update upper
probability bound for whole credit and entropy. This is an L2 consequence,
not the later cost-localized exponential maximal inequality. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem energy_cost_maximal_transfer {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (A : Set Ω) (e v D β r : ℝ) (hβ : 0<β)
    (hmax : μ A≤ENNReal.ofReal (e/r^2)) (he : β*e≤D*v) :
    μ A≤ENNReal.ofReal (D*v/(β*r^2)) := by
  have he' : e≤D*v/β := (le_div_iff₀ hβ).mpr (by nlinarith only [he])
  refine hmax.trans (ENNReal.ofReal_le_ofReal ?_)
  simpa only [div_div] using div_le_div_of_nonneg_right he' (sq_nonneg r)

theorem protectedWholeCost_all_update_maximal {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hKcfg : cfg.K≤K) (hK : K<2) (hn0 : 0<n) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (hready : s.1.val.1.AuxReady cfg.directions ε ((n:ℝ)^γ)) (r : ℝ) (hr : 0<r) :
    let Q := phaseLineForbiddenLaw cfg ε ((n:ℝ)^γ) K L N hn0 s.1
    let V := ∫ω,terminalProtectedWholeCost cfg ε ((n:ℝ)^γ) L E hn0 s ω ∂Q
    (Q {ω | ∃k,r≤|compensatedProtectedCreditTotal cfg ε ((n:ℝ)^γ) L E hn0 s k ω-
      protectedTimedCreditTotal cfg L E s|}≤
      ENNReal.ofReal (((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*V/((1-Real.log 2)*r^2))) ∧
    (Q {ω | ∃k,r≤|compensatedProtectedEntropyTotal cfg ε ((n:ℝ)^γ) L E hn0 s k ω-
      protectedTimedEntropyTotal cfg L E s|}≤
      ENNReal.ofReal (((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*V/
        ((1-Real.log 2)*r^2))) := by
  have hB0 : 0<cfg.B := by linarith
  have hc := terminalProtectedEnergy_cost_mean_bound cfg ε K d γ L hsp N hN E hE hn hB hd hdγ hBd
    hKcfg hK hn0 hm s ho hk hsv hready
  dsimp only at hc ⊢
  constructor
  · exact energy_cost_maximal_transfer _ _ _ _ _ _ _ protectedEntropyCost_margin.1
      (protectedCreditEnergy_all_update_maximal cfg ε ((n:ℝ)^γ) K hKcfg hK L hsp N hN E hE hn0 hB0 hm s ho hk hsv r hr) hc.1
  · exact energy_cost_maximal_transfer _ _ _ _ _ _ _ protectedEntropyCost_margin.1
      (protectedEntropyEnergy_all_update_maximal cfg ε ((n:ℝ)^γ) K hKcfg hK L hsp N hN E hE hn0 hB0 hm s ho hk hsv r hr) hc.2

end NoThreeLine
#print axioms NoThreeLine.protectedWholeCost_all_update_maximal
