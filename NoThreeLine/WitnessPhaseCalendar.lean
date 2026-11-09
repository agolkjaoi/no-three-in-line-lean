import NoThreeLine.WitnessPhaseAccumulation
import NoThreeLine.WitnessCalendarExpectation

/-! Actual phase-calendar source with random initial state and actual
residual board. Its time integral equals the accumulated source pointwise;
Fubini yields a sum of time integrals of the real expected calendar source. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open CalendarIntegral PrimitiveLines

theorem elapsedTime_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n) (k : ℕ) :
    Measurable (fun x : GoodObservation cfg×BoardClockPath n=>elapsedTime cfg ε M start hn x.1 k x.2) := by
  have hi := recycledIterate_joint_measurable _ (goodObservedRestartStep_measurable cfg ε M start hn) k
  exact (measurable_subtype_coe.snd.comp (measurable_subtype_coe.fst.comp measurable_fst)).sub
    (measurable_subtype_coe.snd.comp (measurable_subtype_coe.fst.comp hi.fst))

theorem localSource_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (k : ℕ) :
    Measurable (fun x : (GoodObservation cfg×BoardClockPath n)×ℝ=>
      localSource cfg ε M start e C D L hn x.1.1 k x.1.2 x.2) := by
  have hi := recycledIterate_joint_measurable _ (goodObservedRestartStep_measurable cfg ε M start hn) k
  have hg : Measurable (fun x : (GoodObservation cfg×BoardClockPath n)×ℝ=>
      ((RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) x.1.1 k x.1.2).1.val,x.2)) :=
    (measurable_subtype_coe.comp (hi.comp measurable_fst).fst).prodMk measurable_snd
  convert (selectedSourceSum_joint_measurable cfg e start C D L).comp hg using 1
  rfl

theorem segmentCalendarSource_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (k : ℕ) :
    Measurable (fun x : (GoodObservation cfg×BoardClockPath n)×ℝ=>
      segmentCalendarSource cfg ε M start e C D L hn x.1.1 k (x.1.2,x.2)) := by
  classical
  have ha := (elapsedTime_joint_measurable cfg ε M start hn k).comp
    (measurable_fst : Measurable (Prod.fst : (GoodObservation cfg×BoardClockPath n)×ℝ→_))
  have hb := (elapsedTime_joint_measurable cfg ε M start hn (k+1)).comp
    (measurable_fst : Measurable (Prod.fst : (GoodObservation cfg×BoardClockPath n)×ℝ→_))
  have hg : Measurable (fun x : (GoodObservation cfg×BoardClockPath n)×ℝ=>
      (x.1,x.2-elapsedTime cfg ε M start hn x.1.1 k x.1.2)) :=
    measurable_fst.prodMk (measurable_snd.sub ha)
  convert Measurable.ite ((ha.lt measurable_snd).and (measurable_snd.lt hb)).setOf
    ((localSource_joint_measurable cfg ε M start e C D L hn k).comp hg)
    (measurable_const : Measurable (fun _ : (GoodObservation cfg×BoardClockPath n)×ℝ=>(0:ℝ))) using 1
  rfl

theorem terminalCalendarSource_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) :
    Measurable (fun x : (GoodObservation cfg×BoardClockPath n)×ℝ=>
      terminalCalendarSource cfg ε M start e C D L hn x.1.1 (x.1.2,x.2)) := by
  classical
  have hf (N : ℕ) : Measurable (fun x : (GoodObservation cfg×BoardClockPath n)×ℝ=>
      finiteCalendarSource cfg ε M start e C D L hn x.1.1 N (x.1.2,x.2)) :=
    Finset.measurable_sum _ (fun j _=>segmentCalendarSource_joint_measurable cfg ε M start e C D L hn j)
  exact Measurable.find hf
    (fun k=>((augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).comp
      ((measurable_subtype_coe.fst.comp (measurable_fst.comp measurable_fst)).prodMk measurable_fst.snd)).setOf)
    (fun x : (GoodObservation cfg×BoardClockPath n)×ℝ=>augRecycledCompletionPredicate_exists cfg ε M hn x.1.1.val.1 x.1.2)

def phaseCalendarSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (x : (GoodPhaseObservation n cfg.B×BoardClockPath n)×ℝ) : ℝ :=
  terminalCalendarSource cfg ε M start e C D L hn (goodPhaseStart cfg ε M x.1.1) (x.1.2,x.2)

theorem phaseCalendarSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) : Measurable (phaseCalendarSource cfg ε M start e C D L hn) := by
  have hf : Measurable (fun x : (GoodPhaseObservation n cfg.B×BoardClockPath n)×ℝ=>
      ((goodPhaseStart cfg ε M x.1.1,x.1.2),x.2)) :=
    (((goodPhaseStart_measurable cfg ε M).comp measurable_fst.fst).prodMk measurable_fst.snd).prodMk measurable_snd
  convert (terminalCalendarSource_joint_measurable cfg ε M start e C D L hn).comp hf using 1
  rfl

def scheduledCalendarSource {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (j : ℕ) (x : BoardClockPath n×ℝ) : ℝ :=
  phaseCalendarSource (cs j).config ε M (phaseEndpoint cs start j) e C D L hn
    (goodPhases cs ε M deadline start hn s j x.1,x.2)

theorem scheduledCalendarSource_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (j : ℕ) :
    Measurable (scheduledCalendarSource cs ε M deadline start e C D L hn s j) :=
  (phaseCalendarSource_measurable (cs j).config ε M _ e C D L hn).comp
    (((goodPhases_measurable cs ε M deadline start hn s j).comp measurable_fst).prodMk measurable_snd)

theorem scheduledCalendarSource_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (j : ℕ) (hK : (cs j).K<2) (x : BoardClockPath n×ℝ) :
    0≤scheduledCalendarSource cs ε M deadline start e C D L hn s j x ∧
      scheduledCalendarSource cs ε M deadline start e C D L hn s j x≤sourceCap (cs j).directions C D B (cs j).K :=
  terminalCalendarSource_bounds (cs j).config ε M _ e C D L hn _ (cs j).mask_le_one hK _

theorem scheduledSourceIncrement_eq_calendarIntegral {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (j : ℕ) (hK : (cs j).K<2) (ω : BoardClockPath n) :
    scheduledSourceIncrement cs ε M deadline start e C D L hn s j ω=
      ∫t in (0:ℝ)..(cs j).horizon,scheduledCalendarSource cs ε M deadline start e C D L hn s j (ω,t) :=
  terminalRunningSource_eq_timeIntegral (cs j).config ε M _ e C D L hn _ (cs j).mask_le_one hK _

theorem scheduledSourceIncrement_mean_calendar {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (j : ℕ) (hK : (cs j).K<2) :
    (∫ω,scheduledSourceIncrement cs ε M deadline start e C D L hn s j ω ∂boardClockMeasure n (B/n))=
      ∫t in (0:ℝ)..(cs j).horizon,∫ω,scheduledCalendarSource cs ε M deadline start e C D L hn s j (ω,t)
        ∂boardClockMeasure n (B/n) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  simp_rw [scheduledSourceIncrement_eq_calendarIntegral cs ε M deadline start e C D L hn s j hK]
  exact CalendarIntegral.expected_interval_integral_swap _ _ (cs j).horizon.coe_nonneg _
    (scheduledCalendarSource_measurable cs ε M deadline start e C D L hn s j) _
    (scheduledCalendarSource_bounds cs ε M deadline start e C D L hn s j hK)

theorem finitePhase_mixed_calendar_bound {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodPhaseObservation n B) (k : ℕ) :
    (∫ω,goodPhaseMixed Γ e C D L (goodPhases cs ε M deadline start hn s k ω).1
      ∂boardClockMeasure n (B/n))≤goodPhaseMixed Γ e C D L s+
        ∑j∈Finset.range k,∫t in (0:ℝ)..(cs j).horizon,
          ∫ω,scheduledCalendarSource cs ε M deadline start e C D L hn s j (ω,t) ∂boardClockMeasure n (B/n) := by
  have hh := finitePhase_mixed_source_bound cs ε M deadline start Γ e C D L hn hB hΓ hK hCL hCD s k
  unfold cumulativeScheduledSource at hh
  rw [integral_finsetSum _ (fun j _=>scheduledSourceIncrement_integrable cs ε M deadline start e C D L hn hB s j (hK j))] at hh
  simpa only [scheduledSourceIncrement_mean_calendar cs ε M deadline start e C D L hn hB s _ (hK _)] using hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminalCalendarSource_joint_measurable
#print axioms NoThreeLine.BirthWitness.scheduledSourceIncrement_eq_calendarIntegral
#print axioms NoThreeLine.BirthWitness.finitePhase_mixed_calendar_bound
