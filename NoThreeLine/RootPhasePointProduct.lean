import NoThreeLine.RootPhaseEta
import NoThreeLine.RootPhaseActiveSupport
import NoThreeLine.CutPointWitness

/-! Product estimates for the actual full-phase frozen witnesses under
the existing phase point law. The eta floor has the exact pair exponent.
For initially active roots, zero-density inactive snapshots permit removal
of the active indicator. Unit and coarse prices remain separate. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem initial_rootPhasePoint_active_mean_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (D L : Finset (Grid n)) (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) :
    (∫ω,activeWitness D p (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k)≤
      (∫ω,goodPhaseRootMixed p Γ e {p} D L (rootPhaseRecycledState cs ε M deadline start p hn
        (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂boardClockMeasure n (B/n))/(1-ε)^L.card.choose 2 := by
  let s := initialGoodPhaseRootObservation B hB p deadline start
  let W := rootPhaseWitness cs ε M deadline start p hn e s k
  let ν := phasePointMeasure cs ε M deadline start hn hB p k
  letI : IsProbabilityMeasure ν := phasePointMeasure_probability cs ε M deadline start hn hB p k
  have hv (ω : BoardClockPath n) : (W ω).Valid B := rootPhaseWitness_valid cs ε M deadline start p hn e s k ω
  have hi : Integrable (fun ω=>activeWitness D p (W ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((activeWitness_measurable D p).comp (rootPhaseWitness_measurable cs ε M deadline start p hn e s k))
      1 (fun ω=>activeWitness_bounds D p _ B (hv ω))
  have hj : Integrable (fun ω=>correctedActiveWitness D L p (W ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((correctedActiveWitness_measurable D L p).comp (rootPhaseWitness_measurable cs ε M deadline start p hn e s k))
      1 (fun ω=>correctedActiveWitness_bounds D L p _ B (hv ω))
  have hh := integral_mono (hi.const_mul ((1-ε)^L.card.choose 2)) hj (fun ω=>
    activeWitness_eta_floor D L p _ B ε (hv ω) hε.le
      (fun a _ b _ hab=>initial_rootPhaseWitness_eta_lower cs ε M deadline start p hn hB e hε0 a b hab k ω))
  rw [integral_const_mul] at hh
  change (1-ε)^L.card.choose 2*(∫ω,activeWitness D p (W ω) ∂ν)≤
    ∫ω,correctedActiveWitness D L p (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k at hh
  rw [initial_rootPhaseWitness_corrected_point_mean cs ε M deadline start p hn hB e Γ D L k] at hh
  apply (le_div_iff₀ (pow_pos (sub_pos.mpr hε) _)).mpr
  simpa only [mul_comm] using hh

theorem initial_rootPhasePoint_active_coarse_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (D L : Finset (Grid n)) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) :
    (∫ω,activeWitness D p (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k)≤
      (∏q∈D,accumulatedPhaseCoarsePrice cs start e k q)/(1-ε)^L.card.choose 2 := by
  apply (initial_rootPhasePoint_active_mean_bound cs ε M deadline start p hn hB e Γ D L hε0 hε k).trans
  exact div_le_div_of_nonneg_right (initial_rootPhase_coarse_product cs ε M deadline start p Γ e {p} D L hn hB hΓ hK
    (Finset.disjoint_singleton_left.mpr hpD) (by simpa only [Finset.singleton_union] using hDL) k)
    (pow_nonneg (sub_nonneg.mpr hε.le) _)

theorem initial_rootPhasePoint_active_unit_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (D L : Finset (Grid n)) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (hsep : SeparatedLabels Γ (insert p D))
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) :
    (∫ω,activeWitness D p (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k)≤
      (∏q∈D,accumulatedPhaseUnitPrice cs start e k q)/(1-ε)^L.card.choose 2 := by
  apply (initial_rootPhasePoint_active_mean_bound cs ε M deadline start p hn hB e Γ D L hε0 hε k).trans
  exact div_le_div_of_nonneg_right (initial_rootPhase_unit_product cs ε M deadline start p Γ e {p} D L hn hB hΓ hK
    (Finset.disjoint_singleton_left.mpr hpD) (by simpa only [Finset.singleton_union] using hDL)
    (by simpa only [Finset.singleton_union] using hsep) k) (pow_nonneg (sub_nonneg.mpr hε.le) _)

theorem initial_rootPhasePoint_witness_coarse_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (D L : Finset (Grid n)) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status=.active)
    (hpD : p∉D) (hDL : insert p D⊆L) (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) :
    (∫ω,witnessProduct D (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k)≤
      (∏q∈D,accumulatedPhaseCoarsePrice cs start e k q)/(1-ε)^L.card.choose 2 := by
  rw [initial_rootPhasePoint_witness_mean_eq cs ε M deadline start p hn hB e hp D k]
  exact initial_rootPhasePoint_active_coarse_product cs ε M deadline start p hn hB e Γ D L hΓ hK hpD hDL hε0 hε k

theorem initial_rootPhasePoint_witness_unit_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (D L : Finset (Grid n)) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status=.active)
    (hpD : p∉D) (hDL : insert p D⊆L) (hsep : SeparatedLabels Γ (insert p D))
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) :
    (∫ω,witnessProduct D (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k)≤
      (∏q∈D,accumulatedPhaseUnitPrice cs start e k q)/(1-ε)^L.card.choose 2 := by
  rw [initial_rootPhasePoint_witness_mean_eq cs ε M deadline start p hn hB e hp D k]
  exact initial_rootPhasePoint_active_unit_product cs ε M deadline start p hn hB e Γ D L hΓ hK hpD hDL hsep hε0 hε k

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_active_mean_bound
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_witness_coarse_product
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_witness_unit_product
