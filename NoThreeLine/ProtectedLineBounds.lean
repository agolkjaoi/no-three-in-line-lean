import NoThreeLine.ProtectedLineFlow

/-! Pointwise quantitative bounds for the actual live protected credit
and its positive external-birth drift, before constructing the protected law. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines LineDrift

theorem specifiedLineWeight_formula {n : ℕ} (e : ExtendedState n) (L : LineIndex n) (p : Grid n) :
    specifiedLineWeight e L p=(e.process.accounts p).weight*(2-e.clocks L)/(2-(occupancy e.process L:ℝ)) := by
  unfold specifiedLineWeight protection
  simp only [div_eq_mul_inv,mul_inv_rev,inv_inv]
  ring

theorem specifiedLineWeight_bounds {n : ℕ} (e : ExtendedState n) (L : LineIndex n) (p : Grid n)
    (B K : ℝ) (he : e.Valid B) (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2) :
    0≤specifiedLineWeight e L p ∧ specifiedLineWeight e L p≤2*B := by
  have hw := he.2.1.1 p
  have hk0 := (he.2.1.2.1 L).1
  simp only [ExtendedState.coordinates] at hw hk0
  have hNr : (occupancy e.process L:ℝ)≤1 := by exact_mod_cast hN
  have hden : 0<2-(occupancy e.process L:ℝ) := by linarith
  have hk2 : 0≤2-e.clocks L := by linarith
  have hB0 : 0≤B := hw.1.trans hw.2
  rw [specifiedLineWeight_formula]
  refine ⟨div_nonneg (mul_nonneg hw.1 hk2) hden.le,?_⟩
  apply (div_le_iff₀ hden).mpr
  have hm := mul_nonneg hw.1 hk0
  have hn := mul_nonneg hB0 (show 0≤1-(occupancy e.process L:ℝ) by linarith)
  nlinarith

theorem one_sub_b_bounds (N : ℕ) (hN : N≤1) : 0≤1-b N ∧ 1-b N≤(1/2:ℝ) := by
  interval_cases N <;> norm_num [b]

def protectedLinePositiveDrift {n : ℕ} (e : ExtendedState n) (mask : Grid n→ℝ)
    (L : LineIndex n) (p : Grid n) : ℝ :=
  e.process.birthRate mask p*(1-b (occupancy e.process L))*specifiedLineWeight e L p

theorem protectedLinePositiveDrift_bounds {n : ℕ} (e : ExtendedState n) (mask : Grid n→ℝ)
    (L : LineIndex n) (p : Grid n) (B K : ℝ) (he : e.Valid B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) (hN : occupancy e.process L≤1)
    (hclock : e.clocks L≤K) (hK : K<2) :
    0≤protectedLinePositiveDrift e mask L p ∧
      protectedLinePositiveDrift e mask L p≤(B/n)/2*specifiedLineWeight e L p := by
  have hc := specifiedLineWeight_bounds e L p B K he hN hclock hK
  have hb := one_sub_b_bounds _ hN
  have hr0 := e.process.birthRate_nonneg mask (fun q=>(hm q).1) he.1 p
  have hrB : e.process.birthRate mask p≤B/n := by
    unfold ProcessState.birthRate
    split_ifs
    · exact div_le_div_of_nonneg_right
        ((mul_le_of_le_one_left (he.2.1.1 p).1 (hm p).2).trans (he.2.1.1 p).2) (Nat.cast_nonneg n)
    · exact div_nonneg ((he.2.1.1 p).1.trans (he.2.1.1 p).2) (Nat.cast_nonneg n)
  unfold protectedLinePositiveDrift
  refine ⟨mul_nonneg (mul_nonneg hr0 hb.1) hc.1,?_⟩
  have hh := mul_le_mul hrB hb.2 hb.1 (div_nonneg ((he.2.1.1 p).1.trans (he.2.1.1 p).2) (Nat.cast_nonneg n))
  have hh' := mul_le_mul_of_nonneg_right hh hc.1
  simpa only [mul_one_div] using hh'

theorem protectedLinePositiveDrift_sum_le {n : ℕ} (e : ExtendedState n) (mask : Grid n→ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (B K : ℝ) (he : e.Valid B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) (hN : occupancy e.process L≤1)
    (hclock : e.clocks L≤K) (hK : K<2) :
    (∑p∈E,protectedLinePositiveDrift e mask L p)≤(B/n)/2*(∑p∈E,specifiedLineWeight e L p) := by
  rw [Finset.mul_sum]
  exact Finset.sum_le_sum (fun p _=>(protectedLinePositiveDrift_bounds e mask L p B K he hm hN hclock hK).2)

end NoThreeLine

#print axioms NoThreeLine.specifiedLineWeight_bounds
#print axioms NoThreeLine.protectedLinePositiveDrift_bounds
#print axioms NoThreeLine.protectedLinePositiveDrift_sum_le
