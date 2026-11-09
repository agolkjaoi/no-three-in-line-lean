import NoThreeLine.FrozenReferenceSources
import NoThreeLine.FrozenReferenceUnits
import NoThreeLine.FrozenReferenceOrder
import NoThreeLine.AcceptedPhasePacket

/-! One common internal reference input for every phase lookup. The finite
matching predicate checks scalar source/type/duration data; accepted leaves
and their union certificates remain supplied by CheckedAcceptedPhase. -/
set_option autoImplicit false
namespace NoThreeLine.FrozenReference

def sourceIndex (j : Fin 15348) : Fin 4160 :=
  ⟨(atom j).val%4160, Nat.mod_lt _ (by decide)⟩

def rootType (j : Fin 15348) : Fin 4 :=
  ⟨(atom j).val/4160, by have := (atom j).isLt; omega⟩

def phaseSource (j : Fin 15348) : ℕ × ℕ := source (sourceIndex j)
def phaseUnits (j : Fin 15348) : ℕ := units (atom j)

theorem phaseSource_bounds (j : Fin 15348) :
    (phaseSource j).1 < 128 ∧ (phaseSource j).2 < 128 := source_bounds (sourceIndex j)

def PhaseMatches {G L : ℕ} (a : CheckedAcceptedPhase G L) (j : Fin 15348) : Prop :=
  a.units = phaseUnits j ∧ a.scale = 100000000 ∧ a.phase.rootType = rootType j ∧
    a.phase.sx = (phaseSource j).1 ∧ a.phase.sy = (phaseSource j).2

instance {G L : ℕ} (a : CheckedAcceptedPhase G L) (j : Fin 15348) :
    Decidable (PhaseMatches a j) := by unfold PhaseMatches; infer_instance

theorem PhaseMatches.duration_eq {G L : ℕ} (a : CheckedAcceptedPhase G L)
    (hG : 0 < G) (j : Fin 15348) (h : PhaseMatches a j) :
    (a.toPacket hG).duration = (phaseUnits j : ℝ)/100000000 := by
  change (a.units : ℝ)/(a.scale : ℝ) = _
  rw [h.1, h.2.1]
  norm_num

theorem PhaseMatches.source_bounds {G L : ℕ} (a : CheckedAcceptedPhase G L)
    (j : Fin 15348) (h : PhaseMatches a j) : a.phase.sx < 128 ∧ a.phase.sy < 128 := by
  rw [h.2.2.2.1, h.2.2.2.2]
  exact phaseSource_bounds j

end NoThreeLine.FrozenReference

#print axioms NoThreeLine.FrozenReference.PhaseMatches.duration_eq
