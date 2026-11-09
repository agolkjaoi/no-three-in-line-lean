import NoThreeLine.CandidateAcceptance

/-! Average the actual mark update over a uniform board label. This finite
calculation derives the first-step compensation RHS from actual birth rules;
it does not postulate a continuous-time intensity or a process law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine

def ProcessState.candidateCreditMean {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B : ℝ)
    (positive : Grid n → Grid n → Bool) (p : Grid n) : ℝ :=
  (∑ q : Grid n, ∫ z,
    ((s.thinnedBirth Γ q (positive q) (s.acceptance mask B q) z).accounts p).credit
      ∂markMeasure) / (n : ℝ)^2

theorem ProcessState.all_mark_credit_compensation {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B : ℝ) (hB : 0 < B)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (hw : ∀ q, (s.accounts q).status = .active →
      0 ≤ (s.accounts q).weight ∧ (s.accounts q).weight ≤ B)
    (positive : Grid n → Grid n → Bool) (p : Grid n) (hs : s.Valid) :
    s.continuousCreditDrift Γ (s.birthRate mask) p +
      (∑ q : Grid n, (B/n) *
        (∫ z, (((s.thinnedBirth Γ q (positive q) (s.acceptance mask B q) z).accounts p).credit -
          (s.accounts p).credit) ∂markMeasure)) = 0 := by
  have he := s.actual_mark_credit_compensation Γ mask B hB hm hw positive p hs
  have hsum : (∑ q : Grid n, (B/n) *
        (∫ z, (((s.thinnedBirth Γ q (positive q) (s.acceptance mask B q) z).accounts p).credit -
          (s.accounts p).credit) ∂markMeasure)) =
      ∑ q ∈ s.activeEvents, (B/n) *
        (∫ z, (((s.thinnedBirth Γ q (positive q) (s.acceptance mask B q) z).accounts p).credit -
          (s.accounts p).credit) ∂markMeasure) := by
    symm
    apply Finset.sum_subset (Finset.subset_univ _)
    intro q _ hq
    have hqa : (s.accounts q).status ≠ .active := by simpa using hq
    have ha : s.acceptance mask B q = 0 := by simp [acceptance,hqa]
    rw [ha,s.thinnedBirth_integral_sub Γ q (positive q) 0
      (fun st => (st.accounts p).credit) (by norm_num) (by norm_num)]
    ring
  rw [hsum]
  exact he

theorem ProcessState.candidateCreditMean_compensation {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B : ℝ)
    (hn : 0 < n) (hB : 0 < B)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (hw : ∀ q, (s.accounts q).status = .active →
      0 ≤ (s.accounts q).weight ∧ (s.accounts q).weight ≤ B)
    (positive : Grid n → Grid n → Bool) (p : Grid n) (hs : s.Valid) :
    s.continuousCreditDrift Γ (s.birthRate mask) p =
      ((n : ℝ)*B) * ((s.accounts p).credit - s.candidateCreditMean Γ mask B positive p) := by
  have hh := s.all_mark_credit_compensation Γ mask B hB hm hw positive p hs
  have hj (q : Grid n) :
      (∫ z, (((s.thinnedBirth Γ q (positive q) (s.acceptance mask B q) z).accounts p).credit -
          (s.accounts p).credit) ∂markMeasure) =
        (∫ z, ((s.thinnedBirth Γ q (positive q) (s.acceptance mask B q) z).accounts p).credit
          ∂markMeasure) - (s.accounts p).credit := by
    rw [integral_sub (s.thinnedBirth_integrable Γ q (positive q) (s.acceptance mask B q)
      (fun st => (st.accounts p).credit)) (integrable_const _)]
    simp
  simp_rw [hj] at hh
  rw [← Finset.mul_sum,Finset.sum_sub_distrib] at hh
  simp only [Finset.sum_const,Finset.card_univ,Fintype.card_prod,Fintype.card_fin,nsmul_eq_mul,
    Nat.cast_mul] at hh
  have hnr : (n : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  unfold candidateCreditMean
  have halg : (B/(n : ℝ)) *
      ((∑ q : Grid n, ∫ z,
        ((s.thinnedBirth Γ q (positive q) (s.acceptance mask B q) z).accounts p).credit
          ∂markMeasure) - (n*n : ℝ)*(s.accounts p).credit) =
      -(((n : ℝ)*B) * ((s.accounts p).credit -
        (∑ q : Grid n, ∫ z,
          ((s.thinnedBirth Γ q (positive q) (s.acceptance mask B q) z).accounts p).credit
            ∂markMeasure) / (n : ℝ)^2)) := by
    field_simp
    <;> ring
  rw [halg] at hh
  linarith

end NoThreeLine

#print axioms NoThreeLine.ProcessState.all_mark_credit_compensation
#print axioms NoThreeLine.ProcessState.candidateCreditMean_compensation
