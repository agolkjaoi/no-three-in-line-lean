import NoThreeLine.LineSectionObserver

/-! The stored snapshot at a strict interior mass contact is the original
selected curve at that contact, with the actual section mass above threshold.
Candidate/contact ties retain the existing candidate-priority convention and
are not identified with the pre-birth curve by this theorem. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator

def actualLineSectionMass {n : ℕ} (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (a : AugmentedState n) : ℝ :=
  lineSectionMass a.physical.process L p E a.physical.coordinates

theorem actualLineSectionMass_measurable {n : ℕ} (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) : Measurable (actualLineSectionMass L p E) := by
  have hproc := (ExtendedState.measurable_process n).comp (AugmentedState.measurable_physical n)
  have hr := (measurable_pi_apply L).comp
    ((ExtendedState.measurable_lineCredits n).comp (AugmentedState.measurable_physical n))
  apply hr.mul
  apply Finset.measurable_sum
  intro q hq
  have ha := (ProcessState.measurable_account n q).comp hproc
  exact Measurable.ite ((CreditAccount.measurable_status.comp ha).eq_const .active).setOf
    (CreditAccount.measurable_weight.comp ha) measurable_const

theorem actualLineSectionMass_selected {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (E : Finset (Grid n)) (x : EtaFlowInput cfg) (t : ℝ) :
    actualLineSectionMass L p E (selectedAugmentedCurve cfg x t) =
      lineSectionMass x.1.val.process L p E (selectedCurve cfg (x.1,t)) := by
  change lineSectionMass (x.1.val.withCoordinates (selectedCurve cfg (x.1,t))).process L p E
    (x.1.val.withCoordinates (selectedCurve cfg (x.1,t))).coordinates = _
  rw [ExtendedState.withCoordinates_coordinates]
  rfl

theorem actualLineSectionMass_bounds {n : ℕ} (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (a : AugmentedState n) (B : ℝ) (hB : 0 ≤ B) (ha : a.Valid B) :
    0 ≤ actualLineSectionMass L p E a ∧ actualLineSectionMass L p E a ≤
      B * (((L.val ∩ E).erase p).card : ℝ) := by
  let S := (L.val ∩ E).erase p
  have hw (q : Grid n) : 0 ≤ (if (a.physical.process.accounts q).status = .active then
      (a.physical.process.accounts q).weight else 0) ∧
      (if (a.physical.process.accounts q).status = .active then (a.physical.process.accounts q).weight else 0) ≤ B := by
    split_ifs
    · exact ha.1.2.1.1 q
    · exact ⟨le_rfl,hB⟩
  have hs0 : 0 ≤ ∑ q ∈ S, if (a.physical.process.accounts q).status = .active then
      (a.physical.process.accounts q).weight else 0 := Finset.sum_nonneg (fun q _ => (hw q).1)
  have hs1 : (∑ q ∈ S, if (a.physical.process.accounts q).status = .active then
      (a.physical.process.accounts q).weight else 0) ≤ B * (S.card:ℝ) := by
    calc
      _ ≤ ∑ _q ∈ S, B := Finset.sum_le_sum (fun q _ => (hw q).2)
      _ = _ := by simp [mul_comm]
  have hr := ha.1.2.1.2.2 L
  exact ⟨mul_nonneg hr.1 hs0,(mul_le_of_le_one_left hs0 hr.2).trans hs1⟩

theorem lineSectionObserverStep_interior_contact {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (z : CandidateData n) (hs : LineSectionInvariant cfg p s)
    (hf : s.2.1 = false)
    (ht : selectedLineSectionTime cfg L p E A (augTimedInput cfg s.1.1).1.1 <
      augAdvance cfg ε M (augTimedInput cfg s.1.1,z.1.1)) :
    (lineSectionObserverStep cfg ε M start L p E A (s,z)).2.1 = true ∧
      (lineSectionObserverStep cfg ε M start L p E A (s,z)).2.2 =
        selectedAugmentedCurve cfg (augTimedInput cfg s.1.1).1
          (selectedLineSectionTime cfg L p E A (augTimedInput cfg s.1.1).1.1) ∧
      A ≤ actualLineSectionMass L p E (lineSectionObserverStep cfg ε M start L p E A (s,z)).2.2 := by
  have hd : ¬observationDone cfg s.1 := fun h => hs.open_root hf (Or.inl h)
  rw [lineSectionObserverStep_first_closure cfg ε M start L p E A (s,z) hf (Or.inr ht.le),
    lineSectionRawSnapshot_interior cfg ε M L p E A (s.1,z) hd ht]
  refine ⟨rfl,rfl,?_⟩
  rw [actualLineSectionMass_selected]
  apply selectedLineSectionTime_contact
  exact ht.trans_le ((augAdvance_mem cfg ε M (augTimedInput cfg s.1.1) s.1.1.property.1.1 z.1.1).2.trans
    ((augGuardTime_le_remaining cfg ε M (augTimedInput cfg s.1.1) s.1.1.property.2.1).trans s.1.1.property.2.2))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.actualLineSectionMass_bounds
#print axioms NoThreeLine.BirthWitness.lineSectionObserverStep_interior_contact
