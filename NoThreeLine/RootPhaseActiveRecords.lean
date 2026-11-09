import NoThreeLine.RootActiveRecords
import NoThreeLine.RootPhaseCoarseProduct

/-! The active-root saved/current record identity through all original
phases. Artificial reopening and true deadline retirement preserve it. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def PhaseRootActiveRecords {n : ℕ} {B : ℝ} (p : Grid n) (s : PhaseRootObservation n B) : Prop :=
  (s.1.1.val.physical.process.accounts p).status=.active → s.2.2.2=s.1.2

theorem phaseRootInitial_activeRecords {n : ℕ} {B : ℝ} (p : Grid n) (s : PhaseObservation n B) :
    PhaseRootActiveRecords p (phaseRootInitial p s) := fun _=>rfl

theorem phaseRootStart_activeRecords {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (s : PhaseRootObservation n cfg.B) (hi : PhaseRootActiveRecords p s) :
    RootActiveRecords cfg p (phaseRootStart cfg ε M p s) := by
  by_cases hf : s.2.1=true
  · simp only [phaseRootStart,if_pos hf]
    exact hi
  · simp only [phaseRootStart,if_neg hf]
    exact rootObserverInitial_activeRecords cfg p _

theorem phaseRootEnd_activeRecords {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : RootObservation cfg) (hi : RootActiveRecords cfg p s) :
    PhaseRootActiveRecords p (phaseRootEnd cfg p s) := by
  intro ha
  have hao : (s.1.1.val.1.physical.process.accounts p).status=.active := by
    simpa only [phaseRootEnd_projection,observedTimedProjection,augTimedStateProjection] using ha
  dsimp only [phaseRootEnd]
  split_ifs
  · exact hi hao
  · rfl

theorem phaseRootDeadline_activeRecords {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : PhaseRootObservation n B)
    (hi : PhaseRootActiveRecords p s) :
    PhaseRootActiveRecords p (phaseRootDeadline p deadline t s) := by
  intro ha
  have han : ((observedDeadline deadline t s.1).1.val.physical.process.accounts p).status=.active := by
    simpa only [phaseRootDeadline_projection] using ha
  have hsub : (observedDeadline deadline t s.1).1.val.physical.process.activeEvents⊆
      s.1.1.val.physical.process.activeEvents := by
    unfold observedDeadline augValidDeadlineRetirement
    split_ifs
    · exact Finset.Subset.refl _
    · exact retire_activeEvents_subset _ _
  have hao : (s.1.1.val.physical.process.accounts p).status=.active :=
    (ProcessState.mem_activeEvents _ _).mp (hsub ((ProcessState.mem_activeEvents _ _).mpr han))
  by_cases hf : s.2.1=true
  · simp only [phaseRootDeadline,if_pos hf]
    exact hi hao
  · dsimp only [phaseRootDeadline]
    simp only [if_neg hf]
    split_ifs <;> rfl

theorem phaseRootRun_activeRecords {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (x : PhaseRootObservation n cfg.B×BoardClockPath n)
    (hx : PhaseRootInvariant p x.1) (hi : PhaseRootActiveRecords p x.1) :
    RootActiveRecords cfg p (phaseRootRun cfg ε M start p hn x).1 :=
  rootObserverRecycledPair_activeRecords cfg ε M start p hn _
    (phaseRootStart_invariant cfg ε M p x.1 hx) (phaseRootStart_activeRecords cfg ε M p x.1 hi) _ x.2

theorem phaseRootScheduledPair_activeRecords {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (j : ℕ) (x : PhaseRootObservation n B×BoardClockPath n)
    (hx : PhaseRootInvariant p x.1) (hi : PhaseRootActiveRecords p x.1) :
    PhaseRootActiveRecords p (phaseRootScheduledPair cs ε M deadline start p hn j x).1 :=
  phaseRootDeadline_activeRecords p deadline _ _ (phaseRootEnd_activeRecords (cs j).config p _
    (phaseRootRun_activeRecords (cs j).config ε M _ p hn x hx hi))

theorem phaseRootPhases_activeRecords {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (s : PhaseRootObservation n B) (hs : PhaseRootInvariant p s)
    (hi : PhaseRootActiveRecords p s) (k : ℕ) (ω : BoardClockPath n) :
    PhaseRootActiveRecords p (phaseRootPhases cs ε M deadline start p hn s k ω).1 := by
  induction k with
  | zero => exact hi
  | succ k ih =>
    exact phaseRootScheduledPair_activeRecords cs ε M deadline start p hn k _
      (phaseRootPhases_invariant cs ε M deadline start p hn s hs k ω) ih

theorem initial_phaseRootPhases_activeRecords {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (k : ℕ) (ω : BoardClockPath n) :
    PhaseRootActiveRecords p (phaseRootPhases cs ε M deadline start p hn
      (initialGoodPhaseRootObservation B hB p deadline start).val k ω).1 :=
  phaseRootPhases_activeRecords cs ε M deadline start p hn _
    (initialGoodPhaseRootObservation B hB p deadline start).property.1
    (phaseRootInitial_activeRecords p _) k ω

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseRootDeadline_activeRecords
#print axioms NoThreeLine.BirthWitness.initial_phaseRootPhases_activeRecords
