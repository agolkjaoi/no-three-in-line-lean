import NoThreeLine.PackedProtectedTimed
import NoThreeLine.IndexedLineStageMean

/-! Resume the unfinished phase, apply its original absolute deadline,
then use the remaining original schedule on the actual residual board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

def finishRestartedPhase {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (deadline : Grid n→ℝ) (start : ℝ) (j : ℕ) (v : AugTimedState (cs j).config) :
    ValidAugmentedState n B :=
  augValidDeadlineRetirement deadline (phaseEndpoint cs start (j+1)) (augTimedStateProjection (cs j).config v)

theorem finishRestartedPhase_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (deadline : Grid n→ℝ) (start : ℝ) (j : ℕ) : Measurable (finishRestartedPhase cs deadline start j) :=
  (augValidDeadlineRetirement_measurable deadline _).comp (augTimedStateProjection_measurable _)

def scheduledAfterRestartedPhase {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j J : ℕ)
    (x : AugTimedState (cs j).config × BoardClockPath n) : ValidAugmentedState n B :=
  (iterate (recycledPhaseStep cs ε M deadline start hn)
    (j+1,finishRestartedPhase cs deadline start j x.1) (J-(j+1)) x.2).1.2

theorem scheduledAfterRestartedPhase_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j J : ℕ) :
    Measurable (scheduledAfterRestartedPhase cs ε M deadline start hn j J) :=
  ((iterate_joint_measurable _ (recycledPhaseStep_measurable cs ε M deadline start hn) _).comp
    ((measurable_const.prodMk ((finishRestartedPhase_measurable cs deadline start j).comp measurable_fst)).prodMk
      measurable_snd)).fst.snd

def scheduledLineRemainderState {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (J : ℕ)
    (x : (ℕ × ProtectedPhaseState n B) × BoardClockPath n) : ValidAugmentedState n B :=
  if x.1.1<J then
    let cfg := (cs x.1.1).config
    let r := augRecycledTerminalPair cfg ε M hn (unpackProtectedTimed cfg x.1.2).1 x.2
    scheduledAfterRestartedPhase cs ε M deadline start hn x.1.1 J r
  else x.1.2.1

section
attribute [local irreducible] scheduledAfterRestartedPhase augRecycledTerminalPair

theorem scheduledLineRemainderState_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (J : ℕ) :
    Measurable (scheduledLineRemainderState cs ε M deadline start hn J) := by
  let g := fun (j : ℕ) (x : ProtectedPhaseState n B × BoardClockPath n)=>
    scheduledAfterRestartedPhase cs ε M deadline start hn j J
      (augRecycledTerminalPair (cs j).config ε M hn (unpackProtectedTimed (cs j).config x.1).1 x.2)
  have hg (j : ℕ) : Measurable (g j) :=
    (scheduledAfterRestartedPhase_measurable cs ε M deadline start hn j J).comp
      ((augRecycledTerminalPair_joint_measurable (cs j).config ε M hn).comp
        (((unpackProtectedTimed_measurable (cs j).config).fst.comp measurable_fst).prodMk measurable_snd))
  have hh : Measurable (fun x : ℕ × (ProtectedPhaseState n B × BoardClockPath n)=>g x.1 x.2) :=
    measurable_from_prod_countable_right hg
  unfold scheduledLineRemainderState
  exact Measurable.ite ((measurable_of_countable (fun j : ℕ=>j<J)).comp measurable_fst.fst).setOf
    (hh.comp (measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd))) measurable_fst.snd.fst

end

theorem scheduledLineRemainder_value_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (J : ℕ) (a : ℕ × ProtectedPhaseState n B)
    (ha : validLineStageRegion K L N a.2.1) :
    (∫ω,validLineStageValue K L N (scheduledLineRemainderState cs ε M deadline start hn J (a,ω))
      ∂boardClockMeasure n (B/n))=validLineStageValue K L N a.2.1 := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  by_cases hj : a.1<J
  · let j := a.1
    let cfg := (cs j).config
    let s := (unpackProtectedTimed cfg a.2).1
    let r := augRecycledTerminalPair cfg ε M hn s
    let ρ := ν.map (augRecycledTerminal cfg ε M hn s)
    let d := finishRestartedPhase cs deadline start j
    let f := fun x=>validLineStageValue K L N (scheduledAfterRestartedPhase cs ε M deadline start hn j J x)
    have hr := augRecycledTerminalPair_measurable cfg ε M hn s
    letI : IsProbabilityMeasure ρ := Measure.isProbabilityMeasure_map hr.fst.aemeasurable
    have hd : Measurable d := finishRestartedPhase_measurable cs deadline start j
    have hf : Measurable f := (validLineStageValue_measurable K L N).comp
      (scheduledAfterRestartedPhase_measurable cs ε M deadline start hn j J)
    have hi : Integrable f (ρ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf _
      (fun x=>validLineStageValue_bounds K hK L N hN _)
    have hreg : ∀ᵐv ∂ρ,validLineStageRegion K L N (d v) := by
      apply (ae_map_iff hr.fst.aemeasurable
        ((validLineStageRegion_measurable K L N).comp hd).setOf).mpr
      exact ae_of_all _ (fun ω=>by
        change validLineStageRegion K L N (d (r ω).1)
        unfold d finishRestartedPhase
        rw [validLineStageRegion_retire]
        exact lineStageRegion_recycled cfg ε M K (hKcfg j) L (hsp j) N hN hn s ha _ ω)
    simp only [scheduledLineRemainderState,if_pos hj]
    change (∫ω,f (r ω) ∂ν)=_
    calc
      _ = ∫x,f x ∂ν.map r := (integral_map hr.aemeasurable hf.aestronglyMeasurable).symm
      _ = ∫v,∫ω,f (v,ω) ∂ν ∂ρ := by
        rw [show ν.map r=ρ.prod ν from augRecycledTerminalPair_map cfg ε M hn hB s]
        exact integral_prod f hi
      _ = ∫v,validLineStageValue K L N (d v) ∂ρ := by
        apply integral_congr_ae
        filter_upwards [hreg] with v hv
        exact indexedLineStageValue_expected cs ε M K deadline start hn hB hKcfg hK L hsp
          N hN (j+1,d v) hv (J-(j+1))
      _ = ∫ω,validLineStageValue K L N (d (r ω).1) ∂ν :=
        integral_map hr.fst.aemeasurable ((validLineStageValue_measurable K L N).comp hd).aestronglyMeasurable
      _ = _ := by
        simp only [d,finishRestartedPhase,validLineStageValue_retire]
        exact lineStageValue_terminal_mean cfg ε M K (hKcfg j) hK L (hsp j) N hN hn hB
          (cs j).mask_le_one s ha
  · simp [scheduledLineRemainderState,hj]

end NoThreeLine

#print axioms NoThreeLine.scheduledLineRemainderState_measurable
#print axioms NoThreeLine.scheduledLineRemainder_value_mean
