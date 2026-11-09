import NoThreeLine.LineBirthIndicatorMoment

/-! The actual active-root/selected-birth gate and line mass. These maps are
measurable on the physical witness state, with bounds supplied by validity. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def selectedLineGate {n : ℕ} (p z : Grid n) (a : WitnessState n) : ℝ :=
  if p∈a.augmented.physical.process.activeEvents ∧ z∈a.augmented.physical.process.selected then 1 else 0

def boardLineMass {n : ℕ} (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n)
    (a : WitnessState n) : ℝ :=
  a.augmented.physical.lineCredits L*∑q∈L.val.erase p,mask q*activeLeafWeight q a

theorem selectedLineLeafPower_eq_gate_mul {n : ℕ} (mask : Grid n→ℝ) (L : LineIndex n)
    (p z : Grid n) (k : ℕ) (a : WitnessState n) :
    selectedLineLeafPower mask L p z k a=selectedLineGate p z a*(boardLineMass mask L p a)^k := by
  unfold selectedLineLeafPower selectedLineGate boardLineMass
  split_ifs <;> simp

theorem selectedLineGate_measurable {n : ℕ} (p z : Grid n) : Measurable (selectedLineGate p z) := by
  have hproc : Measurable (fun a : WitnessState n=>a.augmented.physical.process) :=
    (ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
      (WitnessState.measurable_augmented n))
  have hp : MeasurableSet {a : WitnessState n | p∈a.augmented.physical.process.activeEvents} :=
    ((measurable_of_countable (fun S : Finset (Grid n)=>p∈S)).comp
      ((activeEvents_measurable n).comp hproc)).setOf
  have hz : MeasurableSet {a : WitnessState n | z∈a.augmented.physical.process.selected} :=
    ((measurable_of_countable (fun S : Finset (Grid n)=>z∈S)).comp
      ((ProcessState.measurable_selected n).comp hproc)).setOf
  exact Measurable.ite (hp.inter hz) measurable_const measurable_const

theorem selectedLineGate_bounds {n : ℕ} (p z : Grid n) (a : WitnessState n) :
    0≤selectedLineGate p z a ∧ selectedLineGate p z a≤1 := by
  unfold selectedLineGate
  split_ifs <;> norm_num

theorem boardLineMass_measurable {n : ℕ} (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) :
    Measurable (boardLineMass mask L p) := by
  apply Measurable.mul
  · exact (measurable_pi_apply L).comp ((ExtendedState.measurable_lineCredits n).comp
      ((AugmentedState.measurable_physical n).comp (WitnessState.measurable_augmented n)))
  · exact Finset.measurable_sum _ (fun q _=>(activeLeafWeight_measurable q).const_mul (mask q))

theorem boardLineMass_bounds {n : ℕ} (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1)
    (L : LineIndex n) (p : Grid n) (a : WitnessState n) (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    0≤boardLineMass mask L p a ∧ boardLineMass mask L p a≤B*(L.val.card:ℝ) := by
  have hr := ha.1.1.2.1.2.2 L
  have hw (q : Grid n) := activeLeafWeight_bounds q a B hB ha
  have hsum0 : 0≤∑q∈L.val.erase p,mask q*activeLeafWeight q a :=
    Finset.sum_nonneg (fun q _=>mul_nonneg (hm q).1 (hw q).1)
  have hsum1 : (∑q∈L.val.erase p,mask q*activeLeafWeight q a)≤B*(L.val.card:ℝ) := by
    calc
      _ ≤ ∑_q∈L.val.erase p,B := Finset.sum_le_sum (fun q _=>
        (mul_le_of_le_one_left (hw q).1 (hm q).2).trans (hw q).2)
      _ = B*((L.val.erase p).card:ℝ) := by simp [mul_comm]
      _ ≤ _ := mul_le_mul_of_nonneg_left (by exact_mod_cast Finset.card_erase_le) hB
  exact ⟨mul_nonneg hr.1 hsum0,(mul_le_of_le_one_left hsum0 hr.2).trans hsum1⟩

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.selectedLineGate_measurable
#print axioms NoThreeLine.BirthWitness.boardLineMass_bounds
