import NoThreeLine.SelectedLineRegularity
import NoThreeLine.ObservedSourceFreeLeaf

/-! The actual unmasked line mass at an active root is exactly the finite
sum of two-label physical root leaves on a non-specified board line. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct

def activeRootLineMass {n : ℕ} (L : LineIndex n) (p : Grid n) (a : WitnessState n) : ℝ :=
  if p ∈ a.augmented.physical.process.activeEvents then boardLineMass (fun _ => 1) L p a else 0

theorem rootLeafPhi_pair_line {n : ℕ} (Γ : Finset ZPoint) (L : LineIndex n)
    (hL : ¬specified Γ L) (p q : Grid n) (hpL : p ∈ L.val) (hqL : q ∈ L.val)
    (hpq : p ≠ q) (a : WitnessState n) :
    rootLeafPhi Γ {p,q} p a.augmented.physical =
      if p ∈ a.augmented.physical.process.activeEvents then
        a.augmented.physical.lineCredits L * activeLeafWeight q a else 0 := by
  classical
  have hCL : ({p,q} : Finset (Grid n)) ⊆ L.val := by
    simp only [Finset.insert_subset_iff,Finset.singleton_subset_iff,hpL,hqL,and_self]
  rw [rootLeafPhi,connectionProduct_of_subset_nonspecified_line Γ {p,q} _ L hL hCL]
  by_cases hp : p ∈ a.augmented.physical.process.activeEvents <;>
    by_cases hq : q ∈ a.augmented.physical.process.activeEvents <;>
    simp [Finset.insert_subset_iff,Finset.singleton_subset_iff,rootWeightProduct,
      activeLeafWeight,hp,hq,hpq,mul_comm]

theorem activeRootLineMass_eq_sum {n : ℕ} (Γ : Finset ZPoint) (L : LineIndex n)
    (hL : ¬specified Γ L) (p : Grid n) (hpL : p ∈ L.val) (a : WitnessState n) :
    activeRootLineMass L p a = ∑ q ∈ L.val.erase p, rootLeafPhi Γ {p,q} p a.augmented.physical := by
  classical
  have he : (∑ q ∈ L.val.erase p, rootLeafPhi Γ {p,q} p a.augmented.physical) =
      ∑ q ∈ L.val.erase p, if p ∈ a.augmented.physical.process.activeEvents then
        a.augmented.physical.lineCredits L * activeLeafWeight q a else 0 := by
    apply Finset.sum_congr rfl
    intro q hq
    exact rootLeafPhi_pair_line Γ L hL p q hpL (Finset.mem_of_mem_erase hq)
      (Ne.symm (Finset.ne_of_mem_erase hq)) a
  rw [he]
  by_cases hp : p ∈ a.augmented.physical.process.activeEvents <;>
    simp [activeRootLineMass,boardLineMass,hp,Finset.mul_sum]

def observedActiveLineMass {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) (p : Grid n)
    (v : TimedObservation cfg) : ℝ :=
  activeRootLineMass L p (observedWitness cfg (unitBirthRetention n) v)

theorem observedActiveLineMass_eq_sum {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (hL : ¬specified cfg.directions L) (p : Grid n) (hpL : p ∈ L.val) (v : TimedObservation cfg) :
    observedActiveLineMass cfg L p v = ∑ q ∈ L.val.erase p, observedRootLeaf cfg {p,q} p v :=
  activeRootLineMass_eq_sum cfg.directions L hL p hpL _

theorem observedActiveLineMass_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (hL : ¬specified cfg.directions L) (p : Grid n) (hpL : p ∈ L.val) :
    Measurable (observedActiveLineMass cfg L p) := by
  have he : observedActiveLineMass cfg L p = fun v => ∑ q ∈ L.val.erase p, observedRootLeaf cfg {p,q} p v :=
    funext (observedActiveLineMass_eq_sum cfg L hL p hpL)
  rw [he]
  exact Finset.measurable_sum _ (fun q _ => observedRootLeaf_measurable cfg {p,q} p)

theorem observedActiveLineMass_bounds {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (hL : ¬specified cfg.directions L) (p : Grid n) (hpL : p ∈ L.val) (v : TimedObservation cfg) :
    0 ≤ observedActiveLineMass cfg L p v ∧ observedActiveLineMass cfg L p v ≤
      ∑ q ∈ L.val.erase p, rootLeafCap {p,q} p cfg.B := by
  rw [observedActiveLineMass_eq_sum cfg L hL p hpL]
  exact ⟨Finset.sum_nonneg (fun q _ => (observedRootLeaf_bounds cfg {p,q} p v).1),
    Finset.sum_le_sum (fun q _ => (observedRootLeaf_bounds cfg {p,q} p v).2)⟩

theorem observedCorrectedRootLeaf_le {n : ℕ} (cfg : FlowConfig n) (C labels : Finset (Grid n))
    (p : Grid n) (v : TimedObservation cfg) :
    observedCorrectedRootLeaf cfg C labels p v ≤ observedRootLeaf cfg C p v := by
  have hη : etaProduct labels v.1.val.1.eta ≤ 1 := Finset.prod_le_one
    (fun q _ => (v.1.property.1.2 q.1 q.2).1) (fun q _ => (v.1.property.1.2 q.1 q.2).2)
  exact mul_le_of_le_one_left (observedRootLeaf_bounds cfg C p v).1 hη

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.activeRootLineMass_eq_sum
#print axioms NoThreeLine.BirthWitness.observedActiveLineMass_bounds
#print axioms NoThreeLine.BirthWitness.observedCorrectedRootLeaf_le
