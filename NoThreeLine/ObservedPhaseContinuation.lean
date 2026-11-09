import NoThreeLine.ObservedPhaseLaw
import NoThreeLine.AugmentedRecycledMartingale

/-! Continue the actual observed schedule from its original phase index.
The same cs, absolute endpoints, and all-point deadlines are retained. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.RecycledBoardProcess

theorem iterate_add {S W : Type*} (F : S×W→S×W) (s : S) (i k : ℕ) (ω : W) :
    iterate F s (i+k) ω=iterate F (iterate F s i ω).1 k (iterate F s i ω).2 := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change F (iterate F s (i+k) ω)=F (iterate F (iterate F s i ω).1 k (iterate F s i ω).2)
    rw [ih]

theorem iterate_expected_credit {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S×W→S×W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀s,ν.map (fun w=>F (s,w))=(ν.map (fun w=>(F (s,w)).1)).prod ν)
    (z : S→ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀s,0≤z s ∧ z s≤B)
    (hmean : ∀s,(∫w,z (F (s,w)).1 ∂ν)=z s) (s : S) (k : ℕ) :
    (∫w,z (iterate F s k w).1 ∂ν)=z s := by
  induction k with
  | zero => simp [iterate]
  | succ k ih =>
    have hh := history_credit F hF ν hsection z hz B hb hmean s k Set.univ MeasurableSet.univ
    simp only [Measure.restrict_univ,state] at hh
    exact hh.trans ih

end NoThreeLine.RecycledBoardProcess
namespace NoThreeLine.BirthWitness

def observedPhaseContinuation {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ)
    (s : PhaseObservation n B) (ω : BoardClockPath n) :
    (ℕ×PhaseObservation n B)×BoardClockPath n :=
  RecycledBoardProcess.iterate (observedPhaseRestartStep cs ε M deadline start hn) (j,s) k ω

theorem observedPhaseContinuation_joint_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) :
    Measurable (fun x : PhaseObservation n B×BoardClockPath n=>
      observedPhaseContinuation cs ε M deadline start hn j k x.1 x.2) :=
  (RecycledBoardProcess.iterate_joint_measurable _
    (observedPhaseRestartStep_measurable cs ε M deadline start hn) k).comp
      ((measurable_const.prodMk measurable_fst).prodMk measurable_snd)

theorem observedPhaseContinuation_original {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : PhaseObservation n B)
    (j k : ℕ) (ω : BoardClockPath n) :
    let r := observedRecycledPhases cs ε M deadline start hn s j ω
    observedRecycledPhases cs ε M deadline start hn s (j+k) ω=
      observedPhaseContinuation cs ε M deadline start hn j k r.1.2 r.2 := by
  have hh := RecycledBoardProcess.iterate_add (observedPhaseRestartStep cs ε M deadline start hn) (0,s) j k ω
  change observedRecycledPhases cs ε M deadline start hn s (j+k) ω=
    RecycledBoardProcess.iterate (observedPhaseRestartStep cs ε M deadline start hn)
      (observedRecycledPhases cs ε M deadline start hn s j ω).1 k
      (observedRecycledPhases cs ε M deadline start hn s j ω).2 at hh
  have hi := observedRecycledPhases_index cs ε M deadline start hn s j ω
  have he : (observedRecycledPhases cs ε M deadline start hn s j ω).1=
      (j,(observedRecycledPhases cs ε M deadline start hn s j ω).1.2) := Prod.ext hi rfl
  rw [he] at hh
  exact hh

theorem observedPhaseContinuation_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (j k : ℕ) (s : PhaseObservation n B) (p : Grid n) :
    (∫ω,validAugStateCredit B p
      (observedPhaseContinuation cs ε M deadline start hn j k s ω).1.2.1
      ∂boardClockMeasure n (B/n))=validAugStateCredit B p s.1 := by
  let μ := boardClockMeasure n (B/n)
  let F := observedPhaseRestartStep cs ε M deadline start hn
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hsection (a : ℕ×PhaseObservation n B) :
      μ.map (fun ω=>F (a,ω))=(μ.map (fun ω=>(F (a,ω)).1)).prod μ := by
    have he := RecycledBoardProcess.section_state_map F
      (observedPhaseRestartStep_measurable cs ε M deadline start hn)
      (observedPhaseIndexedStep cs ε M deadline start hn) _ _
      (observedPhaseRestartStep_map cs ε M deadline start hn hB) a
    rw [he]
    exact observedPhaseRestartStep_map cs ε M deadline start hn hB a
  have hmean (a : ℕ×PhaseObservation n B) :
      (∫ω,validAugStateCredit B p (F (a,ω)).1.2.1 ∂μ)=validAugStateCredit B p a.2.1 := by
    have he (ω : BoardClockPath n) : (F (a,ω)).1.2.1=
        (recycledPhaseStep cs ε M deadline start hn ((a.1,a.2.1),ω)).1.2 :=
      congrArg (fun r : (ℕ×ValidAugmentedState n B)×BoardClockPath n=>r.1.2)
        (observedPhaseRestartStep_base cs ε M deadline start hn (a,ω))
    simp_rw [he]
    exact recycledPhaseStep_expected_credit cs ε M deadline start hn hB (a.1,a.2.1) p
  exact RecycledBoardProcess.iterate_expected_credit F
    (observedPhaseRestartStep_measurable cs ε M deadline start hn) μ hsection
    (fun a : ℕ×PhaseObservation n B=>validAugStateCredit B p a.2.1)
    ((validAugStateCredit_measurable B p).comp measurable_snd.fst) B
    (fun a=>validAugStateCredit_bounds B p a.2.1) hmean (j,s) k

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedPhaseContinuation_original
#print axioms NoThreeLine.BirthWitness.observedPhaseContinuation_expected_credit
