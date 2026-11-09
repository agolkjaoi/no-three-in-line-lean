import NoThreeLine.LongLinePrefixMoments

/-! The real deadline operation permanently closes the root by the end
of its deadline phase. Complete saved snapshots, saved credit densities and
the existing phase point measures are then exactly stable on every path. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
namespace NoThreeLine.BirthWitness

theorem observedDeadline_rootClosed_of_expired {n : ℕ} {B : ℝ} (deadline : Grid n→ℝ)
    (t : ℝ) (s : PhaseObservation n B) (p : Grid n) (hp : deadline p≤t) :
    phaseRootClosed p (observedDeadline deadline t s) := by
  by_cases hs : s.1.val.physical.process.stopped=true
  · left
    exact (augValidDeadlineRetirement_stop_flag deadline t s.1).trans hs
  · right
    exact augValidDeadlineRetirement_inactive deadline t s.1 hs p hp

theorem phaseRootDeadline_expired_flag {n : ℕ} {B : ℝ} (p : Grid n) (deadline : Grid n→ℝ)
    (t : ℝ) (s : PhaseRootObservation n B) (hp : deadline p≤t) :
    (phaseRootDeadline p deadline t s).2.1=true := by
  have hc := observedDeadline_rootClosed_of_expired deadline t s.1 p hp
  unfold phaseRootDeadline
  by_cases hf : s.2.1=true
  · simp only [if_pos hf]
    exact hf
  · simp only [if_neg hf,if_pos hc]

theorem initialRootPhase_expired_flag {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (k : ℕ) (hp : deadline p≤phaseEndpoint cs start k) (ω : BoardClockPath n) :
    (phaseRootPhases cs ε M deadline start p hn
      (initialGoodPhaseRootObservation B hB p deadline start).val k ω).1.2.1=true := by
  cases k with
  | zero =>
    rw [phaseEndpoint_zero] at hp
    have hc : phaseRootClosed p (initialGoodPhaseObservation B hB deadline start).val :=
      Or.inr (augInitialState_expired B hB deadline start p hp)
    change (if phaseRootClosed p (initialGoodPhaseObservation B hB deadline start).val then true else false)=true
    rw [if_pos hc]
  | succ k =>
    exact phaseRootDeadline_expired_flag p deadline (phaseEndpoint cs start (k+1)) _ hp

theorem initialRootPhase_saved_stable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (k N : ℕ) (hk : k≤N) (hp : deadline p≤phaseEndpoint cs start k) (ω : BoardClockPath n) :
    (rootPhaseRecycledState cs ε M deadline start p hn
      (initialGoodPhaseRootObservation B hB p deadline start) N ω).val.2=
      (rootPhaseRecycledState cs ε M deadline start p hn
        (initialGoodPhaseRootObservation B hB p deadline start) k ω).val.2 := by
  let s := initialGoodPhaseRootObservation B hB p deadline start
  have hN := congrArg (fun r : PhaseRootObservation n B×BoardClockPath n=>r.1.2)
    (rootPhaseRecycledPair_projection cs ε M deadline start p hn s N ω)
  have hk' := congrArg (fun r : PhaseRootObservation n B×BoardClockPath n=>r.1.2)
    (rootPhaseRecycledPair_projection cs ε M deadline start p hn s k ω)
  exact hN.trans ((phaseRootPhases_permanent_stable cs ε M deadline start p hn s.val s.property.1 ω k
    (initialRootPhase_expired_flag cs ε M deadline start p hn hB k hp ω) N hk).trans hk'.symm)

theorem initialRootPhaseWitness_deadline_stable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (k N : ℕ) (hk : k≤N) (hp : deadline p≤phaseEndpoint cs start k) (ω : BoardClockPath n) :
    initialRootPhaseWitness cs ε M deadline start p hn hB e N ω=
      initialRootPhaseWitness cs ε M deadline start p hn hB e k ω :=
  congrArg (fun a : Bool×SavedObservation n=>savedWitness e a.2)
    (initialRootPhase_saved_stable cs ε M deadline start p hn hB k N hk hp ω)

theorem initial_phaseRootPhases_credit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (k : ℕ) (ω : BoardClockPath n) :
    ((phaseRootPhases cs ε M deadline start p hn (initialGoodPhaseRootObservation B hB p deadline start).val k ω).1.2.2.1.physical.process.accounts p).credit=phasePointCredit cs ε M deadline start hn hB p k ω := by
  have h := phaseRootPhases_credit cs ε M deadline start p hn (initialGoodPhaseRootObservation B hB p deadline start).val
    (initialGoodPhaseRootObservation B hB p deadline start).property.1 k ω
  rw [observedRecycledPhaseState_base] at h
  exact h

theorem phasePointCredit_deadline_stable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (k N : ℕ) (hk : k≤N) (hp : deadline p≤phaseEndpoint cs start k) (ω : BoardClockPath n) :
    phasePointCredit cs ε M deadline start hn hB p N ω=phasePointCredit cs ε M deadline start hn hB p k ω := by
  let s := initialGoodPhaseRootObservation B hB p deadline start
  have hh := congrArg (fun a : Bool×SavedObservation n=>(a.2.1.physical.process.accounts p).credit)
    (phaseRootPhases_permanent_stable cs ε M deadline start p hn s.val s.property.1 ω k
      (initialRootPhase_expired_flag cs ε M deadline start p hn hB k hp ω) N hk)
  exact (initial_phaseRootPhases_credit cs ε M deadline start p hn hB N ω).symm.trans
    (hh.trans (initial_phaseRootPhases_credit cs ε M deadline start p hn hB k ω))

theorem phasePointMeasure_deadline_stable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (k N : ℕ) (hk : k≤N) (hp : deadline p≤phaseEndpoint cs start k) :
    phasePointMeasure cs ε M deadline start hn hB p N=phasePointMeasure cs ε M deadline start hn hB p k := by
  unfold phasePointMeasure
  congr 1
  funext ω
  exact phasePointCredit_deadline_stable cs ε M deadline start p hn hB k N hk hp ω

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initialRootPhase_expired_flag
#print axioms NoThreeLine.BirthWitness.initialRootPhaseWitness_deadline_stable
#print axioms NoThreeLine.BirthWitness.phasePointMeasure_deadline_stable
