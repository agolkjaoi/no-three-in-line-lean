import NoThreeLine.ProcessGenerator
import Mathlib.Data.NNReal.Defs

/-! Deterministic traces of the common state. Accepted births are counted
exactly, so every trace has at most n^2 such births. Flow segments here are
data, not a claimed construction of the stopped ODE or a stochastic law. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine

inductive ProcessEvent (n : ℕ) where
  | birth (q : Grid n) (positive : Grid n → Bool)
  | retirement (positive : Grid n → Bool)
  | halt
  | growth (factor : Grid n → NNReal)

def ProcessState.step {n : ℕ} (s : ProcessState n) (Γ : Finset (ℤ × ℤ))
    (event : ProcessEvent n) : ProcessState n :=
  match event with
  | .birth q positive => s.birth Γ q positive
  | .retirement positive => s.retire positive
  | .halt => s.stop
  | .growth factor => s.grow (fun p => factor p)

def ProcessState.eventBirthCount {n : ℕ} (s : ProcessState n)
    (event : ProcessEvent n) : ℕ :=
  match event with
  | .birth q _ => if s.stopped = false ∧ (s.accounts q).status = .active then 1 else 0
  | _ => 0

def ProcessState.runTrace {n : ℕ} (s : ProcessState n) (Γ : Finset (ℤ × ℤ))
    (events : List (ProcessEvent n)) : ProcessState n := events.foldl (fun s e => s.step Γ e) s

def ProcessState.traceBirthCount {n : ℕ} (s : ProcessState n) (Γ : Finset (ℤ × ℤ)) :
    List (ProcessEvent n) → ℕ
  | [] => 0
  | e :: es => s.eventBirthCount e + (s.step Γ e).traceBirthCount Γ es

theorem ProcessState.step_valid {n : ℕ} (s : ProcessState n) (Γ : Finset (ℤ × ℤ))
    (event : ProcessEvent n) (hs : s.Valid) : (s.step Γ event).Valid := by
  cases event with
  | birth q positive => exact s.birth_valid Γ q positive hs
  | retirement positive => exact s.retire_valid positive hs
  | halt => exact s.stop_valid hs
  | growth factor => exact s.grow_valid (fun p => factor p) (fun p => (factor p).coe_nonneg) hs

theorem ProcessState.runTrace_valid {n : ℕ} (s : ProcessState n) (Γ : Finset (ℤ × ℤ))
    (events : List (ProcessEvent n)) (hs : s.Valid) : (s.runTrace Γ events).Valid := by
  induction events generalizing s with
  | nil => exact hs
  | cons e es ih => exact ih (s.step Γ e) (s.step_valid Γ e hs)

theorem ProcessState.step_card {n : ℕ} (s : ProcessState n) (Γ : Finset (ℤ × ℤ))
    (event : ProcessEvent n) (hs : s.Valid) :
    (s.step Γ event).selected.card = s.selected.card + s.eventBirthCount event := by
  cases event with
  | birth q positive =>
      by_cases h : s.stopped = false ∧ (s.accounts q).status = .active
      · simpa only [step,eventBirthCount,if_pos h] using s.birth_card Γ q positive hs h.1 h.2
      · simp [step,eventBirthCount,birth,h]
  | retirement positive => simp [step,eventBirthCount,retire]
  | halt => simp [step,eventBirthCount,stop]
  | growth factor =>
      simp only [step,eventBirthCount,Nat.add_zero,grow]
      split_ifs <;> rfl

theorem ProcessState.runTrace_card {n : ℕ} (s : ProcessState n) (Γ : Finset (ℤ × ℤ))
    (events : List (ProcessEvent n)) (hs : s.Valid) :
    (s.runTrace Γ events).selected.card = s.selected.card + s.traceBirthCount Γ events := by
  induction events generalizing s with
  | nil => simp [runTrace,traceBirthCount]
  | cons e es ih =>
      change ((s.step Γ e).runTrace Γ es).selected.card =
        s.selected.card + (s.eventBirthCount e + (s.step Γ e).traceBirthCount Γ es)
      rw [ih _ (s.step_valid Γ e hs),s.step_card Γ e hs,Nat.add_assoc]

theorem ProcessState.traceBirthCount_le_grid {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (events : List (ProcessEvent n)) (hs : s.Valid) :
    s.traceBirthCount Γ events ≤ n*n := by
  have hc : (s.runTrace Γ events).selected.card ≤ n*n := by
    simpa [Grid] using Finset.card_le_univ (s.runTrace Γ events).selected
  rw [s.runTrace_card Γ events hs] at hc
  omega

theorem initial_trace_noThree {n : ℕ} (Γ : Finset (ℤ × ℤ))
    (events : List (ProcessEvent n)) :
    NoThree ((ProcessState.initial n).runTrace Γ events).selected :=
  ((ProcessState.initial n).runTrace_valid Γ events (ProcessState.initial_valid n)).1

end NoThreeLine

#print axioms NoThreeLine.ProcessState.runTrace_valid
#print axioms NoThreeLine.ProcessState.runTrace_card
#print axioms NoThreeLine.ProcessState.traceBirthCount_le_grid
#print axioms NoThreeLine.initial_trace_noThree
