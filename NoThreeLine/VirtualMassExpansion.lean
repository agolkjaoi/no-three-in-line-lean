import NoThreeLine.VirtualWitnessGeometry
import NoThreeLine.PhysicalLeafRepetition

/-! A finite expansion of the actual virtual mass, with the actual enable
predicate retained.  Repetitions cost B only for repeated physical leaves.
These are pathwise inequalities, not moment or first-hit estimates. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments

def enabled {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) : Prop :=
  s.stopped = false ∧ specified Γ L ∧ occupancy s L ≤ 1 ∧ q ∉ L.val ∧
    (s.accounts q).status = .active

instance {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) : Decidable (enabled s Γ L q) := Classical.propDecidable _

theorem virtualMass_eq_sum {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (z : Coordinates n) (L : LineIndex n) (q : Grid n) (h : enabled s Γ L q) :
    virtualMass s Γ z L q = ∑ y : leaves s Γ L q, normalizedLineWeight s z L y.val := by
  rw [Finset.sum_coe_sort]
  unfold enabled at h
  rw [virtualMass, if_pos h]
  simp only [leaves, Finset.sum_filter]

theorem virtualMass_eq_zero_of_disabled {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (z : Coordinates n) (L : LineIndex n) (q : Grid n) (h : ¬enabled s Γ L q) :
    virtualMass s Γ z L q = 0 := if_neg h

theorem normalizedLineWeight_le_two_mul {n : ℕ} (s : ProcessState n) (z : Coordinates n)
    (L : LineIndex n) (y : Grid n) (hw : 0 ≤ z.1 y)
    (hk : 0 ≤ z.2.1 L ∧ z.2.1 L ≤ 2) (hN : occupancy s L ≤ 1) :
    normalizedLineWeight s z L y ≤ 2 * z.1 y := by
  have hNr : (occupancy s L : ℝ) ≤ 1 := by exact_mod_cast hN
  unfold normalizedLineWeight
  apply (div_le_iff₀ (by linarith : 0 < 2 - (occupancy s L : ℝ))).mpr
  nlinarith [mul_nonneg hw hk.1, mul_nonneg hw (sub_nonneg.mpr hNr)]

def repeatSum {n m : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (w : Grid n → ℝ) (B : ℝ) : ℝ :=
  ∑ f : Fin m → leaves s Γ L q,
    B ^ (m - (tupleLabels (fun i : Fin m => (f i).val)).card) *
      ∏ y ∈ tupleLabels (fun i : Fin m => (f i).val), w y

theorem weight_sum_pow_le_repeatSum {n m : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (w : Grid n → ℝ) (B : ℝ)
    (hB : 0 < B) (hw : ∀ y, 0 ≤ w y ∧ w y ≤ B) :
    (∑ y : leaves s Γ L q, w y.val) ^ m ≤ repeatSum (m := m) s Γ L q w B := by
  rw [Fintype.sum_pow]
  exact Finset.sum_le_sum (fun f _ =>
    prod_tuple_le_repeat_cap (fun i : Fin m => (f i).val) w B hB hw)

theorem virtualMass_pow_le_repeatSum {n m : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (z : Coordinates n) (L : LineIndex n) (q : Grid n)
    (B : ℝ) (hB : 0 < B) (hm : 0 < m) (hz : CoordinateBounds B z) :
    virtualMass s Γ z L q ^ m ≤
      if enabled s Γ L q then 2 ^ m * repeatSum (m := m) s Γ L q z.1 B else 0 := by
  by_cases h : enabled s Γ L q
  · rw [if_pos h]
    have h0 := virtualMass_nonneg s Γ z L q (fun y => (hz.1 y).1) (hz.2.1 L).2
    have hle : virtualMass s Γ z L q ≤ 2 * ∑ y : leaves s Γ L q, z.1 y.val := by
      rw [virtualMass_eq_sum s Γ z L q h, Finset.mul_sum]
      exact Finset.sum_le_sum (fun y _ => normalizedLineWeight_le_two_mul s z L y.val
        (hz.1 y.val).1 (hz.2.1 L) h.2.2.1)
    calc
      _ ≤ (2 * ∑ y : leaves s Γ L q, z.1 y.val) ^ m := pow_le_pow_left₀ h0 hle m
      _ = 2 ^ m * (∑ y : leaves s Γ L q, z.1 y.val) ^ m := mul_pow _ _ _
      _ ≤ _ := mul_le_mul_of_nonneg_left
        (weight_sum_pow_le_repeatSum s Γ L q z.1 B hB hz.1) (by positivity)
  · rw [if_neg h, virtualMass_eq_zero_of_disabled s Γ z L q h, zero_pow (by omega)]

theorem virtualMass_pow_le_repeatSum_actual {n m : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (L : LineIndex n) (q : Grid n)
    (B : ℝ) (hB : 0 < B) (hm : 0 < m) (he : e.Valid B) :
    virtualMass e.process Γ e.coordinates L q ^ m ≤
      if enabled e.process Γ L q then
        2 ^ m * repeatSum (m := m) e.process Γ L q
          (fun y => (e.process.accounts y).weight) B else 0 :=
  virtualMass_pow_le_repeatSum e.process Γ e.coordinates L q B hB hm he.2.1

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.normalizedLineWeight_le_two_mul
#print axioms NoThreeLine.VirtualWitness.weight_sum_pow_le_repeatSum
#print axioms NoThreeLine.VirtualWitness.virtualMass_pow_le_repeatSum_actual
