import NoThreeLine.UnionScheduleSemantics
import Mathlib.Data.List.OfFn

/-! Small verified phase packets compose by list append. A concrete union
checker constructs every packet's analytic field and integrability proof;
the terminal mass of the actual duration schedule equals the list mass. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators
noncomputable section
namespace NoThreeLine.FinitePhase

structure PhasePacket where
  duration : ℝ
  positive : 0 < duration
  rootType : Fin 4
  field : ℝ × ℝ → ℝ
  integrable : Integrable field
  bounded : ∀ z, 0 ≤ field z ∧ field z ≤ 1

def PhasePacket.mass (p : PhasePacket) : ℝ :=
  singlePhaseMass p.duration p.rootType p.field

def gridPhasePacket {n m : ℕ} (G : ℕ) (hG : 0 < G)
    (R : Fin n → GridBox) (A : Fin m → GridBox)
    (cover : Fin n → Fin m) (source : Fin m → Fin n)
    (hc : gridUnionCheck G R A cover source = true)
    (units scale : ℕ) (hu : 0 < units) (hs : 0 < scale) (rootType : Fin 4) : PhasePacket where
  duration := (units : ℝ)/scale
  positive := div_pos (by exact_mod_cast hu) (by exact_mod_cast hs)
  rootType := rootType
  field z := rectangleUnionMask Finset.univ (fun i => ((R i).qrect G).real)
    (commonGridLines G) (commonGridLines G) z.1 z.2
  integrable := gridUnionCheck_integrable G hG R A cover source hc
  bounded z := rectangleUnionMask_bounds _ _ _ _ _ _

theorem gridPhasePacket_mass {n m : ℕ} (G : ℕ) (hG : 0 < G)
    (R : Fin n → GridBox) (A : Fin m → GridBox)
    (cover : Fin n → Fin m) (source : Fin m → Fin n)
    (hc : gridUnionCheck G R A cover source = true)
    (units scale : ℕ) (hu : 0 < units) (hs : 0 < scale) (rootType : Fin 4) :
    (gridPhasePacket G hG R A cover source hc units scale hu hs rootType).mass =
      (units : ℝ)/scale*(gridUnionAreaUnits A : ℝ)/(4*(G : ℝ)^2) := by
  exact gridUnionCheck_phaseMass G hG R A cover source hc _
    (div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)) rootType

def packetListMass (p : List PhasePacket) : ℝ := (p.map PhasePacket.mass).sum

theorem packetListMass_append (p q : List PhasePacket) :
    packetListMass (p++q) = packetListMass p + packetListMass q := by
  simp [packetListMass]

def packetSchedule (p : List PhasePacket) : Schedule p.length :=
  scheduleOfDurations (fun i => (p.get i).duration) (fun i => (p.get i).positive)

theorem packetSchedule_mass (p : List PhasePacket) :
    (packetSchedule p).typedInputMass (fun i => (p.get i).rootType)
      (fun i => (p.get i).field) = packetListMass p := by
  unfold packetSchedule
  rw [scheduleOfDurations_mass _ _ _ _ (fun i => (p.get i).integrable)]
  change (∑ i : Fin p.length, PhasePacket.mass (p.get i)) = (p.map PhasePacket.mass).sum
  rw [← Fin.sum_ofFn]
  congr 1
  rw [List.ofFn_comp', List.ofFn_get]

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.gridPhasePacket_mass
#print axioms NoThreeLine.FinitePhase.packetSchedule_mass
