import NoThreeLine.VertexEnvelope
import NoThreeLine.ChordIntegral
import NoThreeLine.FinitePiecesBV

/-! Finite angular branches are derived from the actual rectangle chord formula.
Each nonconstant vertex numerator contributes at most one cut. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators ENNReal

namespace NoThreeLine

theorem affine_sign_of_no_internal_root (d e l h : ℝ)
    (hd : d ≠ 0) (hno : -e / d ∉ Ioo l h) :
    (∀ u ∈ Icc l h, 0 ≤ d*u+e) ∨ (∀ u ∈ Icc l h, d*u+e ≤ 0) := by
  let c := -e/d
  have hz : d*c+e = 0 := by dsimp [c]; field_simp; ring
  have hc : c ≤ l ∨ h ≤ c := by
    by_cases hc : c ≤ l
    · exact Or.inl hc
    · exact Or.inr (le_of_not_gt (fun hh => hno ⟨lt_of_not_ge hc,hh⟩))
  rcases lt_or_gt_of_ne hd with hd | hd
  · rcases hc with hc | hc
    · right
      intro u hu
      nlinarith [mul_nonpos_of_nonpos_of_nonneg hd.le (sub_nonneg.mpr (hc.trans hu.1))]
    · left
      intro u hu
      nlinarith [mul_nonneg_of_nonpos_of_nonpos hd.le (sub_nonpos.mpr (hu.2.trans hc))]
  · rcases hc with hc | hc
    · left
      intro u hu
      nlinarith [mul_nonneg hd.le (sub_nonneg.mpr (hc.trans hu.1))]
    · right
      intro u hu
      nlinarith [mul_nonpos_of_nonneg_of_nonpos hd.le (sub_nonpos.mpr (hu.2.trans hc))]

theorem inverse_hinge_affine_on (κ d e l h : ℝ) (hl : 0 < l)
    (hno : d ≠ 0 → -e/d ∉ Ioo l h) :
    ∃ A B : ℝ, ∀ u ∈ Icc l h, κ * max 0 (d+e/u) = A+B/u := by
  by_cases hd : d = 0
  · subst d
    by_cases he : 0 ≤ e
    · refine ⟨0,κ*e,?_⟩
      intro u hu
      rw [zero_add,max_eq_right (div_nonneg he (hl.trans_le hu.1).le)]
      ring
    · refine ⟨0,0,?_⟩
      intro u hu
      rw [zero_add,max_eq_left (div_nonpos_of_nonpos_of_nonneg (le_of_not_ge he)
        (hl.trans_le hu.1).le)]
      simp
  · rcases affine_sign_of_no_internal_root d e l h hd (hno hd) with hs | hs
    · refine ⟨κ*d,κ*e,?_⟩
      intro u hu
      have hu0 := hl.trans_le hu.1
      have he : d+e/u = (d*u+e)/u := by field_simp
      rw [max_eq_right (by rw [he]; exact div_nonneg (hs u hu) hu0.le)]
      ring
    · refine ⟨0,0,?_⟩
      intro u hu
      have hu0 := hl.trans_le hu.1
      have he : d+e/u = (d*u+e)/u := by field_simp
      rw [max_eq_left (by rw [he]; exact div_nonpos_of_nonpos_of_nonneg (hs u hu) hu0.le)]
      simp

def inverseHingeCuts {ι : Type*} (S : Finset ι) (d e : ι → ℝ) : Finset ℝ := by
  classical
  exact (S.filter (fun i => d i ≠ 0)).image (fun i => -e i / d i)

theorem inverseHingeCuts_card {ι : Type*} (S : Finset ι) (d e : ι → ℝ) :
    (inverseHingeCuts S d e).card ≤ S.card := by
  classical
  exact (Finset.card_image_le).trans (Finset.card_filter_le _ _)

theorem inverse_hinge_sum_affine_on {ι : Type*} (S : Finset ι) (κ d e : ι → ℝ)
    (l h : ℝ) (hl : 0 < l)
    (hno : ∀ t ∈ inverseHingeCuts S d e, t ∉ Ioo l h) :
    ∃ A B : ℝ, ∀ u ∈ Icc l h,
      (∑ i ∈ S, κ i * max 0 (d i+e i/u)) = A+B/u := by
  classical
  have hsingle : ∀ i ∈ S, ∃ A B : ℝ, ∀ u ∈ Icc l h,
      κ i * max 0 (d i+e i/u) = A+B/u := by
    intro i hi
    apply inverse_hinge_affine_on _ _ _ _ _ hl
    intro hd
    apply hno _
    exact Finset.mem_image.mpr ⟨i,Finset.mem_filter.mpr ⟨hi,hd⟩,rfl⟩
  clear hno
  induction S using Finset.induction_on with
  | empty => exact ⟨0,0,by simp⟩
  | @insert i S hi ih =>
    obtain ⟨A,B,hAB⟩ := ih (fun j hj => hsingle j (Finset.mem_insert_of_mem hj))
    obtain ⟨a,b,hab⟩ := hsingle i (Finset.mem_insert_self _ _)
    refine ⟨a+A,b+B,?_⟩
    intro u hu
    rw [Finset.sum_insert hi,hab u hu,hAB u hu]
    ring

theorem inverse_affine_monotone_or_antitone (A B l h : ℝ) (hl : 0 < l) :
    MonotoneOn (fun u => A+B/u) (Icc l h) ∨
      AntitoneOn (fun u => A+B/u) (Icc l h) := by
  by_cases hB : 0 ≤ B
  · right
    intro u hu v hv huv
    exact add_le_add (le_refl A) (div_le_div_of_nonneg_left hB (hl.trans_le hu.1) huv)
  · left
    intro u hu v hv huv
    have hn := div_le_div_of_nonneg_left (neg_nonneg.mpr (le_of_not_ge hB))
      (hl.trans_le hu.1) huv
    simp only [neg_div] at hn
    linarith

theorem nonnegative_square_monotone_or_antitone (f : ℝ → ℝ) (l h : ℝ)
    (hf : ∀ u ∈ Icc l h, 0 ≤ f u)
    (hm : MonotoneOn f (Icc l h) ∨ AntitoneOn f (Icc l h)) :
    MonotoneOn (fun u => (f u)^2) (Icc l h) ∨
      AntitoneOn (fun u => (f u)^2) (Icc l h) := by
  rcases hm with hm | hm
  · exact Or.inl (fun u hu v hv huv => pow_le_pow_left₀ (hf u hu) (hm hu hv huv) 2)
  · exact Or.inr (fun u hu v hv huv => pow_le_pow_left₀ (hf v hv) (hm hu hv huv) 2)

def angularCuts {ι : Type*} (S : Finset ι) (R : ι → Rect) (x y : ℝ) : Finset ℝ :=
  inverseHingeCuts (vertexSet S R) (fun p => p.1-x) (fun p => y-p.2)

theorem angularCuts_card {ι : Type*} (S : Finset ι) (R : ι → Rect) (x y : ℝ) :
    (angularCuts S R x y).card ≤ 4*S.card := by
  classical
  apply (inverseHingeCuts_card _ _ _).trans
  apply (Finset.card_image_le).trans
  simp only [cornerIndex, Finset.product_eq_sprod, Finset.card_product, Finset.card_univ,
    Fintype.card_fin]
  omega

/-- The actual integral is one inverse-affine branch whenever no constructed
vertex slope lies strictly inside the interval. -/
theorem fieldChord_affine_on_between_cuts {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (x y l h : ℝ) (hl : 0 < l)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hno : ∀ t ∈ angularCuts S R x y, t ∉ Ioo l h) :
    ∃ A B : ℝ, ∀ u ∈ Icc l h, fieldChord S R w x y u = A+B/u := by
  obtain ⟨A,B,hAB⟩ := inverse_hinge_sum_affine_on (vertexSet S R)
    (vertexCoefficient S R w) (fun p => p.1-x) (fun p => y-p.2) l h hl hno
  refine ⟨A,B,?_⟩
  intro u hu
  rw [fieldChord,rectangleField_chord_at_root_eq_vertices S R w x y u hR (hl.trans_le hu.1)]
  exact hAB u hu

end NoThreeLine

#print axioms NoThreeLine.angularCuts_card
#print axioms NoThreeLine.fieldChord_affine_on_between_cuts
