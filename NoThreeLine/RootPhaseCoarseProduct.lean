import NoThreeLine.ScheduledSourceCoarseProduct
import NoThreeLine.RootPhaseSourceProjection

/-! Canonical full-phase frozen products on the actual original board.
The saved root snapshot is initially the current canonical state (including
its initial deadline retirement). Only artificial phase closures reopen.
All real root closures retain the complete witness/eta/connection snapshot. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines

def goodPhaseRootInitial {n : ℕ} {B : ℝ} (p : Grid n) (s : GoodPhaseObservation n B) :
    GoodPhaseRootObservation n B p :=
  ⟨phaseRootInitial p s.val,phaseRootInitial_invariant p s.val s.property.1,s.property.2⟩

theorem goodPhaseRootInitial_measurable {n : ℕ} {B : ℝ} (p : Grid n) :
    Measurable (goodPhaseRootInitial (B:=B) p) :=
  ((phaseRootInitial_measurable p).comp measurable_subtype_coe).subtype_mk

theorem goodPhaseRootInitial_actual {n : ℕ} {B : ℝ} (p : Grid n) (s : GoodPhaseObservation n B) :
    goodPhaseRootActual p (goodPhaseRootInitial p s)=s := rfl

theorem goodPhaseRootInitial_mixed {n : ℕ} {B : ℝ} (p : Grid n) (Γ : Finset ZPoint) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodPhaseObservation n B) :
    goodPhaseRootMixed p Γ e C D L (goodPhaseRootInitial p s)=goodPhaseMixed Γ e C D L s := rfl

def initialGoodPhaseRootObservation {n : ℕ} (B : ℝ) (hB : 1≤B) (p : Grid n)
    (deadline : Grid n→ℝ) (start : ℝ) : GoodPhaseRootObservation n B p :=
  goodPhaseRootInitial p (initialGoodPhaseObservation B hB deadline start)

theorem initialGoodPhaseRoot_mixed_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hB : 1≤B) (hΓ : (cs 0).directions=Γ) (hCD : Disjoint C D) :
    goodPhaseRootMixed p Γ e C D L (initialGoodPhaseRootObservation B hB p deadline start)≤∏q∈D,(0:ℝ) := by
  have h := initialGoodPhase_unit_initial_bound cs ε M deadline start Γ e (C∪D) L hB hΓ D Finset.subset_union_right
  have hs : (C∪D)\D=C := by
    ext q
    simp only [Finset.mem_sdiff,Finset.mem_union]
    exact ⟨fun h=>h.1.resolve_right h.2,fun h=>⟨Or.inl h,fun hq=>Finset.disjoint_left.mp hCD h hq⟩⟩
  simpa only [initialGoodPhaseRootObservation,goodPhaseRootInitial_mixed,hs] using h

theorem initial_rootPhase_coarse_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCD : Disjoint C D) (hCDL : C∪D⊆L) (k : ℕ) :
    (∫ω,goodPhaseRootMixed p Γ e C D L
      (rootPhaseRecycledState cs ε M deadline start p hn (initialGoodPhaseRootObservation B hB p deadline start) k ω)
        ∂boardClockMeasure n (B/n))≤∏q∈D,accumulatedPhaseCoarsePrice cs start e k q := by
  have h := rootPhase_expected_mixed_actual_source cs ε M deadline start p hn (lt_of_lt_of_le zero_lt_one hB)
    Γ e C D L hΓ hK (Finset.subset_union_left.trans hCDL) hCD
    (initialGoodPhaseRootObservation B hB p deadline start) k
  have hi := initialGoodPhaseRoot_mixed_bound cs ε M deadline start p Γ e C D L hB (hΓ 0) hCD
  have hs := initial_cumulativeSource_coarse_product_difference cs ε M deadline start Γ e C D L hn hB hΓ hK hCD hCDL k
  change _≤goodPhaseRootMixed p Γ e C D L (initialGoodPhaseRootObservation B hB p deadline start)+
    (∫ω,cumulativeScheduledSource cs ε M deadline start e C D L hn
      (initialGoodPhaseObservation B hB deadline start) k ω ∂boardClockMeasure n (B/n)) at h
  linarith

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.goodPhaseRootInitial_measurable
#print axioms NoThreeLine.BirthWitness.initial_rootPhase_coarse_product
