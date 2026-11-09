import NoThreeLine.RootPhasePointProduct
import NoThreeLine.RootWeightedMoment

/-! The actual canonical full-phase snapshot, all-label product estimates
and its finite weighted power expansion. Repeated labels are kept by their
image set; no fresh initial-state assumption is introduced at phase N. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines FiniteWitnessMoments

def initialRootPhaseWitness {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (N : ℕ) : BoardClockPath n→WitnessState n :=
  rootPhaseWitness cs ε M deadline start p hn e (initialGoodPhaseRootObservation B hB p deadline start) N

theorem initialRootPhaseWitness_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (N : ℕ) :
    Measurable (initialRootPhaseWitness cs ε M deadline start p hn hB e N) :=
  rootPhaseWitness_measurable cs ε M deadline start p hn e _ N

theorem initialRootPhaseWitness_valid {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (N : ℕ) (ω : BoardClockPath n) : (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω).Valid B :=
  rootPhaseWitness_valid cs ε M deadline start p hn e _ N ω

theorem initial_rootPhasePoint_power_mean_eq {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status=.active)
    (w : Grid n→ℝ) (m N : ℕ) :
    (∫ω,witnessSum w (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)^m
      ∂phasePointMeasure cs ε M deadline start hn hB p N)=
      ∫ω,activeWitnessPower w m p (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)
        ∂phasePointMeasure cs ε M deadline start hn hB p N := by
  apply integral_congr_ae
  filter_upwards [initial_rootPhasePoint_active_ae cs ε M deadline start p hn hB e hp N] with ω hω
  simp only [activeWitnessPower,initialRootPhaseWitness,if_pos hω]

theorem initial_rootPhasePoint_all_labels_coarse_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (D : Finset (Grid n)) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (N : ℕ) :
    (∫ω,activeWitness D p (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)
      ∂phasePointMeasure cs ε M deadline start hn hB p N)≤
      (∏q∈D,accumulatedPhaseCoarsePrice cs start e N q)/(1-ε)^(insert p D).card.choose 2 := by
  by_cases hpD : p∈D
  · have he (ω : BoardClockPath n) : activeWitness D p
        (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)=0 :=
      activeWitness_zero_of_root_mem D p _ B (initialRootPhaseWitness_valid cs ε M deadline start p hn hB e N ω) hpD
    simp_rw [he]
    simp only [integral_zero]
    exact div_nonneg (Finset.prod_nonneg (fun q _=>accumulatedPhaseCoarsePrice_nonneg cs start e N q))
      (pow_nonneg (sub_nonneg.mpr hε.le) _)
  · exact initial_rootPhasePoint_active_coarse_product cs ε M deadline start p hn hB e Γ D (insert p D)
      hΓ hK hpD Finset.Subset.rfl hε0 hε N

theorem initial_rootPhasePoint_all_labels_unit_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (D : Finset (Grid n)) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hsep : SeparatedLabels Γ (insert p D)) (hε0 : 0≤ε) (hε : ε<1) (N : ℕ) :
    (∫ω,activeWitness D p (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)
      ∂phasePointMeasure cs ε M deadline start hn hB p N)≤
      (∏q∈D,accumulatedPhaseUnitPrice cs start e N q)/(1-ε)^(insert p D).card.choose 2 := by
  by_cases hpD : p∈D
  · have he (ω : BoardClockPath n) : activeWitness D p
        (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)=0 :=
      activeWitness_zero_of_root_mem D p _ B (initialRootPhaseWitness_valid cs ε M deadline start p hn hB e N ω) hpD
    simp_rw [he]
    simp only [integral_zero]
    exact div_nonneg (Finset.prod_nonneg (fun q _=>accumulatedPhaseUnitPrice_nonneg cs start e N q))
      (pow_nonneg (sub_nonneg.mpr hε.le) _)
  · exact initial_rootPhasePoint_active_unit_product cs ε M deadline start p hn hB e Γ D (insert p D)
      hΓ hK hpD Finset.Subset.rfl hsep hε0 hε N

theorem initial_rootPhasePoint_power_weighted_expansion {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (w : Grid n→ℝ) (m N : ℕ)
    (hw0 : ∀q,0≤w q) :
    (∫ω,activeWitnessPower w m p (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)
      ∂phasePointMeasure cs ε M deadline start hn hB p N)≤
      ∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*(∫ω,activeWitness (tupleLabels f) p
        (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω) ∂phasePointMeasure cs ε M deadline start hn hB p N) := by
  classical
  let Z := initialRootPhaseWitness cs ε M deadline start p hn hB e N
  let ν := phasePointMeasure cs ε M deadline start hn hB p N
  letI : IsProbabilityMeasure ν := phasePointMeasure_probability cs ε M deadline start hn hB p N
  have hZ : Measurable Z := initialRootPhaseWitness_measurable cs ε M deadline start p hn hB e N
  have hv (ω : BoardClockPath n) : (Z ω).Valid B := initialRootPhaseWitness_valid cs ε M deadline start p hn hB e N ω
  have hi : Integrable (fun ω=>activeWitnessPower w m p (Z ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((activeWitnessPower_measurable w m p).comp hZ) ((∑q,w q)^m)
      (fun ω=>activeWitnessPower_bounds w m p _ B (hv ω) hw0)
  have hj (f : Fin m→Grid n) : Integrable (fun ω=>(∏i : Fin m,w (f i))*activeWitness (tupleLabels f) p (Z ω)) ν := by
    apply Integrable.const_mul
    exact GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((activeWitness_measurable (tupleLabels f) p).comp hZ) 1 (fun ω=>activeWitness_bounds (tupleLabels f) p _ B (hv ω))
  calc
    _≤∫ω,(∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*activeWitness (tupleLabels f) p (Z ω)) ∂ν :=
      integral_mono hi (integrable_finsetSum _ (fun f _=>hj f))
        (fun ω=>activeWitnessPower_expansion_bound w m p _ B (hv ω) hw0)
    _=_ := by
      rw [integral_finsetSum _ (fun f _=>hj f)]
      simp_rw [integral_const_mul]
      rfl

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_power_mean_eq
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_all_labels_coarse_product
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_power_weighted_expansion
