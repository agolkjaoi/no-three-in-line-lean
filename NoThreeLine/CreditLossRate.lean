import NoThreeLine.StateMeasurable

/-! Exact loss accounting for actual saved credit. A stopped snapshot may
still have active labels, so the stopped flag is retained explicitly. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

def CreditAccount.activeCredit (a : CreditAccount) : ℝ :=
  if a.status = .active then a.weight else 0

def CreditAccount.retiredCredit (a : CreditAccount) : ℝ :=
  if a.status = .retired then a.weight else 0

theorem CreditAccount.credit_split (a : CreditAccount) :
    a.credit=a.activeCredit+a.retiredCredit := by
  rcases a with ⟨status,w⟩
  cases status <;> simp [credit,activeCredit,retiredCredit]

def ProcessState.birthUnavailable {n : ℕ} (s : ProcessState n) (p : Grid n) : Prop :=
  s.stopped=true ∨ (s.accounts p).status=.retired

instance {n : ℕ} (s : ProcessState n) (p : Grid n) : Decidable (s.birthUnavailable p) :=
  inferInstanceAs (Decidable (s.stopped=true ∨ (s.accounts p).status=.retired))

def ProcessState.birthCreditLoss {n : ℕ} (s : ProcessState n) (p : Grid n) : ℝ :=
  if s.birthUnavailable p then (s.accounts p).credit else 0

theorem ProcessState.birthUnavailable_measurableSet {n : ℕ} (p : Grid n) :
    MeasurableSet {s : ProcessState n | s.birthUnavailable p} :=
  ((measurableSet_singleton true).preimage (measurable_stopped n)).union
    ((measurableSet_singleton CreditStatus.retired).preimage
      (CreditAccount.measurable_status.comp ((measurable_pi_apply p).comp (measurable_accounts n))))

theorem ProcessState.birthCreditLoss_measurable {n : ℕ} (p : Grid n) :
    Measurable (fun s : ProcessState n=>s.birthCreditLoss p) :=
  Measurable.ite (birthUnavailable_measurableSet p)
    (CreditAccount.measurable_credit.comp ((measurable_pi_apply p).comp (measurable_accounts n))) measurable_const

theorem ProcessState.birthCreditLoss_split {n : ℕ} (s : ProcessState n) (p : Grid n) :
    s.birthCreditLoss p=(s.accounts p).retiredCredit+
      if s.stopped=true then (s.accounts p).activeCredit else 0 := by
  rcases s with ⟨selected,accounts,stopped⟩
  cases stopped <;> cases hs : (accounts p).status <;>
    simp [birthCreditLoss,birthUnavailable,CreditAccount.credit,
      CreditAccount.activeCredit,CreditAccount.retiredCredit,hs]

theorem ProcessState.birthRate_credit_loss {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ) (p : Grid n) :
    s.birthRate mask p=(mask p/n)*((s.accounts p).credit-s.birthCreditLoss p) := by
  rcases s with ⟨selected,accounts,stopped⟩
  cases stopped <;> cases hs : (accounts p).status <;>
    simp [birthRate,birthCreditLoss,birthUnavailable,CreditAccount.credit,hs] <;> ring

theorem ProcessState.birthCreditLoss_bounds {n : ℕ} (s : ProcessState n) (p : Grid n)
    (h : 0≤(s.accounts p).credit) :
    0≤s.birthCreditLoss p ∧ s.birthCreditLoss p≤(s.accounts p).credit := by
  unfold birthCreditLoss
  split_ifs <;> simp_all

theorem ProcessState.birthRate_le_credit {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ)
    (p : Grid n) (hm : 0≤mask p) (hc : 0≤(s.accounts p).credit) :
    s.birthRate mask p≤(mask p/n)*(s.accounts p).credit := by
  rw [birthRate_credit_loss]
  exact mul_le_mul_of_nonneg_left (sub_le_self _ (s.birthCreditLoss_bounds p hc).1)
    (div_nonneg hm (Nat.cast_nonneg n))

theorem ProcessState.masked_loss_zero {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ)
    (p : Grid n) (hm : mask p=0) : mask p*s.birthCreditLoss p=0 := by rw [hm,zero_mul]

end NoThreeLine

#print axioms NoThreeLine.ProcessState.birthRate_credit_loss
#print axioms NoThreeLine.ProcessState.birthCreditLoss_split
