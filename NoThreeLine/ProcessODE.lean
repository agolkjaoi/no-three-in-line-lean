import NoThreeLine.ProcessGenerator
import Mathlib.Analysis.ODE.ExistUnique

/-! Fixed discrete state and fixed phase: the actual compensation vector field
is polynomial. We obtain genuine local ODE solutions from Picard-Lindelof.
Boundary hitting, concatenation and a random law are not asserted here. -/
set_option autoImplicit false
noncomputable section
open Set Metric
open scoped NNReal

namespace NoThreeLine

def ProcessState.compensatedVectorField {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (w : Grid n → ℝ) (p : Grid n) : ℝ :=
  if s.stopped = false ∧ (s.accounts p).status = .active then
    w p * ∑ q ∈ s.activeEvents,
      (mask q * w q / n) * localGrowthFactor Γ s.selected p q
  else 0

theorem ProcessState.compensatedVectorField_contDiff {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) :
    ContDiff ℝ 1 (s.compensatedVectorField Γ mask) := by
  apply contDiff_pi.mpr
  intro p
  by_cases h : s.stopped = false ∧ (s.accounts p).status = .active
  · simp only [compensatedVectorField,if_pos h]
    fun_prop
  · simp only [compensatedVectorField,if_neg h]
    fun_prop

theorem ProcessState.compensatedVectorField_at_state {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (p : Grid n) :
    s.compensatedVectorField Γ mask (fun q => (s.accounts q).weight) p =
      s.continuousCreditDrift Γ (s.birthRate mask) p := by
  by_cases h : s.stopped = false ∧ (s.accounts p).status = .active
  · simp only [compensatedVectorField,continuousCreditDrift,if_pos h]
    congr 1
    apply Finset.sum_congr rfl
    intro q hq
    have ha := (s.mem_activeEvents q).mp hq
    simp [birthRate,h.1,ha]
  · simp [compensatedVectorField,continuousCreditDrift,h]

theorem ProcessState.compensatedVectorField_nonneg {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask w : Grid n → ℝ)
    (hm : ∀ p, 0 ≤ mask p) (hw : ∀ p, 0 ≤ w p) (p : Grid n) :
    0 ≤ s.compensatedVectorField Γ mask w p := by
  unfold compensatedVectorField
  split_ifs
  · apply mul_nonneg (hw p)
    apply Finset.sum_nonneg
    intro q _
    apply mul_nonneg (div_nonneg (mul_nonneg (hm q) (hw q)) (Nat.cast_nonneg _))
    unfold localGrowthFactor
    split_ifs <;> norm_num
  · exact le_rfl

/-- A genuine local flow, jointly continuous in its starting weight vector
and time, for each fixed discrete state and fixed phase mask. -/
theorem ProcessState.local_compensated_flow {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask w₀ : Grid n → ℝ) (t₀ : ℝ) :
    ∃ r > (0 : ℝ), ∃ ε > (0 : ℝ), ∃ φ : ((Grid n → ℝ) × ℝ) → (Grid n → ℝ),
      (∀ w ∈ closedBall w₀ r, φ (w,t₀) = w ∧
        ∀ t ∈ Icc (t₀-ε) (t₀+ε),
          HasDerivWithinAt (fun t => φ (w,t))
            (s.compensatedVectorField Γ mask (φ (w,t))) (Icc (t₀-ε) (t₀+ε)) t) ∧
      ContinuousOn φ (closedBall w₀ r ×ˢ Icc (t₀-ε) (t₀+ε)) := by
  have hf := (s.compensatedVectorField_contDiff Γ mask).contDiffAt (x := w₀)
  obtain ⟨ε,hε,a,r,L,K,hr,hpl⟩ := IsPicardLindelof.of_contDiffAt_one hf
  obtain ⟨φ,hφ,hcont⟩ :=
    (hpl t₀).exists_forall_mem_closedBall_eq_hasDerivWithinAt_continuousOn
  exact ⟨r,hr,ε,hε,φ,hφ,hcont⟩

end NoThreeLine

#print axioms NoThreeLine.ProcessState.compensatedVectorField_contDiff
#print axioms NoThreeLine.ProcessState.compensatedVectorField_at_state
#print axioms NoThreeLine.ProcessState.local_compensated_flow
