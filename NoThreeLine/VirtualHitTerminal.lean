import NoThreeLine.VirtualHitSnapshot

/-! Any live raw virtual hit in the actual recycled phase is contained,
up to the already proved completion null set, in a single terminal saved
snapshot tail event. No factor for the number of times is introduced. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set Filter
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def virtualHitAt {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (s : RootObservation cfg) (L : LineIndex n)
    (k : ℕ) (ω : BoardClockPath n) : Prop :=
  virtualRawHit cfg ε M start L q
    ((rootObserverRecycledPair cfg ε M start q hn s k ω).1.1,
      WinnerMarkLaw.firstMarkedRace hn (rootObserverRecycledPair cfg ε M start q hn s k ω).2)

theorem virtualHitAt_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (s : RootObservation cfg) (L : LineIndex n) (k : ℕ) :
    Measurable (virtualHitAt cfg ε M start q hn s L k) := by
  have hm := rootObserverRecycledPair_measurable cfg ε M start q hn s k
  exact (virtualRawHit_measurable cfg ε M start L q).comp
    (hm.fst.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hm.snd))

def virtualHitEvent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (s : RootObservation cfg) (L : LineIndex n) : Set (BoardClockPath n) :=
  {ω | ∃k,virtualHitAt cfg ε M start q hn s L k ω}

theorem virtualHitEvent_measurableSet {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (s : RootObservation cfg) (L : LineIndex n) :
    MeasurableSet (virtualHitEvent cfg ε M start q hn s L) := by
  simp only [virtualHitEvent,setOf_exists]
  exact MeasurableSet.iUnion (fun k=>(virtualHitAt_measurable cfg ε M start q hn s L k).setOf)

theorem virtualHitAt_snapshot_stable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (s : RootObservation cfg) (hs : RootObserverInvariant cfg q s)
    (hM : 0<M) (L : LineIndex n) (k : ℕ) (ω : BoardClockPath n)
    (hh : virtualHitAt cfg ε M start q hn s L k ω) (j : ℕ) (hj : k+1≤j) :
    (rootObserverRecycledPair cfg ε M start q hn s j ω).1.2=
      (true,rawStepSaved cfg ε M start
        ((rootObserverRecycledPair cfg ε M start q hn s k ω).1.1,
          WinnerMarkLaw.firstMarkedRace hn (rootObserverRecycledPair cfg ε M start q hn s k ω).2)) := by
  have he := rootObserverStep_virtualHit_snapshot cfg ε M start q
    (rootObserverRecycledPair cfg ε M start q hn s k ω).1 _
    (rootObserverRecycledPair_invariant cfg ε M start q hn s hs k ω) hM L hh
  change (rootObserverRecycledPair cfg ε M start q hn s (k+1) ω).1.2=_ at he
  have hf : (rootObserverRecycledPair cfg ε M start q hn s (k+1) ω).1.2.1=true := congrArg Prod.fst he
  exact (rootObserverRecycledPair_frozen_stable cfg ε M start q hn s ω (k+1) hf j hj).trans he

theorem virtualHitEvent_terminal_snapshot_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg q s) (hM : 0<M) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∀L : LineIndex n,
    ω∈virtualHitEvent cfg ε M start q hn s L →
      M≤virtualMass (rootObserverTerminal cfg ε M start q hn (s,ω)).2.2.1.physical.process
        cfg.directions (rootObserverTerminal cfg ε M start q hn (s,ω)).2.2.1.physical.coordinates L q := by
  filter_upwards [rootObserverTerminal_saved_stable_ae cfg ε M start q hn hB s hs] with ω hω
  intro L hh
  obtain ⟨k,hk⟩ := hh
  obtain ⟨j,hjterm,hjk⟩ := (hω.and (eventually_ge_atTop (k+1))).exists
  have he := (hjterm.symm.trans (virtualHitAt_snapshot_stable cfg ε M start q hn s hs hM L k ω hk j hjk))
  rw [he]
  exact hk.2

theorem virtualHitEvent_measure_le_terminal_tail {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg q s) (hM : 0<M) (L : LineIndex n) :
    boardClockMeasure n (cfg.B/n) (virtualHitEvent cfg ε M start q hn s L)≤
      boardClockMeasure n (cfg.B/n) {ω |
        M≤virtualMass (rootObserverTerminal cfg ε M start q hn (s,ω)).2.2.1.physical.process
          cfg.directions (rootObserverTerminal cfg ε M start q hn (s,ω)).2.2.1.physical.coordinates L q} := by
  apply measure_mono_ae
  filter_upwards [virtualHitEvent_terminal_snapshot_ae cfg ε M start q hn hB s hs hM] with ω hω
  exact hω L

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.virtualHitEvent_measurableSet
#print axioms NoThreeLine.BirthWitness.virtualHitAt_snapshot_stable
#print axioms NoThreeLine.BirthWitness.virtualHitEvent_measure_le_terminal_tail
