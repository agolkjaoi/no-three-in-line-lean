import NoThreeLine.AngularBV
import NoThreeLine481.AngularBounds
import NoThreeLine481.KnotEnvelope

/-! On a positive Farey bin, the signs of the projected grid differences
stay fixed. Moving endpoint and knot chords are affine in reciprocal slope. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine

def interceptAt (P : ℝ × ℝ) (u : ℝ) : ℝ := P.2-u*P.1

def offsetAt (P Q : ℝ × ℝ) (u : ℝ) : ℝ := interceptAt P u-interceptAt Q u

def sameSignAt (f : ℝ → ℝ) (r s : ℝ) : Prop :=
  (0 ≤ f r ∧ 0 ≤ f s) ∨ (f r ≤ 0 ∧ f s ≤ 0)

theorem farey_offset_sameSign (a b c d G x y X Y : ℤ)
    (hb : 0 < b) (hd : 0 < d) (hG : 0 < G)
    (hdet : b*c-a*d=1) (hsize : G < b+d) (hx : |X-x| ≤ G) :
    sameSignAt (offsetAt ((x:ℝ)/G,(y:ℝ)/G) ((X:ℝ)/G,(Y:ℝ)/G))
      ((a:ℝ)/b) ((c:ℝ)/d) := by
  have hbr : (0:ℝ)<b := by exact_mod_cast hb
  have hdr : (0:ℝ)<d := by exact_mod_cast hd
  have hGr : (0:ℝ)<G := by exact_mod_cast hG
  let f := offsetAt ((x:ℝ)/G,(y:ℝ)/G) ((X:ℝ)/G,(Y:ℝ)/G)
  have hf (p q : ℤ) (hq : (0:ℝ)<q) :
      f ((p:ℝ)/q) = (((X-x)*p+(y-Y)*q:ℤ):ℝ)/((q:ℝ)*G) := by
    dsimp [f, offsetAt, interceptAt]
    push_cast
    field_simp [hq.ne',hGr.ne']
    ring
  change sameSignAt f _ _
  unfold sameSignAt
  rw [hf a b hbr, hf c d hdr]
  rcases farey_grid_sign a b c d (X-x) (y-Y) G hb hd hdet hsize hx with h | h
  · exact Or.inl ⟨div_nonneg (by exact_mod_cast h.1) (mul_pos hbr hGr).le,
      div_nonneg (by exact_mod_cast h.2) (mul_pos hdr hGr).le⟩
  · exact Or.inr ⟨div_nonpos_of_nonpos_of_nonneg (by exact_mod_cast h.1) (mul_pos hbr hGr).le,
      div_nonpos_of_nonpos_of_nonneg (by exact_mod_cast h.2) (mul_pos hdr hGr).le⟩

private theorem offset_mix (P Q : ℝ × ℝ) (r s u : ℝ) :
    (s-r)*offsetAt P Q u = (s-u)*offsetAt P Q r + (u-r)*offsetAt P Q s := by
  unfold offsetAt interceptAt
  ring

private theorem offset_nonneg_between (P Q : ℝ × ℝ) {r s u : ℝ} (hrs : r < s)
    (hu : u ∈ Icc r s) (hl : 0 ≤ offsetAt P Q r) (hh : 0 ≤ offsetAt P Q s) :
    0 ≤ offsetAt P Q u := by
  apply nonneg_of_mul_nonneg_left _ (sub_pos.mpr hrs)
  rw [mul_comm (offsetAt P Q u), offset_mix]
  exact add_nonneg (mul_nonneg (sub_nonneg.mpr hu.2) hl) (mul_nonneg (sub_nonneg.mpr hu.1) hh)

private theorem offset_nonpos_between (P Q : ℝ × ℝ) {r s u : ℝ} (hrs : r < s)
    (hu : u ∈ Icc r s) (hl : offsetAt P Q r ≤ 0) (hh : offsetAt P Q s ≤ 0) :
    offsetAt P Q u ≤ 0 := by
  apply nonpos_of_mul_nonpos_left _ (sub_pos.mpr hrs)
  rw [mul_comm (offsetAt P Q u), offset_mix]
  exact add_nonpos (mul_nonpos_of_nonneg_of_nonpos (sub_nonneg.mpr hu.2) hl)
    (mul_nonpos_of_nonneg_of_nonpos (sub_nonneg.mpr hu.1) hh)

theorem offset_nonneg_endpoints (P Q : ℝ × ℝ) {r s u : ℝ} (hu : u ∈ Ioo r s)
    (h : sameSignAt (offsetAt P Q) r s) (hcur : 0 ≤ offsetAt P Q u) :
    0 ≤ offsetAt P Q r ∧ 0 ≤ offsetAt P Q s := by
  rcases h with h | h
  · exact h
  have hsum : 0 ≤ (s-u)*offsetAt P Q r + (u-r)*offsetAt P Q s := by
    rw [← offset_mix]
    exact mul_nonneg (sub_nonneg.mpr (hu.1.trans hu.2).le) hcur
  constructor
  · by_contra! hh
    have h1 := mul_neg_of_pos_of_neg (sub_pos.mpr hu.2) hh
    have h2 := mul_nonpos_of_nonneg_of_nonpos (sub_nonneg.mpr hu.1.le) h.2
    linarith only [hsum,h1,h2]
  · by_contra! hh
    have h1 := mul_nonpos_of_nonneg_of_nonpos (sub_nonneg.mpr hu.2.le) h.1
    have h2 := mul_neg_of_pos_of_neg (sub_pos.mpr hu.1) hh
    linarith only [hsum,h1,h2]

def movingChord {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (P : ℝ × ℝ) (u : ℝ) : ℝ :=
  ∫ t : ℝ, rectangleField S R w t (interceptAt P u + u*t)

theorem movingChord_reciprocal_branch {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (P : ℝ × ℝ) {r s : ℝ} (hrs : r < s)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hSigns : ∀ Q ∈ vertexSet S R, sameSignAt (offsetAt P Q) r s) :
    ∃ a b : ℝ, ∀ u ∈ Icc r s, 0 < u → movingChord S R w P u = a+b/u := by
  classical
  let V := vertexSet S R
  let I := V.filter (fun Q => 0 ≤ offsetAt P Q r ∧ 0 ≤ offsetAt P Q s)
  let C := vertexCoefficient S R w
  refine ⟨∑ Q ∈ I, C Q*(Q.1-P.1), ∑ Q ∈ I, C Q*(P.2-Q.2), ?_⟩
  intro u hu hupos
  unfold movingChord
  rw [rectangleField_chord_eq_hingeSum _ _ _ _ _ hR hupos, hingeSum]
  calc
    _ = ∑ Q ∈ V, if 0 ≤ offsetAt P Q r ∧ 0 ≤ offsetAt P Q s then
        C Q*(Q.1-P.1) + (C Q*(P.2-Q.2))/u else 0 := by
      apply Finset.sum_congr rfl
      intro Q hQ
      change C Q*max 0 (offsetAt P Q u)/u = _
      split_ifs with hQsign
      · rw [max_eq_right (offset_nonneg_between P Q hrs hu hQsign.1 hQsign.2)]
        unfold offsetAt interceptAt
        field_simp [hupos.ne']
        ring
      · have hn := (hSigns Q hQ).resolve_left hQsign
        rw [max_eq_left (offset_nonpos_between P Q hrs hu hn.1 hn.2)]
        ring
    _ = _ := by
      rw [← Finset.sum_filter, Finset.sum_add_distrib, Finset.sum_div]

theorem movingChord_le_reciprocalSecant {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (P : ℝ × ℝ) {r s u A B : ℝ} (hr : 0 < r) (hrs : r < s)
    (hu : u ∈ Icc r s)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hSigns : ∀ Q ∈ vertexSet S R, sameSignAt (offsetAt P Q) r s)
    (hL : movingChord S R w P r ≤ A) (hH : movingChord S R w P s ≤ B) :
    movingChord S R w P u ≤ reciprocalSecant r s A B u := by
  obtain ⟨a,b,h⟩ := movingChord_reciprocal_branch S R w P hrs hR hSigns
  rw [h r ⟨le_rfl,hrs.le⟩ hr] at hL
  rw [h s ⟨hrs.le,le_rfl⟩ (hr.trans hrs)] at hH
  rw [h u hu (hr.trans_le hu.1)]
  exact branch_le_reciprocal_secant a b r s A B u hr hrs hu hL hH

#print axioms farey_offset_sameSign
#print axioms offset_nonneg_endpoints
#print axioms movingChord_le_reciprocalSecant


def rootIntercepts (Q : Rect) (u : ℝ) : Set ℝ :=
  Icc (interceptAt (Q.x1,Q.y0) u) (interceptAt (Q.x0,Q.y1) u)

private theorem root_intercept_mem (Q : Rect) (x y u : ℝ) (hu : 0 ≤ u)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1) :
    interceptAt (x,y) u ∈ rootIntercepts Q u := by
  constructor <;> dsimp [interceptAt]
  · nlinarith only [hy.1, mul_nonneg hu (sub_nonneg.mpr hx.2)]
  · nlinarith only [hy.2, mul_nonneg hu (sub_nonneg.mpr hx.1)]

/-- Uniformly over a closed root box, rounded endpoint bounds give the
reciprocal-coordinate secant on the whole positive Farey bin. -/
theorem rectangular_chord_le_farey_secant {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (Q : Rect) (x y u A B : ℝ) (a b c d G : ℤ)
    (ha : 0 < a) (hb : 0 < b) (hd : 0 < d) (hG : 0 < G)
    (hdet : b*c-a*d=1) (hsize : G < b+d)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hgrid : ∀ P ∈ insert (Q.x1,Q.y0) (insert (Q.x0,Q.y1) (vertexSet S R)),
      ∃ X Y : ℤ, 0 ≤ X ∧ X ≤ G ∧ P = ((X:ℝ)/G,(Y:ℝ)/G))
    (hu : u ∈ Ioo ((a:ℝ)/b) ((c:ℝ)/d))
    (hleft : ∀ v ∈ rootIntercepts Q ((a:ℝ)/b),
      (∫ t : ℝ, rectangleField S R w t (v+((a:ℝ)/b)*t)) ≤ A)
    (hright : ∀ v ∈ rootIntercepts Q ((c:ℝ)/d),
      (∫ t : ℝ, rectangleField S R w t (v+((c:ℝ)/d)*t)) ≤ B) :
    movingChord S R w (x,y) u ≤ reciprocalSecant ((a:ℝ)/b) ((c:ℝ)/d) A B u := by
  classical
  let r := (a:ℝ)/b
  let s := (c:ℝ)/d
  let L := (Q.x1,Q.y0)
  let H := (Q.x0,Q.y1)
  let V := insert L (insert H (vertexSet S R))
  have hr : 0 < r := div_pos (by exact_mod_cast ha) (by exact_mod_cast hb)
  have hrs : r < s := hu.1.trans hu.2
  have hupos : 0 < u := hr.trans hu.1
  have hLV : L ∈ V := Finset.mem_insert_self _ _
  have hHV : H ∈ V := Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)
  have hVV {P : ℝ × ℝ} (hP : P ∈ vertexSet S R) : P ∈ V :=
    Finset.mem_insert_of_mem (Finset.mem_insert_of_mem hP)
  have hSigns (P T : ℝ × ℝ) (hP : P ∈ V) (hT : T ∈ V) :
      sameSignAt (offsetAt P T) r s := by
    obtain ⟨p₁,p₂,hp₁,hpG,rfl⟩ := hgrid P hP
    obtain ⟨t₁,t₂,ht₁,htG,rfl⟩ := hgrid T hT
    apply farey_offset_sameSign a b c d G p₁ p₂ t₁ t₂ hb hd hG hdet hsize
    exact abs_le.mpr ⟨by omega,by omega⟩
  have hCandidate (P : ℝ × ℝ) (hP : P ∈ V) (hPu : interceptAt P u ∈ rootIntercepts Q u) :
      movingChord S R w P u ≤ reciprocalSecant r s A B u := by
    have hlo := offset_nonneg_endpoints P L hu (hSigns P L hP hLV) (sub_nonneg.mpr hPu.1)
    have hhi := offset_nonneg_endpoints H P hu (hSigns H P hHV hP) (sub_nonneg.mpr hPu.2)
    apply movingChord_le_reciprocalSecant S R w P hr hrs ⟨hu.1.le,hu.2.le⟩ hR
      (fun T hT => hSigns P T hP (hVV hT))
    · exact hleft _ ⟨sub_nonneg.mp hlo.1,sub_nonneg.mp hhi.1⟩
    · exact hright _ ⟨sub_nonneg.mp hlo.2,sub_nonneg.mp hhi.2⟩
  have hxy := root_intercept_mem Q x y u hupos.le hx hy
  have hI : interceptAt L u ≤ interceptAt H u := hxy.1.trans hxy.2
  apply rectangular_chord_le_of_knots S R w (interceptAt L u) (interceptAt H u)
    (interceptAt (x,y) u) u _ hR hupos hxy
  · exact hCandidate L hLV ⟨le_rfl,hI⟩
  · exact hCandidate H hHV ⟨hI,le_rfl⟩
  · exact fun P hP hPu => hCandidate P (hVV hP) hPu

#print axioms rectangular_chord_le_farey_secant


private theorem reciprocal_branch_const_of_bounded (a b s M : ℝ) (hs : 0 < s)
    (h : ∀ u ∈ Ioc (0:ℝ) s, |a+b/u| ≤ M) : b = 0 := by
  by_contra hn
  have hden : 0 < M+|a|+1 := by
    have hm : 0 ≤ M := (abs_nonneg _).trans (h s ⟨hs,le_rfl⟩)
    positivity
  let u := min (s/2) (|b|/(M+|a|+1))
  have hu : 0 < u := lt_min (by positivity) (div_pos (abs_pos.mpr hn) hden)
  have huS : u ≤ s := (min_le_left _ _).trans (by linarith)
  have hbig := (le_div_iff₀ hden).mp (min_le_right (s/2) (|b|/(M+|a|+1)))
  have hsmall : |b| ≤ (M+|a|)*u := calc
    _ = |(a+b/u-a)*u| := by
      congr 1
      field_simp [hu.ne']
      ring
    _ = |a+b/u-a| * u := by rw [abs_mul,abs_of_pos hu]
    _ ≤ _ := mul_le_mul_of_nonneg_right ((abs_sub _ _).trans (add_le_add (h u ⟨hu,huS⟩) le_rfl)) hu.le
  change u*(M+|a|+1) ≤ |b| at hbig
  nlinarith only [hbig,hsmall,hu]

theorem movingChord_first_bin_le {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (P : ℝ × ℝ) {s u B M : ℝ} (hu : u ∈ Ioc (0:ℝ) s)
    (hR : ∀ i ∈ S, (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1)
    (hSigns : ∀ Q ∈ vertexSet S R, sameSignAt (offsetAt P Q) 0 s)
    (hBound : ∀ v ∈ Ioc (0:ℝ) s, |movingChord S R w P v| ≤ M)
    (hEnd : movingChord S R w P s ≤ B) :
    movingChord S R w P u ≤ B := by
  have hs := hu.1.trans_le hu.2
  obtain ⟨a,b,he⟩ := movingChord_reciprocal_branch S R w P hs hR hSigns
  have hb := reciprocal_branch_const_of_bounded a b s M hs (by
    intro v hv
    rw [← he v ⟨hv.1.le,hv.2⟩ hv.1]
    exact hBound v hv)
  rw [he s ⟨hs.le,le_rfl⟩ hs, hb, zero_div, add_zero] at hEnd
  rw [he u ⟨hu.1.le,hu.2⟩ hu.1, hb, zero_div, add_zero]
  exact hEnd

#print axioms movingChord_first_bin_le


/-- The first Farey bin has a constant bound from its positive endpoint.
The individual moving chords are bounded, forcing their reciprocal
coefficients to vanish. -/
theorem rectangular_chord_le_first_farey_bin {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (Q : Rect) (x y u B M : ℝ) (G : ℤ) (hG : 0 < G)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1)
    (hM : 0 ≤ M) (hsep : RectanglesSeparated S R)
    (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M) (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hgrid : ∀ P ∈ insert (Q.x1,Q.y0) (insert (Q.x0,Q.y1) (vertexSet S R)),
      ∃ X Y : ℤ, 0 ≤ X ∧ X ≤ G ∧ P = ((X:ℝ)/G,(Y:ℝ)/G))
    (hu : u ∈ Ioo (0:ℝ) (1/(G:ℝ)))
    (hright : ∀ v ∈ rootIntercepts Q (1/(G:ℝ)),
      (∫ t : ℝ, rectangleField S R w t (v+(1/(G:ℝ))*t)) ≤ B) :
    movingChord S R w (x,y) u ≤ B := by
  classical
  let s := 1/(G:ℝ)
  let L := (Q.x1,Q.y0)
  let H := (Q.x0,Q.y1)
  let V := insert L (insert H (vertexSet S R))
  have hLV : L ∈ V := Finset.mem_insert_self _ _
  have hHV : H ∈ V := Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)
  have hVV {P : ℝ × ℝ} (hP : P ∈ vertexSet S R) : P ∈ V :=
    Finset.mem_insert_of_mem (Finset.mem_insert_of_mem hP)
  have hSigns (P T : ℝ × ℝ) (hP : P ∈ V) (hT : T ∈ V) :
      sameSignAt (offsetAt P T) 0 s := by
    obtain ⟨p₁,p₂,hp₁,hpG,rfl⟩ := hgrid P hP
    obtain ⟨t₁,t₂,ht₁,htG,rfl⟩ := hgrid T hT
    have h := farey_offset_sameSign 0 1 1 G G p₁ p₂ t₁ t₂
      (by decide) hG hG (by simp) (by omega) (abs_le.mpr ⟨by omega,by omega⟩)
    simpa [s] using h
  have hordered (i : ι) (hi : i ∈ S) : (R i).x0 ≤ (R i).x1 ∧ (R i).y0 ≤ (R i).y1 :=
    ⟨(hR i hi).2.1,(hR i hi).2.2.2.2.1⟩
  have hCandidate (P : ℝ × ℝ) (hP : P ∈ V) (hPu : interceptAt P u ∈ rootIntercepts Q u) :
      movingChord S R w P u ≤ B := by
    have hlo := offset_nonneg_endpoints P L hu (hSigns P L hP hLV) (sub_nonneg.mpr hPu.1)
    have hhi := offset_nonneg_endpoints H P hu (hSigns H P hHV hP) (sub_nonneg.mpr hPu.2)
    apply movingChord_first_bin_le (M := M) S R w P ⟨hu.1,hu.2.le⟩ hordered
      (fun T hT => hSigns P T hP (hVV hT))
    · intro v _
      have h := fieldChord_bounds_all_slopes S R w M P.1 P.2 v hM hsep hw hR
      change 0 ≤ movingChord S R w P v ∧ movingChord S R w P v ≤ M at h
      rw [abs_of_nonneg h.1]
      exact h.2
    · exact hright _ ⟨sub_nonneg.mp hlo.2,sub_nonneg.mp hhi.2⟩
  have hxy := root_intercept_mem Q x y u hu.1.le hx hy
  have hI : interceptAt L u ≤ interceptAt H u := hxy.1.trans hxy.2
  apply rectangular_chord_le_of_knots S R w (interceptAt L u) (interceptAt H u)
    (interceptAt (x,y) u) u _ hordered hu.1 hxy
  · exact hCandidate L hLV ⟨le_rfl,hI⟩
  · exact hCandidate H hHV ⟨hI,le_rfl⟩
  · exact fun P hP hPu => hCandidate P (hVV hP) hPu

#print axioms rectangular_chord_le_first_farey_bin

end NoThreeLine481
