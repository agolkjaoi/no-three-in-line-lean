import NoThreeLine.ExtendedStop
import NoThreeLine.AuxiliaryGuardInvariant

/-! Physical state plus the actual eta coordinates. Auxiliary guards are
tested on the postgeometry state before either global stop or positive
retirement changes active flags. A finite horizon alone is not a guard. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

structure AugmentedState (n : ℕ) where
  physical : ExtendedState n
  eta : EtaCoordinates n

def AugmentedState.Valid {n : ℕ} (a : AugmentedState n) (B : ℝ) : Prop :=
  a.physical.Valid B ∧ ∀ p q, 0 ≤ a.eta p q ∧ a.eta p q ≤ 1

def AugmentedState.initial (n : ℕ) : AugmentedState n := ⟨ExtendedState.initial n,fun _ _ => 1⟩

theorem AugmentedState.initial_valid (n : ℕ) (B : ℝ) (hB : 1 ≤ B) :
    (AugmentedState.initial n).Valid B :=
  ⟨ExtendedState.initial_valid n B hB,fun _ _ => ⟨zero_le_one,le_rfl⟩⟩

instance (n : ℕ) : MeasurableSpace (AugmentedState n) :=
  MeasurableSpace.comap (fun a : AugmentedState n => (a.physical,a.eta)) inferInstance

theorem AugmentedState.measurable_fields (n : ℕ) :
    Measurable (fun a : AugmentedState n => (a.physical,a.eta)) := comap_measurable _

theorem AugmentedState.measurable_physical (n : ℕ) : Measurable (@AugmentedState.physical n) :=
  (measurable_fields n).fst

theorem AugmentedState.measurable_eta (n : ℕ) : Measurable (@AugmentedState.eta n) :=
  (measurable_fields n).snd

theorem AugmentedState.measurable_mk {n : ℕ} {X : Type*} [MeasurableSpace X]
    (p : X → ExtendedState n) (η : X → EtaCoordinates n) (hp : Measurable p) (hη : Measurable η) :
    Measurable (fun x => AugmentedState.mk (p x) (η x)) :=
  measurable_comap_iff.mpr (hp.prodMk hη)

def AugmentedState.auxBad {n : ℕ} (a : AugmentedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (ε M : ℝ) : Prop :=
  a.eta ∈ etaGuard n ε ∨ a.physical.coordinates ∈ virtualGuard a.physical.process Γ M

theorem ExtendedState.measurable_virtualMass {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (L : LineIndex n) (q : Grid n) :
    Measurable (fun e : ExtendedState n => virtualMass e.process Γ e.coordinates L q) := by
  have hm : Measurable (fun x : Coordinates n × ProcessMode n => virtualMass (modeSkeleton x.2) Γ x.1 L q) :=
    measurable_from_prod_countable_left
      (f := fun x : Coordinates n × ProcessMode n => virtualMass (modeSkeleton x.2) Γ x.1 L q)
      (fun m => (virtualMass_contDiff (modeSkeleton m) Γ L q).continuous.measurable)
  have hmap : Measurable (fun e : ExtendedState n => (e.coordinates,e.mode)) :=
    (measurable_coordinates n).prodMk (measurable_mode n)
  exact hm.comp hmap

theorem AugmentedState.auxBad_measurable {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (ε M : ℝ) :
    Measurable (fun a : AugmentedState n => a.auxBad Γ ε M) := by
  apply Measurable.or
  · exact measurableSet_setOf.mp ((etaGuard_closed n ε).measurableSet.preimage (measurable_eta n))
  · simp only [virtualGuard,Set.mem_iUnion,Set.mem_setOf_eq]
    apply Measurable.exists
    intro L
    apply Measurable.exists
    intro q
    exact measurable_const.le' ((ExtendedState.measurable_virtualMass Γ L q).comp (measurable_physical n))

def AugmentedState.resolve {n : ℕ} (a : AugmentedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) : AugmentedState n := by
  classical
  exact if a.auxBad Γ ε M then ⟨a.physical.stop,a.eta⟩
    else ⟨a.physical.resolve Γ B K ρ,a.eta⟩

theorem AugmentedState.resolve_eta {n : ℕ} (a : AugmentedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) : (a.resolve Γ B K ρ ε M).eta = a.eta := by
  unfold resolve
  split_ifs <;> rfl

theorem AugmentedState.resolve_valid {n : ℕ} (a : AugmentedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (ha : a.Valid B) : (a.resolve Γ B K ρ ε M).Valid B := by
  unfold resolve
  split_ifs
  · exact ⟨a.physical.stop_valid B ha.1,ha.2⟩
  · exact ⟨a.physical.resolve_valid Γ B K ρ ha.1,ha.2⟩

theorem AugmentedState.resolve_credit {n : ℕ} (a : AugmentedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (p : Grid n) :
    ((a.resolve Γ B K ρ ε M).physical.process.accounts p).credit =
      (a.physical.process.accounts p).credit := by
  unfold resolve
  split_ifs
  · exact a.physical.stop_credit p
  · exact a.physical.resolve_credit Γ B K ρ p

theorem AugmentedState.resolve_budget_le {n : ℕ} (a : AugmentedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) :
    (a.resolve Γ B K ρ ε M).physical.boundaryBudget ≤ a.physical.boundaryBudget := by
  unfold resolve
  split_ifs
  · exact a.physical.stop_budget_le
  · exact a.physical.resolve_budget_le Γ B K ρ

theorem AugmentedState.resolve_stops_aux {n : ℕ} (a : AugmentedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (ha : a.auxBad Γ ε M) :
    (a.resolve Γ B K ρ ε M).physical.process.stopped = true := by
  simp [resolve,ha,ExtendedState.stop,ProcessState.stop]

theorem AugmentedState.resolve_measurable {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) : Measurable (fun a : AugmentedState n => a.resolve Γ B K ρ ε M) := by
  unfold resolve
  apply Measurable.ite (auxBad_measurable Γ ε M).setOf
  · exact measurable_mk _ _ ((ExtendedState.measurable_stop n).comp (measurable_physical n)) (measurable_eta n)
  · exact measurable_mk _ _ ((ExtendedState.measurable_resolve Γ B K ρ).comp (measurable_physical n)) (measurable_eta n)

end NoThreeLine

#print axioms NoThreeLine.AugmentedState.initial_valid
#print axioms NoThreeLine.AugmentedState.resolve_valid
#print axioms NoThreeLine.AugmentedState.resolve_credit
#print axioms NoThreeLine.AugmentedState.resolve_measurable
