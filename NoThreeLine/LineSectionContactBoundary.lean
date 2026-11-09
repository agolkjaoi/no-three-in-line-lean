import NoThreeLine.MarkedSectionContactCapture
import NoThreeLine.RootPhaseAbsorption

/-! A genuine closed contact at an executed boundary has its pre-birth mass
when the actual candidate time is strictly later. The condition will be
supplied by the exponential no-atom law, not postulated for all paths. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE EtaMixedGenerator BirthWitness

theorem sourceCap_raw_of_candidate_later {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ)
    (hc : 0 ≤ c) (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (z : CandidateData n) (hle : c ≤ augAdvance cfg ε M (x,z.1.1)) (hlt : c < z.1.1) :
    augRawOutcome cfg ε M (sourceCapInput cfg c x,z) = selectedAugmentedCurve cfg x.1 c := by
  have hcG := hle.trans (augAdvance_mem cfg ε M x he z.1.1).2
  have hg : augGuardTime cfg ε M (sourceCapInput cfg c x) = c := by
    rw [sourceCap_guard cfg ε M c hc x,min_eq_right hcG]
  have ha : augAdvance cfg ε M (sourceCapInput cfg c x,z.1.1) = c := by
    rw [sourceCap_advance cfg ε M c hc x z.1.1,min_eq_right hle]
  have hw : ¬(0 < z.1.1 ∧ z.1.1 ≤ augGuardTime cfg ε M (sourceCapInput cfg c x)) := by
    rw [hg]
    exact fun h => (not_le_of_gt hlt) h.2
  simp only [augRawOutcome,if_neg hw,augPreState_selectedAugmentedCurve,ha]
  rfl

namespace BirthWitness

theorem lineSectionRawSnapshot_boundary {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : TimedObservation cfg × CandidateData n) (hd : ¬observationDone cfg x.1)
    (hle : selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.1).1.1 ≤
      augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1))
    (hlt : selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.1).1.1 < x.2.1.1) :
    lineSectionRawSnapshot cfg ε M L p E A x =
      selectedAugmentedCurve cfg (augTimedInput cfg x.1.1).1
        (selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.1).1.1) := by
  simp only [lineSectionRawSnapshot,if_neg hd,lineSectionInput]
  exact sourceCap_raw_of_candidate_later cfg ε M _ (selectedLineSectionTime_bounds cfg L p E A _).1
    _ x.1.1.property.1.1 x.2 hle hlt

theorem lineSectionObserverStep_boundary_contact {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (z : CandidateData n) (hs : LineSectionInvariant cfg p s)
    (hf : s.2.1 = false) (hc : lineSectionPermanentContact cfg ε M L p E A (s.1,z))
    (ht : selectedLineSectionTime cfg L p E A (augTimedInput cfg s.1.1).1.1 < z.1.1) :
    A ≤ actualLineSectionMass L p E (lineSectionObserverStep cfg ε M start L p E A (s,z)).2.2 := by
  have hd : ¬observationDone cfg s.1 := fun h => hs.open_root hf (Or.inl h)
  rw [lineSectionObserverStep_first_closure cfg ε M start L p E A (s,z) hf (Or.inr hc.2),
    lineSectionRawSnapshot_boundary cfg ε M L p E A (s.1,z) hd hc.2 ht,
    actualLineSectionMass_selected]
  exact selectedLineSectionTime_contact cfg L p E A _ hc.1

def MarkedSectionMassSupport {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (s : MarkedLineSectionObservation cfg) : Prop :=
  s.2 = true → A ≤ actualLineSectionMass L p E s.1.2.2 ∨
    phaseRootClosed p (observedTimedProjection cfg s.1.1)

theorem markedLineSectionStep_massSupport {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : MarkedLineSectionObservation cfg) (z : CandidateData n)
    (hs : MarkedLineSectionInvariant cfg p s) (hm : MarkedSectionMassSupport cfg L p E A s)
    (ht0 : 0 < z.1.1)
    (htne : z.1.1 ≠ selectedLineSectionTime cfg L p E A (augTimedInput cfg s.1.1.1).1.1) :
    MarkedSectionMassSupport cfg L p E A (markedLineSectionStep cfg ε M start L p E A (s,z)) := by
  classical
  intro hf
  by_cases hpre : s.2 = true
  · rcases hm hpre with hmass | hclose
    · left
      change A ≤ actualLineSectionMass L p E (lineSectionObserverStep cfg ε M start L p E A (s.1,z)).2.2
      rw [lineSectionObserverStep_preserves_frozen cfg ε M start L p E A (s.1,z) (hs.contact_closed hpre)]
      exact hmass
    · right
      rw [markedLineSectionStep_projection,lineSectionObserverStep_projection]
      exact observedStep_permanentRootClosed cfg ε M start p s.1.1 z hclose
  · have hh : s.1.2.1 = false ∧ lineSectionPermanentContact cfg ε M L p E A (s.1.1,z) := by
      change (if _ then true else false) = true at hf
      split_ifs at hf with h
      · exact h.resolve_left hpre
    left
    have htime : augAdvance cfg ε M (augTimedInput cfg s.1.1.1,z.1.1) ≤ z.1.1 := by
      exact max_le ht0.le (min_le_right _ _)
    have hlt := lt_of_le_of_ne (hh.2.2.trans htime) (Ne.symm htne)
    exact lineSectionObserverStep_boundary_contact cfg ε M start L p E A s.1 z hs.core hh.1 hh.2 hlt

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.sourceCap_raw_of_candidate_later
#print axioms NoThreeLine.BirthWitness.lineSectionObserverStep_boundary_contact
#print axioms NoThreeLine.BirthWitness.markedLineSectionStep_massSupport
