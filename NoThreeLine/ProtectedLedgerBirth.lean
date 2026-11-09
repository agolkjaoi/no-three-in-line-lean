import NoThreeLine.ProtectedInactiveStatus

/-! Birth laws for the actual protected ledger, including simultaneous
positive retirement. Existing saved entries are unchanged even when the
line occupancy or protection changes at a later birth. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines MixedConnection LineDrift

theorem protectedLineCredit_birth_eq_snapshot {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (q p : Grid n) (positive : Grid n→Bool)
    (hp : (e.process.accounts p).status=.active) :
    protectedLineCredit L (e.birth Γ q positive) (protectedLineSave L e (e.birth Γ q positive) saved) p=
      specifiedLineWeight (birthSnapshot e Γ q) L p := by
  rw [protectedLineCredit_after_active L e _ saved p hp]
  have hea : e.process.accounts p=⟨.active,(e.process.accounts p).weight⟩ := by
    cases ha : e.process.accounts p
    simp_all
  unfold specifiedLineWeight birthSnapshot ExtendedState.birth ProcessState.birth
  split_ifs
  · dsimp only
    rw [hea,birthAccount_active_credit,birthAccount_weight _ _ _ _ _ (by rfl)]
    rfl
  · simp only [CreditAccount.credit,hp,true_or,if_true]

theorem protectedLineCredit_birth_inactive {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (q p : Grid n) (positive : Grid n→Bool)
    (hp : (e.process.accounts p).status≠.active) :
    protectedLineCredit L (e.birth Γ q positive) (protectedLineSave L e (e.birth Γ q positive) saved) p=
      protectedLineCredit L e saved p := by
  have ha : ((e.birth Γ q positive).process.accounts p)=e.process.accounts p :=
    ProcessState.birth_account_of_inactive e.process Γ p q positive hp
  unfold protectedLineCredit
  rw [ha,protectedLineSave_inactive L e _ saved p hp]
  cases hs : (e.process.accounts p).status <;> simp_all [CreditAccount.credit]

theorem protectedLineCredit_external_birth {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (q p : Grid n) (positive : Grid n→Bool)
    (he : e.process.Valid) (hs : e.process.stopped=false) (hq : q∈e.process.activeEvents)
    (hp : p∈e.process.activeEvents) (hqL : q∉L.val) :
    protectedLineCredit L (e.birth Γ q positive) (protectedLineSave L e (e.birth Γ q positive) saved) p=
      birthMultiplier Γ e.process.selected p q*protectedLineCredit L e saved p := by
  have hpa := (e.process.mem_activeEvents p).mp hp
  rw [protectedLineCredit_birth_eq_snapshot L e saved Γ q p positive hpa,
    protectedLineCredit_active L e saved p hpa]
  exact specifiedLineWeight_external_birth e Γ L p q he hs hq hp hqL

theorem protectedLineCredit_first_line_birth {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (q p : Grid n) (positive : Grid n→Bool)
    (he : e.process.Valid) (hs : e.process.stopped=false) (hq : q∈e.process.activeEvents)
    (hpL : p∈L.val) (hqL : q∈L.val) (hsp : specified Γ L)
    (hN : occupancy e.process L=0) (hpq : p≠q) :
    protectedLineCredit L (e.birth Γ q positive) (protectedLineSave L e (e.birth Γ q positive) saved) p=
      protectedLineCredit L e saved p := by
  by_cases hp : (e.process.accounts p).status=.active
  · rw [protectedLineCredit_birth_eq_snapshot L e saved Γ q p positive hp,protectedLineCredit_active L e saved p hp]
    exact specifiedLineWeight_first_line_birth e Γ L p q he hs hq ((e.process.mem_activeEvents p).mpr hp) hpL hqL hsp hN hpq
  · exact protectedLineCredit_birth_inactive L e saved Γ q p positive hp

theorem protectedLineCredit_second_line_birth {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (q p : Grid n) (positive : Grid n→Bool)
    (he : e.process.Valid) (hs : e.process.stopped=false) (hq : q∈e.process.activeEvents)
    (hp : (e.process.accounts p).status=.active) (hqL : q∈L.val) (hN : occupancy e.process L=1) :
    protectedLineCredit L (e.birth Γ q positive) (protectedLineSave L e (e.birth Γ q positive) saved) p=0 := by
  rw [protectedLineCredit_birth_eq_snapshot L e saved Γ q p positive hp]
  exact specifiedLineWeight_second_line_birth e Γ L p q he hs hq hqL hN

def protectedLedgerExternalJumpRate {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (p : Grid n) : ℝ :=
  ∑q∈e.process.activeEvents,if q∈L.val then 0 else e.process.birthRate mask q*
    (protectedLineCredit L (e.birth Γ q (positive q)) (protectedLineSave L e (e.birth Γ q (positive q)) saved) p-
      protectedLineCredit L e saved p)

theorem protectedLedgerExternalJumpRate_eq {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (p : Grid n) (he : e.process.Valid) (hs : e.process.stopped=false)
    (hp : (e.process.accounts p).status=.active) :
    protectedLedgerExternalJumpRate e saved Γ mask positive L p=protectedExternalJumpRate e Γ mask positive L p := by
  rw [protectedExternalJumpRate_eq e Γ mask positive L p he hs hp]
  unfold protectedLedgerExternalJumpRate externalLineGrowth
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q hq
  by_cases hqL : q∈L.val
  · simp only [if_pos hqL,mul_zero]
  · rw [if_neg hqL,if_neg hqL,protectedLineCredit_external_birth L e saved Γ q p (positive q) he hs hq
      ((e.process.mem_activeEvents p).mpr hp) hqL,protectedLineCredit_active L e saved p hp]
    rw [growthFactor_eq_loss Γ e.process.selected p q (he.2.1 p hp) (he.2.1 q ((e.process.mem_activeEvents q).mp hq)).1]
    ring

theorem protectedLedger_generator {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (p : Grid n) (he : e.process.Valid) (hs : e.process.stopped=false)
    (hp : (e.process.accounts p).status=.active) (hpL : p∈L.val) (hsp : specified Γ L) :
    protectedLineContinuousDrift e Γ mask L p+protectedLedgerExternalJumpRate e saved Γ mask positive L p=
      protectedLinePositiveDrift e mask L p := by
  rw [protectedLedgerExternalJumpRate_eq e saved Γ mask positive L p he hs hp]
  exact protectedLine_generator e Γ mask positive L p he hs hp hpL hsp

end NoThreeLine

#print axioms NoThreeLine.protectedLineCredit_first_line_birth
#print axioms NoThreeLine.protectedLineCredit_second_line_birth
#print axioms NoThreeLine.protectedLedger_generator
