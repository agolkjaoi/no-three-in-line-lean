import NoThreeLine.ProtectedCellOnePhaseTail
import NoThreeLine.ProtectedCellExponentialBudget

/-! For fixed horizon, direction and linear gap constants, the one-phase
estimate is uniform over the actual ready timed ledgers. -/
set_option autoImplicit false
set_option maxHeartbeats 2450000
noncomputable section
open MeasureTheory
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem exists_protectedCell_onePhase_power_tail (T C D d γ g r : ℝ)
    (hT : 0≤T) (hC : 1≤C) (hD : 0<D) (hd : 0≤d) (hdγ : d≤γ)
    (hγ : γ<1) (hg : 0<g) (hr : 0<r) :
    ∃n0 : ℕ,2≤n0 ∧ ∀n≥n0,∀(cfg : FlowConfig n) (ε K : ℝ)
      (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (cap : ℝ),
      (cfg.horizon:ℝ)≤T → 1+2*(cfg.directions.card:ℝ)≤D →
      1≤cfg.B → cfg.B≤(n:ℝ)^d → cfg.K≤K → K<2 → (∀q,cfg.mask q≤1) →
      specified cfg.directions L → N≤1 → E⊆L.val →
      occupancy s.1.val.1.physical.process L=N → s.1.val.1.physical.clocks L≤K →
      s.1.val.1.AuxReady cfg.directions ε ((n:ℝ)^γ) →
      (∀q∈E,0≤s.2 q ∧ s.2 q≤2*cfg.B) →
      cap≤C*n → protectedTimedCreditTotal cfg L E s+g*n≤cap →
      (phaseLineForbiddenLaw cfg ε ((n:ℝ)^γ) K L N hn s.1).real
        (protectedActualExceedance cfg ε ((n:ℝ)^γ) L N E id hn s cap)≤2*(n:ℝ)^(-r) := by
  have hCp : 0<C := zero_lt_one.trans_le hC
  obtain ⟨nB,hnB,hBgt⟩ := exists_protectedCellLargeN_budget T C d g hT hC hd (hdγ.trans_lt hγ) hg
  obtain ⟨nP,_,hPgt⟩ := exists_protectedCellExponential_budget C D d γ g r hCp hD hd hγ hg hr
  refine ⟨max nB nP,hnB.trans (le_max_left _ _),?_⟩
  intro n hnn cfg ε K L N E hn0 s cap htime hcount hB hBd hKcfg hK hm hsp hN hE ho hk hready hsv hc hgap
  have hn := hnB.trans ((le_max_left _ _).trans hnn)
  obtain ⟨hcap,hH,hcredit,hentropy⟩ := hBgt n ((le_max_left _ _).trans hnn) cfg L E
    hB hBd htime hsp hE N hN s cap hsv hc hgap
  let H := protectedCellEntropyBudget n C d
  let w := 3*H
  let rC := (g/2)*(n:ℝ)
  let vC := protectedCellCreditVarianceBudget n C D d γ
  let vH := protectedCellEntropyVarianceBudget n C D d γ
  let α := 1-Real.log 2
  have hα : 0<α := protectedEntropyCost_margin.1
  have hw : 0≤w := by dsimp [w,H]; linarith
  have hrC : 0≤rC := by dsimp [rC]; positivity
  have hv := protectedCellVarianceBudgets_pos hn C D d γ hCp hD hd
  have hp : 0≤(n:ℝ)^γ := Real.rpow_nonneg (Nat.cast_nonneg n) _
  have hD' := mul_le_mul_of_nonneg_right hcount hp
  have hVC : protectedCellCreditEnergyScale cfg γ*w≤α*vC := by
    calc
      _ ≤ (D*(n:ℝ)^γ)*w := mul_le_mul_of_nonneg_right hD' hw
      _ = _ := by
        change (D*(n:ℝ)^γ)*w=α*((D*(n:ℝ)^γ)*w/α)
        field_simp [hα.ne']
  have hVH : protectedCellEntropyEnergyScale cfg d γ*w≤α*vH := by
    calc
      _ ≤ (D*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*w :=
        mul_le_mul_of_nonneg_right
          (mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right hD' (sq_nonneg _)) (sq_nonneg _)) hw
      _ = _ := by
        change (D*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*w=
          α*(((D*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*w)/α)
        field_simp [hα.ne']
  have h := protectedCell_onePhase_exponential_tail cfg ε K d γ L hsp N hN E hE hn hB hd hdγ hBd
    hKcfg hK hm hn0 s ho hk hready hsv cap w rC H vC vH (rC/vC) (H/vH) hcap hw
    (div_nonneg hrC hv.1.le) (div_nonneg hH.le hv.2.le) hcredit hentropy hVC hVH
  rw [protected_energy_optimal_exponential rC vC hv.1,protected_energy_optimal_exponential H vH hv.2] at h
  exact h.trans (hPgt n ((le_max_right _ _).trans hnn))

end NoThreeLine

#print axioms NoThreeLine.exists_protectedCell_onePhase_power_tail

