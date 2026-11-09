import NoThreeLine.RootPhaseCoarseProduct
import NoThreeLine.ScheduledSourceUnitProduct

/-! The separated-label version of the canonical full-phase frozen
product. Unit prices are used only with the actual geometric separation
hypothesis; the coarse-price theorem remains available independently. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem initial_rootPhase_unit_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCD : Disjoint C D) (hCDL : C∪D⊆L) (hsep : SeparatedLabels Γ (C∪D)) (k : ℕ) :
    (∫ω,goodPhaseRootMixed p Γ e C D L
      (rootPhaseRecycledState cs ε M deadline start p hn (initialGoodPhaseRootObservation B hB p deadline start) k ω)
        ∂boardClockMeasure n (B/n))≤∏q∈D,accumulatedPhaseUnitPrice cs start e k q := by
  have h := rootPhase_expected_mixed_actual_source cs ε M deadline start p hn (lt_of_lt_of_le zero_lt_one hB)
    Γ e C D L hΓ hK (Finset.subset_union_left.trans hCDL) hCD
    (initialGoodPhaseRootObservation B hB p deadline start) k
  have hi := initialGoodPhaseRoot_mixed_bound cs ε M deadline start p Γ e C D L hB (hΓ 0) hCD
  have hs := initial_cumulativeSource_unit_product_difference cs ε M deadline start Γ e C D L hn hB hΓ hK hCD hCDL hsep k
  change _≤goodPhaseRootMixed p Γ e C D L (initialGoodPhaseRootObservation B hB p deadline start)+
    (∫ω,cumulativeScheduledSource cs ε M deadline start e C D L hn
      (initialGoodPhaseObservation B hB deadline start) k ω ∂boardClockMeasure n (B/n)) at h
  linarith

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_rootPhase_unit_product
