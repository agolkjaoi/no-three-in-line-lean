import NoThreeLine.ProtectedCrossingTerminal
import NoThreeLine.ProtectedScheduledKernel

/-! One actual scheduled phase with its crossing flag. Completion,
deadline retirement, the protected ledger, and the original residual board
retain their ordinary projections. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def scheduledCrossingPair {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (x : ProtectedPhaseState n B×BoardClockPath n) :
    (ProtectedPhaseState n B×Bool)×BoardClockPath n :=
  let cfg := (cs j).config
  let r := protectedCrossingTerminalPair cfg ε M L N E A hn b (protectedPhaseStart cfg ε M x.1,x.2)
  ((protectedPhaseEnd cfg L deadline (phaseEndpoint cs start (j+1)) ((r.1.1,0),x.1.2.2),r.1.2),r.2)

theorem scheduledCrossingPair_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (b : ℝ) (j : ℕ) :
    Measurable (scheduledCrossingPair cs ε M deadline start L N E A hn b j) := by
  let cfg := (cs j).config
  have hr := (protectedCrossingTerminalPair_measurable cfg ε M L N E A hA hn b).comp
    (((protectedPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd)
  have he := (protectedPhaseEnd_measurable cfg L deadline (phaseEndpoint cs start (j+1))).comp
    ((hr.fst.fst.prodMk (measurable_const (a := (0:ℝ)))).prodMk measurable_fst.snd.snd)
  exact (he.prodMk hr.fst.snd).prodMk hr.snd

theorem scheduledCrossingPair_map {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (j : ℕ) (s : ProtectedPhaseState n B) :
    (boardClockMeasure n (B/n)).map (fun ω=>scheduledCrossingPair cs ε M deadline start L N E A hn b j (s,ω))=
      ((boardClockMeasure n (B/n)).map (fun ω=>(scheduledCrossingPair cs ε M deadline start L N E A hn b j
        (s,ω)).1)).prod (boardClockMeasure n (B/n)) := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let cfg := (cs j).config
  let a := protectedPhaseStart cfg ε M s
  let r := fun ω=>protectedCrossingTerminalPair cfg ε M L N E A hn b (a,ω)
  let d : ProtectedTimedState cfg×Bool→ProtectedPhaseState n B×Bool := fun u=>
    (protectedPhaseEnd cfg L deadline (phaseEndpoint cs start (j+1)) ((u.1,0),s.2.2),u.2)
  have hd : Measurable d := ((protectedPhaseEnd_measurable cfg L deadline _).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_const)).prodMk measurable_snd
  have hr : Measurable r := (protectedCrossingTerminalPair_measurable cfg ε M L N E A hA hn b).comp
    (measurable_const.prodMk measurable_id)
  let q := fun x : (ProtectedTimedState cfg×Bool)×BoardClockPath n=>(d x.1,x.2)
  have hq : Measurable q := (hd.comp measurable_fst).prodMk measurable_snd
  have hm := congrArg (fun ρ : Measure ((ProtectedTimedState cfg×Bool)×BoardClockPath n)=>ρ.map q)
    (protectedCrossingTerminalPair_map cfg ε M L N E A hA hn hB b a)
  rw [Measure.map_map hq hr,map_pair_with_fresh_right _ _ d hd,Measure.map_map hd hr.fst] at hm
  exact hm

theorem scheduledCrossingPair_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ) (p : Grid n)
    (x : ProtectedPhaseState n B×BoardClockPath n) :
    let r := scheduledCrossingPair cs ε M deadline start L N E A hn b j x
    let q := protectedScheduledPair cs ε M deadline start L p hn j x
    ((r.1.1.1,r.1.1.2.1),r.2)=((q.1.1,q.1.2.1),q.2) := rfl

theorem scheduledCrossingPair_flag {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (x : ProtectedPhaseState n B×BoardClockPath n) :
    (scheduledCrossingPair cs ε M deadline start L N E A hn b j x).1.2=true ↔
      x.2∈protectedActualExceedance (cs j).config ε M L N E A hn
        (protectedPhaseStart (cs j).config ε M x.1) b := by
  classical
  simp [scheduledCrossingPair,protectedCrossingTerminalPair]

end NoThreeLine

#print axioms NoThreeLine.scheduledCrossingPair_projection
#print axioms NoThreeLine.scheduledCrossingPair_map
#print axioms NoThreeLine.scheduledCrossingPair_flag

