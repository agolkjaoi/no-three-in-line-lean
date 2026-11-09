import NoThreeLine.CandidateCreditMean
import NoThreeLine.StateWeightFlow

/-! Pointwise formulas, continuity, and bounds for actual birth credit.
Positive retirement preserves credit, even when its Bool depends on time. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine

theorem ProcessState.birth_credit_formula {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q p : Grid n) (positive : Grid n → Bool) :
    ((s.birth Γ q positive).accounts p).credit =
      if s.stopped = false ∧ (s.accounts q).status = .active then
        if (s.accounts p).status = .active then
          birthMultiplier Γ s.selected p q * (s.accounts p).weight
        else (s.accounts p).credit
      else (s.accounts p).credit := by
  by_cases hq : s.stopped = false ∧ (s.accounts q).status = .active
  · by_cases hp : (s.accounts p).status = .active
    · have he : s.accounts p = ⟨.active,(s.accounts p).weight⟩ := by
        cases ha : s.accounts p
        simp_all
      simp only [birth,if_pos hq,if_pos hp]
      rw [he,birthAccount_active_credit]
    · simpa only [birth,if_pos hq,if_neg hp] using
        birthAccount_inactive_credit Γ s.selected p q (s.accounts p) (positive p) hp
  · simp [birth,hq]

theorem ProcessState.birth_credit_positive_irrel {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q p : Grid n) (positive positive' : Grid n → Bool) :
    ((s.birth Γ q positive).accounts p).credit = ((s.birth Γ q positive').accounts p).credit := by
  rw [s.birth_credit_formula,s.birth_credit_formula]

theorem ProcessState.thinnedBirth_credit_positive_irrel {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q p : Grid n) (α z : ℝ)
    (positive positive' : Grid n → Bool) :
    ((s.thinnedBirth Γ q positive α z).accounts p).credit =
      ((s.thinnedBirth Γ q positive' α z).accounts p).credit := by
  unfold thinnedBirth
  split_ifs
  · exact s.birth_credit_positive_irrel Γ q p positive positive'
  · rfl

theorem ProcessState.withWeights_credit_continuous {n : ℕ} (s : ProcessState n) (p : Grid n) :
    Continuous (fun w => ((s.withWeights w).accounts p).credit) := by
  simp only [withWeights_credit]
  split_ifs <;> fun_prop

theorem ProcessState.withWeights_birth_credit_continuous {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q p : Grid n) (positive : Grid n → Bool) :
    Continuous (fun w => (((s.withWeights w).birth Γ q positive).accounts p).credit) := by
  simp only [birth_credit_formula,withWeights_credit,withWeights_status,withWeights_weight]
  change Continuous (fun w : Grid n → ℝ =>
    if s.stopped = false ∧ (s.accounts q).status = .active then
      if (s.accounts p).status = .active then
        birthMultiplier Γ s.selected p q * w p
      else if (s.accounts p).status = .active ∨ (s.accounts p).status = .retired then w p else 0
    else if (s.accounts p).status = .active ∨ (s.accounts p).status = .retired then w p else 0)
  split_ifs <;> fun_prop

theorem ProcessState.withWeights_acceptance_continuous {n : ℕ} (s : ProcessState n)
    (mask : Grid n → ℝ) (B : ℝ) (q : Grid n) :
    Continuous (fun w => (s.withWeights w).acceptance mask B q) := by
  change Continuous (fun w : Grid n → ℝ =>
    if s.stopped = false ∧ (s.accounts q).status = .active then mask q * w q / B else 0)
  split_ifs <;> fun_prop

theorem CreditAccount.credit_bounds (a : CreditAccount) (B : ℝ)
    (hw : 0 ≤ a.weight ∧ a.weight ≤ B) : 0 ≤ a.credit ∧ a.credit ≤ B := by
  have hB : 0 ≤ B := hw.1.trans hw.2
  unfold credit
  split_ifs
  · exact hw
  · exact ⟨le_rfl,hB⟩

theorem ProcessState.birth_credit_bounds {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q p : Grid n) (positive : Grid n → Bool) (B : ℝ)
    (hw : 0 ≤ (s.accounts p).weight ∧ (s.accounts p).weight ≤ B) :
    0 ≤ ((s.birth Γ q positive).accounts p).credit ∧
      ((s.birth Γ q positive).accounts p).credit ≤ B := by
  rw [s.birth_credit_formula]
  split_ifs
  · have hm := birthMultiplier_bounds Γ s.selected p q
    exact ⟨mul_nonneg hm.1 hw.1,(mul_le_of_le_one_left hw.1 hm.2).trans hw.2⟩
  · exact (s.accounts p).credit_bounds B hw
  · exact (s.accounts p).credit_bounds B hw

theorem ProcessState.thinnedBirth_credit_bounds {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q p : Grid n) (positive : Grid n → Bool) (α z B : ℝ)
    (hw : 0 ≤ (s.accounts p).weight ∧ (s.accounts p).weight ≤ B) :
    0 ≤ ((s.thinnedBirth Γ q positive α z).accounts p).credit ∧
      ((s.thinnedBirth Γ q positive α z).accounts p).credit ≤ B := by
  unfold thinnedBirth
  split_ifs
  · exact s.birth_credit_bounds Γ q p positive B hw
  · exact (s.accounts p).credit_bounds B hw

end NoThreeLine

#print axioms NoThreeLine.ProcessState.birth_credit_formula
#print axioms NoThreeLine.ProcessState.withWeights_birth_credit_continuous
#print axioms NoThreeLine.ProcessState.thinnedBirth_credit_bounds
