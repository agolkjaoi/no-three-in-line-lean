import NoThreeLine.ScheduledCrossingLocalValue
import NoThreeLine.ObservedPhaseContinuation
import NoThreeLine.IndexedLineStageMean

/-! Iterate the marked actual phases from any absolute index, retaining
whether the specified stage crossed. The physical state and board at
the end are exactly the original scheduled suffix. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem scheduledCrossingPair_physical_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (x : ProtectedPhaseState n B×BoardClockPath n) :
    let r := scheduledCrossingPair cs ε M deadline start L N E A hn b j x
    (r.1.1.1,r.2)=recycledScheduledPair cs ε M deadline start hn j (x.1.1,x.2) := by
  have hp := congrArg (fun y : (ValidAugmentedState n B×(Grid n→ℝ))×BoardClockPath n=>(y.1.1,y.2))
    (scheduledCrossingPair_projection cs ε M deadline start L N E A hn b j (⟨0,hn⟩,⟨0,hn⟩) x)
  exact hp.trans (protectedScheduledPair_projection cs ε M deadline start L (⟨0,hn⟩,⟨0,hn⟩) hn j x)

def scheduledCrossingTail {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) :
    ℕ → ℕ → ProtectedPhaseState n B×BoardClockPath n → (ProtectedPhaseState n B×Bool)×BoardClockPath n
  | _,0,x => ((x.1,false),x.2)
  | j,k+1,x =>
    let r := scheduledCrossingPair cs ε M deadline start L N E A hn b j x
    let q := scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) k (r.1.1,r.2)
    ((q.1.1,r.1.2 || q.1.2),q.2)

theorem scheduledCrossingTail_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (b : ℝ) (j k : ℕ) :
    Measurable (scheduledCrossingTail cs ε M deadline start L N E A hn b j k) := by
  induction k generalizing j with
  | zero => exact (measurable_fst.prodMk measurable_const).prodMk measurable_snd
  | succ k ih =>
    have hr := scheduledCrossingPair_measurable cs ε M deadline start L N E A hA hn b j
    have hq := (ih (j+1)).comp (hr.fst.fst.prodMk hr.snd)
    have hm : Measurable (fun z : Bool×Bool=>z.1 || z.2) := measurable_of_countable _
    exact (hq.fst.fst.prodMk (hm.comp (hr.fst.snd.prodMk hq.fst.snd))).prodMk hq.snd

theorem scheduledCrossingTail_physical_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j k : ℕ)
    (x : ProtectedPhaseState n B×BoardClockPath n) :
    let r := scheduledCrossingTail cs ε M deadline start L N E A hn b j k x
    ((j+k,r.1.1.1),r.2)=iterate (recycledPhaseStep cs ε M deadline start hn) (j,x.1.1) k x.2 := by
  induction k generalizing j x with
  | zero => rfl
  | succ k ih =>
    let r := scheduledCrossingPair cs ε M deadline start L N E A hn b j x
    let q := scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) k (r.1.1,r.2)
    have hp : (r.1.1.1,r.2)=recycledScheduledPair cs ε M deadline start hn j (x.1.1,x.2) :=
      scheduledCrossingPair_physical_projection cs ε M deadline start L N E A hn b j x
    let F := recycledPhaseStep cs ε M deadline start hn
    change ((j+(k+1),q.1.1.1),q.2)=iterate F (j,x.1.1) (k+1) x.2
    have hq := ih (j+1) (r.1.1,r.2)
    change (((j+1)+k,q.1.1.1),q.2)=iterate F (j+1,r.1.1.1) k r.2 at hq
    have he : iterate F (j,x.1.1) 1 x.2=((j+1,r.1.1.1),r.2) := by
      change F ((j,x.1.1),x.2)=_
      exact (congrArg (fun z : ValidAugmentedState n B×BoardClockPath n=>((j+1,z.1),z.2)) hp).symm
    rw [show j+(k+1)=(j+1)+k by omega,hq,show k+1=1+k by omega,iterate_add,he]

theorem scheduledCrossingTail_no_stage_flag {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j k : ℕ)
    (x : ProtectedPhaseState n B×BoardClockPath n)
    (hx : N<occupancy x.1.1.val.physical.process L) :
    (scheduledCrossingTail cs ε M deadline start L N E A hn b j k x).1.2=false := by
  induction k generalizing j x with
  | zero => rfl
  | succ k ih =>
    let r := scheduledCrossingPair cs ε M deadline start L N E A hn b j x
    let cfg := (cs j).config
    let a := protectedPhaseStart cfg ε M x.1
    have hb : r.1.2=false := by
      cases h : r.1.2
      · rfl
      · have hE : x.2∈protectedActualExceedance cfg ε M L N E A hn a b :=
          (scheduledCrossingPair_flag cs ε M deadline start L N E A hn b j x).mp h
        obtain ⟨i,hi⟩ := (mem_protectedActualExceedance_iff cfg ε M L N E A hn a b x.2).mp hE
        have hp := congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn a i x.2)
        have hm := recycled_occupancy_monotone cfg ε M L hn a.1 x.2 (Nat.zero_le i)
        change occupancy x.1.1.val.physical.process L≤
          occupancy (augRecycledPair cfg ε M hn a.1 i x.2).1.val.1.physical.process L at hm
        rw [←hp] at hm
        exact False.elim ((not_le_of_gt hx) (hm.trans hi.1.le))
    have hp := congrArg Prod.fst (scheduledCrossingPair_physical_projection cs ε M deadline start L N E A hn b j x)
    have hm := recycledScheduledPair_occupancy_le cs ε M deadline start hn j L x.1.1 x.2
    rw [←hp] at hm
    change (r.1.2 || (scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) k (r.1.1,r.2)).1.2)=false
    rw [hb,ih (j+1) (r.1.1,r.2) (hx.trans_le hm)]
    rfl

end NoThreeLine

#print axioms NoThreeLine.scheduledCrossingTail_physical_projection
#print axioms NoThreeLine.scheduledCrossingTail_no_stage_flag

