import NoThreeLine.WitnessTerminalSource
import NoThreeLine.ObservedScheduledRestart
import NoThreeLine.BirthObservationPhaseRecords

/-! Phase-independent witness data and actual deadline retirement.
The direction set is an explicit argument: no comparison between different
direction sets is asserted. Deadline retirement keeps all records and eta,
and can only decrease the mixed observable with its active-root indicator. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator EtaPairProduct

abbrev GoodPhaseObservation (n : ℕ) (B : ℝ) :=
  {s : PhaseObservation n B // PhaseRecordsConsistent s ∧ EmptyLineCredit s.1.val.physical}

def goodPhaseMixed {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodPhaseObservation n B) : ℝ := mixed Γ C D L (phaseWitness e s.val)

theorem goodPhaseMixed_measurable {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (e : Retention n)
    (C D L : Finset (Grid n)) : Measurable (goodPhaseMixed (B:=B) Γ e C D L) :=
  (mixed_measurable Γ C D L).comp ((phaseWitness_measurable e).comp measurable_subtype_coe)

theorem goodPhaseMixed_bounds {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodPhaseObservation n B) :
    0≤goodPhaseMixed Γ e C D L s ∧ goodPhaseMixed Γ e C D L s≤mixedCap C B :=
  ⟨mixed_nonneg _ Γ C D L B (phaseWitness_valid e s.val s.property.1),
    mixed_le_cap _ Γ C D L B (phaseWitness_valid e s.val s.property.1)⟩

def goodPhaseStart {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : GoodPhaseObservation n cfg.B) : GoodObservation cfg :=
  ⟨observedPhaseStart cfg ε M s.val,s.property.1,s.property.2⟩

theorem goodPhaseStart_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (goodPhaseStart cfg ε M) :=
  ((observedPhaseStart_measurable cfg ε M).comp measurable_subtype_coe).subtype_mk

theorem goodPhaseStart_mixed {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodPhaseObservation n cfg.B) :
    goodMixed cfg e C D L (goodPhaseStart cfg ε M s)=goodPhaseMixed cfg.directions e C D L s := rfl

theorem phaseWitness_deadline_mixed_le {n : ℕ} {B : ℝ} (e : Retention n)
    (Γ : Finset ZPoint) (C D L : Finset (Grid n)) (deadline : Grid n → ℝ) (t : ℝ)
    (s : PhaseObservation n B) (hs : PhaseRecordsConsistent s) :
    mixed Γ C D L (phaseWitness e (observedDeadline deadline t s))≤mixed Γ C D L (phaseWitness e s) := by
  have hc : (augValidDeadlineRetirement deadline t s.1).val.physical.coordinates=s.1.val.physical.coordinates := by
    unfold augValidDeadlineRetirement
    split_ifs
    · rfl
    · exact s.1.val.physical.retire_coordinates _
  have hsel : (augValidDeadlineRetirement deadline t s.1).val.physical.process.selected=
      s.1.val.physical.process.selected := by
    unfold augValidDeadlineRetirement
    split_ifs <;> rfl
  have hact : (augValidDeadlineRetirement deadline t s.1).val.physical.process.activeEvents⊆
      s.1.val.physical.process.activeEvents := by
    unfold augValidDeadlineRetirement
    split_ifs
    · exact Finset.Subset.refl _
    · exact retire_activeEvents_subset _ _
  have hp := phi_le_of_active_reduction s.1.val.physical
    (augValidDeadlineRetirement deadline t s.1).val.physical Γ C B s.1.property.1 hsel hc hact
  unfold mixed correctedPhi
  change witnessProduct D (phaseWitness e s)*
    (etaProduct L (augValidDeadlineRetirement deadline t s.1).val.eta*_)≤_
  rw [augValidDeadlineRetirement_eta]
  exact mul_le_mul_of_nonneg_left
    (mul_le_mul_of_nonneg_left hp (etaProduct_nonneg L s.1.val.eta (fun p q=>(s.1.property.2 p q).1)))
    (witnessProduct_nonneg _ D B (phaseWitness_valid e s hs))

def goodPhaseDeadline {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (s : GoodPhaseObservation n B) : GoodPhaseObservation n B :=
  ⟨observedDeadline deadline t s.val,observedDeadline_consistent deadline t s.val s.property.1,
    emptyLineCredit_augValidDeadlineRetirement deadline t s.val.1 s.property.2⟩

theorem goodPhaseDeadline_measurable {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ) :
    Measurable (goodPhaseDeadline (B:=B) deadline t) :=
  ((observedDeadline_measurable deadline t).comp measurable_subtype_coe).subtype_mk

theorem goodPhaseDeadline_mixed_le {n : ℕ} {B : ℝ} (e : Retention n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (deadline : Grid n → ℝ) (t : ℝ) (s : GoodPhaseObservation n B) :
    goodPhaseMixed Γ e C D L (goodPhaseDeadline deadline t s)≤goodPhaseMixed Γ e C D L s :=
  phaseWitness_deadline_mixed_le e Γ C D L deadline t s.val s.property.1

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseWitness_deadline_mixed_le
#print axioms NoThreeLine.BirthWitness.goodPhaseStart_measurable
#print axioms NoThreeLine.BirthWitness.goodPhaseDeadline_mixed_le
