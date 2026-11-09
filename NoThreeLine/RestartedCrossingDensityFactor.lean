import NoThreeLine.RestartedCrossingRemainder
import NoThreeLine.ScheduledCrossingSuffix
import NoThreeLine.ScheduledRemainderDensity
import NoThreeLine.ScheduledLineForbiddenLaw

/-! The actual restart density factors at the original end of the
unfinished phase. The residual board is reused in the scheduled suffix. -/
set_option autoImplicit false
set_option maxHeartbeats 1750000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

def lineStageBoundaryDensity {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ)
    (e v : ValidAugmentedState n B) : ℝ :=
  if validLineStageValue K L N e=0 then 1
    else validLineStageValue K L N v / validLineStageValue K L N e

theorem lineStageBoundaryDensity_eq {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ)
    (e v : ValidAugmentedState n B) (ho : occupancy e.val.physical.process L=N)
    (hk : e.val.physical.clocks L≤K) :
    lineStageBoundaryDensity K L N e v=validLineStageDensity K L N e v := by
  rw [lineStageBoundaryDensity,show validLineStageValue K L N e =
      Real.exp (specifiedClockHazardPotential N (e.val.physical.clocks L)) by
    simp [validLineStageValue,ho,hk],if_neg (Real.exp_pos _).ne',
    validLineStageDensity,Real.exp_neg,div_eq_mul_inv,mul_comm]

theorem lineStageBoundaryDensity_mul {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ)
    (e v : ValidAugmentedState n B) (he : validLineStageRegion K L N e)
    (hmono : occupancy e.val.physical.process L≤occupancy v.val.physical.process L) :
    validLineStageValue K L N e*lineStageBoundaryDensity K L N e v=validLineStageValue K L N v := by
  by_cases h : occupancy e.val.physical.process L=N
  · rw [lineStageBoundaryDensity_eq K L N e v h (he.2 h),validLineStageDensity,←mul_assoc]
    have h1 := validLineStageDensity_self K L N e h (he.2 h)
    rw [validLineStageDensity,mul_comm] at h1
    rw [h1,one_mul]
  · have hv : occupancy v.val.physical.process L≠N := by
      have he' := he.1
      omega
    have hz : validLineStageValue K L N e=0 := by simp [validLineStageValue,h]
    rw [hz,zero_mul]
    simp [validLineStageValue,hv]

theorem timedCrossingPhasePair_terminalDensity {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (s : ProtectedTimedState (cs j).config) (ω : BoardClockPath n) :
    terminalLineStageDensity (cs j).config ε M K L N hn s.1 ω=
      validLineStageDensity K L N (augTimedStateProjection (cs j).config s.1)
        (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.1.1 := by
  rw [show (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.1.1=
      finishRestartedPhase cs deadline start j (augRecycledTerminal (cs j).config ε M hn s.1 ω) from
    congrArg Prod.fst (timedCrossingPhasePair_projection cs ε M deadline start L N E A hn b j s ω)]
  unfold finishRestartedPhase validLineStageDensity
  rw [validLineStageValue_retire]
  rfl

theorem scheduledRemainderDensity_factor {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j J : ℕ) (hj : j<J)
    (hKcfg : (cs j).K≤K) (hsp : specified (cs j).directions L) (hN : N≤1)
    (a : ProtectedPhaseState n B)
    (ho : occupancy a.1.val.physical.process L=N) (hk : a.1.val.physical.clocks L≤K)
    (ω : BoardClockPath n) :
    let s := unpackProtectedTimed (cs j).config a
    let F := timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)
    let G := recycledPhaseState (fun i=>cs (j+1+i)) ε M deadline (phaseEndpoint cs start (j+1))
      hn F.1.1.1 (J-(j+1)) F.2
    scheduledRemainderDensity cs ε M K deadline start L N hn J ((j,a),ω)=
      terminalLineStageDensity (cs j).config ε M K L N hn s.1 ω *
        lineStageBoundaryDensity K L N F.1.1.1 G := by
  let s := unpackProtectedTimed (cs j).config a
  let F := timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)
  let ds := fun i=>cs (j+1+i)
  let t := phaseEndpoint cs start (j+1)
  let k := J-(j+1)
  let G := recycledPhaseState ds ε M deadline t hn F.1.1.1 k F.2
  have hphys : G=scheduledLineRemainderState cs ε M deadline start hn J ((j,a),ω) := by
    have hproj := congrArg (fun x : (ℕ×ValidAugmentedState n B)×BoardClockPath n=>x.1.2)
      (scheduledCrossingTail_physical_projection ds ε M deadline t L N E A hn b 0 k (F.1.1,F.2))
    change (scheduledCrossingTail ds ε M deadline t L N E A hn b 0 k (F.1.1,F.2)).1.1.1=G at hproj
    rw [show scheduledCrossingTail ds ε M deadline t L N E A hn b 0 k (F.1.1,F.2) =
        scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) k (F.1.1,F.2) by
      simpa only [Nat.add_zero] using scheduledCrossingTail_suffix cs ε M deadline start
        L N E A hn b (j+1) 0 k (F.1.1,F.2)] at hproj
    rw [←hproj,←scheduledCrossingRemainderPair_physical cs ε M deadline start L N E A hn b J]
    simp only [scheduledCrossingRemainderPair,if_pos hj,crossingAppend,k,F,s]
  have hregion := timedCrossingPhasePair_stage_region cs ε M K deadline start L N E A hn b j
    hKcfg hsp hN s ⟨ho.ge,fun _=>hk⟩ ω
  have hm : occupancy F.1.1.1.val.physical.process L≤occupancy G.val.physical.process L :=
    recycledPhaseState_occupancy_monotone ds ε M deadline t hn L F.1.1.1 F.2 (Nat.zero_le k)
  change scheduledRemainderDensity cs ε M K deadline start L N hn J ((j,a),ω)=
    terminalLineStageDensity (cs j).config ε M K L N hn s.1 ω *
      lineStageBoundaryDensity K L N F.1.1.1 G
  unfold scheduledRemainderDensity
  rw [if_pos (show occupancy a.1.val.physical.process L=N ∧ a.1.val.physical.clocks L≤K from ⟨ho,hk⟩),
    ←hphys,timedCrossingPhasePair_terminalDensity cs ε M K deadline start L N E A hn b j s ω]
  change validLineStageDensity K L N a.1 G =
    validLineStageDensity K L N a.1 F.1.1.1 * lineStageBoundaryDensity K L N F.1.1.1 G
  rw [validLineStageDensity,validLineStageDensity,mul_assoc,lineStageBoundaryDensity_mul K L N _ _ hregion hm]

end NoThreeLine

#print axioms NoThreeLine.scheduledRemainderDensity_factor

