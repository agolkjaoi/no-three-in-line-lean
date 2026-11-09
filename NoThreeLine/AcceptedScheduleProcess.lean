import NoThreeLine.ScheduledBoardProcess
import NoThreeLine.ScheduleAcceptedFirst1344
import NoThreeLine.ScaledPacketRiemann
import NoThreeLine.ScheduleAcceptedFirst1344Riemann

/-! Instantiate the constructed original-board process with the same
accepted-region board masks used by the geometric input estimates.
The concrete prefix below is exactly [0,1344), shortened once by 249/250;
it is not the full frozen schedule or a cardinality lower-bound proof. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

def acceptedProcessMasks {J n : ℕ} (a : Fin J → AcceptedPhase 8) : Fin J → Grid n → ℝ :=
  fun j p => (a j).boardInput p

theorem acceptedProcessMasks_bounds {J n : ℕ} (a : Fin J → AcceptedPhase 8) (j : Fin J) (p : Grid n) :
    0 ≤ acceptedProcessMasks a j p ∧ acceptedProcessMasks a j p ≤ 1 :=
  (a j).mask_bounds 32768 (commonGridLines 32768) (commonGridLines 32768)
    (GridArea.typeCode (GridArea.pointType p)) (GridChord.normX n (PrimitiveLines.gridEmbed p))
    (GridChord.normY n (PrimitiveLines.gridEmbed p))

theorem acceptedProcessMasks_eq_packet {J n : ℕ} (a : Fin J → CheckedAcceptedPhase 32768 8)
    (hG : 0 < (32768 : ℕ)) (j : Fin J) (p : Grid n) :
    acceptedProcessMasks (fun j => (a j).phase) j p = ((a j).toPacket hG).boardInput p :=
  ((a j).packetBoardInput_eq hG p).symm

def acceptedScheduleProcessOutput {J n : ℕ} (s : FinitePhase.Schedule J) (a : Fin J → AcceptedPhase 8)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (ω : BoardClockPath n) : ValidAugmentedState n B :=
  scheduleProcessOutput s (acceptedProcessMasks a) (acceptedProcessMasks_bounds a) Γ B K ρ ε M hn hB ω

theorem acceptedScheduleProcessOutput_noThree {J n : ℕ} (s : FinitePhase.Schedule J) (a : Fin J → AcceptedPhase 8)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ) (hn : 0 < n) (hB : 1 ≤ B) (ω : BoardClockPath n) :
    NoThree (acceptedScheduleProcessOutput s a Γ B K ρ ε M hn hB ω).val.physical.process.selected :=
  scheduleProcessState_noThree s _ _ Γ B K ρ ε M hn hB J ω

theorem acceptedScheduleProcessOutput_expected_credit {J n : ℕ} (s : FinitePhase.Schedule J)
    (a : Fin J → AcceptedPhase 8) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) :
    (∫ ω, validAugStateCredit B p (acceptedScheduleProcessOutput s a Γ B K ρ ε M hn hB ω)
      ∂boardClockMeasure n (B/n)) = 1 :=
  scheduleProcessState_expected_credit s _ _ Γ B K ρ ε M hn hB J p

def first1344ShortenedOutput {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) : BoardClockPath n → ValidAugmentedState n B :=
  acceptedScheduleProcessOutput
    (ScheduleAcceptedFirst1344.actualSchedule.scaled (249/250) (by norm_num))
    (fun j => (ScheduleAcceptedFirst1344.phases.get j).phase) Γ B K ρ ε M hn hB

theorem first1344ShortenedOutput_measurable {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) : Measurable (first1344ShortenedOutput Γ B K ρ ε M hn hB) :=
  scheduleProcessState_measurable _ _ _ Γ B K ρ ε M hn hB _

theorem first1344ShortenedOutput_noThree {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (ω : BoardClockPath n) :
    NoThree (first1344ShortenedOutput Γ B K ρ ε M hn hB ω).val.physical.process.selected :=
  (first1344ShortenedOutput Γ B K ρ ε M hn hB ω).property.1.1.1

theorem first1344ShortenedOutput_expected_credit {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) :
    (∫ ω, validAugStateCredit B p (first1344ShortenedOutput Γ B K ρ ε M hn hB ω)
      ∂boardClockMeasure n (B/n)) = 1 :=
  acceptedScheduleProcessOutput_expected_credit _ _ Γ B K ρ ε M hn hB p

def first1344ProcessInputMass (n : ℕ) : ℝ :=
  (ScheduleAcceptedFirst1344.actualSchedule.scaled (249/250) (by norm_num)).boardInputMass
    (acceptedProcessMasks (n := n) (fun j => (ScheduleAcceptedFirst1344.phases.get j).phase))

theorem first1344ProcessInputMass_error (n : ℕ) (hn : 0 < n) :
    |first1344ProcessInputMass n-(53721287334843/204800000000000 : ℝ)| ≤
      (249/250 : ℝ)*ScheduleAcceptedFirst1344Riemann.riemannConstant/(n : ℝ) := by
  have hm : acceptedProcessMasks (n := n) (fun j => (ScheduleAcceptedFirst1344.phases.get j).phase) =
      (fun j => ((ScheduleAcceptedFirst1344.phases.get j).toPacket ScheduleAcceptedFirst1344.grid_pos).boardInput) := by
    funext j p
    exact acceptedProcessMasks_eq_packet _ ScheduleAcceptedFirst1344.grid_pos j p
  unfold first1344ProcessInputMass
  rw [hm]
  exact ScheduleAcceptedFirst1344Riemann.shortened_mass_error n hn

end NoThreeLine

#print axioms NoThreeLine.acceptedProcessMasks_eq_packet
#print axioms NoThreeLine.first1344ShortenedOutput_measurable
#print axioms NoThreeLine.first1344ShortenedOutput_noThree
#print axioms NoThreeLine.first1344ShortenedOutput_expected_credit
#print axioms NoThreeLine.first1344ProcessInputMass_error
