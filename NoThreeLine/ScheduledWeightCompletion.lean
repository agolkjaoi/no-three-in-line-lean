import NoThreeLine.ScheduledPhaseCompletion
import NoThreeLine.PhasePointHistory

/-! Actual inherited phase completion, stated on the unobserved physical
projection used by the weight-growth estimates. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness

theorem scheduledUnobservedPhaseCompletion_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 0 < B) (s : GoodPhaseObservation n B) (N : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      AugTimedDone (cs N).config (augRecycledTerminal (cs N).config ε M hn
        (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn s.val.1 N ω))
        (recycledPhases cs ε M deadline start hn s.val.1 N ω).2) := by
  filter_upwards [scheduledPhaseCompletion_ae cs ε M deadline start hn hB s N] with ω hω
  have hp := goodPhases_birth_projection cs ε M deadline start hn s N ω
  change AugTimedDone (cs N).config (augRecycledTerminal (cs N).config ε M hn
    (augPhaseStart (cs N).config ε M (goodPhases cs ε M deadline start hn s N ω).1.val.1)
    (goodPhases cs ε M deadline start hn s N ω).2) at hω
  rw [congrArg Prod.fst hp,congrArg Prod.snd hp] at hω
  exact hω

theorem initial_scheduledUnobservedPhaseCompletion_all_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n), ∀ N,
      AugTimedDone (cs N).config (augRecycledTerminal (cs N).config ε M hn
        (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn
          (augInitialState B hB deadline start) N ω))
        (recycledPhases cs ε M deadline start hn (augInitialState B hB deadline start) N ω).2) :=
  ae_all_iff.mpr (fun N => scheduledUnobservedPhaseCompletion_ae cs ε M deadline start hn
    (zero_lt_one.trans_le hB) (initialGoodPhaseObservation B hB deadline start) N)

theorem initial_scheduledUnobservedPhaseCompletion_all_point_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) (J : ℕ) :
    ∀ᵐ ω ∂phasePointMeasure cs ε M deadline start hn hB p J, ∀ N,
      AugTimedDone (cs N).config (augRecycledTerminal (cs N).config ε M hn
        (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn
          (augInitialState B hB deadline start) N ω))
        (recycledPhases cs ε M deadline start hn (augInitialState B hB deadline start) N ω).2) :=
  (phasePointMeasure_absolutelyContinuous cs ε M deadline start hn hB p J).ae_le
    (initial_scheduledUnobservedPhaseCompletion_all_ae cs ε M deadline start hn hB)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledUnobservedPhaseCompletion_ae
#print axioms NoThreeLine.BirthWitness.initial_scheduledUnobservedPhaseCompletion_all_point_ae
