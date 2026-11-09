import NoThreeLine.LineSectionMarker
import NoThreeLine.LineSectionCreditGap
import NoThreeLine.RootPhaseReopen

/-! Reachable bounds for reopening only an artificial line-section phase
closure. Without the permanent contact marker, saved/current credit agree
and the current D-empty mixed family is dominated by the saved family. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator

theorem markedLineSectionStep_unmarked_before {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : MarkedLineSectionObservation cfg) (z : CandidateData n)
    (hm : (markedLineSectionStep cfg ε M start L p E A (s,z)).2 = false) : s.2 = false := by
  apply Bool.eq_false_iff.mpr
  intro h
  simp only [markedLineSectionStep,h,true_or,if_true] at hm
  exact Bool.noConfusion hm

theorem markedLineSectionStep_unmarked_advance_le {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : MarkedLineSectionObservation cfg) (z : CandidateData n)
    (hf : s.1.2.1 = false)
    (hm : (markedLineSectionStep cfg ε M start L p E A (s,z)).2 = false) :
    augAdvance cfg ε M (augTimedInput cfg s.1.1.1,z.1.1) ≤
      selectedLineSectionTime cfg L p E A (augTimedInput cfg s.1.1.1).1.1 := by
  apply le_of_not_gt
  intro h
  have hh : lineSectionPermanentContact cfg ε M L p E A (s.1.1,z) :=
    ⟨h.trans_le ((augAdvance_mem cfg ε M _ s.1.1.1.property.1.1 z.1.1).2.trans
      ((augGuardTime_le_remaining cfg ε M _ s.1.1.1.property.2.1).trans s.1.1.1.property.2.2)),h.le⟩
  simp only [markedLineSectionStep,hf,hh,true_and,or_true,if_true] at hm
  exact Bool.noConfusion hm

def UnmarkedLineSectionCredit {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : MarkedLineSectionObservation cfg) : Prop :=
  s.2 = false → (s.1.2.2.physical.process.accounts p).credit = augTimedCredit cfg p s.1.1.1

theorem markedLineSectionInitial_credit {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : TimedObservation cfg) : UnmarkedLineSectionCredit cfg p (markedLineSectionInitial cfg p s) :=
  fun _ => rfl

theorem markedLineSectionStep_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : MarkedLineSectionObservation cfg) (z : CandidateData n)
    (hs : MarkedLineSectionInvariant cfg p s) (hc : UnmarkedLineSectionCredit cfg p s) :
    UnmarkedLineSectionCredit cfg p (markedLineSectionStep cfg ε M start L p E A (s,z)) := by
  intro hm
  have hm0 := markedLineSectionStep_unmarked_before cfg ε M start L p E A s z hm
  by_cases hf : s.1.2.1 = true
  · have hp := lineSectionObserverStep_preserves_frozen cfg ε M start L p E A (s.1,z) hf
    change ((lineSectionObserverStep cfg ε M start L p E A (s.1,z)).2.2.physical.process.accounts p).credit = _
    rw [hp,markedLineSectionStep_projection,lineSectionObserverStep_projection]
    exact (hc hm0).trans (observedStep_closed_credit cfg ε M start (s.1.1,z) p
      (hs.unmarked_closed hm0 hf)).symm
  · exact lineSectionObserverStep_credit_of_advance_le cfg ε M start L p E A s.1 z
      (Bool.eq_false_iff.mpr hf)
      (markedLineSectionStep_unmarked_advance_le cfg ε M start L p E A s z (Bool.eq_false_iff.mpr hf) hm)

def LineSectionReopenBound {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : MarkedLineSectionObservation cfg) : Prop :=
  s.2 = false → ¬phaseRootClosed p (observedTimedProjection cfg s.1.1) →
    ∀ C labels, correctedPhi cfg.directions C labels s.1.1.1.val.1 ≤
      correctedPhi cfg.directions C labels s.1.2.2

theorem markedLineSectionInitial_reopenBound {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : TimedObservation cfg) : LineSectionReopenBound cfg p (markedLineSectionInitial cfg p s) :=
  fun _ _ _ _ => le_rfl

theorem markedLineSectionStep_reopenBound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : MarkedLineSectionObservation cfg) (z : CandidateData n)
    (hs : MarkedLineSectionInvariant cfg p s) (hb : LineSectionReopenBound cfg p s) :
    LineSectionReopenBound cfg p (markedLineSectionStep cfg ε M start L p E A (s,z)) := by
  intro hm hn C labels
  have hm0 := markedLineSectionStep_unmarked_before cfg ε M start L p E A s z hm
  have hn' : ¬phaseRootClosed p (observedTimedProjection cfg (observedStep cfg ε M start (s.1.1,z))) := by
    simpa only [markedLineSectionStep_projection,lineSectionObserverStep_projection] using hn
  by_cases hf : s.1.2.1 = true
  · have hd : observationDone cfg s.1.1 := by
      rcases hs.unmarked_closed hm0 hf with hd | hi
      · exact hd
      · have hpa : ((observedStep cfg ε M start (s.1.1,z)).1.val.1.physical.process.accounts p).status = .active :=
          by
            by_contra h
            exact hn' (Or.inr h)
        exact False.elim (hi ((ProcessState.mem_activeEvents _ _).mp
          (observedStep_active_subset cfg ε M start (s.1.1,z) ((ProcessState.mem_activeEvents _ _).mpr hpa))))
    have he := observedStep_frozen cfg ε M start (s.1.1,z) hd
    have hp := lineSectionObserverStep_preserves_frozen cfg ε M start L p E A (s.1,z) hf
    change correctedPhi cfg.directions C labels
      (lineSectionObserverStep cfg ε M start L p E A (s.1,z)).1.1.val.1 ≤
      correctedPhi cfg.directions C labels (lineSectionObserverStep cfg ε M start L p E A (s.1,z)).2.2
    rw [lineSectionObserverStep_projection,he,hp]
    exact hb hm0 (by simpa only [he] using hn') C labels
  · have hf0 := Bool.eq_false_iff.mpr hf
    by_cases hclose : lineSectionStepClose cfg ε M start L p E A (s.1.1,z)
    · have hp := lineSectionObserverStep_first_closure cfg ε M start L p E A (s.1,z) hf0 hclose
      change correctedPhi cfg.directions C labels
        (lineSectionObserverStep cfg ε M start L p E A (s.1,z)).1.1.val.1 ≤
        correctedPhi cfg.directions C labels (lineSectionObserverStep cfg ε M start L p E A (s.1,z)).2.2
      rw [lineSectionObserverStep_projection,hp,
        lineSectionRawSnapshot_eq_raw cfg ε M start L p E A (s.1.1,z)
          (markedLineSectionStep_unmarked_advance_le cfg ε M start L p E A s z hf0 hm)]
      simpa only [mixed_empty,observedWitness,savedWitness] using
        observedStep_mixed_le_rawStepSaved cfg ε M start (unitBirthRetention n) (s.1.1,z) C ∅ labels hs.core.records
    · simp only [markedLineSectionStep,lineSectionObserverStep,if_neg hf,if_neg hclose]
      exact le_rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.markedLineSectionStep_credit
#print axioms NoThreeLine.BirthWitness.markedLineSectionStep_reopenBound
