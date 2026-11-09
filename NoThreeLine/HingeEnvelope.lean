import Mathlib.Tactic

/-! Endpoint interpolation and the negative-vertex hinge correction.
All estimates follow from the explicit hinge formulas. -/
set_option autoImplicit false
open Set
open scoped BigOperators
noncomputable section

namespace NoThreeLine

def endpointInterp (l h fL fH v : ℝ) : ℝ :=
  ((h-v)*fL + (v-l)*fH)/(h-l)

def hinge (κ k u v : ℝ) : ℝ := κ * max 0 (v-k) / u

def hingeTent (l h k u : ℝ) : ℝ :=
  max 0 (min ((k-l)/u) (min ((h-k)/u) ((h-l)/(4*u))))

def hingeGap (l h k v : ℝ) : ℝ :=
  endpointInterp l h (max 0 (l-k)) (max 0 (h-k)) v - max 0 (v-k)

theorem hingeGap_eq_zero_of_left (l h k v : ℝ) (hlh : l < h)
    (hv : v ∈ Icc l h) (hk : k ≤ l) : hingeGap l h k v = 0 := by
  have hl : 0 ≤ l-k := sub_nonneg.mpr hk
  have hh : 0 ≤ h-k := by linarith
  have hvk : 0 ≤ v-k := by linarith [hv.1]
  simp only [hingeGap, endpointInterp, max_eq_right hl, max_eq_right hh,
    max_eq_right hvk]
  field_simp [ne_of_gt (sub_pos.mpr hlh)]
  ring

theorem hingeGap_eq_zero_of_right (l h k v : ℝ)
    (hv : v ∈ Icc l h) (hk : h ≤ k) : hingeGap l h k v = 0 := by
  have hl : l-k ≤ 0 := by linarith [hv.1, hv.2]
  have hh : h-k ≤ 0 := sub_nonpos.mpr hk
  have hvk : v-k ≤ 0 := by linarith [hv.2]
  simp [hingeGap, endpointInterp, max_eq_left hl, max_eq_left hh,
    max_eq_left hvk]

theorem hingeGap_left_formula (l h k v : ℝ) (_hlh : l < h)
    (hk : k ∈ Icc l h) (hvk : v ≤ k) :
    hingeGap l h k v = (v-l)*(h-k)/(h-l) := by
  simp [hingeGap, endpointInterp, max_eq_left (sub_nonpos.mpr hk.1),
    max_eq_right (sub_nonneg.mpr hk.2), max_eq_left (sub_nonpos.mpr hvk)]

theorem hingeGap_right_formula (l h k v : ℝ) (hlh : l < h)
    (hk : k ∈ Icc l h) (hkv : k ≤ v) :
    hingeGap l h k v = (k-l)*(h-v)/(h-l) := by
  simp only [hingeGap, endpointInterp, max_eq_left (sub_nonpos.mpr hk.1),
    max_eq_right (sub_nonneg.mpr hk.2), max_eq_right (sub_nonneg.mpr hkv),
    mul_zero, zero_add]
  field_simp [ne_of_gt (sub_pos.mpr hlh)]
  ring

/-- Convexity gap and the exact value at the interior kink give a uniform peak. -/
theorem hingeGap_bounds_peak (l h k v : ℝ) (hlh : l < h) (hv : v ∈ Icc l h) :
    0 ≤ hingeGap l h k v ∧
      hingeGap l h k v ≤ max 0 ((k-l)*(h-k)/(h-l)) := by
  by_cases hkl : k ≤ l
  · rw [hingeGap_eq_zero_of_left l h k v hlh hv hkl]
    exact ⟨le_refl 0, le_max_left _ _⟩
  by_cases hhk : h ≤ k
  · rw [hingeGap_eq_zero_of_right l h k v hv hhk]
    exact ⟨le_refl 0, le_max_left _ _⟩
  have hk : k ∈ Icc l h := ⟨(lt_of_not_ge hkl).le, (lt_of_not_ge hhk).le⟩
  have hd : 0 < h-l := sub_pos.mpr hlh
  have hp : 0 ≤ (k-l)*(h-k)/(h-l) := by
    exact div_nonneg (mul_nonneg (sub_nonneg.mpr hk.1) (sub_nonneg.mpr hk.2)) hd.le
  rw [max_eq_right hp]
  by_cases hvk : v ≤ k
  · rw [hingeGap_left_formula l h k v hlh hk hvk]
    constructor
    · exact div_nonneg (mul_nonneg (sub_nonneg.mpr hv.1) (sub_nonneg.mpr hk.2)) hd.le
    · exact div_le_div_of_nonneg_right
        (mul_le_mul_of_nonneg_right (by linarith : v-l ≤ k-l) (sub_nonneg.mpr hk.2)) hd.le
  · rw [hingeGap_right_formula l h k v hlh hk (lt_of_not_ge hvk).le]
    constructor
    · exact div_nonneg (mul_nonneg (sub_nonneg.mpr hk.1) (sub_nonneg.mpr hv.2)) hd.le
    · exact div_le_div_of_nonneg_right
        (mul_le_mul_of_nonneg_left (by linarith : h-v ≤ h-k) (sub_nonneg.mpr hk.1)) hd.le

theorem hinge_peak_le_tent (l h k : ℝ) (hlh : l < h) :
    max 0 ((k-l)*(h-k)/(h-l)) ≤ max 0 (min (k-l) (min (h-k) ((h-l)/4))) := by
  have hd : 0 < h-l := sub_pos.mpr hlh
  by_cases hkl : k ≤ l
  · have hp : (k-l)*(h-k)/(h-l) ≤ 0 :=
      div_nonpos_of_nonpos_of_nonneg
        (mul_nonpos_of_nonpos_of_nonneg (sub_nonpos.mpr hkl) (by linarith)) hd.le
    rw [max_eq_left hp]
    exact le_max_left _ _
  by_cases hhk : h ≤ k
  · have hp : (k-l)*(h-k)/(h-l) ≤ 0 :=
      div_nonpos_of_nonpos_of_nonneg
        (mul_nonpos_of_nonneg_of_nonpos (by linarith) (sub_nonpos.mpr hhk)) hd.le
    rw [max_eq_left hp]
    exact le_max_left _ _
  apply max_le_max (le_refl 0)
  apply le_min
  · apply (div_le_iff₀ hd).2
    nlinarith [sq_nonneg (k-l)]
  · apply le_min
    · apply (div_le_iff₀ hd).2
      nlinarith [sq_nonneg (h-k)]
    · apply (div_le_iff₀ hd).2
      nlinarith [sq_nonneg ((k-l)-(h-k))]

theorem hingeGap_bounds (l h k v : ℝ) (hlh : l < h) (hv : v ∈ Icc l h) :
    0 ≤ hingeGap l h k v ∧
      hingeGap l h k v ≤ max 0 (min (k-l) (min (h-k) ((h-l)/4))) :=
  ⟨(hingeGap_bounds_peak l h k v hlh hv).1,
    (hingeGap_bounds_peak l h k v hlh hv).2.trans (hinge_peak_le_tent l h k hlh)⟩

theorem hingeTent_scaling (l h k u : ℝ) (hu : 0 < u) :
    hingeTent l h k u = max 0 (min (k-l) (min (h-k) ((h-l)/4))) / u := by
  unfold hingeTent
  rw [show (h-l)/(4*u) = ((h-l)/4)/u by ring,
    min_div_div_right hu.le, min_div_div_right hu.le]
  simpa only [zero_div] using
    max_div_div_right hu.le (0 : ℝ) (min (k-l) (min (h-k) ((h-l)/4)))

theorem hinge_defect_eq (l h k u v κ : ℝ) :
    hinge κ k u v - endpointInterp l h (hinge κ k u l) (hinge κ k u h) v =
      (-κ/u) * hingeGap l h k v := by
  unfold hinge hingeGap endpointInterp
  ring

/-- The C02 correction, for arbitrary signed vertex coefficients, all kink
locations, and every root in the closed intercept interval. -/
theorem hinge_defect_bound (l h k u v κ : ℝ) (hlh : l < h)
    (hv : v ∈ Icc l h) (hu : 0 < u) :
    hinge κ k u v - endpointInterp l h (hinge κ k u l) (hinge κ k u h) v ≤
      max 0 (-κ) * hingeTent l h k u := by
  rw [hinge_defect_eq]
  have hg := hingeGap_bounds l h k v hlh hv
  by_cases hκ : 0 ≤ κ
  · exact (mul_nonpos_of_nonpos_of_nonneg
      (div_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr hκ) hu.le) hg.1).trans
      (mul_nonneg (le_max_left _ _) (le_max_left _ _))
  · have hn : 0 ≤ -κ := by linarith
    rw [max_eq_right hn, hingeTent_scaling l h k u hu]
    calc
      (-κ/u) * hingeGap l h k v ≤
          (-κ/u) * max 0 (min (k-l) (min (h-k) ((h-l)/4))) :=
        mul_le_mul_of_nonneg_left hg.2 (div_nonneg hn hu.le)
      _ = _ := by ring

theorem hinge_le_interpolation_correction (l h k u v κ : ℝ) (hlh : l < h)
    (hv : v ∈ Icc l h) (hu : 0 < u) :
    hinge κ k u v ≤ endpointInterp l h (hinge κ k u l) (hinge κ k u h) v +
      max 0 (-κ) * hingeTent l h k u := by
  have hd := hinge_defect_bound l h k u v κ hlh hv hu
  linarith

theorem endpointInterp_le_max (l h fL fH v : ℝ) (hlh : l < h)
    (hv : v ∈ Icc l h) : endpointInterp l h fL fH v ≤ max fL fH := by
  unfold endpointInterp
  apply (div_le_iff₀ (sub_pos.mpr hlh)).2
  calc
    (h-v)*fL + (v-l)*fH ≤ (h-v)*max fL fH + (v-l)*max fL fH :=
      add_le_add
        (mul_le_mul_of_nonneg_left (le_max_left _ _) (sub_nonneg.mpr hv.2))
        (mul_le_mul_of_nonneg_left (le_max_right _ _) (sub_nonneg.mpr hv.1))
    _ = _ := by ring

theorem endpointInterp_sum {ι : Type*} (S : Finset ι) (fL fH : ι → ℝ)
    (l h v : ℝ) :
    endpointInterp l h (∑ i ∈ S, fL i) (∑ i ∈ S, fH i) v =
      ∑ i ∈ S, endpointInterp l h (fL i) (fH i) v := by
  unfold endpointInterp
  rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib, Finset.sum_div]

def hingeSum {ι : Type*} (S : Finset ι) (κ k : ι → ℝ) (u v : ℝ) : ℝ :=
  ∑ i ∈ S, hinge (κ i) (k i) u v

/-- Endpoint majorization of any finite hinge sum. No nonnegativity of the
coefficients or of the endpoint sums is required. -/
theorem hinge_sum_upper {ι : Type*} (S : Finset ι) (κ k : ι → ℝ)
    (l h u v : ℝ) (hlh : l < h) (hv : v ∈ Icc l h) (hu : 0 < u) :
    hingeSum S κ k u v ≤ max (hingeSum S κ k u l) (hingeSum S κ k u h) +
      ∑ i ∈ S, max 0 (-κ i) * hingeTent l h (k i) u := by
  calc
    hingeSum S κ k u v ≤
        endpointInterp l h (hingeSum S κ k u l) (hingeSum S κ k u h) v +
          ∑ i ∈ S, max 0 (-κ i) * hingeTent l h (k i) u := by
      unfold hingeSum
      rw [endpointInterp_sum]
      simpa only [Finset.sum_add_distrib] using Finset.sum_le_sum (s := S)
        (fun i _ => hinge_le_interpolation_correction l h (k i) u v (κ i) hlh hv hu)
    _ ≤ _ := add_le_add
      (endpointInterp_le_max l h (hingeSum S κ k u l) (hingeSum S κ k u h) v hlh hv)
      (le_refl _)

theorem negative_hinge_correction_eq {ι : Type*} (S : Finset ι) (κ k : ι → ℝ)
    (l h u : ℝ) :
    (∑ i ∈ S, max 0 (-κ i) * hingeTent l h (k i) u) =
      ∑ i ∈ S.filter (fun i => κ i < 0), (-κ i) * hingeTent l h (k i) u := by
  classical
  rw [Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro i hi
  by_cases hκ : κ i < 0
  · simp [hκ, max_eq_right (le_of_lt (neg_pos.mpr hκ))]
  · simp [hκ, max_eq_left (neg_nonpos.mpr (le_of_not_gt hκ))]

theorem hinge_sum_upper_negative {ι : Type*} (S : Finset ι) (κ k : ι → ℝ)
    (l h u v : ℝ) (hlh : l < h) (hv : v ∈ Icc l h) (hu : 0 < u) :
    hingeSum S κ k u v ≤ max (hingeSum S κ k u l) (hingeSum S κ k u h) +
      ∑ i ∈ S.filter (fun i => κ i < 0), (-κ i) * hingeTent l h (k i) u := by
  rw [← negative_hinge_correction_eq]
  exact hinge_sum_upper S κ k l h u v hlh hv hu

theorem hingeTent_eq_zero_of_outside (l h k u : ℝ) (hu : 0 < u)
    (hk : k ≤ l ∨ h ≤ k) : hingeTent l h k u = 0 := by
  unfold hingeTent
  apply max_eq_left
  rcases hk with hk | hk
  · exact (min_le_left _ _).trans
      (div_nonpos_of_nonpos_of_nonneg (sub_nonpos.mpr hk) hu.le)
  · exact ((min_le_right _ _).trans (min_le_left _ _)).trans
      (div_nonpos_of_nonpos_of_nonneg (sub_nonpos.mpr hk) hu.le)

theorem hinge_defect_at_k (l h k u κ : ℝ) (hlh : l < h) (hk : k ∈ Icc l h) :
    hinge κ k u k - endpointInterp l h (hinge κ k u l) (hinge κ k u h) k =
      (-κ)*(k-l)*(h-k)/(u*(h-l)) := by
  rw [hinge_defect_eq, hingeGap_left_formula l h k k hlh hk (le_refl k)]
  simp only [div_mul_eq_div_div]
  ring

/-- A point intercept interval is also valid; it needs no interpolation
division. This extension is convenient for degenerate closed root boxes. -/
theorem hinge_sum_upper_closed {ι : Type*} (S : Finset ι) (κ k : ι → ℝ)
    (l h u v : ℝ) (hlh : l ≤ h) (hv : v ∈ Icc l h) (hu : 0 < u) :
    hingeSum S κ k u v ≤ max (hingeSum S κ k u l) (hingeSum S κ k u h) +
      ∑ i ∈ S, max 0 (-κ i) * hingeTent l h (k i) u := by
  rcases lt_or_eq_of_le hlh with hlt | heq
  · exact hinge_sum_upper S κ k l h u v hlt hv hu
  · subst h
    have hv' : v = l := le_antisymm hv.2 hv.1
    subst v
    rw [max_self]
    have hc : 0 ≤ ∑ i ∈ S, max 0 (-κ i) * hingeTent l l (k i) u :=
      Finset.sum_nonneg (fun i _ => mul_nonneg (le_max_left _ _) (le_max_left _ _))
    linarith

theorem hinge_sum_upper_closed_negative {ι : Type*} (S : Finset ι) (κ k : ι → ℝ)
    (l h u v : ℝ) (hlh : l ≤ h) (hv : v ∈ Icc l h) (hu : 0 < u) :
    hingeSum S κ k u v ≤ max (hingeSum S κ k u l) (hingeSum S κ k u h) +
      ∑ i ∈ S.filter (fun i => κ i < 0), (-κ i) * hingeTent l h (k i) u := by
  rw [← negative_hinge_correction_eq]
  exact hinge_sum_upper_closed S κ k l h u v hlh hv hu

end NoThreeLine

#print axioms NoThreeLine.hingeGap_bounds
#print axioms NoThreeLine.hinge_defect_bound
#print axioms NoThreeLine.hinge_sum_upper
#print axioms NoThreeLine.hinge_sum_upper_negative
#print axioms NoThreeLine.hinge_defect_at_k
#print axioms NoThreeLine.hinge_sum_upper_closed_negative
