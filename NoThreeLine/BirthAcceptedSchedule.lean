import NoThreeLine.BirthScheduleCard
import NoThreeLine.AcceptedScheduleProcess

/-! The cardinality identity for the actual accepted masks, including the
existing concrete first1344 process shortened exactly once by 249/250. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def acceptedBirthIntegral {J n : ℕ} (s : FinitePhase.Schedule J) (a : Fin J → AcceptedPhase 8)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B)
    (ω : BoardClockPath n) : ℝ :=
  scheduleBirthIntegral s (acceptedProcessMasks a) (acceptedProcessMasks_bounds a) Γ B K ρ ε M hn hB ω

theorem acceptedSchedule_card_compensation {J n : ℕ} (s : FinitePhase.Schedule J)
    (a : Fin J → AcceptedPhase 8) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) :
    (∫ω,((acceptedScheduleProcessOutput s a Γ B K ρ ε M hn hB ω).val.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (B/n))=
        ∫ω,acceptedBirthIntegral s a Γ B K ρ ε M hn hB ω ∂boardClockMeasure n (B/n) :=
  schedule_card_compensation s _ _ Γ B K ρ ε M hn hB

def first1344ShortenedBirthIntegral {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) : BoardClockPath n → ℝ :=
  acceptedBirthIntegral
    (ScheduleAcceptedFirst1344.actualSchedule.scaled (249/250) (by norm_num))
    (fun j=>(ScheduleAcceptedFirst1344.phases.get j).phase) Γ B K ρ ε M hn hB

attribute [local irreducible] acceptedScheduleProcessOutput acceptedBirthIntegral
  ScheduleAcceptedFirst1344.actualSchedule ScheduleAcceptedFirst1344.phases

theorem first1344Shortened_card_compensation {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) :
    (∫ω,((first1344ShortenedOutput Γ B K ρ ε M hn hB ω).val.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (B/n))=
        ∫ω,first1344ShortenedBirthIntegral Γ B K ρ ε M hn hB ω ∂boardClockMeasure n (B/n) := by
  unfold first1344ShortenedOutput first1344ShortenedBirthIntegral
  exact acceptedSchedule_card_compensation
    (ScheduleAcceptedFirst1344.actualSchedule.scaled (249/250) (by norm_num))
    (fun j=>(ScheduleAcceptedFirst1344.phases.get j).phase) Γ B K ρ ε M hn hB

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.acceptedSchedule_card_compensation
#print axioms NoThreeLine.BirthWitness.first1344Shortened_card_compensation
