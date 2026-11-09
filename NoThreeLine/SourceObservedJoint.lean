import NoThreeLine.SourceCutInterval

/-! Joint measurability includes the absolute phase-start parameter and all
retained birth timestamps. Consequently the full mixed cut observable is
jointly measurable in cut amount and the original clock realization. -/
set_option autoImplicit false
set_option maxHeartbeats 400000
noncomputable section
open MeasureTheory Set
open scoped NNReal

namespace NoThreeLine.BirthWitness

theorem observedStep_start_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (fun x : ℝ×(TimedObservation cfg×CandidateData n)=>observedStep cfg ε M x.1 x.2) := by
  have hin : Measurable (fun x : ℝ×(TimedObservation cfg×CandidateData n)=>(x.2.1.1,x.2.2)) :=
    measurable_snd.fst.fst.prodMk measurable_snd.snd
  have htime : Measurable (fun x : ℝ×(TimedObservation cfg×CandidateData n)=>
      birthObservationTime cfg ε M x.1 (x.2.1.1,x.2.2)) := by
    convert measurable_fst.add ((birthObservationTime_measurable cfg ε M 0).comp hin) using 1
    funext x
    dsimp only [birthObservationTime,observationTime,Function.comp_def,Pi.add_apply]
    ring
  have hu : Measurable (fun x : (BirthRecords n×ℝ)×Grid n=>Function.update x.1.1 x.2 (true,x.1.2)) :=
    measurable_from_prod_countable_left (fun q=>measurable_update'.comp
      (measurable_fst.prodMk (measurable_const.prodMk measurable_snd)))
  apply Measurable.prodMk ((augTimedStep_measurable cfg ε M).comp hin)
  exact Measurable.ite (((timedBirth_measurable cfg ε M).comp hin).setOf)
    (hu.comp ((measurable_snd.fst.snd.prodMk htime).prodMk measurable_snd.snd.fst.snd)) measurable_snd.fst.snd

theorem observedRestartStep_start_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) :
    Measurable (fun x : ℝ×(TimedObservation cfg×BoardClockPath n)=>observedRestartStep cfg ε M x.1 hn x.2) := by
  have hevent := (WinnerMarkLaw.firstMarkedRace_measurable hn).comp
    (measurable_snd.snd : Measurable (fun x : ℝ×(TimedObservation cfg×BoardClockPath n)=>x.2.2))
  exact ((observedStep_start_joint_measurable cfg ε M).comp
    (measurable_fst.prodMk (measurable_snd.fst.prodMk hevent))).prodMk
    ((augResidualBoard_measurable cfg ε M hn).comp (measurable_snd.fst.fst.prodMk measurable_snd.snd))

theorem observedRecycledPair_start_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (k : ℕ) :
    Measurable (fun x : ℝ×(TimedObservation cfg×BoardClockPath n)=>
      observedRecycledPair cfg ε M x.1 hn x.2.1 k x.2.2) := by
  induction k with
  | zero => exact measurable_snd
  | succ k ih =>
    exact (observedRestartStep_start_joint_measurable cfg ε M hn).comp (measurable_fst.prodMk ih)

theorem observedRecycledTerminal_start_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) :
    Measurable (fun x : ℝ×(TimedObservation cfg×BoardClockPath n)=>
      observedRecycledTerminal cfg ε M x.1 hn x.2) := by
  classical
  have hm : Measurable (fun x : ℝ×(TimedObservation cfg×BoardClockPath n)=>
      observedRecycledTerminalPair cfg ε M x.1 hn x.2) := by
    exact Measurable.find (observedRecycledPair_start_joint_measurable cfg ε M hn)
      (fun k=>measurableSet_setOf.mpr
        ((augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).comp
          (measurable_snd.fst.fst.prodMk measurable_snd.snd)))
      (fun x=>augRecycledCompletionPredicate_exists cfg ε M hn x.2.1.1 x.2.2)
  exact hm.fst

theorem sourceCutTerminal_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (fun x : ℝ≥0×BoardClockPath n=>sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2) := by
  have hs : Measurable (fun x : ℝ≥0×BoardClockPath n=>
      sourceRestrictState cfg x.1 x.1.coe_nonneg s.val.1) :=
    (sourceRestrictState_joint_measurable cfg).comp (measurable_fst.prodMk measurable_const)
  have ht : Measurable (fun x : ℝ≥0×BoardClockPath n=>start-(x.1:ℝ)) :=
    measurable_const.sub (measurable_subtype_coe.comp measurable_fst)
  have hinput : Measurable (fun x : ℝ≥0×BoardClockPath n=>
      (start-(x.1:ℝ),((sourceRestrictGood cfg x.1 x.1.coe_nonneg s).val,x.2))) :=
    ht.prodMk ((hs.prodMk measurable_const).prodMk measurable_snd)
  exact (observedRecycledTerminal_start_joint_measurable cfg ε M hn).comp hinput

theorem sourceCutMixed_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (fun x : ℝ≥0×BoardClockPath n=>mixed cfg.directions C D L
      (observedWitness cfg e (sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2))) :=
  (mixed_measurable cfg.directions C D L).comp
    ((observedWitness_measurable cfg e).comp (sourceCutTerminal_joint_measurable cfg ε M start hn s))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedRecycledTerminal_start_joint_measurable
#print axioms NoThreeLine.BirthWitness.sourceCutMixed_joint_measurable
