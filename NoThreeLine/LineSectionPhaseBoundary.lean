import NoThreeLine.LineSectionReopen

/-! Permanent extra-contact/root closure survives a phase boundary;
only an unmarked, active, unstopped artificial closure reopens. Actual
deadline retirement and the original physical/record projection are kept. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator
attribute [local instance] Classical.propDecidable

abbrev PhaseLineSectionObservation (n : ℕ) (B : ℝ) := PhaseObservation n B × (Bool × AugmentedState n)

structure PhaseLineSectionInvariant {n : ℕ} {B : ℝ} (p : Grid n)
    (s : PhaseLineSectionObservation n B) : Prop where
  records : PhaseRecordsConsistent s.1
  saved : s.2.2.Valid B
  live : s.2.1 = false → s.2.2 = s.1.1.val
  open_root : s.2.1 = false → ¬phaseRootClosed p s.1

def phaseLineSectionEnd {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : MarkedLineSectionObservation cfg) : PhaseLineSectionObservation n cfg.B :=
  let actual := observedTimedProjection cfg s.1.1
  if s.2 = true ∨ phaseRootClosed p actual then (actual,true,s.1.2.2)
    else (actual,false,actual.1.val)

theorem phaseLineSectionEnd_projection {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : MarkedLineSectionObservation cfg) :
    (phaseLineSectionEnd cfg p s).1 = observedTimedProjection cfg s.1.1 := by
  dsimp only [phaseLineSectionEnd]
  split_ifs <;> rfl

theorem phaseLineSectionEnd_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :
    Measurable (phaseLineSectionEnd cfg p) := by
  have ha : Measurable (fun s : MarkedLineSectionObservation cfg => observedTimedProjection cfg s.1.1) :=
    (observedTimedProjection_measurable cfg).comp measurable_fst.fst
  exact Measurable.ite ((measurable_snd.eq_const true).or
    ((phaseRootClosed_measurable p).comp ha)).setOf
    (ha.prodMk (measurable_const.prodMk measurable_fst.snd.snd))
    (ha.prodMk (measurable_const.prodMk (measurable_subtype_coe.comp ha.fst)))

theorem phaseLineSectionEnd_invariant {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : MarkedLineSectionObservation cfg) (hs : MarkedLineSectionInvariant cfg p s) :
    PhaseLineSectionInvariant p (phaseLineSectionEnd cfg p s) := by
  by_cases hc : s.2 = true ∨ phaseRootClosed p (observedTimedProjection cfg s.1.1)
  · simp only [phaseLineSectionEnd,if_pos hc]
    exact ⟨hs.core.records,hs.core.saved,fun h => False.elim (Bool.noConfusion h),
      fun h => False.elim (Bool.noConfusion h)⟩
  · simp only [phaseLineSectionEnd,if_neg hc]
    exact ⟨hs.core.records,s.1.1.1.property.1,fun _ => rfl,fun _ h => hc (Or.inr h)⟩

theorem phaseLineSectionEnd_mixed_le {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : MarkedLineSectionObservation cfg) (hb : LineSectionReopenBound cfg p s)
    (C labels : Finset (Grid n)) :
    correctedPhi cfg.directions C labels (phaseLineSectionEnd cfg p s).2.2 ≤
      correctedPhi cfg.directions C labels s.1.2.2 := by
  by_cases hc : s.2 = true ∨ phaseRootClosed p (observedTimedProjection cfg s.1.1)
  · simp only [phaseLineSectionEnd,if_pos hc]
    exact le_rfl
  · simp only [phaseLineSectionEnd,if_neg hc]
    exact hb (Bool.eq_false_iff.mpr (fun h => hc (Or.inl h))) (fun h => hc (Or.inr h)) C labels

def phaseLineSectionDeadline {n : ℕ} {B : ℝ} (p : Grid n) (deadline : Grid n → ℝ)
    (t : ℝ) (s : PhaseLineSectionObservation n B) : PhaseLineSectionObservation n B :=
  let next := observedDeadline deadline t s.1
  if s.2.1 = true then (next,s.2)
    else if phaseRootClosed p next then (next,true,s.1.1.val) else (next,false,next.1.val)

theorem phaseLineSectionDeadline_projection {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (s : PhaseLineSectionObservation n B) :
    (phaseLineSectionDeadline p deadline t s).1 = observedDeadline deadline t s.1 := by
  dsimp only [phaseLineSectionDeadline]
  split_ifs <;> rfl

theorem phaseLineSectionDeadline_measurable {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) : Measurable (phaseLineSectionDeadline (B:=B) p deadline t) := by
  have hn : Measurable (fun s : PhaseLineSectionObservation n B => observedDeadline deadline t s.1) :=
    (observedDeadline_measurable deadline t).comp measurable_fst
  apply Measurable.ite (measurable_snd.fst.eq_const true).setOf
  · exact hn.prodMk measurable_snd
  · exact Measurable.ite ((phaseRootClosed_measurable p).comp hn).setOf
      (hn.prodMk (measurable_const.prodMk (measurable_subtype_coe.comp measurable_fst.fst)))
      (hn.prodMk (measurable_const.prodMk (measurable_subtype_coe.comp hn.fst)))

theorem phaseLineSectionDeadline_invariant {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (s : PhaseLineSectionObservation n B)
    (hs : PhaseLineSectionInvariant p s) :
    PhaseLineSectionInvariant p (phaseLineSectionDeadline p deadline t s) := by
  have hr := observedDeadline_consistent deadline t s.1 hs.records
  dsimp only [phaseLineSectionDeadline]
  split_ifs with hf hc
  · exact ⟨hr,hs.saved,fun h => False.elim (Bool.noConfusion (hf.symm.trans h)),
      fun h => False.elim (Bool.noConfusion (hf.symm.trans h))⟩
  · exact ⟨hr,s.1.1.property,fun h => False.elim (Bool.noConfusion h),
      fun h => False.elim (Bool.noConfusion h)⟩
  · exact ⟨hr,(observedDeadline deadline t s.1).1.property,fun _ => rfl,fun _ => hc⟩

theorem phaseLineSectionDeadline_mixed_le {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (s : PhaseLineSectionObservation n B)
    (hs : PhaseLineSectionInvariant p s) (Γ : Finset PrimitiveLines.ZPoint) (C labels : Finset (Grid n)) :
    correctedPhi Γ C labels (phaseLineSectionDeadline p deadline t s).2.2 ≤
      correctedPhi Γ C labels s.2.2 := by
  by_cases hf : s.2.1 = true
  · simp only [phaseLineSectionDeadline,if_pos hf]
    exact le_rfl
  · rw [hs.live (Bool.eq_false_iff.mpr hf)]
    dsimp only [phaseLineSectionDeadline]
    rw [if_neg hf]
    split_ifs
    · exact le_rfl
    · simpa only [mixed_empty,phaseWitness] using
        phaseWitness_deadline_mixed_le (unitBirthRetention n) Γ C ∅ labels deadline t s.1 hs.records

def phaseLineSectionStart {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : PhaseLineSectionObservation n cfg.B) : MarkedLineSectionObservation cfg :=
  if s.2.1 = true then ((observedPhaseStart cfg ε M s.1,true,s.2.2),true)
    else markedLineSectionInitial cfg p (observedPhaseStart cfg ε M s.1)

theorem phaseLineSectionStart_projection {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : PhaseLineSectionObservation n cfg.B) :
    (phaseLineSectionStart cfg ε M p s).1.1 = observedPhaseStart cfg ε M s.1 := by
  unfold phaseLineSectionStart
  split_ifs <;> rfl

theorem phaseLineSectionStart_invariant {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : PhaseLineSectionObservation n cfg.B) (hs : PhaseLineSectionInvariant p s) :
    MarkedLineSectionInvariant cfg p (phaseLineSectionStart cfg ε M p s) := by
  unfold phaseLineSectionStart
  split_ifs
  · refine ⟨⟨hs.records,hs.saved,fun h => False.elim (Bool.noConfusion h),
      fun h => False.elim (Bool.noConfusion h)⟩,fun _ => rfl,?_⟩
    intro h
    exact False.elim (Bool.noConfusion h)
  · exact markedLineSectionInitial_invariant cfg p _ hs.records

theorem phaseLineSectionStart_saved {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : PhaseLineSectionObservation n cfg.B) (hs : PhaseLineSectionInvariant p s) :
    (phaseLineSectionStart cfg ε M p s).1.2.2 = s.2.2 := by
  unfold phaseLineSectionStart
  split_ifs with hf
  · rfl
  · exact (hs.live (Bool.eq_false_iff.mpr hf)).symm

theorem phaseLineSectionStart_reopenBound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : PhaseLineSectionObservation n cfg.B) :
    LineSectionReopenBound cfg p (phaseLineSectionStart cfg ε M p s) := by
  unfold phaseLineSectionStart
  split_ifs
  · intro h
    exact False.elim (Bool.noConfusion h)
  · exact markedLineSectionInitial_reopenBound cfg p _

theorem phaseLineSectionStart_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : PhaseLineSectionObservation n cfg.B) :
    UnmarkedLineSectionCredit cfg p (phaseLineSectionStart cfg ε M p s) := by
  unfold phaseLineSectionStart
  split_ifs
  · intro h
    exact False.elim (Bool.noConfusion h)
  · exact markedLineSectionInitial_credit cfg p _

theorem markedLineSectionInitial_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :
    Measurable (markedLineSectionInitial cfg p) := by
  have hi : Measurable (lineSectionInitial cfg p) :=
    measurable_id.prodMk ((Measurable.ite (rootClosed_measurable cfg p).setOf
      measurable_const measurable_const).prodMk (measurable_subtype_coe.fst.comp measurable_fst))
  exact hi.prodMk measurable_const

theorem phaseLineSectionStart_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (phaseLineSectionStart cfg ε M p) := by
  have ha : Measurable (fun s : PhaseLineSectionObservation n cfg.B => observedPhaseStart cfg ε M s.1) :=
    (observedPhaseStart_measurable cfg ε M).comp measurable_fst
  exact Measurable.ite (measurable_snd.fst.eq_const true).setOf
    ((ha.prodMk (measurable_const.prodMk measurable_snd.snd)).prodMk measurable_const)
    ((markedLineSectionInitial_measurable cfg p).comp ha)

def phaseLineSectionBoundary {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (s : MarkedLineSectionObservation cfg) : PhaseLineSectionObservation n cfg.B :=
  phaseLineSectionDeadline p deadline t (phaseLineSectionEnd cfg p s)

theorem phaseLineSectionBoundary_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) : Measurable (phaseLineSectionBoundary cfg p deadline t) :=
  (phaseLineSectionDeadline_measurable p deadline t).comp (phaseLineSectionEnd_measurable cfg p)

theorem phaseLineSectionBoundary_projection {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (s : MarkedLineSectionObservation cfg) :
    (phaseLineSectionBoundary cfg p deadline t s).1 =
      observedDeadline deadline t (observedTimedProjection cfg s.1.1) := by
  rw [phaseLineSectionBoundary,phaseLineSectionDeadline_projection,phaseLineSectionEnd_projection]

theorem phaseLineSectionBoundary_invariant {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (s : MarkedLineSectionObservation cfg)
    (hs : MarkedLineSectionInvariant cfg p s) :
    PhaseLineSectionInvariant p (phaseLineSectionBoundary cfg p deadline t s) :=
  phaseLineSectionDeadline_invariant p deadline t _ (phaseLineSectionEnd_invariant cfg p s hs)

theorem phaseLineSectionBoundary_mixed_le {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (s : MarkedLineSectionObservation cfg)
    (hs : MarkedLineSectionInvariant cfg p s) (hb : LineSectionReopenBound cfg p s)
    (C labels : Finset (Grid n)) :
    correctedPhi cfg.directions C labels (phaseLineSectionBoundary cfg p deadline t s).2.2 ≤
      correctedPhi cfg.directions C labels s.1.2.2 :=
  (phaseLineSectionDeadline_mixed_le p deadline t _ (phaseLineSectionEnd_invariant cfg p s hs)
    cfg.directions C labels).trans (phaseLineSectionEnd_mixed_le cfg p s hb C labels)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseLineSectionDeadline_mixed_le
#print axioms NoThreeLine.BirthWitness.phaseLineSectionStart_invariant
#print axioms NoThreeLine.BirthWitness.phaseLineSectionBoundary_mixed_le
