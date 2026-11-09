import NoThreeLine.ProtectedExponentialCrossing
import NoThreeLine.ProtectedEnergyGuardHistory

/-! Actual guard readiness converts the whole-event energy localization into
an actual accumulated entropy-cost localization. One-sided all-update bounds. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedCreditCost_exponential_crossing {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hKcfg : cfg.K≤K) (hK : K<2) (hn0 : 0<n) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (hready : s.1.val.1.AuxReady cfg.directions ε ((n:ℝ)^γ))
    (θ : ℝ) (hθ : 0≤θ) (r w : ℝ) :
    (phaseLineForbiddenLaw cfg ε ((n:ℝ)^γ) K L N hn0 s.1)
      {ω | ∃k,r≤compensatedProtectedCreditTotal cfg ε ((n:ℝ)^γ) L E hn0 s k ω-protectedTimedCreditTotal cfg L E s ∧
        cumulativeProtectedStateSource cfg ε ((n:ℝ)^γ) L (protectedWholeCostField cfg L E) hn0 s k ω≤w}≤
      ENNReal.ofReal (Real.exp (-θ*r+(θ^2/2)*(((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*w/(1-Real.log 2)))) := by
  have hB0 : 0<cfg.B := by linarith
  have hD : 0≤((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ) := by positivity
  have he := protectedCumulativeEnergy_le_cost_ae cfg ε K d γ L hsp N hN E hE hn hB hd hdγ hBd
    hKcfg hK hn0 s ho hk hready
  have hsub : ({ω | ∃k,r≤compensatedProtectedCreditTotal cfg ε ((n:ℝ)^γ) L E hn0 s k ω-protectedTimedCreditTotal cfg L E s ∧
        cumulativeProtectedStateSource cfg ε ((n:ℝ)^γ) L (protectedWholeCostField cfg L E) hn0 s k ω≤w} : Set (BoardClockPath n))
      ≤ᵐ[phaseLineForbiddenLaw cfg ε ((n:ℝ)^γ) K L N hn0 s.1]
      {ω | ∃k,r≤compensatedProtectedCreditTotal cfg ε ((n:ℝ)^γ) L E hn0 s k ω-protectedTimedCreditTotal cfg L E s ∧
        cumulativeProtectedStateSource cfg ε ((n:ℝ)^γ) L (protectedCreditEnergyField cfg L E) hn0 s k ω≤
          ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*w/(1-Real.log 2)} := by
    filter_upwards [he] with ω hω
    rintro ⟨k,hkr,hkw⟩
    refine ⟨k,hkr,(le_div_iff₀ protectedEntropyCost_margin.1).mpr ?_⟩
    have hh := (hω k).1
    have hw := mul_le_mul_of_nonneg_left hkw hD
    nlinarith only [hh,hw]
  exact (measure_mono_ae hsub).trans (protectedCreditExponential_crossing cfg ε ((n:ℝ)^γ) K hKcfg hK L hsp
    N hN E hE hn0 hB0 hm s ho hk hsv θ hθ r (((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*w/(1-Real.log 2)))

theorem protectedEntropyCost_exponential_crossing {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hKcfg : cfg.K≤K) (hK : K<2) (hn0 : 0<n) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (hready : s.1.val.1.AuxReady cfg.directions ε ((n:ℝ)^γ))
    (θ : ℝ) (hθ : 0≤θ) (r w : ℝ) :
    (phaseLineForbiddenLaw cfg ε ((n:ℝ)^γ) K L N hn0 s.1)
      {ω | ∃k,r≤compensatedProtectedEntropyTotal cfg ε ((n:ℝ)^γ) L E hn0 s k ω-protectedTimedEntropyTotal cfg L E s ∧
        cumulativeProtectedStateSource cfg ε ((n:ℝ)^γ) L (protectedWholeCostField cfg L E) hn0 s k ω≤w}≤
      ENNReal.ofReal (Real.exp (-θ*r+(θ^2/2)*(((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*w/(1-Real.log 2)))) := by
  have hB0 : 0<cfg.B := by linarith
  have hD : 0≤((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2) := by positivity
  have he := protectedCumulativeEnergy_le_cost_ae cfg ε K d γ L hsp N hN E hE hn hB hd hdγ hBd
    hKcfg hK hn0 s ho hk hready
  have hsub : ({ω | ∃k,r≤compensatedProtectedEntropyTotal cfg ε ((n:ℝ)^γ) L E hn0 s k ω-protectedTimedEntropyTotal cfg L E s ∧
        cumulativeProtectedStateSource cfg ε ((n:ℝ)^γ) L (protectedWholeCostField cfg L E) hn0 s k ω≤w} : Set (BoardClockPath n))
      ≤ᵐ[phaseLineForbiddenLaw cfg ε ((n:ℝ)^γ) K L N hn0 s.1]
      {ω | ∃k,r≤compensatedProtectedEntropyTotal cfg ε ((n:ℝ)^γ) L E hn0 s k ω-protectedTimedEntropyTotal cfg L E s ∧
        cumulativeProtectedStateSource cfg ε ((n:ℝ)^γ) L (protectedEntropyEnergyField cfg L E) hn0 s k ω≤
          ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*w/(1-Real.log 2)} := by
    filter_upwards [he] with ω hω
    rintro ⟨k,hkr,hkw⟩
    refine ⟨k,hkr,(le_div_iff₀ protectedEntropyCost_margin.1).mpr ?_⟩
    have hh := (hω k).2
    have hw := mul_le_mul_of_nonneg_left hkw hD
    nlinarith only [hh,hw]
  exact (measure_mono_ae hsub).trans (protectedEntropyExponential_crossing cfg ε ((n:ℝ)^γ) K hKcfg hK L hsp
    N hN E hE hn0 hB0 hm s ho hk hsv θ hθ r (((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*w/(1-Real.log 2)))

end NoThreeLine
#print axioms NoThreeLine.protectedCreditCost_exponential_crossing
#print axioms NoThreeLine.protectedEntropyCost_exponential_crossing
