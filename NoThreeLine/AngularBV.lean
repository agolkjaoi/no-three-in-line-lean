import NoThreeLine.AngularBranches
import NoThreeLine.FieldCap

/-! Root-uniform variation of actual rectangle chords, including the axis value.
The finite cut set and its cardinal bound come from actual vertices. -/
set_option autoImplicit false
noncomputable section
open Set MeasureTheory Filter
open scoped ENNReal Topology BigOperators

namespace NoThreeLine

theorem Rect.horizontal_integrable (R : Rect) (w y : ℝ) :
    Integrable (fun t : ℝ => R.field w t y) := by
  by_cases hy : R.y0 < y ∧ y < R.y1
  · have he : (fun t : ℝ => R.field w t y) =
        (Ioo R.x0 R.x1).indicator (fun _ => w) := by
      funext t
      simp [Rect.field,Rect.contains,Set.indicator_apply,hy.1,hy.2]
    rw [he,integrable_indicator_iff measurableSet_Ioo]
    exact integrableOn_const (by simp [Real.volume_Ioo])
  · have he : (fun t : ℝ => R.field w t y) = fun _ => 0 := by
      funext t
      have hn : ¬R.contains t y := fun h => hy ⟨h.2.2.1,h.2.2.2⟩
      simp [Rect.field,hn]
    rw [he]
    exact integrable_zero _ _ _

theorem rectangleField_horizontal_integrable {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (y : ℝ) :
    Integrable (fun t : ℝ => rectangleField S R w t y) := by
  exact integrable_finsetSum S (fun i _ => (R i).horizontal_integrable (w i) y)

theorem rectangleField_nonnegative_slope_integrable {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (x y u : ℝ) (hu : 0 ≤ u) :
    Integrable (fun t : ℝ => rectangleField S R w t (y-u*x+u*t)) := by
  rcases eq_or_lt_of_le hu with rfl | hu
  · simpa using rectangleField_horizontal_integrable S R w y
  · exact rectangleField_line_integrable S R w (y-u*x) u hu

theorem eVariation_Ioc_le_of_Icc (f : ℝ → ℝ) (a b V : ℝ)
    (hv : ∀ l h, a < l → l ≤ h → h ≤ b →
      eVariationOn f (Icc l h) ≤ ENNReal.ofReal V) :
    eVariationOn f (Ioc a b) ≤ ENNReal.ofReal V := by
  rw [eVariationOn.eq_biSup_inter_Icc]
  refine iSup_le fun p => iSup_le fun hp => ?_
  have hp' : p.1 ∈ Ioc a b ∧ p.2 ∈ Ioc a b ∧ p.1 ≤ p.2 := hp
  have hi : Ioc a b ∩ Icc p.1 p.2 = Icc p.1 p.2 := by
    apply inter_eq_right.mpr
    intro t ht
    exact ⟨hp'.1.1.trans_le ht.1,ht.2.trans hp'.2.1.2⟩
  rw [hi]
  exact hv p.1 p.2 hp'.1.1 hp'.2.2 hp'.2.1.2

/-- The actual axis value may differ from the right limit. Its contribution is
at most one amplitude; no continuity at the axis is assumed. -/
theorem eVariation_Icc_le_Ioc_add_amplitude (f : ℝ → ℝ) (C V : ℝ)
    (hC : 0 ≤ C) (hV : 0 ≤ V)
    (hb : ∀ u ∈ Icc (0 : ℝ) 1, 0 ≤ f u ∧ f u ≤ C)
    (hv : eVariationOn f (Ioc (0 : ℝ) 1) ≤ ENNReal.ofReal V) :
    eVariationOn f (Icc (0 : ℝ) 1) ≤ ENNReal.ofReal (V+C) := by
  have hBV : BoundedVariationOn f (Ioc (0 : ℝ) 1) :=
    ne_of_lt (hv.trans_lt ENNReal.ofReal_lt_top)
  obtain ⟨L,hL⟩ := hBV.exists_tendsto_right 0
  have hi : Ioc (0 : ℝ) 1 ∩ Ioi 0 = Ioc 0 1 := by
    exact inter_eq_left.mpr (fun _ h => h.1)
  rw [hi] at hL
  have hn : (𝓝[Ioc (0 : ℝ) 1] 0).NeBot := by
    rw [nhdsWithin_Ioc_eq_nhdsGT (by norm_num : (0 : ℝ) < 1)]
    infer_instance
  have hLb : L ∈ Icc (0 : ℝ) C := by
    apply isClosed_Icc.mem_of_tendsto hL
    filter_upwards [self_mem_nhdsWithin] with u hu
    exact hb u ⟨hu.1.le,hu.2⟩
  have hi0 : Iic (1 : ℝ) ∩ Ioi 0 = Ioc 0 1 := by ext u; simp; tauto
  have hi1 : Iic (1 : ℝ) ∩ Ici 0 = Icc 0 1 := by ext u; simp; tauto
  have he : eVariationOn f (Icc (0 : ℝ) 1) =
      eVariationOn f (Ioc (0 : ℝ) 1) + edist (f 0) L := by
    have ht : Tendsto f (𝓝[Iic (1 : ℝ) ∩ Ioi 0] 0) (𝓝 L) := by rwa [hi0]
    have hnt : (𝓝[Iic (1 : ℝ) ∩ Ioi 0] 0).NeBot := by rwa [hi0]
    simpa only [hi0,hi1] using
      eVariationOn.eVariationOn_on_inter_Ici_eq_Ioi_add_edist hnt
        (by norm_num : (0 : ℝ) ∈ Iic 1) ht
  have hd : edist (f 0) L ≤ ENNReal.ofReal C := by
    rw [edist_dist,Real.dist_eq]
    apply ENNReal.ofReal_le_ofReal
    have hb0 := hb 0 (by constructor <;> norm_num)
    exact abs_le.mpr ⟨by linarith [hLb.1,hLb.2],by linarith [hLb.1,hLb.2]⟩
  rw [he]
  exact (add_le_add hv hd).trans_eq (ENNReal.ofReal_add hV hC).symm

/-- This cap holds for the actual integral at every slope, including zero.
Nonnegativity allows comparison with the integrable unit-width indicator. -/
theorem fieldChord_bounds_all_slopes {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (M x y u : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    0 ≤ fieldChord S R w x y u ∧ fieldChord S R w x y u ≤ M := by
  have hnon : ∀ t : ℝ, 0 ≤ rectangleField S R w t (y-u*x+u*t) :=
    fun t => (rectangleField_point_bounds S R w M t (y-u*x+u*t) hM hsep hw).1
  refine ⟨integral_nonneg hnon,?_⟩
  have hI : Integrable ((Icc (0 : ℝ) 1).indicator (fun _ : ℝ => M)) := by
    rw [integrable_indicator_iff measurableSet_Icc]
    exact integrableOn_const (by simp [Real.volume_Icc])
  have hi := integral_mono_of_nonneg (Filter.Eventually.of_forall hnon) hI
    (Filter.Eventually.of_forall (fun t =>
      rectangleField_le_unit_indicator S R w M t (y-u*x+u*t) hM hsep hw hR))
  simpa only [fieldChord,integral_indicator_const M measurableSet_Icc,Real.volume_real_Icc,
    sub_zero,max_eq_left (by norm_num : (0 : ℝ) ≤ 1),smul_eq_mul,one_mul] using! hi

theorem fieldChord_square_bounds {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (M x y u : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    0 ≤ (fieldChord S R w x y u)^2 ∧ (fieldChord S R w x y u)^2 ≤ M^2 := by
  have hc := fieldChord_bounds_all_slopes S R w M x y u hM hsep hw hR
  exact ⟨sq_nonneg _,pow_le_pow_left₀ hc.1 hc.2 2⟩

theorem fieldChord_square_eVariation_Icc_positive {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (M x y a b : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) (ha : 0 < a) (hab : a ≤ b) :
    eVariationOn (fun u => (fieldChord S R w x y u)^2) (Icc a b) ≤
      ENNReal.ofReal ((4*(S.card : ℝ)+1)*M^2) := by
  have hordered : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1 :=
    fun i hi => ⟨(hR i hi).2.1,(hR i hi).2.2.2.2.1⟩
  have hv : eVariationOn (fun u => (fieldChord S R w x y u)^2) (Icc a b) ≤
      ENNReal.ofReal ((((angularCuts S R x y).card : ℝ)+1)*M^2) := by
    apply eVariation_le_of_finite_cuts (angularCuts S R x y) _ a b (M^2) hab (sq_nonneg M)
    · intro u _
      exact fieldChord_square_bounds S R w M x y u hM hsep hw hR
    · intro l h hal hlh hhb hno
      obtain ⟨A,B,hAB⟩ := fieldChord_affine_on_between_cuts S R w x y l h
        (ha.trans_le hal) hordered hno
      apply nonnegative_square_monotone_or_antitone _ l h
      · intro u _
        exact (fieldChord_bounds_all_slopes S R w M x y u hM hsep hw hR).1
      · rcases inverse_affine_monotone_or_antitone A B l h (ha.trans_le hal) with hm | hm
        · left
          intro u hu v hv huv
          rw [hAB u hu,hAB v hv]
          exact hm hu hv huv
        · right
          intro u hu v hv huv
          rw [hAB u hu,hAB v hv]
          exact hm hu hv huv
  apply hv.trans
  apply ENNReal.ofReal_le_ofReal
  have hc : ((angularCuts S R x y).card : ℝ) ≤ 4*(S.card : ℝ) := by
    exact_mod_cast angularCuts_card S R x y
  gcongr

/-- G12: the bound is independent of the root's distance from every cell boundary.
The value at the axis is the actual integral, not a redefined right limit. -/
theorem fieldChord_square_eVariation {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (M x y : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    eVariationOn (fun u => (fieldChord S R w x y u)^2) (Icc (0 : ℝ) 1) ≤
      ENNReal.ofReal ((4*(S.card : ℝ)+2)*M^2) := by
  have hv : eVariationOn (fun u => (fieldChord S R w x y u)^2) (Ioc (0 : ℝ) 1) ≤
      ENNReal.ofReal ((4*(S.card : ℝ)+1)*M^2) := by
    apply eVariation_Ioc_le_of_Icc
    intro l h hl hlh _
    exact fieldChord_square_eVariation_Icc_positive S R w M x y l h hM hsep hw hR hl hlh
  have ht := eVariation_Icc_le_Ioc_add_amplitude (fun u => (fieldChord S R w x y u)^2)
    (M^2) ((4*(S.card : ℝ)+1)*M^2) (sq_nonneg M) (by positivity)
    (fun u _ => fieldChord_square_bounds S R w M x y u hM hsep hw hR) hv
  convert ht using 1
  congr 1
  ring

theorem fieldChord_square_boundedVariationOn {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (M x y : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    BoundedVariationOn (fun u => (fieldChord S R w x y u)^2) (Icc (0 : ℝ) 1) :=
  ne_of_lt ((fieldChord_square_eVariation S R w M x y hM hsep hw hR).trans_lt
    ENNReal.ofReal_lt_top)

def erasedFieldChord {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (vertical horizontal : Finset ℝ) (x y u : ℝ) : ℝ :=
  ∫ t : ℝ, eraseGrid vertical horizontal (rectangleField S R w) t (y-u*x+u*t)

theorem erasedFieldChord_eq_fieldChord {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (vertical horizontal : Finset ℝ)
    (x y u : ℝ) (hu : 0 < u) :
    erasedFieldChord S R w vertical horizontal x y u = fieldChord S R w x y u :=
  eraseGrid_chord_eq vertical horizontal (rectangleField S R w) (y-u*x) u hu

theorem erased_horizontal_integrable {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (vertical horizontal : Finset ℝ) (y : ℝ) :
    Integrable (fun t : ℝ => eraseGrid vertical horizontal (rectangleField S R w) t y) := by
  classical
  by_cases hy : y ∈ horizontal
  · simp only [eraseGrid,hy,or_true,if_true]
    exact integrable_zero _ _ _
  · have he : (fun t : ℝ => eraseGrid vertical horizontal (rectangleField S R w) t y) =
        (vertical : Set ℝ)ᶜ.indicator (fun t => rectangleField S R w t y) := by
      funext t
      by_cases ht : t ∈ vertical <;> simp [eraseGrid,hy,ht]
    rw [he]
    exact (rectangleField_horizontal_integrable S R w y).indicator
      vertical.finite_toSet.measurableSet.compl

theorem erasedFieldChord_bounds_all_slopes {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (vertical horizontal : Finset ℝ)
    (M x y u : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    0 ≤ erasedFieldChord S R w vertical horizontal x y u ∧
      erasedFieldChord S R w vertical horizontal x y u ≤ M := by
  have hnon : ∀ t : ℝ, 0 ≤ eraseGrid vertical horizontal (rectangleField S R w)
      t (y-u*x+u*t) := fun t =>
    (erased_rectangleField_point_bounds S R w M t (y-u*x+u*t) hM hsep hw vertical horizontal).1
  refine ⟨integral_nonneg hnon,?_⟩
  have hI : Integrable ((Icc (0 : ℝ) 1).indicator (fun _ : ℝ => M)) := by
    rw [integrable_indicator_iff measurableSet_Icc]
    exact integrableOn_const (by simp [Real.volume_Icc])
  have hle (t : ℝ) : eraseGrid vertical horizontal (rectangleField S R w) t (y-u*x+u*t) ≤
      (Icc (0 : ℝ) 1).indicator (fun _ => M) t := by
    unfold eraseGrid
    split_ifs
    · exact Set.indicator_nonneg (fun _ _ => hM) t
    · exact rectangleField_le_unit_indicator S R w M t (y-u*x+u*t) hM hsep hw hR
  have hi := integral_mono_of_nonneg (Filter.Eventually.of_forall hnon) hI
    (Filter.Eventually.of_forall hle)
  simpa only [erasedFieldChord,integral_indicator_const M measurableSet_Icc,Real.volume_real_Icc,
    sub_zero,max_eq_left (by norm_num : (0 : ℝ) ≤ 1),smul_eq_mul,one_mul] using! hi

/-- Extra finite horizontal/vertical grid lines may change the axis chord.
Their actual axis value is retained and charged once, not equated to the nonaxis limit. -/
theorem erasedFieldChord_square_eVariation {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (vertical horizontal : Finset ℝ)
    (M x y : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    eVariationOn (fun u => (erasedFieldChord S R w vertical horizontal x y u)^2)
      (Icc (0 : ℝ) 1) ≤ ENNReal.ofReal ((4*(S.card : ℝ)+2)*M^2) := by
  have hv : eVariationOn (fun u => (erasedFieldChord S R w vertical horizontal x y u)^2)
      (Ioc (0 : ℝ) 1) ≤ ENNReal.ofReal ((4*(S.card : ℝ)+1)*M^2) := by
    have he : eVariationOn (fun u => (erasedFieldChord S R w vertical horizontal x y u)^2)
        (Ioc (0 : ℝ) 1) = eVariationOn (fun u => (fieldChord S R w x y u)^2)
        (Ioc (0 : ℝ) 1) := by
      apply eVariationOn.congr
      intro u hu
      dsimp only
      rw [erasedFieldChord_eq_fieldChord S R w vertical horizontal x y u hu.1]
    rw [he]
    apply eVariation_Ioc_le_of_Icc
    intro l h hl hlh _
    exact fieldChord_square_eVariation_Icc_positive S R w M x y l h hM hsep hw hR hl hlh
  have hb : ∀ u ∈ Icc (0 : ℝ) 1,
      0 ≤ (erasedFieldChord S R w vertical horizontal x y u)^2 ∧
        (erasedFieldChord S R w vertical horizontal x y u)^2 ≤ M^2 := by
    intro u _
    have hc := erasedFieldChord_bounds_all_slopes S R w vertical horizontal M x y u hM hsep hw hR
    exact ⟨sq_nonneg _,pow_le_pow_left₀ hc.1 hc.2 2⟩
  have ht := eVariation_Icc_le_Ioc_add_amplitude
    (fun u => (erasedFieldChord S R w vertical horizontal x y u)^2)
    (M^2) ((4*(S.card : ℝ)+1)*M^2) (sq_nonneg M) (by positivity) hb hv
  convert ht using 1
  congr 1
  ring

end NoThreeLine

#print axioms NoThreeLine.fieldChord_square_eVariation
#print axioms NoThreeLine.fieldChord_square_boundedVariationOn
#print axioms NoThreeLine.erasedFieldChord_square_eVariation
