import NoThreeLine.RemainingCost
import NoThreeLine.GridLineCard
import NoThreeLine.GridLines

/-! Future mask cost along the actual finite board line. Rates come from
the existing finite Schedule, and the root and witness are both removed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines GridLines

def witnessLeaves {n : ℕ} (p z : Grid n) : Finset (Grid n) :=
  ((lineThrough p z).erase p).erase z

theorem witnessLeaves_subset {n : ℕ} (p z : Grid n) : witnessLeaves p z⊆lineThrough p z :=
  (Finset.erase_subset _ _).trans (Finset.erase_subset _ _)

theorem witnessLeaves_card_le {n : ℕ} (p z : Grid n) :
    (witnessLeaves p z).card≤(lineThrough p z).card := Finset.card_le_card (witnessLeaves_subset p z)

theorem lineThrough_card_le_two_mul {n : ℕ} (p z : Grid n) (hz : z≠p) :
    ((lineThrough p z).card:ℝ)≤2*(n:ℝ) := by
  classical
  obtain ⟨d,hd,hline⟩ := FiniteDirections.grid_point_direction p z hz
  have he : lineThrough p z=gridLinePoints n (gridEmbed p) d.2 := by
    ext q
    rw [mem_lineThrough,mem_gridLinePoints]
    exact (hline q).symm
  rw [he]
  have hh : (1:ℝ)≤d.1 := by exact_mod_cast (Finset.mem_Ico.mp (Finset.mem_sigma.mp hd).1).1
  exact (GridLineCard.directionIndex_gridLine_card_le n (gridEmbed p) d hd).trans
    (div_le_self (mul_nonneg (by norm_num) (Nat.cast_nonneg n)) hh)

def lineMaskRate {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (p z : Grid n) (t : ℝ) : ℝ := ∑q∈witnessLeaves p z,s.rate (fun j=>mask j q) t

theorem lineMaskRate_integrable {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (p z : Grid n) : Integrable (lineMaskRate s mask p z) :=
  integrable_finsetSum _ (fun q _=>FinitePhase.rate_integrable Finset.univ s.lo s.hi (fun j=>mask j q))

theorem lineMaskRate_bounds {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (p z : Grid n) (t : ℝ) :
    0≤lineMaskRate s mask p z t ∧ lineMaskRate s mask p z t≤(lineThrough p z).card := by
  constructor
  · exact Finset.sum_nonneg (fun q _=>(s.rate_bounds _ (fun j=>hm j q) t).1)
  · calc
      _ ≤ ∑q∈witnessLeaves p z,(1:ℝ) :=
        Finset.sum_le_sum (fun q _=>(s.rate_bounds _ (fun j=>hm j q) t).2)
      _ = (witnessLeaves p z).card := by simp
      _ ≤ (lineThrough p z).card := by exact_mod_cast witnessLeaves_card_le p z

def lineFutureCost {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (p z : Grid n) (u : ℝ) : ℝ := remainingIntegral (lineMaskRate s mask p z) s.total u/n

def lineCostWeight {J n : ℕ} (s : FinitePhase.Schedule J) (p z : Grid n) : ℝ :=
  s.total*(lineThrough p z).card/n

theorem lineCostWeight_nonneg {J n : ℕ} (s : FinitePhase.Schedule J) (p z : Grid n) :
    0≤lineCostWeight s p z :=
  div_nonneg (mul_nonneg s.total_nonneg (Nat.cast_nonneg _)) (Nat.cast_nonneg n)

theorem lineCostWeight_le {J n : ℕ} (s : FinitePhase.Schedule J) (p z : Grid n) (hz : z≠p) :
    lineCostWeight s p z≤2*s.total := by
  have hn : (0:ℝ)<n := by exact_mod_cast (Nat.zero_le p.1.val).trans_lt p.1.isLt
  apply (div_le_iff₀ hn).mpr
  have hh := mul_le_mul_of_nonneg_left (lineThrough_card_le_two_mul p z hz) s.total_nonneg
  nlinarith

theorem lineFutureCost_bounds {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (p z : Grid n) (u : ℝ) :
    0≤lineFutureCost s mask p z u ∧ lineFutureCost s mask p z u≤lineCostWeight s p z := by
  have hh := remainingIntegral_bounds (lineMaskRate s mask p z) (lineMaskRate_integrable s mask p z)
    s.total (lineThrough p z).card u s.total_nonneg (Nat.cast_nonneg _)
    (lineMaskRate_bounds s mask hm p z)
  exact ⟨div_nonneg hh.1 (Nat.cast_nonneg n),div_le_div_of_nonneg_right hh.2 (Nat.cast_nonneg n)⟩

theorem lineFutureCost_continuous {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (p z : Grid n) : Continuous (lineFutureCost s mask p z) :=
  (remainingIntegral_continuous _ (lineMaskRate_integrable s mask p z) s.total).div_const n

theorem lineFutureCost_eq {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (p z : Grid n) (u : ℝ) (hu : u∈Icc (0:ℝ) s.total) :
    lineFutureCost s mask p z u=(∫t in u..s.total,∑q∈witnessLeaves p z,s.rate (fun j=>mask j q) t)/n := by
  rw [lineFutureCost,remainingIntegral_eq _ _ _ hu]
  rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineThrough_card_le_two_mul
#print axioms NoThreeLine.BirthWitness.lineFutureCost_bounds
