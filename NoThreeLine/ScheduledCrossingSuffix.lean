import NoThreeLine.ScheduledCrossingTail

/-! Starting a suffix at its original absolute boundary preserves every
phase endpoint, its marked ledger and its residual board. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem phaseEndpoint_suffix {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start : ℝ) (i k : ℕ) :
    phaseEndpoint (fun j=>cs (i+j)) (phaseEndpoint cs start i) k =
      phaseEndpoint cs start (i+k) := by
  induction k with
  | zero => rw [phaseEndpoint_zero,Nat.add_zero]
  | succ k ih =>
    change phaseEndpoint (fun j=>cs (i+j)) (phaseEndpoint cs start i) (k+1) =
      phaseEndpoint cs start (i+k+1)
    rw [phaseEndpoint_succ,phaseEndpoint_succ,ih]

theorem scheduledCrossingPair_suffix {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (i j : ℕ)
    (x : ProtectedPhaseState n B×BoardClockPath n) :
    scheduledCrossingPair (fun k=>cs (i+k)) ε M deadline (phaseEndpoint cs start i)
      L N E A hn b j x =
    scheduledCrossingPair cs ε M deadline start L N E A hn b (i+j) x := by
  simp only [scheduledCrossingPair,phaseEndpoint_suffix,Nat.add_assoc]

theorem scheduledCrossingTail_suffix {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (i j k : ℕ)
    (x : ProtectedPhaseState n B×BoardClockPath n) :
    scheduledCrossingTail (fun q=>cs (i+q)) ε M deadline (phaseEndpoint cs start i)
      L N E A hn b j k x =
    scheduledCrossingTail cs ε M deadline start L N E A hn b (i+j) k x := by
  induction k generalizing j x with
  | zero => rfl
  | succ k ih =>
    simp only [scheduledCrossingTail,scheduledCrossingPair_suffix,ih,Nat.add_assoc]

end NoThreeLine

#print axioms NoThreeLine.scheduledCrossingTail_suffix

