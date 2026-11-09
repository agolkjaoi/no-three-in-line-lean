import NoThreeLine.RootPhaseBoundary
import NoThreeLine.RootFreezeRecycled

/-! Reopen only an active, globally unstopped root at an artificial phase
endpoint. Its endpoint observation may differ from its pre-resolution
saved observation. The needed domination is proved as a reachable invariant,
not postulated as a bound on the process. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open PrimitiveLines AuxiliaryODE

def phaseRootEnd {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : RootObservation cfg) : PhaseRootObservation n cfg.B :=
  let actual := observedTimedProjection cfg s.1
  if phaseRootClosed p actual then (actual,true,s.2.2)
  else (actual,false,phaseSaved actual)

theorem phaseRootEnd_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :
    Measurable (phaseRootEnd cfg p) := by
  have ha : Measurable (fun s : RootObservation cfg=>observedTimedProjection cfg s.1) :=
    (observedTimedProjection_measurable cfg).comp measurable_fst
  exact Measurable.ite ((phaseRootClosed_measurable p).comp ha).setOf
    (ha.prodMk (measurable_const.prodMk measurable_snd.snd))
    (ha.prodMk (measurable_const.prodMk (phaseSaved_measurable.comp ha)))

theorem phaseRootEnd_projection {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : RootObservation cfg) : (phaseRootEnd cfg p s).1=observedTimedProjection cfg s.1 := by
  dsimp only [phaseRootEnd]
  split_ifs <;> rfl

theorem phaseRootEnd_invariant {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : RootObservation cfg) (hs : RootObserverInvariant cfg p s) :
    PhaseRootInvariant p (phaseRootEnd cfg p s) := by
  have hr : PhaseRecordsConsistent (observedTimedProjection cfg s.1) := hs.records
  by_cases hc : phaseRootClosed p (observedTimedProjection cfg s.1)
  · simp only [phaseRootEnd,if_pos hc]
    refine ⟨hr,hs.saved,⟨fun _=>hc,fun _=>rfl⟩,?_,hs.credit⟩
    intro h
    exact False.elim (Bool.noConfusion h)
  · simp only [phaseRootEnd,if_neg hc]
    refine ⟨hr,phaseSaved_valid _ hr,?_,fun _=>rfl,rfl⟩
    exact ⟨fun h=>False.elim (Bool.noConfusion h),fun h=>False.elim (hc h)⟩

def RootReopenBound {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (e : Retention n)
    (s : RootObservation cfg) : Prop :=
  ¬phaseRootClosed p (observedTimedProjection cfg s.1) → ∀C D L,
    mixed cfg.directions C D L (savedWitness e (phaseSaved (observedTimedProjection cfg s.1)))≤
      mixed cfg.directions C D L (savedWitness e s.2.2)

theorem rootObserverInitial_reopenBound {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (e : Retention n) (s : TimedObservation cfg) :
    RootReopenBound cfg p e (rootObserverInitial cfg p s) := by
  intro _ C D L
  exact le_rfl

theorem rootObserverStep_reopenBound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (s : RootObservation cfg) (z : CandidateData n)
    (hs : RootObserverInvariant cfg p s) (hb : RootReopenBound cfg p e s) :
    RootReopenBound cfg p e (rootObserverStep cfg ε M start p (s,z)) := by
  intro hn C D L
  by_cases hf : s.2.1=true
  · have hn' : ¬phaseRootClosed p (observedTimedProjection cfg (observedStep cfg ε M start (s.1,z))) := by
      simpa only [rootObserverStep_projection] using hn
    have ha : ((observedStep cfg ε M start (s.1,z)).1.val.1.physical.process.accounts p).status=.active := by
      by_contra h
      exact hn' (Or.inr h)
    have hd : observationDone cfg s.1 := by
      rcases hs.closed_iff.mp hf with hd | hi
      · exact hd
      · exact False.elim (hi ((ProcessState.mem_activeEvents _ _).mp
          (observedStep_active_subset cfg ε M start (s.1,z) ((ProcessState.mem_activeEvents _ _).mpr ha))))
    have he : rootObserverStep cfg ε M start p (s,z)=s := by
      simp only [rootObserverStep,if_pos hf,observedStep_frozen cfg ε M start (s.1,z) hd]
    rw [he] at hn ⊢
    exact hb hn C D L
  · by_cases hc : rootClosed cfg p (observedStep cfg ε M start (s.1,z))
    · simp only [rootObserverStep,if_neg hf,if_pos hc]
      exact observedStep_mixed_le_rawStepSaved cfg ε M start e (s.1,z) C D L hs.records
    · simp only [rootObserverStep,if_neg hf,if_neg hc]
      exact le_rfl

theorem rootObserverRecycledPair_reopenBound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (hn : 0<n) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) (hb : RootReopenBound cfg p e s)
    (k : ℕ) (ω : BoardClockPath n) :
    RootReopenBound cfg p e (rootObserverRecycledPair cfg ε M start p hn s k ω).1 := by
  induction k with
  | zero => exact hb
  | succ k ih =>
    exact rootObserverStep_reopenBound cfg ε M start p e _ _
      (rootObserverRecycledPair_invariant cfg ε M start p hn s hs k ω) ih

theorem phaseRootEnd_mixed_le {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (e : Retention n) (s : RootObservation cfg) (hb : RootReopenBound cfg p e s)
    (C D L : Finset (Grid n)) :
    mixed cfg.directions C D L (savedWitness e (phaseRootEnd cfg p s).2.2)≤
      mixed cfg.directions C D L (savedWitness e s.2.2) := by
  by_cases hc : phaseRootClosed p (observedTimedProjection cfg s.1)
  · simp only [phaseRootEnd,if_pos hc]
    exact le_rfl
  · simp only [phaseRootEnd,if_neg hc]
    exact hb hc C D L

def phaseRootBoundary {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : RootObservation cfg) : PhaseRootObservation n cfg.B :=
  phaseRootDeadline p deadline t (phaseRootEnd cfg p s)

theorem phaseRootBoundary_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) : Measurable (phaseRootBoundary cfg p deadline t) :=
  (phaseRootDeadline_measurable p deadline t).comp (phaseRootEnd_measurable cfg p)

theorem phaseRootBoundary_invariant {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : RootObservation cfg) (hs : RootObserverInvariant cfg p s) :
    PhaseRootInvariant p (phaseRootBoundary cfg p deadline t s) :=
  phaseRootDeadline_invariant p deadline t _ (phaseRootEnd_invariant cfg p s hs)

theorem phaseRootBoundary_projection {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : RootObservation cfg) :
    (phaseRootBoundary cfg p deadline t s).1=observedDeadline deadline t (observedTimedProjection cfg s.1) := by
  rw [phaseRootBoundary,phaseRootDeadline_projection,phaseRootEnd_projection]

theorem phaseRootBoundary_mixed_le {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (e : Retention n) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) (hb : RootReopenBound cfg p e s) (C D L : Finset (Grid n)) :
    mixed cfg.directions C D L (savedWitness e (phaseRootBoundary cfg p deadline t s).2.2)≤
      mixed cfg.directions C D L (savedWitness e s.2.2) :=
  (phaseRootDeadline_mixed_le p deadline t _ (phaseRootEnd_invariant cfg p s hs) e cfg.directions C D L).trans
    (phaseRootEnd_mixed_le cfg p e s hb C D L)

theorem phaseRootStart_reopenBound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (e : Retention n) (s : PhaseRootObservation n cfg.B) (hs : PhaseRootInvariant p s) :
    RootReopenBound cfg p e (phaseRootStart cfg ε M p s) := by
  by_cases hf : s.2.1=true
  · intro hn
    apply False.elim
    apply hn
    rw [phaseRootStart_projection]
    exact hs.closed_iff.mp hf
  · simpa only [phaseRootStart,if_neg hf] using
      rootObserverInitial_reopenBound cfg p e (observedPhaseStart cfg ε M s.1)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rootObserverStep_reopenBound
#print axioms NoThreeLine.BirthWitness.rootObserverRecycledPair_reopenBound
#print axioms NoThreeLine.BirthWitness.phaseRootBoundary_mixed_le
#print axioms NoThreeLine.BirthWitness.phaseRootStart_reopenBound
