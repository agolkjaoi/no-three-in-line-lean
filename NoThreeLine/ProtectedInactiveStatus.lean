import NoThreeLine.ProtectedRetirementLedger
import NoThreeLine.RecycledCompletion

/-! Actual inactive account statuses are absorbing, including through
flow, candidate geometry, positive retirement and global stopping. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE

theorem CreditAccount.retire_eq_of_inactive (a : CreditAccount) (positive : Bool)
    (ha : a.status≠.active) : a.retire positive=a := by
  simp only [CreditAccount.retire,ha,false_and,if_false]

theorem ProcessState.birth_account_of_inactive {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (p q : Grid n) (positive : Grid n→Bool)
    (hp : (s.accounts p).status≠.active) :
    (s.birth Γ q positive).accounts p=s.accounts p := by
  unfold ProcessState.birth
  split_ifs
  · simp only [birthAccount,birthGeometry,hp,if_false,CreditAccount.retire_eq_of_inactive _ _ hp]
  · rfl

theorem ExtendedState.candidateUpdate_inactive_status {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ) (p q : Grid n)
    (positive : Grid n→Bool) (mark : ℝ) (hp : (e.process.accounts p).status≠.active) :
    ((e.candidateUpdate Γ mask B q positive mark).process.accounts p).status=(e.process.accounts p).status := by
  rw [candidateUpdate_eq]
  split_ifs
  · exact congrArg CreditAccount.status (ProcessState.birth_account_of_inactive e.process Γ p q positive hp)
  · rfl

theorem AugmentedState.resolve_inactive_status {n : ℕ} (e : AugmentedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ) (p : Grid n)
    (hp : (e.physical.process.accounts p).status≠.active) :
    ((e.resolve Γ B K ρ ε M).physical.process.accounts p).status=(e.physical.process.accounts p).status := by
  unfold AugmentedState.resolve ExtendedState.stop ExtendedState.resolve resolveBoundary
  split_ifs <;> simp only [ProcessState.stop,ProcessState.retire,CreditAccount.retire_eq_of_inactive _ _ hp]

theorem augOutcome_inactive_status {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (p : Grid n) (hp : (x.1.1.val.process.accounts p).status≠.active)
    (z : (ℝ×Grid n)×ℝ) :
    ((augOutcome cfg ε M (x,z)).physical.process.accounts p).status=(x.1.1.val.process.accounts p).status := by
  have hraw : ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).status=
      (x.1.1.val.process.accounts p).status := by
    unfold augRawOutcome
    split_ifs
    · exact ExtendedState.candidateUpdate_inactive_status _ cfg.directions cfg.mask cfg.B p _ _ _ hp
    · rfl
  rw [augOutcome,AugmentedState.resolve_inactive_status _ _ _ _ _ _ _ p (by rw [hraw]; exact hp),hraw]

theorem augTimedStep_inactive_status {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (p : Grid n) (hp : (s.val.1.physical.process.accounts p).status≠.active)
    (z : (ℝ×Grid n)×ℝ) :
    ((augTimedStep cfg ε M (s,z)).val.1.physical.process.accounts p).status=(s.val.1.physical.process.accounts p).status := by
  change ((augTimedStepPair cfg ε M (s,z)).1.physical.process.accounts p).status=_
  unfold augTimedStepPair
  split_ifs
  · rfl
  · exact augOutcome_inactive_status cfg ε M (augTimedInput cfg s) p hp z

theorem augRecycledPair_inactive_status {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (p : Grid n) (hp : (s.val.1.physical.process.accounts p).status≠.active)
    (k : ℕ) (ω : BoardClockPath n) :
    ((augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process.accounts p).status=(s.val.1.physical.process.accounts p).status := by
  induction k with
  | zero => rfl
  | succ k ih =>
    have hk : ((augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process.accounts p).status≠.active := by
      rw [ih]
      exact hp
    exact (augTimedStep_inactive_status cfg ε M (augRecycledPair cfg ε M hn s k ω).1 p hk _).trans ih

end NoThreeLine

#print axioms NoThreeLine.augRecycledPair_inactive_status
