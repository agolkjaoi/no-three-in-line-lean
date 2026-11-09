import NoThreeLine.CrossingAppend
import NoThreeLine.TimedCrossingStageWeight

/-! A crossing flag on the actual remaining schedule from a packed timed
restart. It observes the unfinished phase and all its original successors. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def scheduledCrossingRemainderPair {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (J : ℕ)
    (x : (ℕ×ProtectedPhaseState n B)×BoardClockPath n) :
    (ProtectedPhaseState n B×Bool)×BoardClockPath n :=
  let j := x.1.1
  if j<J then
    let s := unpackProtectedTimed (cs j).config x.1.2
    crossingAppend (scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) (J-(j+1)))
      (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,x.2))
  else ((x.1.2,false),x.2)

theorem scheduledCrossingRemainderPair_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (b : ℝ) (J : ℕ) :
    Measurable (scheduledCrossingRemainderPair cs ε M deadline start L N E A hn b J) := by
  let f := fun j (x : ProtectedPhaseState n B×BoardClockPath n)=>
    crossingAppend (scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) (J-(j+1)))
      (timedCrossingPhasePair cs ε M deadline start L N E A hn b j
        (unpackProtectedTimed (cs j).config x.1,x.2))
  have hf (j : ℕ) : Measurable (f j) :=
    (crossingAppend_measurable _ (scheduledCrossingTail_measurable cs ε M deadline start L N E A hA hn b
      (j+1) (J-(j+1)))).comp
      ((timedCrossingPhasePair_measurable cs ε M deadline start L N E A hA hn b j).comp
        (((unpackProtectedTimed_measurable (cs j).config).comp measurable_fst).prodMk measurable_snd))
  have hg : Measurable (fun x : ℕ×(ProtectedPhaseState n B×BoardClockPath n)=>f x.1 x.2) :=
    measurable_from_prod_countable_right hf
  exact Measurable.ite
    ((measurable_of_countable (fun j : ℕ=>j<J)).comp measurable_fst.fst).setOf
    (hg.comp (measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd)))
    ((measurable_fst.snd.prodMk measurable_const).prodMk measurable_snd)

theorem scheduledCrossingRemainderPair_physical {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (J : ℕ)
    (x : (ℕ×ProtectedPhaseState n B)×BoardClockPath n) :
    (scheduledCrossingRemainderPair cs ε M deadline start L N E A hn b J x).1.1.1=
      scheduledLineRemainderState cs ε M deadline start hn J x := by
  by_cases hj : x.1.1<J
  · let j := x.1.1
    let s := unpackProtectedTimed (cs j).config x.1.2
    let r := timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,x.2)
    let q := augRecycledTerminalPair (cs j).config ε M hn s.1 x.2
    let k := J-(j+1)
    have hp : (r.1.1.1,r.2)=(finishRestartedPhase cs deadline start j q.1,q.2) :=
      timedCrossingPhasePair_projection cs ε M deadline start L N E A hn b j s x.2
    have ht := congrArg (fun y : (ℕ×ValidAugmentedState n B)×BoardClockPath n=>y.1.2)
      (scheduledCrossingTail_physical_projection cs ε M deadline start L N E A hn b (j+1) k (r.1.1,r.2))
    change (scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) k (r.1.1,r.2)).1.1.1=
      (RecycledBoardProcess.iterate (recycledPhaseStep cs ε M deadline start hn)
        (j+1,r.1.1.1) k r.2).1.2 at ht
    simp only [scheduledCrossingRemainderPair,scheduledLineRemainderState,if_pos hj,crossingAppend]
    change (scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) k (r.1.1,r.2)).1.1.1=
      (RecycledBoardProcess.iterate (recycledPhaseStep cs ε M deadline start hn)
        (j+1,finishRestartedPhase cs deadline start j q.1) k q.2).1.2
    rw [ht,show r.1.1.1=finishRestartedPhase cs deadline start j q.1 from congrArg Prod.fst hp,
      show r.2=q.2 from congrArg Prod.snd hp]
  · simp only [scheduledCrossingRemainderPair,scheduledLineRemainderState,if_neg hj]

end NoThreeLine

#print axioms NoThreeLine.scheduledCrossingRemainderPair_measurable
#print axioms NoThreeLine.scheduledCrossingRemainderPair_physical

