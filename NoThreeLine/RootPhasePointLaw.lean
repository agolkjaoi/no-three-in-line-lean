import NoThreeLine.RootPhaseUnitProduct
import NoThreeLine.PhasePointLaw
import NoThreeLine.SingletonWitnessCredit

/-! The actual full-phase frozen snapshot has exactly the density of the
already constructed phase point law. No new measure or independence premise
is introduced, and the snapshot's active indicator is retained here. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def rootPhaseWitness {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (e : Retention n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) : WitnessState n :=
  savedWitness e (rootPhaseRecycledState cs ε M deadline start p hn s k ω).val.2.2

theorem rootPhaseWitness_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (e : Retention n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) :
    Measurable (rootPhaseWitness cs ε M deadline start p hn e s k) :=
  (savedWitness_measurable e).comp
    ((measurable_subtype_coe.comp (rootPhaseRecycledPair_measurable cs ε M deadline start p hn s k).fst.snd).snd.snd)

theorem rootPhaseWitness_valid {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (e : Retention n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) :
    (rootPhaseWitness cs ε M deadline start p hn e s k ω).Valid B :=
  savedWitness_valid B e _ (rootPhaseRecycledState cs ε M deadline start p hn s k ω).property.1.saved

theorem rootPhaseWitness_credit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (e : Retention n)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) :
    ((rootPhaseWitness cs ε M deadline start p hn e s k ω).augmented.physical.process.accounts p).credit=
      validAugStateCredit B p (observedRecycledPhaseState cs ε M deadline start hn s.val.1 k ω).1 := by
  have hp := congrArg (fun r : PhaseRootObservation n B×BoardClockPath n=>r.1)
    (rootPhaseRecycledPair_projection cs ε M deadline start p hn s k ω)
  change (rootPhaseRecycledState cs ε M deadline start p hn s k ω).val=
    (phaseRootPhases cs ε M deadline start p hn s.val k ω).1 at hp
  change ((rootPhaseRecycledState cs ε M deadline start p hn s k ω).val.2.2.1.physical.process.accounts p).credit=_
  rw [hp]
  exact phaseRootPhases_credit cs ε M deadline start p hn s.val s.property.1 k ω

theorem initial_rootPhaseWitness_credit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (k : ℕ) (ω : BoardClockPath n) :
    ((rootPhaseWitness cs ε M deadline start p hn e (initialGoodPhaseRootObservation B hB p deadline start) k ω).augmented.physical.process.accounts p).credit=phasePointCredit cs ε M deadline start hn hB p k ω := by
  rw [rootPhaseWitness_credit,observedRecycledPhaseState_base]
  rfl

theorem initial_rootPhaseWitness_density {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (k : ℕ) :
    savedCreditMeasure (boardClockMeasure n (B/n))
      (fun ω=>((rootPhaseWitness cs ε M deadline start p hn e
        (initialGoodPhaseRootObservation B hB p deadline start) k ω).augmented.physical.process.accounts p).credit)=
      phasePointMeasure cs ε M deadline start hn hB p k := by
  simp only [initial_rootPhaseWitness_credit,phasePointMeasure]

theorem initial_rootPhaseWitness_corrected_point_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (Γ : Finset PrimitiveLines.ZPoint) (D L : Finset (Grid n)) (k : ℕ) :
    (∫ω,correctedActiveWitness D L p (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k)=
      ∫ω,goodPhaseRootMixed p Γ e {p} D L (rootPhaseRecycledState cs ε M deadline start p hn
        (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂boardClockMeasure n (B/n) := by
  unfold phasePointMeasure
  rw [savedCreditMeasure_integral _ _ (phasePointCredit_measurable cs ε M deadline start hn hB p k)
    (fun ω=>(phasePointCredit_bounds cs ε M deadline start hn hB p k ω).1)]
  apply integral_congr_ae
  exact Filter.Eventually.of_forall (fun ω=>by
    change phasePointCredit cs ε M deadline start hn hB p k ω*correctedActiveWitness D L p _=_
    rw [←initial_rootPhaseWitness_credit cs ε M deadline start p hn hB e k ω]
    exact (singleton_mixed_credit Γ D L p _).symm)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_rootPhaseWitness_density
#print axioms NoThreeLine.BirthWitness.initial_rootPhaseWitness_corrected_point_mean
