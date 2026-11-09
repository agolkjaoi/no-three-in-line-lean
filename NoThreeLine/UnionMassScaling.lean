import NoThreeLine.FiniteDurationSchedule
import NoThreeLine.ScheduleTimeScaling

/-! Time shortening for arbitrary actual union inputs. The masks themselves
are unchanged; the scale enters once through the phase durations. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.FinitePhase

theorem Schedule.scaled_typedInputMass {J : ℕ} (s : Schedule J) (a : ℝ) (ha : 0 < a)
    (typ : Fin J → Fin 4) (F : Fin J → ℝ × ℝ → ℝ) :
    (s.scaled a ha).typedInputMass typ F = a*s.typedInputMass typ F := by
  unfold Schedule.typedInputMass
  rw [Schedule.scaled_total]
  have he (r : Fin 4) (z : ℝ × ℝ) := s.scaled_cumulative a ha
    (fun j => if r=typ j then F j z else 0) s.total s.total_nonneg
  simp_rw [he,integral_const_mul]
  rw [← Finset.mul_sum]
  ring

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.Schedule.scaled_typedInputMass
