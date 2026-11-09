import NoThreeLine.ScheduledCutPhysicalCoarse

/-! A deterministic point-price cap is derived from the actual phase
coefficients and durations. It is not assumed as a probability hypothesis. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def coarsePhasePriceRate {n : ℕ} (cfg : FlowConfig n) : ℝ :=
  (1/n)*max 1 (AuxiliaryODE.protection 1 cfg.K)^cfg.directions.card

theorem coarsePhasePriceRate_nonneg {n : ℕ} (cfg : FlowConfig n) :
    0≤coarsePhasePriceRate cfg :=
  mul_nonneg (div_nonneg zero_le_one (Nat.cast_nonneg _))
    (pow_nonneg (le_max_of_le_left zero_le_one) _)

def coarseCutPriceCap {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (k : ℕ) (t : ℝ) : ℝ :=
  (∑j∈Finset.range k,(cs j).horizon*coarsePhasePriceRate (cs j).config)+
    t*coarsePhasePriceRate (cs k).config

theorem coarseCutPriceCap_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (k : ℕ) (t : ℝ) (ht : 0≤t) : 0≤coarseCutPriceCap cs k t :=
  add_nonneg (Finset.sum_nonneg (fun j _=>mul_nonneg (cs j).horizon.coe_nonneg
    (coarsePhasePriceRate_nonneg _))) (mul_nonneg ht (coarsePhasePriceRate_nonneg _))

theorem integral_phaseCoarseCoefficient_le {n : ℕ} (cfg : FlowConfig n) (start : ℝ)
    (e : Retention n) (hm : ∀q,cfg.mask q≤1) (q : Grid n) (h : ℝ) (hh : 0≤h) :
    (∫u in (0:ℝ)..h,phaseCoarseCoefficient cfg start e q u)≤h*coarsePhasePriceRate cfg := by
  have hi := intervalIntegral.integral_mono_on hh
    (phaseCoarseCoefficient_intervalIntegrable cfg start e hm q 0 h)
    (intervalIntegrable_const : IntervalIntegrable (fun _ : ℝ=>coarsePhasePriceRate cfg) volume 0 h)
    (fun u _=>(phaseCoarseCoefficient_bounds cfg start e hm q u).2)
  simpa only [intervalIntegral.integral_const,sub_zero,smul_eq_mul] using hi

theorem cutSelectedCoarsePrice_le_cap {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start : ℝ) (k : ℕ) (t : ℝ) (ht : 0≤t) (q : Grid n) :
    cutSelectedCoarsePrice cs start k t q≤coarseCutPriceCap cs k t := by
  unfold cutSelectedCoarsePrice accumulatedPhaseCoarsePrice coarseCutPriceCap
  apply add_le_add
  · exact Finset.sum_le_sum (fun j _=>integral_phaseCoarseCoefficient_le (cs j).config
      (phaseEndpoint cs start j) (unitBirthRetention n) (cs j).mask_le_one q _ (cs j).horizon.coe_nonneg)
  · exact integral_phaseCoarseCoefficient_le (cs k).config (phaseEndpoint cs start k)
      (unitBirthRetention n) (cs k).mask_le_one q t ht

theorem coarseCutPriceCap_eq_const {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (Γ : Finset PrimitiveLines.ZPoint) (K start : ℝ) (k : ℕ) (t : ℝ)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K=K) :
    coarseCutPriceCap cs k t=(phaseEndpoint cs start k-start+t)/n*
      max 1 (AuxiliaryODE.protection 1 K)^Γ.card := by
  have he (j : ℕ) : coarsePhasePriceRate (cs j).config=
      (1/n)*max 1 (AuxiliaryODE.protection 1 K)^Γ.card := by
    change (1/n)*max 1 (AuxiliaryODE.protection 1 (cs j).K)^(cs j).directions.card=_
    rw [hK j,hΓ j]
  unfold coarseCutPriceCap
  simp_rw [he]
  rw [←Finset.sum_mul]
  unfold phaseEndpoint
  push_cast
  ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cutSelectedCoarsePrice_le_cap
#print axioms NoThreeLine.BirthWitness.coarseCutPriceCap_eq_const
