import NoThreeLine.VirtualFixedObservable

/-! The state-dependent virtual tuple sum is bounded by a finite sum over
fixed geometric anchors. The factor a^m counts repetition codes, and B is
charged only m-a times. Every summand retains its active/selected event. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments BirthWitness

def countTuples {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (m a : ℕ) : Finset (Fin m → leaves s Γ L q) :=
  Finset.univ.filter (fun f => (leafLabels f).card = a)

theorem tuplePairs_injective {n m : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) :
    Function.Injective (tuplePairs (m := m) (s := s) (Γ := Γ) (L := L) (q := q)) := by
  intro f g h
  funext i
  exact Subtype.ext (congrArg Sigma.fst (congrFun h i))

attribute [local irreducible] tuplePairs fixedCover rawProduct rawLeaves rawWitnesses

theorem countTuples_weight_le_fixed {n m a : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (B : ℝ) (he : e.Valid B)
    (hqL : q ∉ L.val) (hq : (e.process.accounts q).status = .active) :
    (∑ f ∈ countTuples e.process Γ L q m a,
      ∏ y ∈ leafLabels f, (e.process.accounts y).weight) ≤
      (a : ℝ)^m * ∑ g ∈ anchors L q a, anchorProduct g e := by
  have hsub : (countTuples e.process Γ L q m a).image tuplePairs ⊆ fixedCover L q m a := by
    intro g hg
    obtain ⟨f, hf, rfl⟩ := Finset.mem_image.mp hg
    simpa only [(Finset.mem_filter.mp hf).2] using tuple_mem_fixedCover f he.1 hqL hq
  apply le_trans ?_ (sum_fixedCover_product_le L q e B he)
  calc
    _ = ∑ f ∈ countTuples e.process Γ L q m a, rawProduct q (tuplePairs f) e :=
      Finset.sum_congr rfl (fun f _ => (rawProduct_tuplePairs f hqL hq).symm)
    _ = ∑ f ∈ (countTuples e.process Γ L q m a).image tuplePairs, rawProduct q f e :=
      (Finset.sum_image (s := countTuples e.process Γ L q m a)
        (f := fun f => rawProduct q f e)
        (fun f _ g _ h => tuplePairs_injective e.process Γ L q h)).symm
    _ ≤ _ := Finset.sum_le_sum_of_subset_of_nonneg hsub
      (fun f _ _ => rawProduct_nonneg q f e B he)

theorem repeatSum_group_count {n m : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (w : Grid n → ℝ) (B : ℝ) (hm : 0 < m) :
    repeatSum (m := m) s Γ L q w B =
      ∑ a ∈ Finset.Icc 1 m, B^(m-a) *
        ∑ f ∈ countTuples s Γ L q m a, ∏ y ∈ leafLabels f, w y := by
  rw [repeatSum_eq_leafLabels]
  rw [← Finset.sum_fiberwise_of_maps_to
    (fun f (_hf : f ∈ (Finset.univ : Finset (Fin m → leaves s Γ L q))) =>
      (Finset.mem_Icc.mpr (distinct_leaf_count_bounds f hm) : (leafLabels f).card ∈ Finset.Icc 1 m))
    (fun f => B^(m-(leafLabels f).card) * ∏ y ∈ leafLabels f, w y)]
  apply Finset.sum_congr rfl
  intro a _
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro f hf
  rw [(Finset.mem_filter.mp hf).2]

def fixedMassBound {n : ℕ} (L : LineIndex n) (q : Grid n) (m : ℕ) (B : ℝ)
    (e : ExtendedState n) : ℝ :=
  2^m * ∑ a ∈ Finset.Icc 1 m, B^(m-a) * (a : ℝ)^m *
    ∑ g ∈ anchors L q a, anchorProduct g e

theorem fixedMassBound_nonneg {n : ℕ} (L : LineIndex n) (q : Grid n) (m : ℕ) (B : ℝ)
    (hB : 0 ≤ B) (e : ExtendedState n) (he : e.Valid B) : 0 ≤ fixedMassBound L q m B e := by
  apply mul_nonneg (by positivity)
  apply Finset.sum_nonneg
  intro a _
  apply mul_nonneg (mul_nonneg (pow_nonneg hB _) (by positivity))
  exact Finset.sum_nonneg (fun g _ => rawProduct_nonneg q _ e B he)

theorem virtualMass_pow_le_fixedMassBound {n m : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (L : LineIndex n) (q : Grid n) (B : ℝ)
    (hB : 0 < B) (hm : 0 < m) (he : e.Valid B) :
    virtualMass e.process Γ e.coordinates L q ^ m ≤ fixedMassBound L q m B e := by
  by_cases h : enabled e.process Γ L q
  · have hbase := virtualMass_pow_le_repeatSum_actual e Γ L q B hB hm he
    rw [if_pos h, repeatSum_group_count e.process Γ L q _ B hm] at hbase
    apply hbase.trans
    apply mul_le_mul_of_nonneg_left _ (by positivity)
    apply Finset.sum_le_sum
    intro a _
    simpa only [mul_assoc] using mul_le_mul_of_nonneg_left
      (countTuples_weight_le_fixed (m := m) (a := a) e Γ L q B he h.2.2.2.1 h.2.2.2.2)
      (pow_nonneg hB.le (m-a))
  · rw [virtualMass_eq_zero_of_disabled e.process Γ e.coordinates L q h, zero_pow (by omega)]
    exact fixedMassBound_nonneg L q m B hB.le e he

theorem fixedMassBound_measurable {n : ℕ} (L : LineIndex n) (q : Grid n) (m : ℕ) (B : ℝ) :
    Measurable (fixedMassBound L q m B) := by
  apply Measurable.const_mul
  apply Finset.measurable_sum
  intro a _
  apply Measurable.const_mul
  exact Finset.measurable_sum _ (fun g _ => rawProduct_measurable q _)

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.repeatSum_group_count
#print axioms NoThreeLine.VirtualWitness.virtualMass_pow_le_fixedMassBound
#print axioms NoThreeLine.VirtualWitness.fixedMassBound_measurable
