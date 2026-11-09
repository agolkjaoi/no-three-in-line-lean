import NoThreeLine.MarkedClocks

/-! The paper's actual acceptance threshold m_q w_q/B, with the active/stopped
guard. Its real uniform-mark average recovers the prescribed birth rate.
This is not yet a time-indexed intensity/compensator theorem. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine

def ProcessState.acceptance {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ)
    (B : ℝ) (q : Grid n) : ℝ :=
  if s.stopped = false ∧ (s.accounts q).status = .active then
    mask q * (s.accounts q).weight / B else 0

theorem ProcessState.acceptance_bounds {n : ℕ} (s : ProcessState n)
    (mask : Grid n → ℝ) (B : ℝ) (hB : 0 < B)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (hw : ∀ q, (s.accounts q).status = .active →
      0 ≤ (s.accounts q).weight ∧ (s.accounts q).weight ≤ B) (q : Grid n) :
    0 ≤ s.acceptance mask B q ∧ s.acceptance mask B q ≤ 1 := by
  unfold acceptance
  split_ifs with ha
  · have hprod : mask q * (s.accounts q).weight ≤ B :=
      (mul_le_of_le_one_left (hw q ha.2).1 (hm q).2).trans (hw q ha.2).2
    exact ⟨div_nonneg (mul_nonneg (hm q).1 (hw q ha.2).1) hB.le,
      (div_le_one hB).mpr hprod⟩
  · norm_num

theorem ProcessState.candidate_rate_times_acceptance {n : ℕ} (s : ProcessState n)
    (mask : Grid n → ℝ) (B : ℝ) (hB : B ≠ 0) (q : Grid n) :
    (B/n) * s.acceptance mask B q = s.birthRate mask q := by
  unfold acceptance birthRate
  split_ifs
  · field_simp
  · ring

theorem ProcessState.actual_mark_credit_compensation {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B : ℝ) (hB : 0 < B)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (hw : ∀ q, (s.accounts q).status = .active →
      0 ≤ (s.accounts q).weight ∧ (s.accounts q).weight ≤ B)
    (positive : Grid n → Grid n → Bool) (p : Grid n) (hs : s.Valid) :
    s.continuousCreditDrift Γ (s.birthRate mask) p +
      (∑ q ∈ s.activeEvents, (B/n) *
        (∫ z, (((s.thinnedBirth Γ q (positive q) (s.acceptance mask B q) z).accounts p).credit -
          (s.accounts p).credit) ∂markMeasure)) = 0 := by
  have hh := s.thinned_credit_compensation Γ (fun _ => B/n) (s.acceptance mask B)
    positive p hs (fun q _ => s.acceptance_bounds mask B hB hm hw q)
  have he : (fun q => (B/n) * s.acceptance mask B q) = s.birthRate mask := by
    funext q
    exact s.candidate_rate_times_acceptance mask B hB.ne' q
  rw [he] at hh
  exact hh

end NoThreeLine

#print axioms NoThreeLine.ProcessState.acceptance_bounds
#print axioms NoThreeLine.ProcessState.actual_mark_credit_compensation
