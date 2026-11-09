import NoThreeLine.WitnessPhaseCalendar
import NoThreeLine.SourceInitialProduct
import NoThreeLine.WitnessTerminalHierarchyBase

/-! Instantiate the finite-phase source inequality at the actual canonical
deadline-retired observer. Unborn witnesses vanish initially, and the
source-free base remains at most one across all finite phase prefixes. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines

def initialGoodPhaseObservation {n : ℕ} (B : ℝ) (hB : 1≤B) (deadline : Grid n→ℝ) (start : ℝ) :
    GoodPhaseObservation n B :=
  ⟨observedInitial B hB deadline start,observedInitial_consistent B hB deadline start,
    emptyLineCredit_augInitialState B hB deadline start⟩

theorem initialGoodPhaseObservation_start {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hB : 1≤cfg.B) (deadline : Grid n→ℝ) (start : ℝ) :
    goodPhaseStart cfg ε M (initialGoodPhaseObservation cfg.B hB deadline start)=
      initialGoodObservation cfg ε M hB deadline start := rfl

theorem scheduledSourceIncrement_empty {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (j : ℕ) (ω : BoardClockPath n) :
    scheduledSourceIncrement cs ε M deadline start e C ∅ L hn s j ω=0 :=
  terminalRunningSource_empty (cs j).config ε M _ e C L hn _ _

theorem cumulativeScheduledSource_empty {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeScheduledSource cs ε M deadline start e C ∅ L hn s k ω=0 := by
  simp only [cumulativeScheduledSource,scheduledSourceIncrement_empty,Finset.sum_const_zero]

theorem finitePhase_source_free_bound {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (C L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCL : C⊆L) (s : GoodPhaseObservation n B) (k : ℕ) :
    (∫ω,goodPhaseMixed Γ e C ∅ L (goodPhases cs ε M deadline start hn s k ω).1
      ∂boardClockMeasure n (B/n))≤goodPhaseMixed Γ e C ∅ L s := by
  simpa only [cumulativeScheduledSource_empty,integral_zero,add_zero] using
    finitePhase_mixed_source_bound cs ε M deadline start Γ e C ∅ L hn hB hΓ hK hCL (Finset.disjoint_empty_right C) s k

theorem initial_finitePhase_source_free_bound {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (C L : Finset (Grid n))
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCL : C⊆L) (k : ℕ) :
    (∫ω,goodPhaseMixed Γ e C ∅ L
      (goodPhases cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) k ω).1
      ∂boardClockMeasure n (B/n))≤1 := by
  apply (finitePhase_source_free_bound cs ε M deadline start Γ e C L hn
    (lt_of_lt_of_le zero_lt_one hB) hΓ hK hCL _ k).trans
  have hh := goodMixed_empty_le_one_of_initial (cs 0).config e C L
    (initialGoodObservation (cs 0).config ε M hB deadline start)
    (initialGoodObservation_selected (cs 0).config ε M hB deadline start)
    (fun p=>(initialGoodObservation_weight (cs 0).config ε M hB deadline start p).le)
    (initialGoodObservation_clock (cs 0).config ε M hB deadline start)
  change goodPhaseMixed (cs 0).directions e C ∅ L (initialGoodPhaseObservation B hB deadline start)≤1 at hh
  rw [hΓ 0] at hh
  exact hh

theorem initial_finitePhase_unborn_source_bound {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCL : C⊆L) (hCD : Disjoint C D) (hD : D.Nonempty) (k : ℕ) :
    (∫ω,goodPhaseMixed Γ e C D L
      (goodPhases cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) k ω).1
      ∂boardClockMeasure n (B/n))≤
        ∫ω,cumulativeScheduledSource cs ε M deadline start e C D L hn
          (initialGoodPhaseObservation B hB deadline start) k ω ∂boardClockMeasure n (B/n) := by
  obtain ⟨q,hq⟩ := hD
  have hz := goodMixed_eq_zero_of_unborn (cs 0).config e C D L
    (initialGoodObservation (cs 0).config ε M hB deadline start) q hq
    (by simp [initialGoodObservation_selected])
  change goodPhaseMixed (cs 0).directions e C D L (initialGoodPhaseObservation B hB deadline start)=0 at hz
  rw [hΓ 0] at hz
  simpa only [hz,zero_add] using finitePhase_mixed_source_bound cs ε M deadline start Γ e C D L hn
    (lt_of_lt_of_le zero_lt_one hB) hΓ hK hCL hCD (initialGoodPhaseObservation B hB deadline start) k

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_finitePhase_source_free_bound
#print axioms NoThreeLine.BirthWitness.initial_finitePhase_unborn_source_bound
