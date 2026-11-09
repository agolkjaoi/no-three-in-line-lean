import NoThreeLine.VirtualContinuousContact
import NoThreeLine.PhaseCandidateRegular

/-! Continuous contact anywhere in an executed physical segment, together
with raw birth/geometry contacts, is transported to one canonical saved
snapshot. The actual no-tie law is supplied internally for all phases and
steps; there is no union bound over time. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def phaseContinuousVirtualAt {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (L : LineIndex n) (N k : ℕ) (ω : BoardClockPath n) : Prop :=
  let x := rootObserverRecycledPair (cs N).config ε M (phaseEndpoint cs start N) q hn
    (phaseRootStart (cs N).config ε M q (phaseRootPhases cs ε M deadline start q hn s N ω).1)
    k (phaseRootPhases cs ε M deadline start q hn s N ω).2
  virtualSegmentContact (cs N).config ε M L q (x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem phaseContinuousVirtualAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (L : LineIndex n) (N k : ℕ) :
    Measurable (phaseContinuousVirtualAt cs ε M deadline start q hn s L N k) := by
  have hm := (phaseRootPhases_joint_measurable cs ε M deadline start q hn N).comp
    (measurable_const.prodMk measurable_id (f:=fun _ : BoardClockPath n=>s))
  have hi := (rootObserverRecycledPair_joint_measurable (cs N).config ε M (phaseEndpoint cs start N) q hn k).comp
    (((phaseRootStart_measurable (cs N).config ε M q).comp hm.fst).prodMk hm.snd)
  exact (virtualSegmentContact_measurable (cs N).config ε M L q).comp
    (hi.fst.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hi.snd))

theorem phaseContinuousVirtualAt_rawHit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (L : LineIndex n) (N k : ℕ) (ω : BoardClockPath n)
    (hreg : phaseCandidateRegular cs ε M deadline start q hn s N k ω)
    (hh : phaseContinuousVirtualAt cs ε M deadline start q hn s L N k ω) :
    phaseVirtualHitAt cs ε M deadline start q hn s L N k ω :=
  virtualSegmentContact_rawHit (cs N).config ε M (phaseEndpoint cs start N) L q _ hh hreg.1.le hreg.2

def phaseContinuousVirtualBefore {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (L : LineIndex n) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃N,N<J ∧ ∃k,phaseContinuousVirtualAt cs ε M deadline start q hn s L N k ω}

theorem phaseContinuousVirtualBefore_measurableSet {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (L : LineIndex n) (J : ℕ) :
    MeasurableSet (phaseContinuousVirtualBefore cs ε M deadline start q hn s L J) :=
  (Measurable.exists (fun N=>measurable_const.and
    (Measurable.exists (fun k=>phaseContinuousVirtualAt_measurable cs ε M deadline start q hn s L N k)))).setOf

def phaseActualVirtualHitBefore {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (L : LineIndex n) (J : ℕ) : Set (BoardClockPath n) :=
  phaseVirtualHitBefore cs ε M deadline start q hn s L J ∪
    phaseContinuousVirtualBefore cs ε M deadline start q hn s L J

theorem phaseActualVirtualHitBefore_measurableSet {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (L : LineIndex n) (J : ℕ) :
    MeasurableSet (phaseActualVirtualHitBefore cs ε M deadline start q hn s L J) :=
  (phaseVirtualHitBefore_measurableSet cs ε M deadline start q hn s L J).union
    (phaseContinuousVirtualBefore_measurableSet cs ε M deadline start q hn s L J)

theorem phaseActualVirtualHitBefore_raw_ae {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n) (hB : 0<B)
    (s : GoodPhaseRootObservation n B q) :
    ∀ᵐω∂boardClockMeasure n (B/n),∀L J,
      ω∈phaseActualVirtualHitBefore cs ε M deadline start q hn s.val L J →
      ω∈phaseVirtualHitBefore cs ε M deadline start q hn s.val L J := by
  filter_upwards [phases_all_candidateRegular_ae cs ε M deadline start q hn hB s] with ω hω
  intro L J hh
  rcases hh with hh|hh
  · exact hh
  · obtain ⟨N,hN,k,hk⟩ := hh
    exact ⟨N,hN,k,phaseContinuousVirtualAt_rawHit cs ε M deadline start q hn s.val L N k ω (hω N k) hk⟩

theorem initial_actualVirtualHit_full_snapshot_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (q : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (hM : 0<M)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ) :
    ∀ᵐω∂boardClockMeasure n (B/n),∀L J,
      ω∈phaseActualVirtualHitBefore cs ε M deadline start q hn
        (initialGoodPhaseRootObservation B hB q deadline start).val L J →
      M≤virtualMass (initialRootPhaseWitness cs ε M deadline start q hn hB e J ω).augmented.physical.process
        Γ (initialRootPhaseWitness cs ε M deadline start q hn hB e J ω).augmented.physical.coordinates L q := by
  filter_upwards [phaseActualVirtualHitBefore_raw_ae cs ε M deadline start q hn (zero_lt_one.trans_le hB)
    (initialGoodPhaseRootObservation B hB q deadline start)] with ω hω
  intro L J hh
  exact initial_phaseVirtualHitBefore_full_snapshot cs ε M deadline start q hn hB e hM Γ hΓ L J ω (hω L J hh)

theorem initial_actualVirtualHit_measure_le {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (q : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (hM : 0<M)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ) (L : LineIndex n) (J : ℕ) :
    boardClockMeasure n (B/n) (phaseActualVirtualHitBefore cs ε M deadline start q hn
      (initialGoodPhaseRootObservation B hB q deadline start).val L J)≤
    boardClockMeasure n (B/n) {ω |
      M≤virtualMass (initialRootPhaseWitness cs ε M deadline start q hn hB e J ω).augmented.physical.process
        Γ (initialRootPhaseWitness cs ε M deadline start q hn hB e J ω).augmented.physical.coordinates L q} := by
  apply measure_mono_ae
  filter_upwards [initial_actualVirtualHit_full_snapshot_ae cs ε M deadline start q hn hB e hM Γ hΓ] with ω hω
  exact hω L J

theorem initial_actualVirtualHit_full_snapshot_point_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (q : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (hM : 0<M)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ) (J : ℕ) :
    ∀ᵐω∂phasePointMeasure cs ε M deadline start hn hB q J,∀L,
      ω∈phaseActualVirtualHitBefore cs ε M deadline start q hn
        (initialGoodPhaseRootObservation B hB q deadline start).val L J →
      M≤virtualMass (initialRootPhaseWitness cs ε M deadline start q hn hB e J ω).augmented.physical.process
        Γ (initialRootPhaseWitness cs ε M deadline start q hn hB e J ω).augmented.physical.coordinates L q := by
  filter_upwards [(phasePointMeasure_absolutelyContinuous cs ε M deadline start hn hB q J).ae_le
    (initial_actualVirtualHit_full_snapshot_ae cs ε M deadline start q hn hB e hM Γ hΓ)] with ω hω
  exact fun L=>hω L J

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseActualVirtualHitBefore_measurableSet
#print axioms NoThreeLine.BirthWitness.initial_actualVirtualHit_measure_le
#print axioms NoThreeLine.BirthWitness.initial_actualVirtualHit_full_snapshot_point_ae
