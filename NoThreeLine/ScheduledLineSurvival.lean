import NoThreeLine.ScheduledLineForbiddenLaw
import NoThreeLine.ValidScheduledCompletion

/-! The finite scheduled forbidden-line law excludes line births at
every actual internal update of each included phase. Completion is
derived for the inherited original residuals, not assumed pathwise. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem scheduledTerminal_occupancy {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (j : ℕ) (ω : BoardClockPath n) (L : LineIndex n) :
    occupancy (augRecycledTerminal (cs j).config ε M hn
      (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
      (recycledPhases cs ε M deadline start hn e j ω).2).val.1.physical.process L=
    occupancy (recycledPhaseState cs ε M deadline start hn e (j+1) ω).val.physical.process L := by
  rw [recycledPhaseState_succ_eq,recycledScheduledPair,augValidDeadlineRetirement_occupancy]
  rfl

theorem scheduledLineForbiddenLaw_no_line_birth {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (L : LineIndex n) (N : ℕ) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (J : ℕ) :
    ∀ᵐω ∂scheduledLineForbiddenLaw cs ε M K deadline start hn L N e J,∀j<J,∀k,
      let r := augRecycledPair (cs j).config ε M hn
        (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω)) k
        (recycledPhases cs ε M deadline start hn e j ω).2
      ¬(timedBirth (cs j).config ε M (r.1,WinnerMarkLaw.firstMarkedRace hn r.2) ∧
        (WinnerMarkLaw.firstMarkedRace hn r.2).1.2∈L.val) := by
  have hdone := (scheduledLineForbiddenLaw_absolutelyContinuous cs ε M K deadline start hn L N e J).ae_le
    (validScheduledPhasesCompletion_ae cs ε M deadline start hn hB e)
  filter_upwards [scheduledLineForbiddenLaw_occupancy cs ε M K deadline start hn L N e J,hdone] with ω hocc hd
  intro j hj k
  have ho := recycledPhaseState_occupancy_prefix cs ε M deadline start hn L N e he J ω hocc j hj.le
  have ht := recycledPhaseState_occupancy_prefix cs ε M deadline start hn L N e he J ω hocc (j+1) hj
  rw [←scheduledTerminal_occupancy cs ε M deadline start hn e j ω L] at ht
  exact no_line_birth_of_terminal_occupancy (cs j).config ε M L N hn
    (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω)) ho
    (recycledPhases cs ε M deadline start hn e j ω).2 (hd j) ht k

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledLineForbiddenLaw_no_line_birth
