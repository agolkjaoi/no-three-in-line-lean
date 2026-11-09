import NoThreeLine.VirtualHitPathwise
import NoThreeLine.RootPhaseConnectionFloor

/-! Actual postgeometry virtual hits in any of the original physical
phases remain in one full-J saved root snapshot. The hit causes a true
global stop, so artificial phase reopening cannot discard the snapshot. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem virtualHitAt_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (L : LineIndex n) (k : ℕ) :
    Measurable (fun x : RootObservation cfg×BoardClockPath n=>virtualHitAt cfg ε M start q hn x.1 L k x.2) := by
  have hm := rootObserverRecycledPair_joint_measurable cfg ε M start q hn k
  exact (virtualRawHit_measurable cfg ε M start L q).comp
    (hm.fst.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hm.snd))

def phaseVirtualHitAt {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (L : LineIndex n) (N k : ℕ) (ω : BoardClockPath n) : Prop :=
  virtualHitAt (cs N).config ε M (phaseEndpoint cs start N) q hn
    (phaseRootStart (cs N).config ε M q (phaseRootPhases cs ε M deadline start q hn s N ω).1)
    L k (phaseRootPhases cs ε M deadline start q hn s N ω).2

theorem phaseVirtualHitAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (L : LineIndex n) (N k : ℕ) :
    Measurable (phaseVirtualHitAt cs ε M deadline start q hn s L N k) := by
  have hm := (phaseRootPhases_joint_measurable cs ε M deadline start q hn N).comp
    (measurable_const.prodMk measurable_id (f:=fun _ : BoardClockPath n=>s))
  exact (virtualHitAt_joint_measurable (cs N).config ε M (phaseEndpoint cs start N) q hn L k).comp
    (((phaseRootStart_measurable (cs N).config ε M q).comp hm.fst).prodMk hm.snd)

def phaseVirtualHitBefore {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (L : LineIndex n) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃N,N<J ∧ ∃k,phaseVirtualHitAt cs ε M deadline start q hn s L N k ω}

theorem phaseVirtualHitBefore_measurableSet {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (L : LineIndex n) (J : ℕ) :
    MeasurableSet (phaseVirtualHitBefore cs ε M deadline start q hn s L J) := by
  exact (Measurable.exists (fun N=>measurable_const.and
    (Measurable.exists (fun k=>phaseVirtualHitAt_measurable cs ε M deadline start q hn s L N k)))).setOf

theorem phaseVirtualHitAt_full_snapshot {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (hs : PhaseRootInvariant q s) (hM : 0<M)
    (L : LineIndex n) (N k J : ℕ) (hNJ : N<J) (ω : BoardClockPath n)
    (hh : phaseVirtualHitAt cs ε M deadline start q hn s L N k ω) :
    M≤virtualMass (phaseRootPhases cs ε M deadline start q hn s J ω).1.2.2.1.physical.process
      (cs N).directions (phaseRootPhases cs ε M deadline start q hn s J ω).1.2.2.1.physical.coordinates L q := by
  let x := phaseRootPhases cs ε M deadline start q hn s N ω
  let a := phaseRootStart (cs N).config ε M q x.1
  let t := rootObserverTerminal (cs N).config ε M (phaseEndpoint cs start N) q hn (a,x.2)
  have hx : PhaseRootInvariant q x.1 := phaseRootPhases_invariant cs ε M deadline start q hn s hs N ω
  have he := virtualHitEvent_terminal_snapshot (cs N).config ε M (phaseEndpoint cs start N) q hn a
    (phaseRootStart_invariant (cs N).config ε M q x.1 hx) hM L x.2 ⟨k,hh⟩
  have hb : (phaseRootPhases cs ε M deadline start q hn s (N+1) ω).1.2=(true,t.2.2) := by
    exact phaseRootBoundary_permanent (cs N).config q deadline (phaseEndpoint cs start (N+1)) t (Or.inl he.1)
  have hf : (phaseRootPhases cs ε M deadline start q hn s (N+1) ω).1.2.1=true := congrArg Prod.fst hb
  rw [phaseRootPhases_permanent_stable cs ε M deadline start q hn s hs ω (N+1) hf J hNJ,hb]
  exact he.2

theorem phaseVirtualHitBefore_full_snapshot {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (hs : PhaseRootInvariant q s) (hM : 0<M)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ) (L : LineIndex n) (J : ℕ) (ω : BoardClockPath n)
    (hh : ω∈phaseVirtualHitBefore cs ε M deadline start q hn s L J) :
    M≤virtualMass (phaseRootPhases cs ε M deadline start q hn s J ω).1.2.2.1.physical.process
      Γ (phaseRootPhases cs ε M deadline start q hn s J ω).1.2.2.1.physical.coordinates L q := by
  obtain ⟨N,hN,k,hk⟩ := hh
  have he := phaseVirtualHitAt_full_snapshot cs ε M deadline start q hn s hs hM L N k J hN ω hk
  simpa only [hΓ N] using he

theorem initial_phaseVirtualHitBefore_full_snapshot {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (q : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (hM : 0<M)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ) (L : LineIndex n) (J : ℕ) (ω : BoardClockPath n)
    (hh : ω∈phaseVirtualHitBefore cs ε M deadline start q hn
      (initialGoodPhaseRootObservation B hB q deadline start).val L J) :
    M≤virtualMass (initialRootPhaseWitness cs ε M deadline start q hn hB e J ω).augmented.physical.process
      Γ (initialRootPhaseWitness cs ε M deadline start q hn hB e J ω).augmented.physical.coordinates L q := by
  let s := initialGoodPhaseRootObservation B hB q deadline start
  have he := congrArg Prod.fst (rootPhaseRecycledPair_projection cs ε M deadline start q hn s J ω)
  change (rootPhaseRecycledState cs ε M deadline start q hn s J ω).val=_ at he
  change M≤virtualMass (rootPhaseRecycledState cs ε M deadline start q hn s J ω).val.2.2.1.physical.process
    Γ (rootPhaseRecycledState cs ε M deadline start q hn s J ω).val.2.2.1.physical.coordinates L q
  rw [he]
  exact phaseVirtualHitBefore_full_snapshot cs ε M deadline start q hn s.val s.property.1 hM Γ hΓ L J ω hh

theorem initial_phaseVirtualHitBefore_measure_le {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (q : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (hM : 0<M)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ) (L : LineIndex n) (J : ℕ)
    (μ : Measure (BoardClockPath n)) :
    μ (phaseVirtualHitBefore cs ε M deadline start q hn
      (initialGoodPhaseRootObservation B hB q deadline start).val L J)≤
    μ {ω | M≤virtualMass (initialRootPhaseWitness cs ε M deadline start q hn hB e J ω).augmented.physical.process
      Γ (initialRootPhaseWitness cs ε M deadline start q hn hB e J ω).augmented.physical.coordinates L q} :=
  measure_mono (initial_phaseVirtualHitBefore_full_snapshot cs ε M deadline start q hn hB e hM Γ hΓ L J)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseVirtualHitBefore_measurableSet
#print axioms NoThreeLine.BirthWitness.initial_phaseVirtualHitBefore_full_snapshot
#print axioms NoThreeLine.BirthWitness.initial_phaseVirtualHitBefore_measure_le
