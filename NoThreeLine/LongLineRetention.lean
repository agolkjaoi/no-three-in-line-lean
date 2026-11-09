import NoThreeLine.FutureLineCost
import NoThreeLine.WitnessProductExpansion

/-! The actual long, unspecified root-line witness proxy. Its normalized
future cost is a deterministic birth retention with no division by an input
density, including zero-length time schedules and zero future mask cost. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open GridLines

def longWitnessEligible {n : ℕ} (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) (z : Grid n) : Prop :=
  z≠p ∧ ¬specifiedPair Γ p z ∧ threshold≤((lineThrough p z).card:ℝ)

instance {n : ℕ} (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) (z : Grid n) :
    Decidable (longWitnessEligible Γ p threshold z) := Classical.propDecidable _

def longWitnessWeight {J n : ℕ} (s : FinitePhase.Schedule J) (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (threshold : ℝ) (z : Grid n) : ℝ :=
  if longWitnessEligible Γ p threshold z then lineCostWeight s p z else 0

def longWitnessCost {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) (z : Grid n) (u : ℝ) : ℝ :=
  if longWitnessEligible Γ p threshold z then lineFutureCost s mask p z u else 0

theorem longWitnessWeight_bounds {J n : ℕ} (s : FinitePhase.Schedule J) (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (threshold : ℝ) (z : Grid n) :
    0≤longWitnessWeight s Γ p threshold z ∧ longWitnessWeight s Γ p threshold z≤2*s.total := by
  unfold longWitnessWeight
  split_ifs with hz
  · exact ⟨lineCostWeight_nonneg s p z,lineCostWeight_le s p z hz.1⟩
  · exact ⟨le_rfl,mul_nonneg (by norm_num) s.total_nonneg⟩

theorem longWitnessWeight_root_separated {J n : ℕ} (s : FinitePhase.Schedule J)
    (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) (z : Grid n)
    (hw : longWitnessWeight s Γ p threshold z≠0) : ¬specifiedPair Γ p z := by
  by_cases hz : longWitnessEligible Γ p threshold z
  · exact hz.2.1
  · exact (hw (if_neg hz)).elim

theorem longWitnessCost_bounds {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ)) (p : Grid n)
    (threshold : ℝ) (z : Grid n) (u : ℝ) :
    0≤longWitnessCost s mask Γ p threshold z u ∧
      longWitnessCost s mask Γ p threshold z u≤longWitnessWeight s Γ p threshold z := by
  unfold longWitnessCost longWitnessWeight
  split_ifs
  · exact lineFutureCost_bounds s mask hm p z u
  · exact ⟨le_rfl,le_rfl⟩

theorem longWitnessCost_continuous {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) (z : Grid n) :
    Continuous (longWitnessCost s mask Γ p threshold z) := by
  change Continuous (fun u=>if longWitnessEligible Γ p threshold z then lineFutureCost s mask p z u else 0)
  by_cases hz : longWitnessEligible Γ p threshold z
  · simp only [if_pos hz]
    exact lineFutureCost_continuous s mask p z
  · simp only [if_neg hz]
    exact continuous_const

def longWitnessRetention {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (threshold : ℝ) : Retention n :=
  normalizedCostRetention (longWitnessCost s mask Γ p threshold) (longWitnessWeight s Γ p threshold)
    (fun z=>(longWitnessCost_continuous s mask Γ p threshold z).measurable)
    (longWitnessCost_bounds s mask hm Γ p threshold)

theorem longWitnessRetention_weight_value {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (threshold : ℝ) (z : Grid n) (u : ℝ) :
    longWitnessWeight s Γ p threshold z*(longWitnessRetention s mask hm Γ p threshold).value z u=
      longWitnessCost s mask Γ p threshold z u :=
  normalizedCostRetention_weight_value _ _ _ _ z u

theorem longWitnessCost_eq {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) (z : Grid n) (u : ℝ)
    (hz : longWitnessEligible Γ p threshold z) (hu : u∈Icc (0:ℝ) s.total) :
    longWitnessCost s mask Γ p threshold z u=
      (∫t in u..s.total,∑q∈witnessLeaves p z,s.rate (fun j=>mask j q) t)/n := by
  rw [longWitnessCost,if_pos hz,lineFutureCost_eq s mask p z u hu]

theorem longWitnessSum_eq_recorded_cost {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (threshold : ℝ) (a : AugmentedState n) (records : BirthRecords n) :
    witnessSum (longWitnessWeight s Γ p threshold)
      ⟨a,recordedValue (longWitnessRetention s mask hm Γ p threshold) records⟩=
      ∑z : Grid n,if (records z).1=true then longWitnessCost s mask Γ p threshold z (records z).2 else 0 := by
  apply Finset.sum_congr rfl
  intro z _
  change longWitnessWeight s Γ p threshold z*recordedValue
    (longWitnessRetention s mask hm Γ p threshold) records z=_
  unfold recordedValue
  split_ifs
  · exact longWitnessRetention_weight_value s mask hm Γ p threshold z (records z).2
  · exact mul_zero _

theorem longWitnessPrice_identity {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (threshold : ℝ) (z : Grid n) :
    longWitnessWeight s Γ p threshold z*
      (∫u in (0:ℝ)..s.total,s.rate (fun j=>mask j z) u*
        (longWitnessRetention s mask hm Γ p threshold).value z u/n)=
      ∫u in (0:ℝ)..s.total,s.rate (fun j=>mask j z) u*longWitnessCost s mask Γ p threshold z u/n := by
  rw [←intervalIntegral.integral_const_mul]
  apply intervalIntegral.integral_congr
  intro u _
  have hh := longWitnessRetention_weight_value s mask hm Γ p threshold z u
  calc
    _ = s.rate (fun j=>mask j z) u*(longWitnessWeight s Γ p threshold z*
        (longWitnessRetention s mask hm Γ p threshold).value z u)/n := by ring
    _ = _ := by rw [hh]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.longWitnessWeight_bounds
#print axioms NoThreeLine.BirthWitness.longWitnessSum_eq_recorded_cost
#print axioms NoThreeLine.BirthWitness.longWitnessPrice_identity
