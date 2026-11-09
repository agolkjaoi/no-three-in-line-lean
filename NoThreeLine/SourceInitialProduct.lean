import NoThreeLine.SourceHierarchyProduct
import NoThreeLine.BirthObservationPhases

/-! Apply the actual product hierarchy to the canonical deadline-retired
initial observer, including unused points whose deadlines are already past.
This is one fixed phase, not the mixed hierarchy across all phases. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def initialGoodObservation {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hB : 1≤cfg.B)
    (deadline : Grid n→ℝ) (start : ℝ) : GoodObservation cfg :=
  ⟨observedPhaseStart cfg ε M (observedInitial cfg.B hB deadline start),
    observedInitial_consistent cfg.B hB deadline start,
    emptyLineCredit_augInitialState cfg.B hB deadline start⟩

theorem initialGoodObservation_selected {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hB : 1≤cfg.B)
    (deadline : Grid n→ℝ) (start : ℝ) :
    (initialGoodObservation cfg ε M hB deadline start).val.1.val.1.physical.process.selected=∅ := rfl

theorem initialGoodObservation_weight {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hB : 1≤cfg.B)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) :
    ((initialGoodObservation cfg ε M hB deadline start).val.1.val.1.physical.process.accounts p).weight=1 := by
  change (CreditAccount.retire ⟨.active,1⟩ (decide (deadline p≤start))).weight=1
  exact CreditAccount.retire_weight _ _

theorem initialGoodObservation_clock {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hB : 1≤cfg.B)
    (deadline : Grid n→ℝ) (start : ℝ) (J : LineIndex n) :
    (initialGoodObservation cfg ε M hB deadline start).val.1.val.1.physical.clocks J=0 := rfl

theorem initialGoodObservation_time {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hB : 1≤cfg.B)
    (deadline : Grid n→ℝ) (start : ℝ) :
    observationTime cfg start (initialGoodObservation cfg ε M hB deadline start).val.1=start :=
  observedPhaseStart_time cfg ε M start _

theorem initial_elapsedMixedMean_product_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 1≤cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCD : Disjoint C D) (hCDL : C∪D⊆L)
    (deadline : Grid n→ℝ) (t : ℝ) (ht : t∈Icc (0:ℝ) cfg.horizon) :
    elapsedMixedMean cfg ε M start e C D L hn (initialGoodObservation cfg ε M hB deadline start) t≤
      ∏q∈D,∫u in (0:ℝ)..t,(cfg.mask q*e.value q (start+u)/n)*
        max 1 (protection 1 cfg.K)^cfg.directions.card := by
  have hh := elapsedMixedMean_product_bound cfg ε M start e C D L hn (lt_of_lt_of_le zero_lt_one hB)
    hm hK hCD hCDL (initialGoodObservation cfg ε M hB deadline start)
    (initialGoodObservation_selected cfg ε M hB deadline start)
    (fun p=>(initialGoodObservation_weight cfg ε M hB deadline start p).le)
    (initialGoodObservation_clock cfg ε M hB deadline start) t ht
  simpa only [elapsedSourceCoefficient,initialGoodObservation_time] using hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initialGoodObservation
#print axioms NoThreeLine.BirthWitness.initial_elapsedMixedMean_product_bound
