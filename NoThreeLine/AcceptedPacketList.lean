import NoThreeLine.AcceptedPhasePacket
import NoThreeLine.UnionMassScaling

/-! Chronological concatenation preserves both checked source geometry and
the actual analytic schedule.  The mass is a genuine time/space integral. -/
set_option autoImplicit false
open MeasureTheory
noncomputable section
namespace NoThreeLine.FinitePhase

def acceptedListMass {G L : ℕ} (a : List (CheckedAcceptedPhase G L))
    (hG : 0 < G) : ℝ := (a.map (fun b => (b.toPacket hG).mass)).sum

theorem acceptedListMass_append {G L : ℕ} (a b : List (CheckedAcceptedPhase G L))
    (hG : 0 < G) :
    acceptedListMass (a++b) hG = acceptedListMass a hG + acceptedListMass b hG := by
  simp [acceptedListMass]

def acceptedListSchedule {G L : ℕ} (a : List (CheckedAcceptedPhase G L))
    (hG : 0 < G) : Schedule a.length := checkedAcceptedSchedule a.get hG

theorem acceptedListSchedule_mass {G L : ℕ} (a : List (CheckedAcceptedPhase G L))
    (hG : 0 < G) :
    (acceptedListSchedule a hG).typedInputMass (fun j => (a.get j).phase.rootType)
      (fun j => ((a.get j).toPacket hG).field) = acceptedListMass a hG := by
  unfold acceptedListSchedule checkedAcceptedSchedule
  rw [scheduleOfDurations_mass _ _ _ _ (fun j => ((a.get j).toPacket hG).integrable)]
  change (∑ j : Fin a.length, ((a.get j).toPacket hG).mass) =
    (a.map (fun b => (b.toPacket hG).mass)).sum
  rw [← Fin.sum_ofFn]
  congr 1
  rw [List.ofFn_comp' a.get (fun b => (b.toPacket hG).mass), List.ofFn_get]

theorem acceptedListSchedule_scaled_mass {G L : ℕ}
    (a : List (CheckedAcceptedPhase G L)) (hG : 0 < G) (c : ℝ) (hc : 0 < c) :
    ((acceptedListSchedule a hG).scaled c hc).typedInputMass
      (fun j => (a.get j).phase.rootType) (fun j => ((a.get j).toPacket hG).field) =
        c * acceptedListMass a hG := by
  rw [Schedule.scaled_typedInputMass, acceptedListSchedule_mass]

theorem acceptedListSchedule_prefix_le_coarse {G L : ℕ}
    (a : List (CheckedAcceptedPhase G L)) (hG : 0 < G)
    (T : ℝ) (hT : 0 ≤ T) (r : Fin 4) (x y : ℝ) :
    (acceptedListSchedule a hG).cumulative
      (fun j => ((a.get j).toPacket hG).typedField r x y) T ≤
    (acceptedListSchedule a hG).coarseAcceptedPrefix (fun j => (a.get j).phase)
      G (commonGridLines G) (commonGridLines G) T r x y :=
  (acceptedListSchedule a hG).checkedAcceptedPrefix_le_coarse a.get hG T hT r x y

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.acceptedListSchedule_mass
#print axioms NoThreeLine.FinitePhase.acceptedListSchedule_prefix_le_coarse
