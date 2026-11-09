import NoThreeLine.ScheduledFirstCrossing
import NoThreeLine.ScheduledLineRemainder

/-! Mark the unfinished part of a real phase. Its incoming time is the
time left at the actual restart, and its retirement is the original
absolute retirement at this phase's deadline. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def timedCrossingPhasePair {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (x : ProtectedTimedState (cs j).config×BoardClockPath n) :
    (ProtectedPhaseState n B×Bool)×BoardClockPath n :=
  let cfg := (cs j).config
  let r := protectedCrossingTerminalPair cfg ε M L N E A hn b x
  ((protectedPhaseEnd cfg L deadline (phaseEndpoint cs start (j+1)) ((r.1.1,0),0),r.1.2),r.2)

theorem timedCrossingPhasePair_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (b : ℝ) (j : ℕ) :
    Measurable (timedCrossingPhasePair cs ε M deadline start L N E A hn b j) := by
  let cfg := (cs j).config
  have hr := protectedCrossingTerminalPair_measurable cfg ε M L N E A hA hn b
  have he := (protectedPhaseEnd_measurable cfg L deadline (phaseEndpoint cs start (j+1))).comp
    ((hr.fst.fst.prodMk (measurable_const (a := (0:ℝ)))).prodMk (measurable_const (a := (0:ℝ))))
  exact (he.prodMk hr.fst.snd).prodMk hr.snd

theorem timedCrossingPhasePair_map {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B) (b : ℝ)
    (j : ℕ) (s : ProtectedTimedState (cs j).config) :
    (boardClockMeasure n (B/n)).map (fun ω=>timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω))=
      ((boardClockMeasure n (B/n)).map (fun ω=>(timedCrossingPhasePair cs ε M deadline start L N E A hn b j
        (s,ω)).1)).prod (boardClockMeasure n (B/n)) := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let cfg := (cs j).config
  let r := fun ω=>protectedCrossingTerminalPair cfg ε M L N E A hn b (s,ω)
  let d : ProtectedTimedState cfg×Bool→ProtectedPhaseState n B×Bool := fun u=>
    (protectedPhaseEnd cfg L deadline (phaseEndpoint cs start (j+1)) ((u.1,0),0),u.2)
  have hd : Measurable d := ((protectedPhaseEnd_measurable cfg L deadline _).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_const)).prodMk measurable_snd
  have hr : Measurable r := (protectedCrossingTerminalPair_measurable cfg ε M L N E A hA hn b).comp
    (measurable_const.prodMk measurable_id)
  let q := fun x : (ProtectedTimedState cfg×Bool)×BoardClockPath n=>(d x.1,x.2)
  have hq : Measurable q := (hd.comp measurable_fst).prodMk measurable_snd
  have hm := congrArg (fun ρ : Measure ((ProtectedTimedState cfg×Bool)×BoardClockPath n)=>ρ.map q)
    (protectedCrossingTerminalPair_map cfg ε M L N E A hA hn hB b s)
  rw [Measure.map_map hq hr,map_pair_with_fresh_right _ _ d hd,Measure.map_map hd hr.fst] at hm
  exact hm

theorem timedCrossingPhasePair_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (s : ProtectedTimedState (cs j).config) (ω : BoardClockPath n) :
    let r := timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)
    let q := augRecycledTerminalPair (cs j).config ε M hn s.1 ω
    (r.1.1.1,r.2)=(finishRestartedPhase cs deadline start j q.1,q.2) := by
  exact congrArg (fun z : AugTimedState (cs j).config×BoardClockPath n=>
    (finishRestartedPhase cs deadline start j z.1,z.2))
      (protectedRecycledTerminalPair_projection (cs j).config ε M L hn s ω)

theorem timedCrossingPhasePair_flag {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (s : ProtectedTimedState (cs j).config) (ω : BoardClockPath n) :
    (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.2=true ↔
      ω∈protectedActualExceedance (cs j).config ε M L N E A hn s b := by
  classical
  simp [timedCrossingPhasePair,protectedCrossingTerminalPair]

end NoThreeLine

#print axioms NoThreeLine.timedCrossingPhasePair_map
#print axioms NoThreeLine.timedCrossingPhasePair_projection

