import NoThreeLine.RootPhaseInvariantKernel
import NoThreeLine.RecycledHistoryInequality

/-! The actual invariant root observer is iterated with its phase index.
The entire finite history, including every saved snapshot, is independent
of the actual remaining original board. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def rootPhaseRestartStep {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (x : (ℕ×GoodPhaseRootObservation n B p)×BoardClockPath n) :
    (ℕ×GoodPhaseRootObservation n B p)×BoardClockPath n :=
  let r := goodPhaseRootScheduledPair cs ε M deadline start p hn x.1.1 (x.1.2,x.2)
  ((x.1.1+1,r.1),r.2)

theorem rootPhaseRestartStep_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) :
    Measurable (rootPhaseRestartStep cs ε M deadline start p hn) := by
  have hm : Measurable (fun x : ℕ×(GoodPhaseRootObservation n B p×BoardClockPath n)=>
      goodPhaseRootScheduledPair cs ε M deadline start p hn x.1 x.2) :=
    measurable_from_prod_countable_right (goodPhaseRootScheduledPair_measurable cs ε M deadline start p hn)
  have hg : Measurable (fun x : (ℕ×GoodPhaseRootObservation n B p)×BoardClockPath n=>(x.1.1,(x.1.2,x.2))) :=
    measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd)
  have hi : Measurable (fun x : (ℕ×GoodPhaseRootObservation n B p)×BoardClockPath n=>x.1.1+1) :=
    (measurable_of_countable (fun j : ℕ=>j+1)).comp measurable_fst.fst
  exact (hi.prodMk (hm.comp hg).fst).prodMk (hm.comp hg).snd

theorem rootPhaseRestartStep_residual_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (s : ℕ×GoodPhaseRootObservation n B p) :
    (boardClockMeasure n (B/n)).map (fun ω=>rootPhaseRestartStep cs ε M deadline start p hn (s,ω))=
      ((boardClockMeasure n (B/n)).map
        (fun ω=>(rootPhaseRestartStep cs ε M deadline start p hn (s,ω)).1)).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hi : Measurable (fun a : GoodPhaseRootObservation n B p=>(s.1+1,a)) :=
    measurable_const.prodMk measurable_id
  have hp : Measurable (fun r : GoodPhaseRootObservation n B p×BoardClockPath n=>((s.1+1,r.1),r.2)) :=
    (measurable_const.prodMk measurable_fst).prodMk measurable_snd
  have hr : Measurable (fun ω : BoardClockPath n=>goodPhaseRootScheduledPair cs ε M deadline start p hn s.1 (s.2,ω)) :=
    (goodPhaseRootScheduledPair_measurable cs ε M deadline start p hn s.1).comp (measurable_const.prodMk measurable_id)
  have h := congrArg (fun μ : Measure (GoodPhaseRootObservation n B p×BoardClockPath n)=>
    μ.map (fun r=>((s.1+1,r.1),r.2)))
      (goodPhaseRootScheduledPair_residual_product cs ε M deadline start p hn hB s.1 s.2)
  rw [Measure.map_map hp hr,map_pair_with_fresh_right _ _ _ hi,Measure.map_map hi hr.fst] at h
  exact h

def rootPhaseRecycledPair {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) :=
  RecycledBoardProcess.iterate (rootPhaseRestartStep cs ε M deadline start p hn) (0,s) k ω

def rootPhaseRecycledState {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) : GoodPhaseRootObservation n B p :=
  (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).1.2

theorem rootPhaseRecycledPair_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) : Measurable (rootPhaseRecycledPair cs ε M deadline start p hn s k) :=
  RecycledBoardProcess.iterate_measurable _ (rootPhaseRestartStep_measurable cs ε M deadline start p hn) (0,s) k

theorem rootPhaseRecycledPair_index {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) :
    (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).1.1=k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).1.1+1=k+1
    rw [ih]

theorem rootPhaseRecycledState_succ {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) :
    rootPhaseRecycledState cs ε M deadline start p hn s (k+1) ω=
      (goodPhaseRootScheduledPair cs ε M deadline start p hn k
        (rootPhaseRecycledState cs ε M deadline start p hn s k ω,
          (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).2)).1 := by
  change (goodPhaseRootScheduledPair cs ε M deadline start p hn
    (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).1.1 _).1=_
  rw [rootPhaseRecycledPair_index]
  rfl

theorem rootPhaseRecycledPair_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) :
    ((rootPhaseRecycledPair cs ε M deadline start p hn s k ω).1.2.val,
      (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).2)=
      phaseRootPhases cs ε M deadline start p hn s.val k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change ((goodPhaseRootScheduledPair cs ε M deadline start p hn
      (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).1.1 _).1.val,
      (goodPhaseRootScheduledPair cs ε M deadline start p hn
        (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).1.1 _).2)=_
    rw [rootPhaseRecycledPair_index,goodPhaseRootScheduledPair_projection]
    change phaseRootScheduledPair cs ε M deadline start p hn k
      ((rootPhaseRecycledPair cs ε M deadline start p hn s k ω).1.2.val,
        (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).2)=_
    rw [ih]
    rfl

def rootPhaseHistory {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) :=
  StateHistory.history (RecycledBoardProcess.state (rootPhaseRestartStep cs ε M deadline start p hn) (0,s)) k

theorem rootPhaseHistory_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) : Measurable (rootPhaseHistory cs ε M deadline start p hn s k) :=
  StateHistory.history_measurable _ (RecycledBoardProcess.state_measurable _
    (rootPhaseRestartStep_measurable cs ε M deadline start p hn) (0,s)) k

theorem rootPhaseHistory_residual_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (fun ω=>(rootPhaseHistory cs ε M deadline start p hn s k ω,
      (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).2))=
      ((boardClockMeasure n (B/n)).map (rootPhaseHistory cs ε M deadline start p hn s k)).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact RecycledBoardProcess.history_residual_product _ (rootPhaseRestartStep_measurable cs ε M deadline start p hn) _
    (rootPhaseRestartStep_residual_product cs ε M deadline start p hn hB) (0,s) k

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.rootPhaseRecycledPair_projection
#print axioms NoThreeLine.BirthWitness.rootPhaseHistory_residual_product
