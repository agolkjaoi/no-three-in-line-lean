import NoThreeLine.RootFreezeStep
import NoThreeLine.WitnessPhaseRetirement
import NoThreeLine.ObservedPhaseRestart

/-! Phase boundaries carry a permanent root-closure flag. Unlike the
within-phase flag it does not include the artificial horizon. Deadline
closure saves the complete pre-deadline observation. Physical states,
birth records and saved credit are not altered by the observer. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open PrimitiveLines AuxiliaryODE MixedConnection EtaMixedGenerator

abbrev PhaseRootObservation (n : ℕ) (B : ℝ) :=
  PhaseObservation n B × (Bool × SavedObservation n)

def phaseSaved {n : ℕ} {B : ℝ} (s : PhaseObservation n B) : SavedObservation n :=
  (s.1.val,s.2)

def phaseRootClosed {n : ℕ} {B : ℝ} (p : Grid n) (s : PhaseObservation n B) : Prop :=
  s.1.val.physical.process.stopped=true ∨ (s.1.val.physical.process.accounts p).status≠.active

instance {n : ℕ} {B : ℝ} (p : Grid n) (s : PhaseObservation n B) :
    Decidable (phaseRootClosed p s) := Classical.propDecidable _

theorem phaseSaved_measurable {n : ℕ} {B : ℝ} : Measurable (phaseSaved (n:=n) (B:=B)) :=
  (measurable_subtype_coe.comp measurable_fst).prodMk measurable_snd

theorem phaseSaved_valid {n : ℕ} {B : ℝ} (s : PhaseObservation n B)
    (hs : PhaseRecordsConsistent s) : SavedValid B (phaseSaved s) := ⟨s.1.property,hs⟩

theorem phaseSaved_witness {n : ℕ} {B : ℝ} (e : Retention n) (s : PhaseObservation n B) :
    savedWitness e (phaseSaved s)=phaseWitness e s := rfl

theorem phaseRootClosed_measurable {n : ℕ} {B : ℝ} (p : Grid n) :
    Measurable (phaseRootClosed (B:=B) p) := by
  have hp : Measurable (fun s : PhaseObservation n B=>s.1.val.physical.process) :=
    (ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
      (measurable_subtype_coe.comp measurable_fst))
  exact (((ProcessState.measurable_stopped n).comp hp).eq_const true).or
    ((CreditAccount.measurable_status.comp ((ProcessState.measurable_account n p).comp hp)).eq_const CreditStatus.active).not

theorem observedPhaseStart_saved {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : PhaseObservation n cfg.B) :
    savedObservation cfg (observedPhaseStart cfg ε M s)=phaseSaved s := rfl

theorem observedPhaseStart_rootClosed {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (s : PhaseObservation n cfg.B) :
    rootClosed cfg p (observedPhaseStart cfg ε M s) ↔
      (cfg.horizon:ℝ)≤0 ∨ phaseRootClosed p s := by
  change (((cfg.horizon:ℝ)≤0 ∨ s.1.val.physical.process.stopped=true) ∨
    (s.1.val.physical.process.accounts p).status≠CreditStatus.active) ↔ _
  exact or_assoc

theorem observedDeadline_credit {n : ℕ} {B : ℝ} (deadline : Grid n→ℝ) (t : ℝ)
    (s : PhaseObservation n B) (p : Grid n) :
    ((observedDeadline deadline t s).1.val.physical.process.accounts p).credit=
      (s.1.val.physical.process.accounts p).credit :=
  augValidDeadlineRetirement_credit deadline t s.1 p

theorem observedDeadline_rootClosed {n : ℕ} {B : ℝ} (deadline : Grid n→ℝ) (t : ℝ)
    (s : PhaseObservation n B) (p : Grid n) (hs : phaseRootClosed p s) :
    phaseRootClosed p (observedDeadline deadline t s) := by
  rcases hs with hs | hs
  · left
    exact (augValidDeadlineRetirement_stop_flag deadline t s.1).trans hs
  · right
    have hsub : (observedDeadline deadline t s).1.val.physical.process.activeEvents⊆
        s.1.val.physical.process.activeEvents := by
      unfold observedDeadline augValidDeadlineRetirement
      split_ifs
      · exact Finset.Subset.refl _
      · exact retire_activeEvents_subset _ _
    intro ha
    exact hs ((ProcessState.mem_activeEvents _ _).mp (hsub ((ProcessState.mem_activeEvents _ _).mpr ha)))

structure PhaseRootInvariant {n : ℕ} {B : ℝ} (p : Grid n)
    (s : PhaseRootObservation n B) : Prop where
  records : PhaseRecordsConsistent s.1
  saved : SavedValid B s.2.2
  closed_iff : s.2.1=true ↔ phaseRootClosed p s.1
  live : s.2.1=false → s.2.2=phaseSaved s.1
  credit : (s.2.2.1.physical.process.accounts p).credit=
    (s.1.1.val.physical.process.accounts p).credit

def phaseRootDeadline {n : ℕ} {B : ℝ} (p : Grid n) (deadline : Grid n→ℝ) (t : ℝ)
    (s : PhaseRootObservation n B) : PhaseRootObservation n B :=
  let next := observedDeadline deadline t s.1
  if s.2.1=true then (next,s.2)
  else if phaseRootClosed p next then (next,true,phaseSaved s.1)
  else (next,false,phaseSaved next)

theorem phaseRootDeadline_measurable {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) : Measurable (phaseRootDeadline (B:=B) p deadline t) := by
  have hn : Measurable (fun s : PhaseRootObservation n B=>observedDeadline deadline t s.1) :=
    (observedDeadline_measurable (B:=B) deadline t).comp measurable_fst
  apply Measurable.ite (measurable_snd.fst.eq_const true).setOf
  · exact hn.prodMk measurable_snd
  · apply Measurable.ite ((phaseRootClosed_measurable p).comp hn).setOf
    · exact hn.prodMk (measurable_const.prodMk (phaseSaved_measurable.comp measurable_fst))
    · exact hn.prodMk (measurable_const.prodMk (phaseSaved_measurable.comp hn))

theorem phaseRootDeadline_projection {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : PhaseRootObservation n B) :
    (phaseRootDeadline p deadline t s).1=observedDeadline deadline t s.1 := by
  dsimp only [phaseRootDeadline]
  split_ifs <;> rfl

theorem phaseRootDeadline_invariant {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : PhaseRootObservation n B) (hs : PhaseRootInvariant p s) :
    PhaseRootInvariant p (phaseRootDeadline p deadline t s) := by
  have hr := observedDeadline_consistent deadline t s.1 hs.records
  by_cases hf : s.2.1=true
  · simp only [phaseRootDeadline,if_pos hf]
    have hc := observedDeadline_rootClosed deadline t s.1 p (hs.closed_iff.mp hf)
    refine ⟨hr,hs.saved,⟨fun _=>hc,fun _=>hf⟩,?_,?_⟩
    · intro h
      exact False.elim (Bool.noConfusion (hf.symm.trans h))
    · exact hs.credit.trans (observedDeadline_credit deadline t s.1 p).symm
  · by_cases hc : phaseRootClosed p (observedDeadline deadline t s.1)
    · simp only [phaseRootDeadline,if_neg hf,if_pos hc]
      refine ⟨hr,phaseSaved_valid s.1 hs.records,⟨fun _=>hc,fun _=>rfl⟩,?_,?_⟩
      · intro h
        exact False.elim (Bool.noConfusion h)
      · exact (observedDeadline_credit deadline t s.1 p).symm
    · simp only [phaseRootDeadline,if_neg hf,if_neg hc]
      refine ⟨hr,phaseSaved_valid _ hr,?_,fun _=>rfl,rfl⟩
      exact ⟨fun h=>False.elim (Bool.noConfusion h),fun h=>False.elim (hc h)⟩

theorem phaseRootDeadline_mixed_le {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : PhaseRootObservation n B) (hs : PhaseRootInvariant p s)
    (e : Retention n) (Γ : Finset ZPoint) (C D L : Finset (Grid n)) :
    mixed Γ C D L (savedWitness e (phaseRootDeadline p deadline t s).2.2)≤
      mixed Γ C D L (savedWitness e s.2.2) := by
  by_cases hf : s.2.1=true
  · simp only [phaseRootDeadline,if_pos hf]
    exact le_rfl
  · have hf0 : s.2.1=false := Bool.eq_false_iff.mpr hf
    rw [hs.live hf0]
    by_cases hc : phaseRootClosed p (observedDeadline deadline t s.1)
    · simp only [phaseRootDeadline,if_neg hf,if_pos hc]
      exact le_rfl
    · simp only [phaseRootDeadline,if_neg hf,if_neg hc,phaseSaved_witness]
      exact phaseWitness_deadline_mixed_le e Γ C D L deadline t s.1 hs.records

def phaseRootStart {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : PhaseRootObservation n cfg.B) : RootObservation cfg :=
  if s.2.1=true then (observedPhaseStart cfg ε M s.1,true,s.2.2)
  else rootObserverInitial cfg p (observedPhaseStart cfg ε M s.1)

theorem phaseRootStart_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (phaseRootStart cfg ε M p) :=
  Measurable.ite (measurable_snd.fst.eq_const true).setOf
    (((observedPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk
      (measurable_const.prodMk measurable_snd.snd))
    ((rootObserverInitial_measurable cfg p).comp ((observedPhaseStart_measurable cfg ε M).comp measurable_fst))

theorem phaseRootStart_projection {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : PhaseRootObservation n cfg.B) :
    (phaseRootStart cfg ε M p s).1=observedPhaseStart cfg ε M s.1 := by
  unfold phaseRootStart
  split_ifs <;> rfl

theorem phaseRootStart_invariant {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : PhaseRootObservation n cfg.B) (hs : PhaseRootInvariant p s) :
    RootObserverInvariant cfg p (phaseRootStart cfg ε M p s) := by
  by_cases hf : s.2.1=true
  · simp only [phaseRootStart,if_pos hf]
    have hc := (observedPhaseStart_rootClosed cfg ε M p s.1).mpr (Or.inr (hs.closed_iff.mp hf))
    refine ⟨hs.records,hs.saved,⟨fun _=>hc,fun _=>rfl⟩,?_,hs.credit⟩
    intro h
    exact False.elim (Bool.noConfusion h)
  · simp only [phaseRootStart,if_neg hf]
    exact rootObserverInitial_invariant cfg p _ hs.records

theorem phaseRootStart_saved {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : PhaseRootObservation n cfg.B) (hs : PhaseRootInvariant p s) :
    (phaseRootStart cfg ε M p s).2.2=s.2.2 := by
  by_cases hf : s.2.1=true
  · simp only [phaseRootStart,if_pos hf]
  · simp only [phaseRootStart,if_neg hf,rootObserverInitial,observedPhaseStart_saved]
    exact (hs.live (Bool.eq_false_iff.mpr hf)).symm

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedPhaseStart_saved
#print axioms NoThreeLine.BirthWitness.phaseRootDeadline_invariant
#print axioms NoThreeLine.BirthWitness.phaseRootDeadline_mixed_le
#print axioms NoThreeLine.BirthWitness.phaseRootStart_invariant
