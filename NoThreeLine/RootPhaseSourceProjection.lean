import NoThreeLine.RootPhaseAccumulation
import NoThreeLine.WitnessPhaseAccumulation

/-! The running upper source in saved-root phase S7 is exactly the old
actual ordinary source on the same original board, with identical birth
records, phase times, deadlines and residual clocks. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem rootPhaseActual_pair_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) :
    (goodPhaseRootActual p (rootPhaseRecycledState cs ε M deadline start p hn s k ω),
      (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).2)=
      goodPhases cs ε M deadline start hn (goodPhaseRootActual p s) k ω := by
  have hraw := congrArg (fun r : PhaseRootObservation n B×BoardClockPath n=>(r.1.1,r.2))
    (rootPhaseRecycledPair_projection cs ε M deadline start p hn s k ω)
  have hactual := hraw.trans (phaseRootPhases_projection cs ε M deadline start p hn s.val k ω)
  have hgood := goodPhases_projection cs ε M deadline start hn (goodPhaseRootActual p s) k ω
  have hp := hactual.trans hgood.symm
  apply Prod.ext
  · apply Subtype.ext
    exact congrArg (fun r : PhaseObservation n B×BoardClockPath n=>r.1) hp
  · exact congrArg (fun r : PhaseObservation n B×BoardClockPath n=>r.2) hp

theorem rootPhaseSourceIncrement_eq_actual {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : Retention n) (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) (j : ℕ) (ω : BoardClockPath n) :
    rootPhaseSourceIncrement cs ε M deadline start p hn e C D L s j ω=
      scheduledSourceIncrement cs ε M deadline start e C D L hn (goodPhaseRootActual p s) j ω := by
  change phaseRunningSource (cs j).config ε M (phaseEndpoint cs start j) e C D L hn
    (goodPhaseRootActual p (rootPhaseRecycledState cs ε M deadline start p hn s j ω),
      (rootPhaseRecycledPair cs ε M deadline start p hn s j ω).2)=_
  rw [rootPhaseActual_pair_projection]
  rfl

theorem cumulativeRootPhaseSource_eq_actual {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : Retention n) (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeRootPhaseSource cs ε M deadline start p hn e C D L s k ω=
      cumulativeScheduledSource cs ε M deadline start e C D L hn (goodPhaseRootActual p s) k ω := by
  apply Finset.sum_congr rfl
  intro j _
  exact rootPhaseSourceIncrement_eq_actual cs ε M deadline start p hn e C D L s j ω

theorem rootPhase_expected_mixed_actual_source {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2) (hCL : C⊆L) (hCD : Disjoint C D)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) :
    (∫ω,goodPhaseRootMixed p Γ e C D L (rootPhaseRecycledState cs ε M deadline start p hn s k ω)
      ∂boardClockMeasure n (B/n))≤goodPhaseRootMixed p Γ e C D L s+
      ∫ω,cumulativeScheduledSource cs ε M deadline start e C D L hn (goodPhaseRootActual p s) k ω
        ∂boardClockMeasure n (B/n) := by
  have h := rootPhase_expected_mixed_cumulative cs ε M deadline start p hn hB Γ e C D L hΓ hK hCL hCD s k
  simpa only [cumulativeRootPhaseSource_eq_actual] using h

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.rootPhaseActual_pair_projection
#print axioms NoThreeLine.BirthWitness.cumulativeRootPhaseSource_eq_actual
#print axioms NoThreeLine.BirthWitness.rootPhase_expected_mixed_actual_source
