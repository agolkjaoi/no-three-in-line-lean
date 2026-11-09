import NoThreeLine.AcceptedPrefix
import NoThreeLine.UnionPhasePacket

/-! Keep the source cell and accepted leaves attached to a checked union
packet.  The actual typed field and its coarse-source domination are derived
from these data.  No compressed reference-field identity is a premise. -/
set_option autoImplicit false
open MeasureTheory
noncomputable section
namespace NoThreeLine

structure CheckedAcceptedPhase (G L : ℕ) where
  phase : AcceptedPhase L
  outCount : ℕ
  output : Fin outCount → GridBox
  cover : Fin (phase.count*4) → Fin outCount
  source : Fin outCount → Fin (phase.count*4)
  checked : gridUnionCheck G (phaseImageBoxes G L phase.sx phase.sy phase.leaves)
    output cover source = true
  units : ℕ
  scale : ℕ
  units_pos : 0 < units
  scale_pos : 0 < scale

namespace FinitePhase

def PhasePacket.typedField (p : PhasePacket) (r : Fin 4) (x y : ℝ) : ℝ :=
  if r=p.rootType then p.field (x,y) else 0

end FinitePhase
open FinitePhase

def CheckedAcceptedPhase.toPacket {G L : ℕ} (a : CheckedAcceptedPhase G L)
    (hG : 0 < G) : PhasePacket :=
  gridPhasePacket G hG (phaseImageBoxes G L a.phase.sx a.phase.sy a.phase.leaves)
    a.output a.cover a.source a.checked a.units a.scale a.units_pos a.scale_pos a.phase.rootType

theorem CheckedAcceptedPhase.typedField_eq {G L : ℕ} (a : CheckedAcceptedPhase G L)
    (hG : 0 < G) (r : Fin 4) (x y : ℝ) :
    (a.toPacket hG).typedField r x y =
      a.phase.mask G (commonGridLines G) (commonGridLines G) r x y := rfl

theorem CheckedAcceptedPhase.typedField_le_coarse {G L : ℕ}
    (a : CheckedAcceptedPhase G L) (hG : 0 < G) (r : Fin 4) (x y : ℝ) :
    (a.toPacket hG).typedField r x y ≤
      a.phase.coarseMask G (commonGridLines G) (commonGridLines G) r x y := by
  rw [a.typedField_eq]
  exact a.phase.mask_le_coarse G hG _ _ r x y

theorem CheckedAcceptedPhase.mass_eq {G L : ℕ} (a : CheckedAcceptedPhase G L)
    (hG : 0 < G) :
    (a.toPacket hG).mass = (a.units : ℝ)/a.scale*
      (gridUnionAreaUnits a.output : ℝ)/(4*(G : ℝ)^2) :=
  gridPhasePacket_mass G hG _ _ _ _ a.checked _ _ a.units_pos a.scale_pos _

namespace FinitePhase

def checkedAcceptedSchedule {J G L : ℕ} (a : Fin J → CheckedAcceptedPhase G L)
    (hG : 0 < G) : Schedule J :=
  scheduleOfDurations (fun j => ((a j).toPacket hG).duration)
    (fun j => ((a j).toPacket hG).positive)

theorem Schedule.checkedAcceptedPrefix_eq {J G L : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase G L) (hG : 0 < G)
    (T : ℝ) (r : Fin 4) (x y : ℝ) :
    s.cumulative (fun j => ((a j).toPacket hG).typedField r x y) T =
      s.acceptedPrefix (fun j => (a j).phase) G
        (commonGridLines G) (commonGridLines G) T r x y := rfl

theorem Schedule.checkedAcceptedPrefix_le_coarse {J G L : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase G L) (hG : 0 < G)
    (T : ℝ) (hT : 0 ≤ T) (r : Fin 4) (x y : ℝ) :
    s.cumulative (fun j => ((a j).toPacket hG).typedField r x y) T ≤
      s.coarseAcceptedPrefix (fun j => (a j).phase) G
        (commonGridLines G) (commonGridLines G) T r x y := by
  rw [s.checkedAcceptedPrefix_eq]
  exact s.acceptedPrefix_le_coarse _ G hG _ _ T hT r x y

theorem checkedAcceptedSchedule_mass {J G L : ℕ}
    (a : Fin J → CheckedAcceptedPhase G L) (hG : 0 < G) :
    (checkedAcceptedSchedule a hG).typedInputMass (fun j => (a j).phase.rootType)
      (fun j => ((a j).toPacket hG).field) =
        ∑ j : Fin J, (a j).units/(a j).scale*
          (gridUnionAreaUnits (a j).output : ℝ)/(4*(G : ℝ)^2) := by
  unfold checkedAcceptedSchedule
  rw [scheduleOfDurations_mass _ _ _ _ (fun j => ((a j).toPacket hG).integrable)]
  apply Finset.sum_congr rfl
  intro j _
  exact (a j).mass_eq hG

end FinitePhase
end NoThreeLine

#print axioms NoThreeLine.FinitePhase.Schedule.checkedAcceptedPrefix_le_coarse
#print axioms NoThreeLine.FinitePhase.checkedAcceptedSchedule_mass
