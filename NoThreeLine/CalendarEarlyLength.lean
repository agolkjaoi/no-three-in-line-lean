import NoThreeLine.FinitePhaseComposition

/-! Deterministic lengths cut by a single elapsed-time boundary. Their
sum telescopes, so no factor equal to the number of phases is introduced. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def earlyPhaseLength {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (τ : ℝ) (N : ℕ) : ℝ :=
  min (cs N).horizon (max 0 (τ-phaseEndpoint cs 0 N))

theorem earlyPhaseLength_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (τ : ℝ) (N : ℕ) : 0≤earlyPhaseLength cs τ N ∧ earlyPhaseLength cs τ N≤(cs N).horizon :=
  ⟨le_min (cs N).horizon.coe_nonneg (le_max_left _ _),min_le_left _ _⟩

theorem earlyPhaseLength_eq_diff {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (τ : ℝ) (N : ℕ) :
    earlyPhaseLength cs τ N=min τ (phaseEndpoint cs 0 (N+1))-min τ (phaseEndpoint cs 0 N) := by
  rw [phaseEndpoint_succ]
  have hH := (cs N).horizon.coe_nonneg
  unfold earlyPhaseLength
  simp only [min_def,max_def]
  split_ifs <;> linarith

theorem sum_earlyPhaseLength {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (τ : ℝ) (hτ : 0≤τ) (J : ℕ) :
    (∑N∈Finset.range J,earlyPhaseLength cs τ N)=min τ (phaseEndpoint cs 0 J) := by
  induction J with
  | zero => simp [phaseEndpoint_zero,min_eq_right hτ]
  | succ J ih =>
    rw [Finset.sum_range_succ,ih,earlyPhaseLength_eq_diff]
    ring

theorem sum_earlyPhaseLength_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (τ : ℝ) (hτ : 0≤τ) (J : ℕ) : (∑N∈Finset.range J,earlyPhaseLength cs τ N)≤τ := by
  rw [sum_earlyPhaseLength cs τ hτ J]
  exact min_le_left _ _

theorem elapsed_lt_of_early {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (τ start : ℝ) (N : ℕ) (t : ℝ) (ht : t∈Set.Ioo (0:ℝ) (earlyPhaseLength cs τ N)) :
    phaseEndpoint cs start N-start+t<τ := by
  have hright := ht.2.trans_le (min_le_right ((cs N).horizon:ℝ) (max 0 (τ-phaseEndpoint cs 0 N)))
  have hsub : 0<τ-phaseEndpoint cs 0 N := by
    by_contra h
    rw [max_eq_left (le_of_not_gt h)] at hright
    linarith [ht.1]
  rw [max_eq_right hsub.le] at hright
  have he : phaseEndpoint cs start N-start=phaseEndpoint cs 0 N := by simp [phaseEndpoint]
  rw [he]
  linarith

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.sum_earlyPhaseLength
#print axioms NoThreeLine.BirthWitness.elapsed_lt_of_early
