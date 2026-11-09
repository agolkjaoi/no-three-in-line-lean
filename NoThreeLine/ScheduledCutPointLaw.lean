import NoThreeLine.ScheduledCutObservation
import NoThreeLine.PhasePointLaw

/-! Actual saved-credit point probability at a scheduled deterministic cut.
The inherited phase state and its actual residual original board are used.
Probability normalization follows from the residual product law and the
proved cut credit mean, not from a fresh canonical initialization. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness

def phaseCutCredit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (p : Grid n) (x : (GoodPhaseObservation n cfg.B×ℝ)×BoardClockPath n) : ℝ :=
  augTimedCredit cfg p (phaseCutObservation cfg ε M start hn x).1

theorem phaseCutCredit_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n) (p : Grid n) :
    Measurable (phaseCutCredit cfg ε M start hn p) :=
  (augTimedCredit_measurable cfg p).comp (phaseCutObservation_measurable cfg ε M start hn).fst

theorem phaseCutCredit_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (p : Grid n) (s : GoodPhaseObservation n cfg.B) (t : ℝ) :
    (∫ω,phaseCutCredit cfg ε M start hn p ((s,t),ω) ∂boardClockMeasure n (cfg.B/n))=
      validAugStateCredit cfg.B p s.val.1 := by
  unfold phaseCutCredit phaseCutObservation
  exact sourceCutTerminal_expected_credit cfg ε M start (elapsedCutAmount cfg.horizon t)
    (elapsedCutAmount cfg.horizon t).coe_nonneg hn hB hm (goodPhaseStart cfg ε M s) p

def scheduledCutCredit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (p : Grid n) (k : ℕ) (x : BoardClockPath n×ℝ) : ℝ :=
  augTimedCredit (cs k).config p (scheduledCutObservation cs ε M deadline start hn s k x).1

theorem scheduledCutCredit_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (p : Grid n) (k : ℕ) : Measurable (scheduledCutCredit cs ε M deadline start hn s p k) :=
  (augTimedCredit_measurable (cs k).config p).comp
    (scheduledCutObservation_measurable cs ε M deadline start hn s k).fst

theorem scheduledCutCredit_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (p : Grid n) (k : ℕ) (x : BoardClockPath n×ℝ) :
    0≤scheduledCutCredit cs ε M deadline start hn s p k x ∧ scheduledCutCredit cs ε M deadline start hn s p k x≤B :=
  augTimedCredit_bounds (cs k).config p _

theorem scheduledCutCredit_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B)
    (p : Grid n) (k : ℕ) (t : ℝ) :
    Integrable (fun ω=>scheduledCutCredit cs ε M deadline start hn s p k (ω,t)) (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((scheduledCutCredit_measurable cs ε M deadline start hn s p k).comp (measurable_id.prodMk measurable_const))
    B (fun ω=>scheduledCutCredit_bounds cs ε M deadline start hn s p k (ω,t))

theorem scheduledCutWitness_credit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (hn : 0<n)
    (s : GoodPhaseObservation n B) (p : Grid n) (k : ℕ) (x : BoardClockPath n×ℝ) :
    ((scheduledCutWitness cs ε M deadline start e hn s k x).augmented.physical.process.accounts p).credit=
      scheduledCutCredit cs ε M deadline start hn s p k x := rfl

theorem initial_scheduledCutCredit_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) (t : ℝ) :
    (∫ω,scheduledCutCredit cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) p k (ω,t)
      ∂boardClockMeasure n (B/n))=1 := by
  let s := initialGoodPhaseObservation B hB deadline start
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s k
  have hB0 : 0<B := lt_of_lt_of_le zero_lt_one hB
  letI := boardClockMeasure_probability n (B/n) (div_pos hB0 (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB0 s k
  let f : GoodPhaseObservation n B×BoardClockPath n→ℝ := fun x=>
    phaseCutCredit (cs k).config ε M (phaseEndpoint cs start k) hn p ((x.1,t),x.2)
  have hf : Measurable f := by
    let g : GoodPhaseObservation n B×BoardClockPath n→(GoodPhaseObservation n B×ℝ)×BoardClockPath n :=
      fun x=>((x.1,t),x.2)
    have hg : Measurable g := (measurable_fst.prodMk measurable_const).prodMk measurable_snd
    convert (phaseCutCredit_measurable (cs k).config ε M (phaseEndpoint cs start k) hn p).comp hg using 1
    rfl
  have hi : Integrable f (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf B
    (fun x=>augTimedCredit_bounds (cs k).config p _)
  have hg := goodPhases_measurable cs ε M deadline start hn s k
  change (∫ω,f (goodPhases cs ε M deadline start hn s k ω) ∂ν)=1
  rw [←integral_map_of_stronglyMeasurable hg hf.stronglyMeasurable,
    goodPhases_residual_product cs ε M deadline start hn hB0 s k]
  change (∫x,f x ∂μ.prod ν)=1
  rw [integral_prod _ hi]
  have hinner (a : GoodPhaseObservation n B) : (∫ω,f (a,ω) ∂ν)=validAugStateCredit B p a.val.1 :=
    phaseCutCredit_mean (cs k).config ε M (phaseEndpoint cs start k) hn hB0 (cs k).mask_le_one p a t
  simp_rw [hinner]
  have hstate : Measurable (fun a : GoodPhaseObservation n B=>validAugStateCredit B p a.val.1) :=
    (validAugStateCredit_measurable B p).comp measurable_subtype_coe.fst
  rw [show (∫a,validAugStateCredit B p a.val.1 ∂μ)=
      ∫ω,validAugStateCredit B p (goodPhases cs ε M deadline start hn s k ω).1.val.1 ∂ν from
    integral_map_of_stronglyMeasurable hg.fst hstate.stronglyMeasurable]
  have he (ω : BoardClockPath n) : validAugStateCredit B p (goodPhases cs ε M deadline start hn s k ω).1.val.1=
      phasePointCredit cs ε M deadline start hn hB p k ω := by
    rw [goodPhases_state_projection,observedRecycledPhaseState_base]
    rfl
  simp_rw [he]
  exact phasePointCredit_mean cs ε M deadline start hn hB p k

def scheduledCutPointMeasure {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) (t : ℝ) :
    Measure (BoardClockPath n) :=
  savedCreditMeasure (boardClockMeasure n (B/n))
    (fun ω=>scheduledCutCredit cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) p k (ω,t))

theorem scheduledCutPointMeasure_probability {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) (t : ℝ) :
    IsProbabilityMeasure (scheduledCutPointMeasure cs ε M deadline start hn hB p k t) :=
  savedCreditMeasure_probability _ _
    (scheduledCutCredit_integrable cs ε M deadline start hn (lt_of_lt_of_le zero_lt_one hB) _ p k t)
    (fun ω=>(scheduledCutCredit_bounds cs ε M deadline start hn _ p k (ω,t)).1)
    (initial_scheduledCutCredit_mean cs ε M deadline start hn hB p k t)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCutCredit_mean
#print axioms NoThreeLine.BirthWitness.scheduledCutPointMeasure_probability
