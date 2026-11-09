import NoThreeLine.RootDeadlineStability
import NoThreeLine.ScheduledOutsideRiskPath

/-! Beyond a root deadline, the actual cut is stopped or the root is
inactive. The real outside rate is therefore zero. A bare active-root
star observable is not asserted to vanish in the stopped branch. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

theorem observedRecycledTerminal_permanentRootClosed {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (p : Grid n) (hn : 0<n) (s : TimedObservation cfg)
    (hs : phaseRootClosed p (observedTimedProjection cfg s)) (ω : BoardClockPath n) :
    phaseRootClosed p (observedTimedProjection cfg (observedRecycledTerminal cfg ε M start hn (s,ω))) := by
  have hi (k : ℕ) : phaseRootClosed p
      (observedTimedProjection cfg (observedRecycledPair cfg ε M start hn s k ω).1) := by
    induction k with
    | zero => exact hs
    | succ k ih => exact observedStep_permanentRootClosed cfg ε M start p _ _ ih
  exact hi _

theorem sourceCutTerminal_permanentRootClosed {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (hs : phaseRootClosed p (observedTimedProjection cfg s.val)) (ω : BoardClockPath n) :
    phaseRootClosed p (observedTimedProjection cfg (sourceCutTerminal cfg ε M start δ hδ hn s ω)) :=
  observedRecycledTerminal_permanentRootClosed cfg ε M (start-δ) p hn
    (sourceRestrictGood cfg δ hδ s).val hs ω

theorem initial_goodPhases_expired_closed {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N : ℕ)
    (hp : deadline p≤phaseEndpoint cs start N) (ω : BoardClockPath n) :
    phaseRootClosed p (goodPhases cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) N ω).1.val := by
  let s := initialGoodPhaseRootObservation B hB p deadline start
  have hf := initialRootPhase_expired_flag cs ε M deadline start p hn hB N hp ω
  have hc := (phaseRootPhases_invariant cs ε M deadline start p hn s.val s.property.1 N ω).closed_iff.mp hf
  have he := congrArg Prod.fst (phaseRootPhases_projection cs ε M deadline start p hn s.val N ω)
  rw [he] at hc
  rw [goodPhases_state_projection]
  exact hc

theorem initial_scheduledCut_expired_closed {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N : ℕ)
    (hp : deadline p≤phaseEndpoint cs start N) (x : BoardClockPath n×ℝ) :
    phaseRootClosed p (observedTimedProjection (cs N).config
      (scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) N x)) := by
  exact sourceCutTerminal_permanentRootClosed (cs N).config ε M (phaseEndpoint cs start N)
    (elapsedCutAmount (cs N).horizon x.2) (elapsedCutAmount (cs N).horizon x.2).coe_nonneg p hn
    (goodPhaseStart (cs N).config ε M (goodPhases cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) N x.1).1)
    (initial_goodPhases_expired_closed cs ε M deadline start p hn hB N hp x.1) _

theorem physicalOutsideLineRisk_eq_zero_of_closed {n : ℕ} (mask : Grid n→ℝ)
    (p : Grid n) (L : LineIndex n) (e : ExtendedState n)
    (he : e.process.stopped=true ∨ (e.process.accounts p).status≠.active) :
    physicalOutsideLineRisk mask p L e=0 := by
  classical
  rcases he with hstop | hi
  · simp only [physicalOutsideLineRisk,ProcessState.birthRate,hstop,Bool.true_eq_false,
      false_and,ite_false,Finset.sum_const_zero,ite_self]
  · have hp : p∉e.process.activeEvents := fun h=>hi ((ProcessState.mem_activeEvents _ _).mp h)
    simp only [physicalOutsideLineRisk,hp,false_and,ite_false]

theorem scheduledOutsideLineRates_expired_zero {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (hp : deadline p≤phaseEndpoint cs start N) (x : BoardClockPath n×ℝ) :
    scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N x=0 ∧
      scheduledOutsideLineProxyRate cs ε M deadline start hn hB L p N x=0 := by
  have hz := physicalOutsideLineRisk_eq_zero_of_closed (cs N).mask p L _
    (initial_scheduledCut_expired_closed cs ε M deadline start p hn hB N hp x)
  change physicalOutsideLineRisk (cs N).mask p L
    (scheduledCutObservation cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) N x).1.val.1.physical=0 at hz
  refine ⟨hz,?_⟩
  change _*physicalOutsideLineRisk (cs N).mask p L _=0
  rw [hz,mul_zero]

theorem scheduledOutsideLinePaths_expired_zero {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (hp : deadline p≤phaseEndpoint cs start N) (ω : BoardClockPath n) :
    scheduledOutsideLineRiskPath cs ε M deadline start hn hB L p N ω=0 ∧
      scheduledOutsideLineProxyPath cs ε M deadline start hn hB L p N ω=0 := by
  constructor
  · simp only [scheduledOutsideLineRiskPath,
      (scheduledOutsideLineRates_expired_zero cs ε M deadline start hn hB L p N hp _).1,
      intervalIntegral.integral_zero]
  · simp only [scheduledOutsideLineProxyPath,
      (scheduledOutsideLineRates_expired_zero cs ε M deadline start hn hB L p N hp _).2,
      intervalIntegral.integral_zero]

theorem scheduledOutsidePaths_deadline_prefix {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (k J : ℕ)
    (hkJ : k≤J) (hp : deadline p≤phaseEndpoint cs start k) (ω : BoardClockPath n) :
    scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω=
      scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p k ω ∧
    scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω=
      scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p k ω := by
  have hz (N : ℕ) (hN : k≤N) (L : LineIndex n) := scheduledOutsideLinePaths_expired_zero
    cs ε M deadline start hn hB L p N (hp.trans (phaseEndpoint_mono cs start hN)) ω
  constructor
  · apply Finset.sum_congr rfl
    intro L _
    exact (Finset.sum_subset (Finset.range_mono hkJ) (fun N hN hk=>
      (hz N (Nat.le_of_not_gt (fun h=>hk (Finset.mem_range.mpr h))) L.val).1)).symm
  · apply Finset.sum_congr rfl
    intro L _
    exact (Finset.sum_subset (Finset.range_mono hkJ) (fun N hN hk=>
      (hz N (Nat.le_of_not_gt (fun h=>hk (Finset.mem_range.mpr h))) L.val).2)).symm

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_scheduledCut_expired_closed
#print axioms NoThreeLine.BirthWitness.scheduledOutsideLineRates_expired_zero
#print axioms NoThreeLine.BirthWitness.scheduledOutsidePaths_deadline_prefix
