import NoThreeLine.ProcessState

/-! The finite generator identity for the actual common-state birth operation.
The active event set and its safety are derived from the state invariant.
This algebraic generator identity is not a stochastic compensator theorem. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine

def ProcessState.activeEvents {n : ℕ} (s : ProcessState n) : Finset (Grid n) :=
  Finset.univ.filter (fun q => (s.accounts q).status = .active)

@[simp] theorem ProcessState.mem_activeEvents {n : ℕ} (s : ProcessState n) (q : Grid n) :
    q ∈ s.activeEvents ↔ (s.accounts q).status = .active := by
  simp [activeEvents]

def ProcessState.birthRate {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ)
    (q : Grid n) : ℝ :=
  if s.stopped = false ∧ (s.accounts q).status = .active then
    mask q * (s.accounts q).weight / n else 0

theorem ProcessState.birthRate_nonneg {n : ℕ} (s : ProcessState n)
    (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q) (hs : s.Valid) (q : Grid n) :
    0 ≤ s.birthRate mask q := by
  unfold birthRate
  split_ifs
  · exact div_nonneg (mul_nonneg (hm q) (hs.2.2 q)) (Nat.cast_nonneg _)
  · exact le_rfl

def ProcessState.creditJumpGenerator {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (rate : Grid n → ℝ) (positive : Grid n → Grid n → Bool)
    (p : Grid n) : ℝ :=
  ∑ q ∈ s.activeEvents, rate q *
    (((s.birth Γ q (positive q)).accounts p).credit - (s.accounts p).credit)

def ProcessState.continuousCreditDrift {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (rate : Grid n → ℝ) (p : Grid n) : ℝ :=
  if s.stopped = false ∧ (s.accounts p).status = .active then
    (s.accounts p).weight *
      ∑ q ∈ s.activeEvents, rate q * localGrowthFactor Γ s.selected p q
  else 0

theorem ProcessState.active_credit_generator {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (rate : Grid n → ℝ) (positive : Grid n → Grid n → Bool)
    (p : Grid n) (hs : s.Valid) (hstop : s.stopped = false)
    (hp : (s.accounts p).status = .active) :
    s.continuousCreditDrift Γ rate p + s.creditJumpGenerator Γ rate positive p = 0 := by
  have he : s.accounts p = ⟨.active,(s.accounts p).weight⟩ := by
    cases ha : s.accounts p
    simp_all
  have hj : s.creditJumpGenerator Γ rate positive p =
      ∑ q ∈ s.activeEvents, rate q *
        ((birthAccount Γ s.selected p q ⟨.active,(s.accounts p).weight⟩
          (positive q p)).credit - (s.accounts p).weight) := by
    apply Finset.sum_congr rfl
    intro q hq
    have hqa := (s.mem_activeEvents q).mp hq
    simp only [ProcessState.birth, hstop, hqa, and_self, if_true]
    rw [he]
    simp [CreditAccount.credit]
  rw [hj]
  simp only [continuousCreditDrift,hstop,hp,and_self,if_true]
  exact birth_credit_compensation Γ s.selected p s.activeEvents rate
    (s.accounts p).weight (fun q => positive q p) (hs.2.1 p hp)
    (fun q hq => (hs.2.1 q ((s.mem_activeEvents q).mp hq)).1)

theorem ProcessState.credit_generator {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (rate : Grid n → ℝ) (positive : Grid n → Grid n → Bool)
    (p : Grid n) (hs : s.Valid) :
    s.continuousCreditDrift Γ rate p + s.creditJumpGenerator Γ rate positive p = 0 := by
  by_cases hstop : s.stopped = false
  · by_cases hp : (s.accounts p).status = .active
    · exact s.active_credit_generator Γ rate positive p hs hstop hp
    · simp only [continuousCreditDrift,hp,and_false,if_false,zero_add]
      apply Finset.sum_eq_zero
      intro q hq
      have hqa := (s.mem_activeEvents q).mp hq
      simp only [birth,hstop,hqa,and_self,if_true]
      rw [birthAccount_inactive_credit _ _ _ _ _ _ hp]
      ring
  · simp [continuousCreditDrift,creditJumpGenerator,birth,hstop]

theorem ProcessState.birth_card {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q : Grid n) (positive : Grid n → Bool)
    (hs : s.Valid) (hstop : s.stopped = false) (hq : (s.accounts q).status = .active) :
    (s.birth Γ q positive).selected.card = s.selected.card + 1 := by
  simp only [birth,hstop,hq,and_self,if_true]
  simp [(hs.2.1 q hq).1]

end NoThreeLine

#print axioms NoThreeLine.ProcessState.birthRate_nonneg
#print axioms NoThreeLine.ProcessState.credit_generator
#print axioms NoThreeLine.ProcessState.birth_card
