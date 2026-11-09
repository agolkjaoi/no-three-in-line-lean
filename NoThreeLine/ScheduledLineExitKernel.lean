import NoThreeLine.PackedProtectedTimed
import NoThreeLine.ProtectedLineExitCompletion

/-! Run the actual first line-stage exit in each phase. A birth stores
the timed state in its own phase. Otherwise the real deadline retirement
and next-phase initialization are applied. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def scheduledLineExitOutput {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N j : ℕ)
    (v : ProtectedTimedState (cs j).config) : ℕ × ProtectedPhaseState n B :=
  let a := packProtectedTimed (cs j).config v
  if N<occupancy a.1.val.physical.process L then (j,a) else
    let b := protectedDeadlineBook L deadline (phaseEndpoint cs start (j+1)) a
    (j+1,(b.1,(b.2.1,(cs (j+1)).horizon)))

theorem scheduledLineExitOutput_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N j : ℕ) :
    Measurable (scheduledLineExitOutput cs deadline start L N j) := by
  have ha := packProtectedTimed_measurable (cs j).config
  have hb := (protectedDeadlineBook_measurable L deadline (phaseEndpoint cs start (j+1))).comp ha
  have hc : Measurable (fun v : ProtectedTimedState (cs j).config=>
      N<occupancy (packProtectedTimed (cs j).config v).1.val.physical.process L) :=
    (measurable_of_countable (fun k : ℕ=>N<k)).comp
      ((ExtendedState.measurable_occupancy n L).comp (validAugPhysical_measurable.comp ha.fst))
  unfold scheduledLineExitOutput
  exact Measurable.ite hc.setOf (measurable_const.prodMk ha)
    (measurable_const.prodMk (hb.fst.prodMk (hb.snd.fst.prodMk measurable_const)))

def scheduledLineExitRun {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (j : ℕ) (x : ProtectedPhaseState n B × BoardClockPath n) :
    (ℕ × ProtectedPhaseState n B) × BoardClockPath n :=
  let r := protectedLineExitPair (cs j).config ε M L N hn
    (unpackProtectedTimed (cs j).config x.1) x.2
  (scheduledLineExitOutput cs deadline start L N j r.1,r.2)

theorem scheduledLineExitRun_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (j : ℕ) : Measurable (scheduledLineExitRun cs ε M deadline start L N hn j) := by
  have hr := (protectedLineExitPair_joint_measurable (cs j).config ε M L N hn).comp
    (((unpackProtectedTimed_measurable (cs j).config).comp measurable_fst).prodMk measurable_snd)
  exact ((scheduledLineExitOutput_measurable cs deadline start L N j).comp hr.fst).prodMk hr.snd

def scheduledLineExitStep {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (J : ℕ) (x : (ℕ × ProtectedPhaseState n B) × BoardClockPath n) :
    (ℕ × ProtectedPhaseState n B) × BoardClockPath n :=
  if x.1.1<J ∧ occupancy x.1.2.1.val.physical.process L≤N then
    scheduledLineExitRun cs ε M deadline start L N hn x.1.1 (x.1.2,x.2) else x

section
attribute [local irreducible] scheduledLineExitRun

set_option maxHeartbeats 500000 in
theorem scheduledLineExitStep_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (J : ℕ) : Measurable (scheduledLineExitStep cs ε M deadline start L N hn J) := by
  have hr : Measurable (fun x : ℕ × (ProtectedPhaseState n B × BoardClockPath n)=>
      scheduledLineExitRun cs ε M deadline start L N hn x.1 x.2) :=
    measurable_from_prod_countable_right (fun j=>scheduledLineExitRun_measurable cs ε M deadline start L N hn j)
  have ho : Measurable (fun x : (ℕ × ProtectedPhaseState n B) × BoardClockPath n=>
      occupancy x.1.2.1.val.physical.process L≤N) :=
    (measurable_of_countable (fun k : ℕ=>k≤N)).comp
      ((ExtendedState.measurable_occupancy n L).comp (validAugPhysical_measurable.comp measurable_fst.snd.fst))
  unfold scheduledLineExitStep
  exact Measurable.ite (((measurable_of_countable (fun j : ℕ=>j<J)).comp measurable_fst.fst).and ho).setOf
    (hr.comp (measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd))) measurable_id

end

theorem scheduledLineExitStep_map {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (hB : 0<B) (J : ℕ) (s : ℕ × ProtectedPhaseState n B) :
    (boardClockMeasure n (B/n)).map (fun ω=>scheduledLineExitStep cs ε M deadline start L N hn J (s,ω))=
      ((boardClockMeasure n (B/n)).map (fun ω=>(scheduledLineExitStep cs ε M deadline start L N hn J (s,ω)).1)).prod
        (boardClockMeasure n (B/n)) := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  by_cases hs : s.1<J ∧ occupancy s.2.1.val.physical.process L≤N
  · simp only [scheduledLineExitStep,if_pos hs]
    let cfg := (cs s.1).config
    let a := unpackProtectedTimed cfg s.2
    let d := scheduledLineExitOutput cs deadline start L N s.1
    have hd : Measurable d := scheduledLineExitOutput_measurable cs deadline start L N s.1
    have hr : Measurable (protectedLineExitPair cfg ε M L N hn a) :=
      (protectedLineExitPair_joint_measurable cfg ε M L N hn).comp (measurable_const.prodMk measurable_id)
    have hp : Measurable (fun x : ProtectedTimedState cfg × BoardClockPath n=>(d x.1,x.2)) :=
      (hd.comp measurable_fst).prodMk measurable_snd
    have h := congrArg (fun μ : Measure (ProtectedTimedState cfg × BoardClockPath n)=>
      μ.map (fun x=>(d x.1,x.2))) (protectedLineExitPair_map cfg ε M L N hn hB a)
    rw [Measure.map_map hp hr,map_pair_with_fresh_right _ _ d hd,Measure.map_map hd hr.fst] at h
    exact h
  · simp only [scheduledLineExitStep,if_neg hs]
    change ν.map (Prod.mk s)=(ν.map (fun _ : BoardClockPath n=>s)).prod ν
    rw [Measure.map_const,measure_univ,one_smul,Measure.dirac_prod]

end NoThreeLine

#print axioms NoThreeLine.scheduledLineExitStep_measurable
#print axioms NoThreeLine.scheduledLineExitStep_map
