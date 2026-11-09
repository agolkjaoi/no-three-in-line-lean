import NoThreeLine.WitnessPhaseRetirement

/-! Joint initial-state measurability of the actual accumulated source and
the actual phase kernel estimate, including absolute deadline retirement. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem recycledIterate_joint_measurable {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S×W→S×W) (hF : Measurable F) (k : ℕ) :
    Measurable (fun x : S×W=>RecycledBoardProcess.iterate F x.1 k x.2) := by
  induction k with
  | zero => exact measurable_id
  | succ k ih => exact hF.comp ih

theorem cumulativeRunningSource_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (k : ℕ) :
    Measurable (fun x : GoodObservation cfg×BoardClockPath n=>
      cumulativeRunningSource cfg ε M start e C D L hn x.1 k x.2) :=
  Finset.measurable_sum _ (fun j _=>(goodRunningSource_measurable cfg ε M start e C D L hn).comp
    (recycledIterate_joint_measurable _ (goodObservedRestartStep_measurable cfg ε M start hn) j))

theorem terminalRunningSource_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) :
    Measurable (fun x : GoodObservation cfg×BoardClockPath n=>
      terminalRunningSource cfg ε M start e C D L hn x.1 x.2) := by
  classical
  exact Measurable.find (cumulativeRunningSource_joint_measurable cfg ε M start e C D L hn)
    (fun k=>((augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).comp
      ((measurable_subtype_coe.fst.comp measurable_fst).prodMk measurable_snd)).setOf)
    (fun x : GoodObservation cfg×BoardClockPath n=>augRecycledCompletionPredicate_exists cfg ε M hn x.1.val.1 x.2)

def phaseRunningSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (x : GoodPhaseObservation n cfg.B×BoardClockPath n) : ℝ :=
  terminalRunningSource cfg ε M start e C D L hn (goodPhaseStart cfg ε M x.1) x.2

theorem phaseRunningSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) : Measurable (phaseRunningSource cfg ε M start e C D L hn) := by
  have hf : Measurable (fun x : GoodPhaseObservation n cfg.B×BoardClockPath n=>
      (goodPhaseStart cfg ε M x.1,x.2)) :=
    ((goodPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd
  convert (terminalRunningSource_joint_measurable cfg ε M start e C D L hn).comp hf using 1
  rfl

theorem phaseRunningSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (x : GoodPhaseObservation n cfg.B×BoardClockPath n) :
    0≤phaseRunningSource cfg ε M start e C D L hn x ∧
      phaseRunningSource cfg ε M start e C D L hn x≤(cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K :=
  cumulativeRunningSource_bounds cfg ε M start e C D L hn hm hK _ _ _

theorem observedRecycledTerminal_emptyLineCredit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) :
    EmptyLineCredit (observedRecycledTerminal cfg ε M start hn (s.val,ω)).1.val.1.physical := by
  have hp := congrArg Prod.fst (goodObservedRecycled_projection cfg ε M start hn s
    (augRecycledCompletionIndex cfg ε M hn s.val.1 ω) ω)
  change EmptyLineCredit (observedRecycledPair cfg ε M start hn s.val
    (augRecycledCompletionIndex cfg ε M hn s.val.1 ω) ω).1.1.val.1.physical
  rw [←hp]
  exact (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s
    (augRecycledCompletionIndex cfg ε M hn s.val.1 ω) ω).1.property.2

def goodPhaseRecycledPair {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : GoodPhaseObservation n cfg.B×BoardClockPath n) : GoodPhaseObservation n cfg.B×BoardClockPath n :=
  let r := observedPhaseRecycledPair cfg ε M start hn (x.1.val,x.2)
  (⟨r.1,observedPhaseRecycledPair_consistent cfg ε M start hn (x.1.val,x.2) x.1.property.1,
    observedRecycledTerminal_emptyLineCredit cfg ε M start hn (goodPhaseStart cfg ε M x.1) x.2⟩,r.2)

theorem goodPhaseRecycledPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n) :
    Measurable (goodPhaseRecycledPair cfg ε M start hn) := by
  have hr : Measurable (fun x : GoodPhaseObservation n cfg.B×BoardClockPath n=>
      observedPhaseRecycledPair cfg ε M start hn (x.1.val,x.2)) :=
    (observedPhaseRecycledPair_measurable cfg ε M start hn).comp
      ((measurable_subtype_coe.comp measurable_fst).prodMk measurable_snd)
  exact hr.fst.subtype_mk.prodMk hr.snd

theorem phase_expected_mixed_running_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D)
    (s : GoodPhaseObservation n cfg.B) :
    (∫ω,goodPhaseMixed cfg.directions e C D L (goodPhaseRecycledPair cfg ε M start hn (s,ω)).1
      ∂boardClockMeasure n (cfg.B/n))≤goodPhaseMixed cfg.directions e C D L s+
        ∫ω,phaseRunningSource cfg ε M start e C D L hn (s,ω) ∂boardClockMeasure n (cfg.B/n) :=
  terminal_expected_mixed_running_bound cfg ε M start e C D L hn hB hm hK hCL hCD (goodPhaseStart cfg ε M s)

def goodScheduledPair {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j : ℕ)
    (x : GoodPhaseObservation n B×BoardClockPath n) : GoodPhaseObservation n B×BoardClockPath n :=
  let r := goodPhaseRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn x
  (goodPhaseDeadline deadline (phaseEndpoint cs start (j+1)) r.1,r.2)

theorem goodScheduledPair_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j : ℕ) :
    Measurable (goodScheduledPair cs ε M deadline start hn j) := by
  have hr := goodPhaseRecycledPair_measurable (cs j).config ε M (phaseEndpoint cs start j) hn
  exact ((goodPhaseDeadline_measurable deadline _).comp hr.fst).prodMk hr.snd

theorem goodScheduledPair_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j : ℕ)
    (x : GoodPhaseObservation n B×BoardClockPath n) :
    ((goodScheduledPair cs ε M deadline start hn j x).1.val,
      (goodScheduledPair cs ε M deadline start hn j x).2)=
        observedScheduledPair cs ε M deadline start hn j (x.1.val,x.2) := rfl

theorem scheduled_expected_mixed_running_bound {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (j : ℕ) (hK : (cs j).config.K<2) (hCL : C⊆L) (hCD : Disjoint C D)
    (s : GoodPhaseObservation n B) :
    (∫ω,goodPhaseMixed (cs j).config.directions e C D L (goodScheduledPair cs ε M deadline start hn j (s,ω)).1
      ∂boardClockMeasure n (B/n))≤goodPhaseMixed (cs j).config.directions e C D L s+
        ∫ω,phaseRunningSource (cs j).config ε M (phaseEndpoint cs start j) e C D L hn (s,ω)
          ∂boardClockMeasure n (B/n) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  apply le_trans _ (phase_expected_mixed_running_bound (cs j).config ε M (phaseEndpoint cs start j)
    e C D L hn hB (cs j).mask_le_one hK hCL hCD s)
  apply integral_mono
  · exact GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((goodPhaseMixed_measurable _ e C D L).comp
        ((goodScheduledPair_measurable cs ε M deadline start hn j).comp (measurable_const.prodMk measurable_id)).fst)
      (mixedCap C B) (fun _=>goodPhaseMixed_bounds _ e C D L _)
  · exact GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((goodPhaseMixed_measurable _ e C D L).comp
        ((goodPhaseRecycledPair_measurable (cs j).config ε M _ hn).comp (measurable_const.prodMk measurable_id)).fst)
      (mixedCap C B) (fun _=>goodPhaseMixed_bounds _ e C D L _)
  · intro ω
    exact goodPhaseDeadline_mixed_le e _ C D L deadline _ _

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminalRunningSource_joint_measurable
#print axioms NoThreeLine.BirthWitness.goodScheduledPair_projection
#print axioms NoThreeLine.BirthWitness.scheduled_expected_mixed_running_bound
