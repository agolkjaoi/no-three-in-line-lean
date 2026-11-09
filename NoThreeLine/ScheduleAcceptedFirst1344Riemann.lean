import NoThreeLine.ScheduleAcceptedFirst1344
import NoThreeLine.ScaledPacketRiemann

/-! G1 for the actual first 1344 accepted-input phases. The area constants
are supplied by the checked chronology and not assumed as numeric premises. -/
set_option autoImplicit false
open NoThreeLine.FinitePhase
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst1344Riemann
open ScheduleAcceptedFirst1344

def actualBoardMass (n : ℕ) : ℝ := actualSchedule.boardInputMass
  (fun j => ((phases.get j).toPacket grid_pos).boardInput (n := n))

def riemannConstant : ℝ := checkedRiemannConstant phases.get grid_pos

theorem actual_mass_error (n : ℕ) (hn : 0 < n) :
    |actualBoardMass n-(215748141907/819200000000 : ℝ)| ≤ riemannConstant/(n : ℝ) := by
  have he := checkedBoardMass_area_error phases.get grid_pos n hn
  change |actualBoardMass n-actualSchedule.typedInputMass
    (fun j => (phases.get j).phase.rootType)
    (fun j => ((phases.get j).toPacket grid_pos).field)| ≤ riemannConstant/(n : ℝ) at he
  rw [actual_schedule_mass] at he
  exact he

theorem shorten_pos : 0 < (249/250 : ℝ) := by norm_num

def shortenedBoardMass (n : ℕ) : ℝ := (actualSchedule.scaled (249/250) shorten_pos).boardInputMass
  (fun j => ((phases.get j).toPacket grid_pos).boardInput (n := n))

theorem shortened_mass_error (n : ℕ) (hn : 0 < n) :
    |shortenedBoardMass n-(53721287334843/204800000000000 : ℝ)| ≤
      (249/250 : ℝ)*riemannConstant/(n : ℝ) := by
  have he := scaled_checkedBoardMass_area_error phases.get grid_pos n hn (249/250) shorten_pos
  change |shortenedBoardMass n-(actualSchedule.scaled (249/250) shorten_pos).typedInputMass
    (fun j => (phases.get j).phase.rootType)
    (fun j => ((phases.get j).toPacket grid_pos).field)| ≤
      (249/250 : ℝ)*riemannConstant/(n : ℝ) at he
  rw [shortened_schedule_mass] at he
  exact he

theorem riemannConstant_nonneg : 0 ≤ riemannConstant :=
  checkedRiemannConstant_nonneg phases.get grid_pos

end NoThreeLine.ScheduleAcceptedFirst1344Riemann

#print axioms NoThreeLine.ScheduleAcceptedFirst1344Riemann.actual_mass_error
#print axioms NoThreeLine.ScheduleAcceptedFirst1344Riemann.shortened_mass_error
