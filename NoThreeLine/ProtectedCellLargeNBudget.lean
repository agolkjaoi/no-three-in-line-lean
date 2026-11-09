import NoThreeLine.ProtectedClockTailDecay
import NoThreeLine.ProtectedCellSourceCap

/-! Deterministic budgets for the actual stopped-cell argument. A fixed
linear credit gap leaves a linear credit surplus, and the entropy
surplus and its cost budget use the same n log n scale. -/
set_option autoImplicit false
set_option maxHeartbeats 2500000
noncomputable section
namespace NoThreeLine
open AuxiliaryODE BirthWitness LineDrift FiniteWitnessMoments

def protectedCellEntropyBudget (n : ℕ) (C d : ℝ) : ℝ :=
  (entropyLogConstant d*Real.log n)*(C*n)

theorem entropyLogConstant_pos (d : ℝ) (hd : 0≤d) : 0<entropyLogConstant d := by
  have h2 : 0<Real.log (2:ℝ) := Real.log_pos (by norm_num)
  have h4 : 0≤Real.log (4:ℝ) := Real.log_nonneg (by norm_num)
  unfold entropyLogConstant
  positivity

theorem exists_protectedCellLargeN_budget (T C d g : ℝ)
    (hT : 0≤T) (hC : 1≤C) (hd : 0≤d) (hd1 : d<1) (hg : 0<g) :
    ∃n0 : ℕ,2≤n0 ∧ ∀ n≥n0,∀(cfg : FlowConfig n) (L : LineIndex n) (E : Finset (Grid n)),
      1≤cfg.B → cfg.B≤(n:ℝ)^d → (cfg.horizon:ℝ)≤T →
      specified cfg.directions L → E⊆L.val → ∀ N≤1,∀(s : ProtectedTimedState cfg) (cap : ℝ),
      (∀q∈E,0≤s.2 q ∧ s.2 q≤2*cfg.B) →
      cap≤C*n → protectedTimedCreditTotal cfg L E s+g*n≤cap →
      let β := (cfg.B/n)*(1-b N)
      let H := protectedCellEntropyBudget n C d
      0≤cap ∧ 0<H ∧
      protectedTimedCreditTotal cfg L E s+cfg.horizon*(β*cap)+(g/2)*n≤cap ∧
      protectedTimedEntropyTotal cfg L E s+
        cfg.horizon*(β*((entropyLogConstant d*Real.log n)*max 1 cap))+H≤3*H := by
  let η := min (g/2) 1
  have hη : 0<η := lt_min (by linarith) zero_lt_one
  obtain ⟨n0,hn02,hdrift⟩ := exists_clock_positive_drift_small T C d η hT (by linarith) hd1 hη
  refine ⟨n0,hn02,?_⟩
  intro n hnn cfg L E hB hBd htime hsp hE N hN s cap hsv hcap hgap
  let β := (cfg.B/n)*(1-b N)
  let ℓ := entropyLogConstant d*Real.log n
  let H := protectedCellEntropyBudget n C d
  have hn := hn02.trans hnn
  have hnR : (0:ℝ)<n := by exact_mod_cast (show 0<n by omega)
  have hn1 : (1:ℝ)≤n := by exact_mod_cast (show 1≤n by omega)
  have hℓ : 0<ℓ := mul_pos (entropyLogConstant_pos d hd) (log_nat_pos hn)
  have hH : 0<H := mul_pos hℓ (mul_pos (by linarith) hnR)
  have hB0 : 0≤cfg.B := by linarith
  have hratio : 0≤cfg.B/n := div_nonneg hB0 hnR.le
  have hβ : 0≤β := mul_nonneg hratio (one_sub_b_bounds N hN).1
  have hβle : β≤cfg.B/n := mul_le_of_le_one_right hratio ((one_sub_b_bounds N hN).2.trans (by norm_num))
  have hcredit0 : 0≤protectedTimedCreditTotal cfg L E s := by
    apply Finset.sum_nonneg
    intro q hq
    exact (protectedLineCredit_bounds_all L _ s.2 cfg.directions hsp q (hE hq) cfg.B
      s.1.property.1.1 (hsv q hq)).1
  have hcap0 : 0≤cap := (add_nonneg hcredit0 (mul_nonneg hg.le hnR.le)).trans hgap
  have hCn : 1≤C*(n:ℝ) := by
    have h := mul_le_mul_of_nonneg_right hC hnR.le
    linarith
  have hbound : max 1 cap≤C*(n:ℝ) := max_le hCn hcap
  have h₁ : cfg.horizon*(β*max 1 cap)≤T*(cfg.B/n)*(C*n) := by
    rw [mul_assoc T]
    exact mul_le_mul htime
      (mul_le_mul hβle hbound (zero_le_one.trans (le_max_left _ _)) hratio)
      (mul_nonneg hβ (zero_le_one.trans (le_max_left _ _))) hT
  have hsmall := h₁.trans (hdrift n hnn cfg.B hB0 hBd).1
  have hsmallC : cfg.horizon*(β*cap)≤(g/2)*n :=
    ((mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left (le_max_right _ _) hβ)
      cfg.horizon.coe_nonneg).trans hsmall).trans
        (mul_le_mul_of_nonneg_right (min_le_left _ _) hnR.le)
  have hsmallH : cfg.horizon*(β*(ℓ*max 1 cap))≤H := by
    have h := hsmall.trans (mul_le_mul_of_nonneg_right (min_le_right (g/2) 1) hnR.le)
    have hr : cfg.horizon*(β*max 1 cap)≤C*(n:ℝ) :=
      (by simpa using h : cfg.horizon*(β*max 1 cap)≤(n:ℝ)).trans
        (le_mul_of_one_le_left hnR.le hC)
    calc
      _ = ℓ*(cfg.horizon*(β*max 1 cap)) := by ring
      _ ≤ H := mul_le_mul_of_nonneg_left hr hℓ.le
  have hH0 := (protectedEntropyTotal_nonneg_le_credit_log s.1.val.1.physical s.2
    cfg.directions L E cfg.B d hn hB hd hBd s.1.property.1.1 hsp hE hsv).2
  change protectedTimedEntropyTotal cfg L E s≤ℓ*max 1 (protectedTimedCreditTotal cfg L E s) at hH0
  have hinitial : protectedTimedEntropyTotal cfg L E s≤H :=
    hH0.trans (mul_le_mul_of_nonneg_left (max_le hCn
      ((le_add_of_nonneg_right (mul_nonneg hg.le hnR.le)).trans (hgap.trans hcap))) hℓ.le)
  change 0≤cap ∧ 0<H ∧ protectedTimedCreditTotal cfg L E s+cfg.horizon*(β*cap)+(g/2)*n≤cap ∧
    protectedTimedEntropyTotal cfg L E s+cfg.horizon*(β*(ℓ*max 1 cap))+H≤3*H
  exact ⟨hcap0,hH,by linarith only [hsmallC,hgap],by linarith only [hinitial,hsmallH]⟩

end NoThreeLine

#print axioms NoThreeLine.exists_protectedCellLargeN_budget

