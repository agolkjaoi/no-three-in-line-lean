import NoThreeLine.ActualClockStopTerminal
import NoThreeLine.ScheduledProtectedClockTail
import NoThreeLine.SpecifiedBoardLineCount

/-! A raw clock trigger stops the original process. Its clock survives
every later phase boundary, including all absolute deadline retirements. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines SpecifiedBoardCount

theorem recycledPhaseState_eq_of_stopped {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (ω : BoardClockPath n) (i : ℕ)
    (hi : (recycledPhaseState cs ε M deadline start hn e i ω).val.physical.process.stopped=true)
    (j : ℕ) (hij : i≤j) :
    recycledPhaseState cs ε M deadline start hn e j ω=recycledPhaseState cs ε M deadline start hn e i ω := by
  induction j,hij using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    rw [recycledPhaseState_succ_eq,ih,recycledScheduledPair_stopped cs ε M deadline start hn j _ hi]

def scheduledSpecifiedClockThreshold {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (L : LineIndex n) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | K≤(recycledPhaseState cs ε M deadline start hn e J ω).val.physical.clocks L}

def actualRawClockTriggered {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg×CandidateData n) : Prop :=
  let a := augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2)
  ¬AugTimedDone cfg x.1 ∧ clockTriggered a.physical.process cfg.directions cfg.K a.physical.clocks

theorem actualRawClockTriggered_terminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n)
    (h : let x := augRecycledPair cfg ε M hn s k ω
      actualRawClockTriggered cfg ε M (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)) :
    let x := augRecycledPair cfg ε M hn s k ω
    let a := augRawOutcome cfg ε M (augTimedInput cfg x.1,WinnerMarkLaw.firstMarkedRace hn x.2)
    (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process.stopped=true ∧
      (augRecycledTerminal cfg ε M hn s ω).val.1.physical.clocks=a.physical.clocks := by
  let x := augRecycledPair cfg ε M hn s k ω
  let z := WinnerMarkLaw.firstMarkedRace hn x.2
  let a := augRawOutcome cfg ε M (augTimedInput cfg x.1,z)
  have hd : ¬(x.1.val.2≤0 ∨ x.1.val.1.physical.process.stopped=true) :=
    fun hh=>h.1 ((birthDone_iff cfg x.1).mp hh)
  have hs : x.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
  have hnxt : (augTimedStep cfg ε M (x.1,z)).val.1.physical.process.stopped=true ∧
      (augTimedStep cfg ε M (x.1,z)).val.1.physical.clocks=a.physical.clocks := by
    change (augTimedStepPair cfg ε M (x.1,z)).1.physical.process.stopped=true ∧
      (augTimedStepPair cfg ε M (x.1,z)).1.physical.clocks=a.physical.clocks
    simp only [augTimedStepPair,if_neg hd]
    exact ⟨(augOutcome_new_stop_iff cfg ε M (augTimedInput cfg x.1) z hs).mpr (Or.inr h.2),
      congrArg (fun v : Coordinates n=>v.2.1)
        (augmented_resolve_coordinates a cfg.directions cfg.B cfg.K cfg.rho ε M)⟩
  have hd' : AugTimedDone cfg (augRecycledPair cfg ε M hn s (k+1) ω).1 := Or.inr hnxt.1
  rw [augRecycledTerminal_eq_done_update cfg ε M hn s (k+1) ω hd']
  exact hnxt

def scheduledActualClockHit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃ j : ℕ, j < J ∧ ∃ k : ℕ,
    let x := augRecycledPair (cs j).config ε M hn
      (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω)) k
      (recycledPhases cs ε M deadline start hn e j ω).2
    actualRawClockTriggered (cs j).config ε M (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)}

theorem scheduledActualClockHit_subset_terminal {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (Γ : Finset ZPoint) (J : ℕ)
    (hΓ : ∀j<J,(cs j).directions=Γ) (hK : ∀j<J,(cs j).K=K) :
    scheduledActualClockHit cs ε M deadline start hn e J⊆
      ⋃ L∈specifiedBoardLines n Γ,scheduledSpecifiedClockThreshold cs ε M K deadline start hn e L J := by
  rintro ω ⟨j,hj,k,h⟩
  let cfg := (cs j).config
  let s := augPhaseStart cfg ε M (recycledPhaseState cs ε M deadline start hn e j ω)
  let w := (recycledPhases cs ε M deadline start hn e j ω).2
  let x := augRecycledPair cfg ε M hn s k w
  let z := WinnerMarkLaw.firstMarkedRace hn x.2
  let a := augRawOutcome cfg ε M (augTimedInput cfg x.1,z)
  have hr : actualRawClockTriggered cfg ε M (x.1,z) := h
  have htrigger : clockTriggered a.physical.process cfg.directions cfg.K a.physical.clocks := hr.2
  obtain ⟨L,hL,_,hclock⟩ := htrigger
  have ht := actualRawClockTriggered_terminal cfg ε M hn s k w hr
  let t := augRecycledTerminal cfg ε M hn s w
  let f := augTimedStateProjection cfg t
  have hstop : f.val.physical.process.stopped=true := ht.1
  have hphase : recycledPhaseState cs ε M deadline start hn e (j+1) ω=f := by
    rw [recycledPhaseState_succ_eq]
    change augValidDeadlineRetirement deadline (phaseEndpoint cs start (j+1)) f=f
    exact augValidDeadlineRetirement_stopped deadline _ f hstop
  have hfinal : recycledPhaseState cs ε M deadline start hn e J ω=f := by
    rw [recycledPhaseState_eq_of_stopped cs ε M deadline start hn e ω (j+1)
      (hphase.symm ▸ hstop) J hj]
    exact hphase
  refine mem_iUnion.mpr ⟨L,mem_iUnion.mpr ⟨?_,?_⟩⟩
  · have hspec : specified Γ L := by
      change specified (cs j).directions L at hL
      rwa [hΓ j hj] at hL
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _,hspec⟩
  · change K≤(recycledPhaseState cs ε M deadline start hn e J ω).val.physical.clocks L
    rw [hfinal,←hK j hj]
    change cfg.K≤t.val.1.physical.clocks L
    have he : t.val.1.physical.clocks=a.physical.clocks := ht.2
    rw [he]
    exact hclock

theorem scheduledBoundaryCause_clock_subset_actual {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (p : Grid n) (J : ℕ) :
    scheduledBoundaryCauseBefore cs ε M deadline start hn e p .clock J⊆
      scheduledActualClockHit cs ε M deadline start hn e J := by
  rintro ω ⟨j,hj,k,h⟩
  exact ⟨j,hj,k,h.1,h.2.2⟩

theorem scheduledActualClockHit_real_le_terminal_sum {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (Γ : Finset ZPoint) (J : ℕ)
    (hΓ : ∀j<J,(cs j).directions=Γ) (hK : ∀j<J,(cs j).K=K)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    μ.real (scheduledActualClockHit cs ε M deadline start hn e J)≤
      ∑L∈specifiedBoardLines n Γ,μ.real (scheduledSpecifiedClockThreshold cs ε M K deadline start hn e L J) := by
  exact (measureReal_mono (μ:=μ) (scheduledActualClockHit_subset_terminal cs ε M K
    deadline start hn e Γ J hΓ hK) (measure_ne_top μ _)).trans
      (measureReal_biUnion_finset_le _ _)

theorem scheduledBoundaryCause_clock_real_le_terminal_sum {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (p : Grid n) (Γ : Finset ZPoint) (J : ℕ)
    (hΓ : ∀j<J,(cs j).directions=Γ) (hK : ∀j<J,(cs j).K=K)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    μ.real (scheduledBoundaryCauseBefore cs ε M deadline start hn e p .clock J)≤
      ∑L∈specifiedBoardLines n Γ,μ.real (scheduledSpecifiedClockThreshold cs ε M K deadline start hn e L J) := by
  exact (measureReal_mono (μ:=μ) (scheduledBoundaryCause_clock_subset_actual cs ε M deadline start
    hn e p J) (measure_ne_top μ _)).trans
      (scheduledActualClockHit_real_le_terminal_sum cs ε M K deadline start hn e Γ J hΓ hK μ)

end NoThreeLine

#print axioms NoThreeLine.scheduledActualClockHit_subset_terminal
#print axioms NoThreeLine.scheduledBoundaryCause_clock_real_le_terminal_sum

