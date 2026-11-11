import NoThreeLine.VertexEnvelope

set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators
noncomputable section

namespace NoThreeLine481
open NoThreeLine

/-- At a rational slope and an integer projected intercept, the
numerator used in the sweep is the actual hinge times p*scale. -/
theorem scaled_integer_hinge (c x y t p q scale : ℤ)
    (hp : 0 < p) (hq : 0 < q) (hs : 0 < scale) :
    hinge (c:ℝ) ((y:ℝ)/scale-((p:ℝ)/q)*((x:ℝ)/scale))
      ((p:ℝ)/q) ((t:ℝ)/((q:ℝ)*scale)) =
      ((c * max 0 (t-(q*y-p*x)) : ℤ):ℝ)/((p:ℝ)*scale) := by
  have hp' : (0:ℝ) < p := by exact_mod_cast hp
  have hq' : (0:ℝ) < q := by exact_mod_cast hq
  have hs' : (0:ℝ) < scale := by exact_mod_cast hs
  let d : ℤ := t-(q*y-p*x)
  have hdiff : (t:ℝ)/((q:ℝ)*scale)-((y:ℝ)/scale-((p:ℝ)/q)*((x:ℝ)/scale)) =
      (d:ℝ)/((q:ℝ)*scale) := by
    dsimp [d]
    push_cast
    field_simp [hq'.ne',hs'.ne']
  have hmax : max (0:ℝ) ((d:ℝ)/((q:ℝ)*scale)) =
      ((max (0:ℤ) d : ℤ):ℝ)/((q:ℝ)*scale) := by
    by_cases hd : 0 ≤ d
    · rw [max_eq_right hd, max_eq_right
        (div_nonneg (by exact_mod_cast hd) (mul_pos hq' hs').le)]
    · have hd' : d ≤ 0 := le_of_not_ge hd
      rw [max_eq_left hd', max_eq_left
        (div_nonpos_of_nonpos_of_nonneg (by exact_mod_cast hd') (mul_pos hq' hs').le)]
      simp
  unfold hinge
  rw [hdiff, hmax]
  change (c:ℝ)*(((max (0:ℤ) d : ℤ):ℝ)/((q:ℝ)*scale))/((p:ℝ)/q) =
    ((c * max 0 d : ℤ):ℝ)/((p:ℝ)*scale)
  push_cast
  field_simp [hp'.ne',hq'.ne',hs'.ne']

/-- The integer sweep's update formula, before specializing the
coefficients and knots to integer coordinates. Knots at the right
endpoint can be included in the slope only after this update. -/
theorem hinge_sum_sweep_step {ι : Type*} (S : Finset ι)
    (coeff knot : ι → ℝ) (l h : ℝ) (hlh : l ≤ h)
    (hno : ∀ i ∈ S, knot i ≤ l ∨ h ≤ knot i) :
    (∑ i ∈ S, coeff i * max 0 (h-knot i)) =
      (∑ i ∈ S, coeff i * max 0 (l-knot i)) +
        (h-l) * ∑ i ∈ S, (if knot i ≤ l then coeff i else 0) := by
  classical
  simp only [Finset.mul_sum, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  by_cases hl : knot i ≤ l
  · simp only [if_pos hl, max_eq_right (sub_nonneg.mpr hl),
      max_eq_right (sub_nonneg.mpr (hl.trans hlh))]
    ring
  · have hh := (hno i hi).resolve_left hl
    simp [hl, max_eq_left (sub_nonpos.mpr hh),
      max_eq_left (sub_nonpos.mpr (hlh.trans hh))]

/-- A sum of signed hinges is affine between consecutive knots. Its
maximum on a closed interval can therefore be checked at the endpoints
and at the knots inside the interval. -/
theorem hingeSum_le_of_knots {ι : Type*} (S : Finset ι)
    (coeff knot : ι → ℝ) (l h v U : ℝ) (hv : v ∈ Icc l h)
    (hl : ∑ i ∈ S, coeff i * max 0 (l-knot i) ≤ U)
    (hh : ∑ i ∈ S, coeff i * max 0 (h-knot i) ≤ U)
    (hk : ∀ j ∈ S, knot j ∈ Icc l h →
      ∑ i ∈ S, coeff i * max 0 (knot j-knot i) ≤ U) :
    ∑ i ∈ S, coeff i * max 0 (v-knot i) ≤ U := by
  classical
  let points := insert l (insert h ((S.image knot).filter fun x => x ∈ Icc l h))
  let lower := points.filter (· ≤ v)
  let upper := points.filter (v ≤ ·)
  have hp (x : ℝ) (hx : x ∈ points) : x ∈ Icc l h := by
    rcases Finset.mem_insert.mp hx with rfl | he
    · exact ⟨le_rfl, hv.1.trans hv.2⟩
    · rcases Finset.mem_insert.mp he with rfl | he
      · exact ⟨hv.1.trans hv.2, le_rfl⟩
      · exact (Finset.mem_filter.mp he).2
  have hpU (x : ℝ) (hx : x ∈ points) : ∑ i ∈ S, coeff i * max 0 (x-knot i) ≤ U := by
    rcases Finset.mem_insert.mp hx with he | he
    · simpa only [he] using hl
    · rcases Finset.mem_insert.mp he with he | he
      · simpa only [he] using hh
      · obtain ⟨j, hj, rfl⟩ := Finset.mem_image.mp (Finset.mem_filter.mp he).1
        exact hk j hj (Finset.mem_filter.mp he).2
  have hLower : lower.Nonempty := ⟨l, Finset.mem_filter.mpr ⟨Finset.mem_insert_self _ _, hv.1⟩⟩
  have hUpper : upper.Nonempty := ⟨h, Finset.mem_filter.mpr
    ⟨Finset.mem_insert_of_mem (Finset.mem_insert_self _ _), hv.2⟩⟩
  let a := lower.max' hLower
  let b := upper.min' hUpper
  have ha := Finset.mem_filter.mp (Finset.max'_mem lower hLower)
  have hb := Finset.mem_filter.mp (Finset.min'_mem upper hUpper)
  by_cases hab : a = b
  · have hva : v ≤ a := hab.symm ▸ hb.2
    have hEq : v = a := le_antisymm hva ha.2
    rw [hEq]
    exact hpU a ha.1
  have hab' : a < b := lt_of_le_of_ne (ha.2.trans hb.2) hab
  let t := (v-a)/(b-a)
  have ht0 : 0 ≤ t := div_nonneg (sub_nonneg.mpr ha.2) (sub_nonneg.mpr hab'.le)
  have ht1 : t ≤ 1 := (div_le_iff₀ (sub_pos.mpr hab')).mpr (by linarith [hb.2])
  have hv' : v = (1-t)*a+t*b := by
    dsimp [t]
    field_simp [sub_ne_zero.mpr hab'.ne']
    ring
  have outside (i : ι) (hi : i ∈ S) : knot i ≤ a ∨ b ≤ knot i := by
    by_cases hka : knot i ≤ a
    · exact Or.inl hka
    by_cases hbk : b ≤ knot i
    · exact Or.inr hbk
    have hkp : knot i ∈ points := Finset.mem_insert_of_mem (Finset.mem_insert_of_mem
      (Finset.mem_filter.mpr ⟨Finset.mem_image_of_mem knot hi,
        ⟨(hp a ha.1).1.trans (le_of_not_ge hka), (le_of_not_ge hbk).trans (hp b hb.1).2⟩⟩))
    rcases le_total (knot i) v with hkv | hvk
    · exact Or.inl (Finset.le_max' lower _ (Finset.mem_filter.mpr ⟨hkp,hkv⟩))
    · exact Or.inr (Finset.min'_le upper _ (Finset.mem_filter.mpr ⟨hkp,hvk⟩))
  have hterm (i : ι) (hi : i ∈ S) :
      coeff i * max 0 (v-knot i) =
        (1-t)*(coeff i * max 0 (a-knot i)) + t*(coeff i * max 0 (b-knot i)) := by
    rcases outside i hi with h | h
    · rw [max_eq_right (sub_nonneg.mpr (h.trans ha.2)), max_eq_right (sub_nonneg.mpr h),
        max_eq_right (sub_nonneg.mpr (h.trans hab'.le)), hv']
      ring
    · rw [max_eq_left (sub_nonpos.mpr (hb.2.trans h)),
        max_eq_left (sub_nonpos.mpr (hab'.le.trans h)), max_eq_left (sub_nonpos.mpr h)]
      ring
  calc
    _ = (1-t)*(∑ i ∈ S, coeff i * max 0 (a-knot i)) +
        t*(∑ i ∈ S, coeff i * max 0 (b-knot i)) := by
      simp only [Finset.mul_sum, ← Finset.sum_add_distrib]
      exact Finset.sum_congr rfl hterm
    _ ≤ (1-t)*U+t*U := add_le_add
      (mul_le_mul_of_nonneg_left (hpU a ha.1) (sub_nonneg.mpr ht1))
      (mul_le_mul_of_nonneg_left (hpU b hb.1) ht0)
    _ = U := by ring

/-- The finite candidate set in the angular replay bounds every actual
rectangle-field chord at a fixed positive slope. -/
theorem rectangular_chord_le_of_knots {ι : Type*} (S : Finset ι)
    (R : ι → NoThreeLine.Rect) (w : ι → ℝ) (l h v u U : ℝ)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hu : 0 < u) (hv : v ∈ Icc l h)
    (hl : (∫ t : ℝ, NoThreeLine.rectangleField S R w t (l+u*t)) ≤ U)
    (hh : (∫ t : ℝ, NoThreeLine.rectangleField S R w t (h+u*t)) ≤ U)
    (hk : ∀ p ∈ NoThreeLine.vertexSet S R, p.2-u*p.1 ∈ Icc l h →
      (∫ t : ℝ, NoThreeLine.rectangleField S R w t (p.2-u*p.1+u*t)) ≤ U) :
    (∫ t : ℝ, NoThreeLine.rectangleField S R w t (v+u*t)) ≤ U := by
  rw [rectangleField_chord_eq_hingeSum S R w v u hR hu]
  rw [rectangleField_chord_eq_hingeSum S R w l u hR hu] at hl
  rw [rectangleField_chord_eq_hingeSum S R w h u hR hu] at hh
  simp only [hingeSum, hinge, ← div_mul_eq_mul_div] at hl hh ⊢
  apply hingeSum_le_of_knots (vertexSet S R) (fun p => vertexCoefficient S R w p/u)
    (fun p => p.2-u*p.1) l h v U hv
  · exact hl
  · exact hh
  · intro p hp hpk
    have hs := hk p hp hpk
    rw [rectangleField_chord_eq_hingeSum S R w _ u hR hu] at hs
    simpa only [hingeSum, hinge, ← div_mul_eq_mul_div] using hs

#print axioms scaled_integer_hinge
#print axioms hinge_sum_sweep_step
#print axioms hingeSum_le_of_knots
#print axioms rectangular_chord_le_of_knots

end NoThreeLine481
