import NoThreeLine.AffineBranch

/-! Analytical bounds for the replay. The hypotheses relating the finite
sweep to actual grid fields still have to be supplied by a certified
geometric checker. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped Interval

namespace NoThreeLine481

theorem tube_chord_bound
    (field dilated : ℝ → ℝ → ℝ) (x y u center radius : ℝ)
    (hx : x ∈ Icc (0 : ℝ) 1) (hu : |u-center| ≤ radius)
    (hf : Integrable (fun t => field t (y+u*(t-x))))
    (hg : Integrable (fun t => dilated t (y+center*(t-x))))
    (hsupport : ∀ t ∉ Icc (0 : ℝ) 1, ∀ z, field t z = 0)
    (hdilated : ∀ t z, 0 ≤ dilated t z)
    (hupper : ∀ t z w, |z-w| ≤ radius → field t z ≤ dilated t w) :
    (∫ t, field t (y+u*(t-x))) ≤ ∫ t, dilated t (y+center*(t-x)) := by
  apply integral_mono hf hg
  intro t
  by_cases ht : t ∈ Icc (0 : ℝ) 1
  · have htx : |t-x| ≤ 1 := abs_le.mpr ⟨by linarith [ht.1, hx.2], by linarith [ht.2, hx.1]⟩
    apply hupper
    rw [show y+u*(t-x)-(y+center*(t-x)) = (u-center)*(t-x) by ring, abs_mul]
    calc
      |u-center| * |t-x| ≤ |u-center| * 1 := mul_le_mul_of_nonneg_left htx (abs_nonneg _)
      _ ≤ radius := by simpa using hu
  · change field t (y+u*(t-x)) ≤ dilated t (y+center*(t-x))
    rw [hsupport t ht]
    exact hdilated t _

theorem constant_bin_square_bound (f : ℝ → ℝ) (r s U : ℝ)
    (hrs : r ≤ s) (hi : IntervalIntegrable (fun u => (f u)^2) volume r s)
    (h : ∀ u ∈ Ioo r s, 0 ≤ f u ∧ f u ≤ U) :
    (∫ u in r..s, (f u)^2) ≤ (s-r)*U^2 := by
  have hmono := intervalIntegral.integral_mono_on_of_le_Ioo hrs hi
    (intervalIntegrable_const : IntervalIntegrable (fun _ : ℝ => U^2) volume r s)
    (fun u hu => pow_le_pow_left₀ (h u hu).1 (h u hu).2 2)
  simpa [intervalIntegral.integral_const, smul_eq_mul] using hmono

noncomputable def reciprocalSecant (r s A B u : ℝ) : ℝ :=
  (s*B-r*A)/(s-r) + ((A-B)*r*s/(s-r))/u

/-- Any candidate of the form a+b/u with bounded endpoint values lies
below the reciprocal-coordinate secant of the endpoint bounds. -/
theorem branch_le_reciprocal_secant (a b r s A B u : ℝ)
    (hr : 0 < r) (hrs : r < s) (hu : u ∈ Icc r s)
    (hl : a+b/r ≤ A) (hh : a+b/s ≤ B) :
    a+b/u ≤ reciprocalSecant r s A B u := by
  have hs : 0 < s := hr.trans hrs
  have hupos : 0 < u := hr.trans_le hu.1
  have hd := sub_pos.mpr hrs
  let t := r*(s-u)/(u*(s-r))
  have ht0 : 0 ≤ t := div_nonneg (mul_nonneg hr.le (sub_nonneg.mpr hu.2)) (mul_pos hupos hd).le
  have ht1 : t ≤ 1 := by
    apply (div_le_iff₀ (mul_pos hupos hd)).mpr
    nlinarith [mul_nonneg hs.le (sub_nonneg.mpr hu.1)]
  calc
    a+b/u = t*(a+b/r)+(1-t)*(a+b/s) := by
      dsimp [t]
      field_simp [hr.ne',hs.ne',hupos.ne',hd.ne']
      ring
    _ ≤ t*A+(1-t)*B := add_le_add (mul_le_mul_of_nonneg_left hl ht0)
      (mul_le_mul_of_nonneg_left hh (sub_nonneg.mpr ht1))
    _ = reciprocalSecant r s A B u := by
      dsimp [t,reciprocalSecant]
      field_simp [hupos.ne',hd.ne']
      ring

/-- If the two endpoints have determinant one, a fraction strictly
between them must have denominator at least their denominator sum. -/
theorem farey_denominator_lower_bound (a b c d p q : ℤ)
    (hb : 0 < b) (hd : 0 < d) (hdet : b*c-a*d = 1)
    (hleft : a*q < b*p) (hright : d*p < c*q) : b+d ≤ q := by
  have h₁ : 1 ≤ b*p-a*q := by omega
  have h₂ : 1 ≤ c*q-d*p := by omega
  calc
    b+d ≤ d*(b*p-a*q)+b*(c*q-d*p) := by
      simpa [add_comm] using add_le_add
        (mul_le_mul_of_nonneg_left h₁ hd.le)
        (mul_le_mul_of_nonneg_left h₂ hb.le)
    _ = q := by calc
      _ = (b*c-a*d)*q := by ring
      _ = q := by rw [hdet, one_mul]

/-- No grid-vertex comparison changes sign strictly between two adjacent
Farey cuts. Here m is the difference of the integer x-coordinates. -/
theorem farey_grid_sign (a b c d m k G : ℤ)
    (hb : 0 < b) (hd : 0 < d) (hdet : b*c-a*d = 1)
    (hsize : G < b+d) (hm : |m| ≤ G) :
    (0 ≤ m*a+k*b ∧ 0 ≤ m*c+k*d) ∨
      (m*a+k*b ≤ 0 ∧ m*c+k*d ≤ 0) := by
  let L := m*a+k*b
  let R := m*c+k*d
  change (0 ≤ L ∧ 0 ≤ R) ∨ (L ≤ 0 ∧ R ≤ 0)
  by_contra! h
  have hop : (L < 0 ∧ 0 < R) ∨ (R < 0 ∧ 0 < L) := by omega
  rcases hop with ⟨hl,hr⟩ | ⟨hr,hl⟩
  · have hq := farey_denominator_lower_bound a b c d (-k) m hb hd hdet
      (by dsimp [L] at hl; nlinarith) (by dsimp [R] at hr; nlinarith)
    exact (not_lt_of_ge (hq.trans (abs_le.mp hm).2)) hsize
  · have hq := farey_denominator_lower_bound a b c d k (-m) hb hd hdet
      (by dsimp [L] at hl; nlinarith) (by dsimp [R] at hr; nlinarith)
    have hm' : -m ≤ G := by linarith [(abs_le.mp hm).1]
    exact (not_lt_of_ge (hq.trans hm')) hsize

theorem ceil_div_mul_bound (num den : ℤ) (hd : 0 < den) :
    num ≤ ((num+den-1)/den)*den := by
  have h := Int.emod_add_ediv_mul (num+den-1) den
  have hr := Int.emod_lt_of_pos (num+den-1) hd
  omega

/-- A Farey bin bound from rounded endpoint values, once the reciprocal
secant dominates the chord throughout the open bin. -/
theorem farey_bin_square_bound (f : ℝ → ℝ) (r s A B : ℝ)
    (hr : 0 < r) (hrs : r < s) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (hi : IntervalIntegrable (fun u => (f u)^2) volume r s)
    (h : ∀ u ∈ Ioo r s, 0 ≤ f u ∧ f u ≤ reciprocalSecant r s A B u) :
    let v := (s-r)/(r+s)^2
    let X := if B ≤ A then A else A+(B-A)*s*v
    let Y := if B ≤ A then B else B+(B-A)*r*v
    (∫ u in r..s, (f u)^2) ≤
      min ((s-r)*max (A^2) (B^2)) ((s-r)/3*(X^2+X*Y+Y^2)) := by
  let a := (s*B-r*A)/(s-r)
  let b := (A-B)*r*s/(s-r)
  have hs : 0 < s := hr.trans hrs
  have hd : s-r ≠ 0 := sub_ne_zero.mpr hrs.ne'
  have hm : r+s ≠ 0 := ne_of_gt (add_pos hr hs)
  have hleft : a+b/r=A := by dsimp [a,b]; field_simp [hr.ne', hd]; ring
  have hright : a+b/s=B := by dsimp [a,b]; field_simp [hs.ne', hd]; ring
  have hc : ContinuousOn (fun u : ℝ => a+b/u) (Icc r s) := by
    apply continuousOn_const.add
    apply continuousOn_const.div continuousOn_id
    intro u hu
    exact ne_of_gt (hr.trans_le hu.1)
  have hsec := intervalIntegral.integral_mono_on_of_le_Ioo hrs.le hi
    ((hc.pow 2).intervalIntegrable_of_Icc hrs.le)
    (fun u hu => pow_le_pow_left₀ (h u hu).1 (h u hu).2 2)
  have hbound := NoThreeLineSecondFollowup.concrete_branch_integral_soundness a b r s
    hr hrs (hleft ▸ hA) (hright ▸ hB)
  rw [hleft, hright] at hbound
  have hb : 0 ≤ b ↔ B ≤ A := by
    dsimp [b]
    rw [le_div_iff₀ (sub_pos.mpr hrs), zero_mul, mul_nonneg_iff_of_pos_right hs,
      mul_nonneg_iff_of_pos_right hr, sub_nonneg]
  have endpoints :
      NoThreeLineSecondFollowup.alpha a b r s + NoThreeLineSecondFollowup.beta b r s*r =
        (if B ≤ A then A else A+(B-A)*s*((s-r)/(r+s)^2)) ∧
      NoThreeLineSecondFollowup.alpha a b r s + NoThreeLineSecondFollowup.beta b r s*s =
        (if B ≤ A then B else B+(B-A)*r*((s-r)/(r+s)^2)) := by
    unfold NoThreeLineSecondFollowup.alpha NoThreeLineSecondFollowup.beta
    by_cases hBA : B ≤ A
    · simp only [if_pos (hb.mpr hBA), if_pos hBA]
      constructor <;> dsimp [a,b] <;> field_simp [hr.ne',hs.ne',hd,hm] <;> ring
    · simp only [if_neg (mt hb.mp hBA), if_neg hBA]
      constructor <;> dsimp [a,b] <;> field_simp [hr.ne',hs.ne',hd,hm] <;> ring
  rw [endpoints.1,endpoints.2] at hbound
  exact hsec.trans hbound

#print axioms tube_chord_bound
#print axioms constant_bin_square_bound
#print axioms branch_le_reciprocal_secant
#print axioms farey_denominator_lower_bound
#print axioms farey_grid_sign
#print axioms ceil_div_mul_bound
#print axioms farey_bin_square_bound

end NoThreeLine481
