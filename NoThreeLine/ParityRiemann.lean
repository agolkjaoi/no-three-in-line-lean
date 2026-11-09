import Mathlib.Topology.EMetricSpace.VariationOnFromTo
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Data.ENNReal.BigOperators
import Mathlib.Tactic

set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval

namespace NoThreeLine

/-- A real BV function is interval integrable, via its proved Jordan decomposition. -/
theorem bv_intervalIntegrable (f : ℝ → ℝ) (a b : ℝ)
    (hf : BoundedVariationOn f (uIcc a b)) : IntervalIntegrable f volume a b := by
  obtain ⟨p, q, hp, hq, hdecomp⟩ :=
    hf.locallyBoundedVariationOn.exists_monotoneOn_sub_monotoneOn
  rw [hdecomp]
  exact hp.intervalIntegrable.sub hq.intervalIntegrable

/-- The variation includes the actual values at both endpoints and at the tag. -/
theorem bv_cell_quadrature_error (f : ℝ → ℝ) (a b t : ℝ) (hab : a ≤ b)
    (hf : BoundedVariationOn f (Icc a b)) (ht : t ∈ Icc a b) :
    |(b-a) * f t - ∫ u in a..b, f u| ≤
      (b-a) * (eVariationOn f (Icc a b)).toReal := by
  have hi : IntervalIntegrable f volume a b :=
    bv_intervalIntegrable f a b (by simpa only [uIcc_of_le hab] using hf)
  have he : (b-a) * f t - (∫ u in a..b, f u) =
      ∫ u in a..b, f t - f u := by
    rw [intervalIntegral.integral_sub intervalIntegrable_const hi,
      intervalIntegral.integral_const]
    simp only [smul_eq_mul]
  rw [he]
  have hn := intervalIntegral.norm_integral_le_of_norm_le_const
    (a := a) (b := b) (f := fun u : ℝ => f t - f u)
    (C := (eVariationOn f (Icc a b)).toReal) (by
      intro u hu
      rw [uIoc_of_le hab] at hu
      simpa only [Real.norm_eq_abs, Real.dist_eq] using
        hf.dist_le ht ⟨hu.1.le, hu.2⟩)
  simpa only [Real.norm_eq_abs, abs_of_nonneg (sub_nonneg.mpr hab), mul_comm] using hn

/-- General finite tagged quadrature: summing the true local BV errors costs
the mesh size times the total variation, with no unproved quadrature premise. -/
theorem bv_quadrature_error (f : ℝ → ℝ) (x t : ℕ → ℝ) (n : ℕ) (mesh : ℝ)
    (hx : Monotone x) (hf : BoundedVariationOn f (Icc (x 0) (x n)))
    (htags : ∀ i < n, t i ∈ Icc (x i) (x (i+1)))
    (hmesh : ∀ i < n, x (i+1) - x i ≤ mesh) :
    |(∑ i ∈ Finset.range n, (x (i+1) - x i) * f (t i)) -
        ∫ u in (x 0)..(x n), f u| ≤
      mesh * (eVariationOn f (Icc (x 0) (x n))).toReal := by
  have hsub (i : ℕ) (hi : i < n) : Icc (x i) (x (i+1)) ⊆ Icc (x 0) (x n) := by
    intro u hu
    exact ⟨(hx (Nat.zero_le i)).trans hu.1, hu.2.trans (hx (by omega))⟩
  have hlocal (i : ℕ) (hi : i < n) : BoundedVariationOn f (Icc (x i) (x (i+1))) :=
    hf.mono (hsub i hi)
  have hint (i : ℕ) (hi : i < n) : IntervalIntegrable f volume (x i) (x (i+1)) :=
    bv_intervalIntegrable f _ _ (by
      simpa only [uIcc_of_le (hx (Nat.le_succ i))] using hlocal i hi)
  have hvars : (∑ i ∈ Finset.range n, (eVariationOn f (Icc (x i) (x (i+1)))).toReal) =
      (eVariationOn f (Icc (x 0) (x n))).toReal := by
    rw [← ENNReal.toReal_sum (fun i hi => hlocal i (Finset.mem_range.mp hi))]
    rw [eVariationOn.sum' f hx]
  rw [← intervalIntegral.sum_integral_adjacent_intervals hint, ← Finset.sum_sub_distrib]
  calc
    _ ≤ ∑ i ∈ Finset.range n,
        |(x (i+1) - x i) * f (t i) - ∫ u in (x i)..(x (i+1)), f u| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ i ∈ Finset.range n,
        mesh * (eVariationOn f (Icc (x i) (x (i+1)))).toReal := by
      apply Finset.sum_le_sum
      intro i hi
      have hi' := Finset.mem_range.mp hi
      exact (bv_cell_quadrature_error f _ _ _ (hx (Nat.le_succ i))
        (hlocal i hi') (htags i hi')).trans
        (mul_le_mul_of_nonneg_right (hmesh i hi') ENNReal.toReal_nonneg)
    _ = _ := by rw [← Finset.mul_sum, hvars]

theorem sum_adjacent_widths (x : ℕ → ℝ) (n : ℕ) :
    (∑ i ∈ Finset.range n, (x (i+1) - x i)) = x n - x 0 := by
  induction n with
  | zero => simp
  | succ n ih => rw [Finset.sum_range_succ, ih]; ring

/-- Converting cell-width weights to a common mesh pays only the total missing
weight. The assumptions concern endpoints and widths, not integration error. -/
theorem equal_weight_defect (f : ℝ → ℝ) (x t : ℕ → ℝ) (n : ℕ) (mesh M : ℝ)
    (hmesh : ∀ i < n, x (i+1) - x i ≤ mesh)
    (hM : ∀ i < n, |f (t i)| ≤ M) :
    |mesh * (∑ i ∈ Finset.range n, f (t i)) -
        ∑ i ∈ Finset.range n, (x (i+1) - x i) * f (t i)| ≤
      M * (mesh * n - (x n - x 0)) := by
  rw [Finset.mul_sum, ← Finset.sum_sub_distrib]
  calc
    _ ≤ ∑ i ∈ Finset.range n,
        |mesh * f (t i) - (x (i+1) - x i) * f (t i)| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ i ∈ Finset.range n, (mesh - (x (i+1) - x i)) * M := by
      apply Finset.sum_le_sum
      intro i hi
      have hi' := Finset.mem_range.mp hi
      rw [← sub_mul, abs_mul, abs_of_nonneg (sub_nonneg.mpr (hmesh i hi'))]
      exact mul_le_mul_of_nonneg_left (hM i hi') (sub_nonneg.mpr (hmesh i hi'))
    _ = _ := by
      rw [← Finset.sum_mul, Finset.sum_sub_distrib, sum_adjacent_widths]
      simp only [Finset.sum_const, Finset.card_range, nsmul_eq_mul]
      ring

/-- Equal-weight quadrature on [0,1], allowing a shortened first cell and a
missing final interval. Each boundary defect is bounded by one mesh. -/
theorem bv_equal_weight_error (f : ℝ → ℝ) (x t : ℕ → ℝ) (n : ℕ) (mesh M : ℝ)
    (hf : BoundedVariationOn f (Icc 0 1)) (hx : Monotone x) (hx0 : x 0 = 0)
    (hxn : x n ≤ 1) (hmesh0 : 0 ≤ mesh)
    (htags : ∀ i < n, t i ∈ Icc (x i) (x (i+1)))
    (hmesh : ∀ i < n, x (i+1) - x i ≤ mesh)
    (hdefect : mesh * n - x n ≤ mesh) (htail : 1 - x n ≤ mesh)
    (hM : ∀ u ∈ Icc (0 : ℝ) 1, |f u| ≤ M) :
    |mesh * (∑ i ∈ Finset.range n, f (t i)) - ∫ u in (0 : ℝ)..1, f u| ≤
      mesh * ((eVariationOn f (Icc 0 1)).toReal + 2 * M) := by
  have hxnonneg : 0 ≤ x n := by simpa only [hx0] using hx (Nat.zero_le n)
  have hM0 : 0 ≤ M := (abs_nonneg (f 0)).trans (hM 0 (by simp))
  have hleft : Icc (0 : ℝ) (x n) ⊆ Icc 0 1 :=
    fun _ hu => ⟨hu.1, hu.2.trans hxn⟩
  have hright : Icc (x n) (1 : ℝ) ⊆ Icc 0 1 :=
    fun _ hu => ⟨hxnonneg.trans hu.1, hu.2⟩
  have hfl : BoundedVariationOn f (Icc 0 (x n)) := hf.mono hleft
  have hfr : BoundedVariationOn f (Icc (x n) 1) := hf.mono hright
  have hil : IntervalIntegrable f volume 0 (x n) :=
    bv_intervalIntegrable f 0 (x n) (by simpa only [uIcc_of_le hxnonneg] using hfl)
  have hir : IntervalIntegrable f volume (x n) 1 :=
    bv_intervalIntegrable f (x n) 1 (by simpa only [uIcc_of_le hxn] using hfr)
  have htagsM (i : ℕ) (hi : i < n) : |f (t i)| ≤ M := by
    apply hM
    have ht := htags i hi
    have hxi : 0 ≤ x i := by simpa only [hx0] using hx (Nat.zero_le i)
    exact ⟨hxi.trans ht.1, (ht.2.trans (hx (by omega))).trans hxn⟩
  have hmass := equal_weight_defect f x t n mesh M hmesh htagsM
  rw [hx0, sub_zero] at hmass
  have hmass' := hmass.trans (mul_le_mul_of_nonneg_left hdefect hM0)
  have hquad := bv_quadrature_error f x t n mesh hx
    (by simpa only [hx0] using hfl) htags hmesh
  rw [hx0] at hquad
  have hvar : (eVariationOn f (Icc 0 (x n))).toReal ≤
      (eVariationOn f (Icc 0 1)).toReal := ENNReal.toReal_mono hf (eVariationOn.mono f hleft)
  have hquad' := hquad.trans (mul_le_mul_of_nonneg_left hvar hmesh0)
  have htailBound : |∫ u in (x n)..(1 : ℝ), f u| ≤ M * mesh := by
    have hi := intervalIntegral.norm_integral_le_of_norm_le_const
      (a := x n) (b := 1) (f := f) (C := M) (by
        intro u hu
        rw [uIoc_of_le hxn] at hu
        simpa only [Real.norm_eq_abs] using hM u ⟨hxnonneg.trans hu.1.le, hu.2⟩)
    have hi' : |∫ u in (x n)..(1 : ℝ), f u| ≤ M * (1 - x n) := by
      simpa only [Real.norm_eq_abs, abs_of_nonneg (sub_nonneg.mpr hxn)] using hi
    exact hi'.trans (mul_le_mul_of_nonneg_left htail hM0)
  have hsplit := intervalIntegral.integral_add_adjacent_intervals hil hir
  have htail' : |(∫ u in (0 : ℝ)..(x n), f u) - ∫ u in (0 : ℝ)..1, f u| ≤ M * mesh := by
    rw [← hsplit]
    simpa only [sub_add_cancel_left, abs_neg] using htailBound
  have htri := abs_sub_le (mesh * ∑ i ∈ Finset.range n, f (t i))
    (∑ i ∈ Finset.range n, (x (i+1) - x i) * f (t i))
    (∫ u in (0 : ℝ)..1, f u)
  have htri' := abs_sub_le (∑ i ∈ Finset.range n, (x (i+1) - x i) * f (t i))
    (∫ u in (0 : ℝ)..(x n), f u) (∫ u in (0 : ℝ)..1, f u)
  nlinarith

/-- The first cell is clipped at zero; all later tags have spacing 2/k. -/
noncomputable def parityEndpoint (k ε i : ℕ) : ℝ := ((2 * i - ε : ℕ) : ℝ) / k

theorem parityEndpoint_monotone (k ε : ℕ) : Monotone (parityEndpoint k ε) := by
  intro i j hij
  apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg k)
  exact_mod_cast Nat.sub_le_sub_right (Nat.mul_le_mul_left 2 hij) ε

@[simp] theorem parityEndpoint_zero (k ε : ℕ) : parityEndpoint k ε 0 = 0 := by
  simp [parityEndpoint]

theorem parityEndpoint_width (k ε i : ℕ) (hk : 0 < k) :
    parityEndpoint k ε (i+1) - parityEndpoint k ε i ≤ 2 / (k : ℝ) := by
  have hk' : (0 : ℝ) < k := by exact_mod_cast hk
  have hn : 2 * (i+1) - ε ≤ (2 * i - ε) + 2 := by omega
  have hn' : ((2 * (i+1) - ε : ℕ) : ℝ) ≤ ((2*i-ε : ℕ) : ℝ) + 2 := by
    exact_mod_cast hn
  unfold parityEndpoint
  rw [← sub_div]
  apply (div_le_div_iff_of_pos_right hk').mpr
  linarith

theorem parityEndpoint_final_bounds (k ε : ℕ) (hk : 0 < k) (hε : ε ≤ 1) :
    parityEndpoint k ε ((k+ε)/2) ≤ 1 ∧
      (2 / (k : ℝ)) * ((k+ε)/2 : ℕ) - parityEndpoint k ε ((k+ε)/2) ≤ 2 / k ∧
      1 - parityEndpoint k ε ((k+ε)/2) ≤ 2 / k := by
  have hk' : (0 : ℝ) < k := by exact_mod_cast hk
  let n := (k+ε)/2
  let q := 2*n-ε
  have hq_upper : q ≤ k := by dsimp [q, n]; omega
  have hdef : 2*n ≤ q+2 := by dsimp [q]; omega
  have htail : k ≤ q+2 := by dsimp [q, n]; omega
  have hq_upper' : (q : ℝ) ≤ k := by exact_mod_cast hq_upper
  have hdef' : (2 : ℝ)*n ≤ (q : ℝ)+2 := by exact_mod_cast hdef
  have htail' : (k : ℝ) ≤ (q : ℝ)+2 := by exact_mod_cast htail
  change (q : ℝ)/k ≤ 1 ∧ (2/(k:ℝ))*n - (q:ℝ)/k ≤ 2/k ∧ 1-(q:ℝ)/k ≤ 2/k
  constructor
  · exact (div_le_iff₀ hk').mpr (by simpa using hq_upper')
  constructor
  · have he : (2/(k:ℝ))*n - (q:ℝ)/k = ((2:ℝ)*n-q)/k := by ring
    rw [he]
    exact (div_le_div_iff_of_pos_right hk').mpr (by linarith)
  · have he : 1 ≤ (q:ℝ)/k + 2/k := by
      rw [← add_div]
      exact (le_div_iff₀ hk').mpr (by simpa using htail')
    linarith

theorem parity_indices_eq_image (k ε : ℕ) (hε : ε ≤ 1) :
    (Finset.Icc 1 k).filter (fun b => b % 2 = ε) =
      (Finset.range ((k+ε)/2)).image (fun i => 2*(i+1)-ε) := by
  ext b
  simp only [Finset.mem_filter, Finset.mem_Icc, Finset.mem_image, Finset.mem_range]
  constructor
  · rintro ⟨⟨hb1, hbk⟩, hmod⟩
    refine ⟨(b+ε)/2-1, ?_, ?_⟩ <;> omega
  · rintro ⟨i, hi, rfl⟩
    omega

noncomputable def parityRiemannSum (f : ℝ → ℝ) (k ε : ℕ) : ℝ :=
  ∑ b ∈ (Finset.Icc 1 k).filter (fun b => b % 2 = ε), f ((b : ℝ) / k)

theorem parityRiemannSum_eq_range (f : ℝ → ℝ) (k ε : ℕ) (hε : ε ≤ 1) :
    parityRiemannSum f k ε =
      ∑ i ∈ Finset.range ((k+ε)/2), f (parityEndpoint k ε (i+1)) := by
  unfold parityRiemannSum
  rw [parity_indices_eq_image k ε hε, Finset.sum_image]
  · rfl
  · intro i _ j _ heq
    dsimp only at heq
    omega

/-- S1 from the actual BV and integral definitions. No modulus of continuity
or separation from a boundary is required. This also works for signed f. -/
theorem parityRiemann_error (f : ℝ → ℝ) (k ε : ℕ) (M : ℝ)
    (hk : 0 < k) (hε : ε ≤ 1) (hf : BoundedVariationOn f (Icc 0 1))
    (hM : ∀ u ∈ Icc (0 : ℝ) 1, |f u| ≤ M) :
    |parityRiemannSum f k ε - ((k : ℝ) / 2) * ∫ u in (0 : ℝ)..1, f u| ≤
      2*M + (eVariationOn f (Icc 0 1)).toReal := by
  have hk' : (0 : ℝ) < k := by exact_mod_cast hk
  have hmeshpos : 0 < 2 / (k : ℝ) := by positivity
  have hx := parityEndpoint_monotone k ε
  have hfinal := parityEndpoint_final_bounds k ε hk hε
  have hscaled := bv_equal_weight_error f (parityEndpoint k ε)
    (fun i => parityEndpoint k ε (i+1)) ((k+ε)/2) (2/(k:ℝ)) M hf hx
    (parityEndpoint_zero k ε) hfinal.1 hmeshpos.le
    (fun i _ => ⟨hx (Nat.le_succ i), le_rfl⟩)
    (fun i _ => parityEndpoint_width k ε i hk) hfinal.2.1 hfinal.2.2 hM
  rw [← parityRiemannSum_eq_range f k ε hε] at hscaled
  have he : (2/(k:ℝ)) * (parityRiemannSum f k ε - ((k:ℝ)/2) *
      ∫ u in (0:ℝ)..1, f u) =
      (2/(k:ℝ))*parityRiemannSum f k ε - ∫ u in (0:ℝ)..1, f u := by
    field_simp
  rw [← he, abs_mul, abs_of_pos hmeshpos] at hscaled
  nlinarith

theorem nonnegative_parityRiemann_error (f : ℝ → ℝ) (k ε : ℕ) (M : ℝ)
    (hk : 0 < k) (hε : ε ≤ 1) (hf : BoundedVariationOn f (Icc 0 1))
    (hM : ∀ u ∈ Icc (0 : ℝ) 1, 0 ≤ f u ∧ f u ≤ M) :
    |parityRiemannSum f k ε - ((k : ℝ) / 2) * ∫ u in (0 : ℝ)..1, f u| ≤
      2*M + (eVariationOn f (Icc 0 1)).toReal := by
  apply parityRiemann_error f k ε M hk hε hf
  intro u hu
  rw [abs_of_nonneg (hM u hu).1]
  exact (hM u hu).2

end NoThreeLine

#print axioms NoThreeLine.bv_intervalIntegrable
#print axioms NoThreeLine.bv_cell_quadrature_error
#print axioms NoThreeLine.bv_quadrature_error
#print axioms NoThreeLine.bv_equal_weight_error
#print axioms NoThreeLine.parityRiemann_error
#print axioms NoThreeLine.nonnegative_parityRiemann_error
