import NoThreeLine.PhaseLineSectionKernel
import NoThreeLine.RecycledHistoryInequality

/-! The permanently marked section observer iterates on the original board.
Its full finite history, including saved snapshots and the permanent flag,
is independent of the actual remaining board. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def phaseSectionRestartStep {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0<n)
    (x : (ℕ×GoodPhaseLineSection n B p)×BoardClockPath n) :
    (ℕ×GoodPhaseLineSection n B p)×BoardClockPath n :=
  let r := phaseSectionScheduledPair cs ε M deadline start L p E A hn x.1.1 (x.1.2,x.2)
  ((x.1.1+1,r.1),r.2)

theorem phaseSectionRestartStep_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0<n) :
    Measurable (phaseSectionRestartStep cs ε M deadline start L p E A hn) := by
  have hm : Measurable (fun x : ℕ×(GoodPhaseLineSection n B p×BoardClockPath n)=>
      phaseSectionScheduledPair cs ε M deadline start L p E A hn x.1 x.2) :=
    measurable_from_prod_countable_right (phaseSectionScheduledPair_measurable cs ε M deadline start L p E A hn)
  have hg : Measurable (fun x : (ℕ×GoodPhaseLineSection n B p)×BoardClockPath n=>(x.1.1,(x.1.2,x.2))) :=
    measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd)
  have hi : Measurable (fun x : (ℕ×GoodPhaseLineSection n B p)×BoardClockPath n=>x.1.1+1) :=
    (measurable_of_countable (fun j : ℕ=>j+1)).comp measurable_fst.fst
  exact (hi.prodMk (hm.comp hg).fst).prodMk (hm.comp hg).snd

theorem phaseSectionRestartStep_residual_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0<n) (hB : 0<B)
    (s : ℕ×GoodPhaseLineSection n B p) :
    (boardClockMeasure n (B/n)).map (fun ω=>phaseSectionRestartStep cs ε M deadline start L p E A hn (s,ω))=
      ((boardClockMeasure n (B/n)).map
        (fun ω=>(phaseSectionRestartStep cs ε M deadline start L p E A hn (s,ω)).1)).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hi : Measurable (fun a : GoodPhaseLineSection n B p=>(s.1+1,a)) :=
    measurable_const.prodMk measurable_id
  have hp : Measurable (fun r : GoodPhaseLineSection n B p×BoardClockPath n=>((s.1+1,r.1),r.2)) :=
    (measurable_const.prodMk measurable_fst).prodMk measurable_snd
  have hr : Measurable (fun ω : BoardClockPath n=>phaseSectionScheduledPair cs ε M deadline start L p E A hn s.1 (s.2,ω)) :=
    (phaseSectionScheduledPair_measurable cs ε M deadline start L p E A hn s.1).comp (measurable_const.prodMk measurable_id)
  have h := congrArg (fun μ : Measure (GoodPhaseLineSection n B p×BoardClockPath n)=>
    μ.map (fun r=>((s.1+1,r.1),r.2)))
      (phaseSectionScheduledPair_residual_product cs ε M deadline start L p E A hn hB s.1 s.2)
  rw [Measure.map_map hp hr,map_pair_with_fresh_right _ _ _ hi,Measure.map_map hi hr.fst] at h
  exact h

def phaseSectionRecycledPair {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0<n)
    (s : GoodPhaseLineSection n B p) (k : ℕ) (ω : BoardClockPath n) :=
  RecycledBoardProcess.iterate (phaseSectionRestartStep cs ε M deadline start L p E A hn) (0,s) k ω

def phaseSectionRecycledState {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0<n)
    (s : GoodPhaseLineSection n B p) (k : ℕ) (ω : BoardClockPath n) : GoodPhaseLineSection n B p :=
  (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).1.2

theorem phaseSectionRecycledPair_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0<n)
    (s : GoodPhaseLineSection n B p) (k : ℕ) : Measurable (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k) :=
  RecycledBoardProcess.iterate_measurable _ (phaseSectionRestartStep_measurable cs ε M deadline start L p E A hn) (0,s) k

theorem phaseSectionRecycledPair_index {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0<n)
    (s : GoodPhaseLineSection n B p) (k : ℕ) (ω : BoardClockPath n) :
    (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).1.1=k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).1.1+1=k+1
    rw [ih]

theorem phaseSectionRecycledState_succ {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0<n)
    (s : GoodPhaseLineSection n B p) (k : ℕ) (ω : BoardClockPath n) :
    phaseSectionRecycledState cs ε M deadline start L p E A hn s (k+1) ω=
      (phaseSectionScheduledPair cs ε M deadline start L p E A hn k
        (phaseSectionRecycledState cs ε M deadline start L p E A hn s k ω,
          (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).2)).1 := by
  change (phaseSectionScheduledPair cs ε M deadline start L p E A hn
    (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).1.1 _).1=_
  rw [phaseSectionRecycledPair_index]
  rfl

theorem phaseSectionRecycledPair_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0<n)
    (s : GoodPhaseLineSection n B p) (k : ℕ) (ω : BoardClockPath n) :
    (((phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).1.1,
      (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).1.2.val.1),
      (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).2) =
      observedRecycledPhases cs ε M deadline start hn s.val.1 k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change ((_,(phaseSectionScheduledPair cs ε M deadline start L p E A hn
      (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).1.1 _).1.val.1),
      (phaseSectionScheduledPair cs ε M deadline start L p E A hn
        (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).1.1 _).2) = _
    rw [phaseSectionRecycledPair_index,observedRecycledPhases_succ]
    have hp := phaseSectionScheduledPair_projection cs ε M deadline start L p E A hn k
      ((phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).1.2,
        (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).2)
    have hb := congrArg (fun v : (ℕ × PhaseObservation n B) × BoardClockPath n => (v.1.2,v.2)) ih
    have he := hp.trans (congrArg (observedScheduledPair cs ε M deadline start hn k) hb)
    simp only [phaseSectionRecycledPair_index]
    simpa only [phaseSectionRecycledPair] using
      congrArg (fun v : PhaseObservation n B × BoardClockPath n => ((k+1,v.1),v.2)) he

def phaseSectionHistory {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0<n)
    (s : GoodPhaseLineSection n B p) (k : ℕ) :=
  StateHistory.history (RecycledBoardProcess.state (phaseSectionRestartStep cs ε M deadline start L p E A hn) (0,s)) k

theorem phaseSectionHistory_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0<n)
    (s : GoodPhaseLineSection n B p) (k : ℕ) : Measurable (phaseSectionHistory cs ε M deadline start L p E A hn s k) :=
  StateHistory.history_measurable _ (RecycledBoardProcess.state_measurable _
    (phaseSectionRestartStep_measurable cs ε M deadline start L p E A hn) (0,s)) k

theorem phaseSectionHistory_residual_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0<n) (hB : 0<B)
    (s : GoodPhaseLineSection n B p) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (fun ω=>(phaseSectionHistory cs ε M deadline start L p E A hn s k ω,
      (phaseSectionRecycledPair cs ε M deadline start L p E A hn s k ω).2))=
      ((boardClockMeasure n (B/n)).map (phaseSectionHistory cs ε M deadline start L p E A hn s k)).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact RecycledBoardProcess.history_residual_product _ (phaseSectionRestartStep_measurable cs ε M deadline start L p E A hn) _
    (phaseSectionRestartStep_residual_product cs ε M deadline start L p E A hn hB) (0,s) k

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseSectionRecycledPair_projection
#print axioms NoThreeLine.BirthWitness.phaseSectionHistory_residual_product
