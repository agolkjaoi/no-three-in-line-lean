import NoThreeLine.PhysicalLeafExpansion

/-! Actual active leaf weights and one-witness leaf powers are measurable
and bounded from the state validity conditions. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem activeLeafWeight_measurable {n : ℕ} (q : Grid n) : Measurable (activeLeafWeight q) := by
  unfold activeLeafWeight
  apply Measurable.ite
  · exact ((measurable_of_countable (fun S : Finset (Grid n)=>q∈S)).comp
      ((activeEvents_measurable n).comp ((ExtendedState.measurable_process n).comp
        ((AugmentedState.measurable_physical n).comp (WitnessState.measurable_augmented n))))).setOf
  · exact CreditAccount.measurable_weight.comp ((ProcessState.measurable_account n q).comp
      ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
        (WitnessState.measurable_augmented n))))
  · exact measurable_const

theorem activeLeafWeight_bounds {n : ℕ} (q : Grid n) (a : WitnessState n)
    (B : ℝ) (hB : 0≤B) (ha : a.Valid B) : 0≤activeLeafWeight q a ∧ activeLeafWeight q a≤B := by
  unfold activeLeafWeight
  split_ifs
  · exact ha.1.1.2.1.1 q
  · exact ⟨le_rfl,hB⟩

theorem lineLeafPower_measurable {n : ℕ} {α : Type*} [Fintype α]
    (leaf : α→Grid n) (mask : α→ℝ) (L : LineIndex n) (p z : Grid n) (k : ℕ) :
    Measurable (lineLeafPower leaf mask L p z k) := by
  unfold lineLeafPower
  apply Measurable.ite
  · exact ((measurable_of_countable (fun S : Finset (Grid n)=>p∈S)).comp
      ((activeEvents_measurable n).comp ((ExtendedState.measurable_process n).comp
        ((AugmentedState.measurable_physical n).comp (WitnessState.measurable_augmented n))))).setOf
  · apply Measurable.mul
    · exact (measurable_pi_apply z).comp (WitnessState.measurable_retained n)
    · apply Measurable.pow_const
      apply Measurable.mul
      · exact (measurable_pi_apply L).comp ((ExtendedState.measurable_lineCredits n).comp
          ((AugmentedState.measurable_physical n).comp (WitnessState.measurable_augmented n)))
      · exact Finset.measurable_sum _ (fun q _=>(activeLeafWeight_measurable (leaf q)).const_mul (mask q))
  · exact measurable_const

theorem lineLeafPower_bounds {n : ℕ} {α : Type*} [Fintype α]
    (leaf : α→Grid n) (mask : α→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1)
    (L : LineIndex n) (p z : Grid n) (k : ℕ) (a : WitnessState n)
    (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    0≤lineLeafPower leaf mask L p z k a ∧ lineLeafPower leaf mask L p z k a≤(B*Fintype.card α)^k := by
  have hr := ha.1.1.2.1.2.2 L
  have hw (q : α) := activeLeafWeight_bounds (leaf q) a B hB ha
  have hsum0 : 0≤∑q : α,mask q*activeLeafWeight (leaf q) a :=
    Finset.sum_nonneg (fun q _=>mul_nonneg (hm q).1 (hw q).1)
  have hsum1 : (∑q : α,mask q*activeLeafWeight (leaf q) a)≤B*Fintype.card α := by
    calc
      _ ≤ ∑_q : α,B := Finset.sum_le_sum (fun q _=>
        ((mul_le_of_le_one_left (hw q).1 (hm q).2).trans (hw q).2))
      _ = _ := by simp [mul_comm]
  have hbase0 : 0≤a.augmented.physical.lineCredits L*∑q : α,mask q*activeLeafWeight (leaf q) a :=
    mul_nonneg hr.1 hsum0
  have hbase1 : a.augmented.physical.lineCredits L*(∑q : α,mask q*activeLeafWeight (leaf q) a)≤B*Fintype.card α :=
    (mul_le_of_le_one_left hsum0 hr.2).trans hsum1
  unfold lineLeafPower
  split_ifs
  · exact ⟨mul_nonneg (ha.2.1 z).1 (pow_nonneg hbase0 k),
      (mul_le_of_le_one_left (pow_nonneg hbase0 k) (ha.2.1 z).2).trans (pow_le_pow_left₀ hbase0 hbase1 k)⟩
  · exact ⟨le_rfl,pow_nonneg (mul_nonneg hB (Nat.cast_nonneg _)) k⟩

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.lineLeafPower_measurable
#print axioms NoThreeLine.BirthWitness.lineLeafPower_bounds
