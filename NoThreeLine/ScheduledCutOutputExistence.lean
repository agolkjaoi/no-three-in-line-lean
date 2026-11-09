import NoThreeLine.ScheduledCutCardinality
import Mathlib.MeasureTheory.Integral.Average

/-! Extract an actual legal output at least as large as the exact
exposure-minus-loss expression. No lower bound on that expression is
postulated, and the fixed 1.501 target is not asserted. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness

theorem scheduleOutput_card_integrable {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J→Grid n→ℝ)
    (hm : ∀j p,0≤m j p ∧ m j p≤1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) :
    Integrable (fun ω=>((scheduleProcessOutput s m hm Γ B K ρ ε M hn hB ω).val.physical.process.selected.card:ℝ))
      (boardClockMeasure n (B/n)) := by
  have hi := integrable_finsetSum Finset.univ (fun p _=>recycledPhaseSelected_integrable
    (scheduleSharedPhases s m hm Γ B K ρ) ε M (scheduleProcessDeadline s m) 0 p hn
    (lt_of_lt_of_le zero_lt_one hB) (augInitialState B hB (scheduleProcessDeadline s m) 0) J)
  apply hi.congr
  exact Filter.Eventually.of_forall (fun ω=>
    validSelectedIndicator_sum B (scheduleProcessOutput s m hm Γ B K ρ ε M hn hB ω))

theorem schedule_exists_output_ge_exposure_sub_loss {J n : ℕ} (s : FinitePhase.Schedule J)
    (m : Fin J→Grid n→ℝ) (hm : ∀j p,0≤m j p ∧ m j p≤1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) :
    ∃ω : BoardClockPath n,
      (∑p : Grid n,∑j : Fin J,s.duration j*(m j p/n))-scheduleCutLoss s m hm Γ B K ρ ε M hn hB≤
        ((scheduleProcessOutput s m hm Γ B K ρ ε M hn hB ω).val.physical.process.selected.card:ℝ) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos (lt_of_lt_of_le zero_lt_one hB) (by exact_mod_cast hn))
  obtain ⟨ω,hω⟩ := exists_integral_le (scheduleOutput_card_integrable s m hm Γ B K ρ ε M hn hB)
  rw [schedule_card_loss] at hω
  exact ⟨ω,hω⟩

theorem schedule_exists_noThree_ge_exposure_sub_loss {J n : ℕ} (s : FinitePhase.Schedule J)
    (m : Fin J→Grid n→ℝ) (hm : ∀j p,0≤m j p ∧ m j p≤1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) :
    ∃S : Finset (Grid n),NoThree S ∧
      (∑p : Grid n,∑j : Fin J,s.duration j*(m j p/n))-scheduleCutLoss s m hm Γ B K ρ ε M hn hB≤(S.card:ℝ) := by
  obtain ⟨ω,hω⟩ := schedule_exists_output_ge_exposure_sub_loss s m hm Γ B K ρ ε M hn hB
  exact ⟨(scheduleProcessOutput s m hm Γ B K ρ ε M hn hB ω).val.physical.process.selected,
    scheduleProcessState_noThree s m hm Γ B K ρ ε M hn hB J ω,hω⟩

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduleOutput_card_integrable
#print axioms NoThreeLine.BirthWitness.schedule_exists_noThree_ge_exposure_sub_loss
