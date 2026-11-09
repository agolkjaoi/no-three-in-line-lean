import NoThreeLine.AugmentedState
import NoThreeLine.ExtendedRetirement
import NoThreeLine.CreditLossRate

/-! Exact causes of retirement or a new global stop at boundary resolution.
The tests are made on the pre-resolution state, as in the ordered update. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem CreditAccount.retire_inactive_iff (a : CreditAccount) (b : Bool)
    (ha : a.status = .active) : (a.retire b).status ≠ .active ↔ b = true := by
  cases b <;> simp [retire,ha]

theorem CreditAccount.positive_inactive_retired (a : CreditAccount)
    (ha : a.status ≠ .active) (hc : 0 < a.credit) : a.status = .retired := by
  cases hs : a.status <;> simp_all [credit]

def rootLocalBoundaryCause {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (B ρ : ℝ) (p : Grid n) : Prop :=
  B ≤ (e.process.accounts p).weight ∨
    ∃ L ∈ newTags e.process Γ e.lineCredits ρ e.handled, p ∈ L.val

theorem rootLocalBoundaryCause_explicit {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (B ρ : ℝ) (p : Grid n) :
    rootLocalBoundaryCause e Γ B ρ p ↔ B ≤ (e.process.accounts p).weight ∨
      ∃ L, (¬specified Γ L ∧ occupancy e.process L = 1 ∧ e.lineCredits L ≤ ρ) ∧
        L ∉ e.handled ∧ p ∈ L.val := by
  simp only [rootLocalBoundaryCause,newTags,triggeredTags,Finset.mem_sdiff,
    Finset.mem_filter,Finset.mem_univ,true_and,and_assoc]

theorem ExtendedState.resolve_inactive_iff {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (B K ρ : ℝ) (p : Grid n)
    (hp : (e.process.accounts p).status = .active) :
    ((e.resolve Γ B K ρ).process.accounts p).status ≠ .active ↔
      clockTriggered e.process Γ K e.clocks ∨ rootLocalBoundaryCause e Γ B ρ p := by
  by_cases hc : clockTriggered e.process Γ K e.clocks
  · simp [resolve,resolveBoundary,hc,ProcessState.stop,CreditAccount.retire,hp]
  · change ((resolveBoundary e.process Γ B K ρ e.clocks e.lineCredits e.handled).accounts p).status ≠ .active ↔ _
    rw [resolveBoundary,if_neg hc]
    simp only [ProcessState.retire]
    rw [CreditAccount.retire_inactive_iff _ _ hp]
    simp [hc,boundaryRetirement,rootLocalBoundaryCause]

theorem ExtendedState.resolve_new_stop_iff {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (B K ρ : ℝ) (hs : e.process.stopped = false) :
    (e.resolve Γ B K ρ).process.stopped = true ↔ clockTriggered e.process Γ K e.clocks := by
  by_cases hc : clockTriggered e.process Γ K e.clocks <;>
    simp [resolve,resolveBoundary,hc,ProcessState.stop,ProcessState.retire,hs]

def rootResolveCause {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (B K ρ ε M : ℝ) (p : Grid n) : Prop :=
  a.auxBad Γ ε M ∨ clockTriggered a.physical.process Γ K a.physical.clocks ∨
    rootLocalBoundaryCause a.physical Γ B ρ p

theorem rootResolveCause_explicit {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (B K ρ ε M : ℝ) (p : Grid n) :
    rootResolveCause a Γ B K ρ ε M p ↔
      ((∃ u v : Grid n, u ≠ v ∧ a.eta u v ≤ 1-ε) ∨
        ∃ L q, M ≤ virtualMass a.physical.process Γ a.physical.coordinates L q) ∨
      (∃ L, specified Γ L ∧ occupancy a.physical.process L ≤ 1 ∧ K ≤ a.physical.clocks L) ∨
      B ≤ (a.physical.process.accounts p).weight ∨
      ∃ L, (¬specified Γ L ∧ occupancy a.physical.process L = 1 ∧ a.physical.lineCredits L ≤ ρ) ∧
        L ∉ a.physical.handled ∧ p ∈ L.val := by
  rw [rootResolveCause,rootLocalBoundaryCause_explicit]
  simp only [AugmentedState.auxBad,etaGuard,virtualGuard,Set.mem_setOf_eq,Set.mem_iUnion,clockTriggered]

theorem AugmentedState.resolve_inactive_iff {n : ℕ} (a : AugmentedState n)
    (Γ : Finset ZPoint) (B K ρ ε M : ℝ) (p : Grid n)
    (hp : (a.physical.process.accounts p).status = .active) :
    ((a.resolve Γ B K ρ ε M).physical.process.accounts p).status ≠ .active ↔
      rootResolveCause a Γ B K ρ ε M p := by
  by_cases ha : a.auxBad Γ ε M
  · simp [resolve,ha,rootResolveCause,ExtendedState.stop,ProcessState.stop,CreditAccount.retire,hp]
  · simp only [resolve,if_neg ha,rootResolveCause,ha,false_or]
    exact a.physical.resolve_inactive_iff Γ B K ρ p hp

theorem AugmentedState.resolve_new_stop_iff {n : ℕ} (a : AugmentedState n)
    (Γ : Finset ZPoint) (B K ρ ε M : ℝ) (hs : a.physical.process.stopped = false) :
    (a.resolve Γ B K ρ ε M).physical.process.stopped = true ↔
      a.auxBad Γ ε M ∨ clockTriggered a.physical.process Γ K a.physical.clocks := by
  by_cases ha : a.auxBad Γ ε M
  · simp [resolve,ha,ExtendedState.stop,ProcessState.stop]
  · simp only [resolve,if_neg ha,ha,false_or]
    exact a.physical.resolve_new_stop_iff Γ B K ρ hs

theorem deadlineRetirement_inactive_iff {n : ℕ} (deadline : Grid n → ℝ)
    (e : ExtendedState n) (t : ℝ) (p : Grid n) (hp : (e.process.accounts p).status = .active) :
    ((deadlineRetirement deadline (e,t)).process.accounts p).status ≠ .active ↔ deadline p ≤ t := by
  change ((e.process.accounts p).retire (decide (deadline p ≤ t))).status ≠ .active ↔ _
  rw [CreditAccount.retire_inactive_iff _ _ hp]
  simp

end NoThreeLine

#print axioms NoThreeLine.rootResolveCause_explicit
#print axioms NoThreeLine.AugmentedState.resolve_inactive_iff
#print axioms NoThreeLine.AugmentedState.resolve_new_stop_iff
#print axioms NoThreeLine.deadlineRetirement_inactive_iff
