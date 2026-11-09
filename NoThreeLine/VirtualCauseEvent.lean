import NoThreeLine.BoundaryCauseKinds
import NoThreeLine.VirtualActualHitUnion

/-! A virtual cause of actual root loss is an actual virtual hit in the
existing C5 event. Both observer layers are projected to the same physical
state and same residual original clock board, pointwise. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

theorem phaseRootPhases_physical_pair {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (q : Grid n) (hn : 0 < n) (s : PhaseRootObservation n B) (N : ℕ) (ω : BoardClockPath n) :
    ((phaseRootPhases cs ε M deadline start q hn s N ω).1.1.1,
      (phaseRootPhases cs ε M deadline start q hn s N ω).2) =
      (recycledPhaseState cs ε M deadline start hn s.1.1 N ω,
        (recycledPhases cs ε M deadline start hn s.1.1 N ω).2) := by
  have hp := phaseRootPhases_projection cs ε M deadline start q hn s N ω
  apply Prod.ext
  · exact (congrArg (fun a : PhaseObservation n B × BoardClockPath n => a.1.1) hp).trans
      (observedRecycledPhaseState_base cs ε M deadline start hn s.1 N ω)
  · exact (congrArg Prod.snd hp).trans (congrArg Prod.snd
      (observedRecycledPhases_base cs ε M deadline start hn s.1 N ω))

theorem phaseRootObserver_physical_pair {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (q : Grid n) (hn : 0 < n) (s : PhaseRootObservation n B) (N k : ℕ) (ω : BoardClockPath n) :
    let y := rootObserverRecycledPair (cs N).config ε M (phaseEndpoint cs start N) q hn
      (phaseRootStart (cs N).config ε M q (phaseRootPhases cs ε M deadline start q hn s N ω).1)
      k (phaseRootPhases cs ε M deadline start q hn s N ω).2
    (y.1.1.1,y.2) = augRecycledPair (cs N).config ε M hn
      (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn s.1.1 N ω))
      k (recycledPhases cs ε M deadline start hn s.1.1 N ω).2 := by
  dsimp only
  rw [rootObserverRecycledPair_physical_base,phaseRootStart_projection]
  change augRecycledPair (cs N).config ε M hn
    (augPhaseStart (cs N).config ε M (phaseRootPhases cs ε M deadline start q hn s N ω).1.1.1)
    k (phaseRootPhases cs ε M deadline start q hn s N ω).2 = _
  have hp := phaseRootPhases_physical_pair cs ε M deadline start q hn s N ω
  rw [congrArg Prod.fst hp,congrArg Prod.snd hp]

theorem initial_virtualCauseAt_actualHit {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) (N k J : ℕ) (hN : N < J) (ω : BoardClockPath n)
    (hc : scheduledBoundaryCauseAt cs ε M deadline start hn (augInitialState B hB deadline start)
      p .virtual N k ω) :
    ω ∈ VirtualWitness.anyActualVirtualHit cs ε M deadline start hn hB J := by
  let x := augRecycledPair (cs N).config ε M hn
    (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn
      (augInitialState B hB deadline start) N ω))
    k (recycledPhases cs ε M deadline start hn (augInitialState B hB deadline start) N ω).2
  obtain ⟨hd,_,L,q,hmass⟩ := hc
  let s := (initialGoodPhaseRootObservation B hB q deadline start).val
  let y := rootObserverRecycledPair (cs N).config ε M (phaseEndpoint cs start N) q hn
    (phaseRootStart (cs N).config ε M q (phaseRootPhases cs ε M deadline start q hn s N ω).1)
    k (phaseRootPhases cs ε M deadline start q hn s N ω).2
  have hp := phaseRootObserver_physical_pair cs ε M deadline start q hn s N k ω
  change (y.1.1.1,y.2) = x at hp
  have hrun : ¬observationDone (cs N).config y.1.1 := by
    intro h
    have hh : AugTimedDone (cs N).config y.1.1.1 := by
      rcases h with hr | hs
      · exact Or.inl (le_antisymm hr y.1.1.1.property.2.1)
      · exact Or.inr hs
    rw [congrArg Prod.fst hp] at hh
    exact hd hh
  refine ⟨L,q,Or.inl ⟨N,hN,k,?_⟩⟩
  change virtualRawHit (cs N).config ε M (phaseEndpoint cs start N) L q
    (y.1.1,WinnerMarkLaw.firstMarkedRace hn y.2)
  refine ⟨hrun,?_⟩
  simp only [rawStepSaved,if_neg hrun]
  rw [congrArg Prod.fst hp,congrArg Prod.snd hp]
  exact hmass

theorem initial_virtualCauseBefore_subset_actualHit {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) (J : ℕ) :
    scheduledBoundaryCauseBefore cs ε M deadline start hn (augInitialState B hB deadline start) p .virtual J ⊆
      VirtualWitness.anyActualVirtualHit cs ε M deadline start hn hB J := by
  rintro ω ⟨N,hN,k,hk⟩
  exact initial_virtualCauseAt_actualHit cs ε M deadline start hn hB p N k J hN ω hk

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseRootObserver_physical_pair
#print axioms NoThreeLine.BirthWitness.initial_virtualCauseBefore_subset_actualHit
