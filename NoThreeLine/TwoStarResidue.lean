import NoThreeLine.OffLineRadius

/-! The initial-edge two-star count: a fixed primitive direction and a fixed
positive displacement divisor leave only one residue class. The diameter
bound retains the height of that direction. No congruence solution or
cardinality estimate is assumed. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.TwoStar
open PrimitiveLines GridLineCard OffLineDivisors

/-- Quotient spacing in a single residue class, with the direction-height
factor retained. The empty set is included. -/
theorem residue_height_card_le (S : Finset ℤ) (f h M : ℕ)
    (hf : 0 < f) (hh : 0 < h)
    (hspan : ∀ s ∈ S, ∀ t ∈ S, s ≤ t → (t-s)*(h : ℤ) ≤ (f : ℤ)*M)
    (hmod : ∀ s ∈ S, ∀ t ∈ S, (f : ℤ) ∣ t-s) :
    S.card ≤ M/h+1 := by
  classical
  by_cases hS : S.Nonempty
  · let a := S.min' hS
    have ha : a ∈ S := S.min'_mem hS
    let q : ℤ → ℕ := fun t => ((t-a)/(f : ℤ)).toNat
    have hq (t : ℤ) (ht : t ∈ S) : (q t : ℤ)*(f : ℤ)=t-a := by
      have hn : 0 ≤ (t-a)/(f : ℤ) :=
        Int.ediv_nonneg (sub_nonneg.mpr (S.min'_le t ht)) (Int.natCast_nonneg f)
      dsimp [q]
      rw [Int.toNat_of_nonneg hn,Int.ediv_mul_cancel (hmod a ha t ht)]
    have hinj : Set.InjOn q (S : Set ℤ) := by
      intro s hs t ht he
      have hc := congrArg (fun x : ℕ => (x : ℤ)*(f : ℤ)) he
      rw [hq s hs,hq t ht] at hc
      omega
    have hmaps : Set.MapsTo q (S : Set ℤ) (Finset.range (M/h+1) : Set ℕ) := by
      intro t ht
      have hfZ : (0 : ℤ) < f := by exact_mod_cast hf
      have hp : (q t : ℤ)*(h : ℤ) ≤ M := by
        apply (mul_le_mul_iff_right₀ hfZ).mp
        calc
          (f : ℤ)*((q t : ℤ)*(h : ℤ)) = ((q t : ℤ)*(f : ℤ))*(h : ℤ) := by ring
          _ = (t-a)*(h : ℤ) := by rw [hq t ht]
          _ ≤ (f : ℤ)*M := hspan a ha t ht (S.min'_le t ht)
      have hpN : q t*h ≤ M := by exact_mod_cast hp
      exact Finset.mem_range.mpr (by have := (Nat.le_div_iff_mul_le hh).mpr hpN; omega)
    simpa only [Finset.card_range] using Finset.card_le_card_of_injOn q hmaps hinj
  · simp [Finset.not_nonempty_iff_eq_empty.mp hS]

theorem radius_parameter_span_height (a u b : ZPoint) (R : ℕ) (s t : ℤ)
    (hs : distance b (linePoint a u s) ≤ R)
    (ht : distance b (linePoint a u t) ≤ R) (hst : s ≤ t) :
    (t-s)*(height u : ℤ) ≤ 2*(R : ℤ) := by
  have hs' := distance_coordinate_abs_le b (linePoint a u s) R hs
  have ht' := distance_coordinate_abs_le b (linePoint a u t) R ht
  have hx (k : ℤ) : (linePoint a u k).1-b.1=(a.1-b.1)+k*u.1 := by dsimp [linePoint]; ring
  have hy (k : ℤ) : (linePoint a u k).2-b.2=(a.2-b.2)+k*u.2 := by dsimp [linePoint]; ring
  rw [hx s,hy s] at hs'
  rw [hx t,hy t] at ht'
  rcases le_total u.1.natAbs u.2.natAbs with h | h
  · simpa only [height,max_eq_right h] using radius_coordinate_span R _ _ s t hs'.2 ht'.2 hst
  · simpa only [height,max_eq_left h] using radius_coordinate_span R _ _ s t hs'.1 ht'.1 hst

/-- Actual grid parameters whose displacement from the second root is
divisible by `f` and has infinity norm at most `f*J`. -/
def divisorHeightParameters (n : ℕ) (a u b : ZPoint) (f J : ℕ) : Finset ℤ :=
  divisorParameters n a u b (f*J) f

theorem divisorHeightParameters_card_le (n : ℕ) (a u b : ZPoint)
    (hu : Primitive u) (f J : ℕ) (hf : 0 < f) :
    (divisorHeightParameters n a u b f J).card ≤ (2*J)/height u+1 := by
  classical
  apply residue_height_card_le _ f (height u) (2*J) hf (height_pos u hu)
  · intro s hs t ht hst
    have hsR := (Finset.mem_filter.mp (Finset.mem_filter.mp hs).1).2
    have htR := (Finset.mem_filter.mp (Finset.mem_filter.mp ht).1).2
    have hb := radius_parameter_span_height a u b (f*J) s t hsR htR hst
    push_cast at hb ⊢
    nlinarith
  · intro s hs t ht
    exact parameter_difference_dvd a u b hu f s t
      (Finset.mem_filter.mp hs).2 (Finset.mem_filter.mp ht).2

theorem divisorHeightParameters_card_mul_le (n : ℕ) (a u b : ZPoint)
    (hu : Primitive u) (f J : ℕ) (hf : 0 < f) :
    (divisorHeightParameters n a u b f J).card * height u ≤ 2*J+height u := by
  have hc := Nat.mul_le_mul_right (height u)
    (divisorHeightParameters_card_le n a u b hu f J hf)
  have hd := Nat.div_mul_le_self (2*J) (height u)
  nlinarith

/-- The divisor index is forced by the actual off-baseline determinant. -/
theorem parameter_divisor_mem (a u b : ZPoint) (f : ℕ) (t : ℤ)
    (hdet : det u (b-a) ≠ 0) (hf : parameterCongruence a u b f t) :
    f ∈ (det u (b-a)).natAbs.divisors := by
  apply Nat.mem_divisors.mpr
  refine ⟨?_,fun h => hdet (Int.natAbs_eq_zero.mp h)⟩
  exact (parameterCongruence_iff_dvd_gcd a u b f t).mp hf |>.trans
    (displacementGcd_dvd_determinant a u b (linePoint a u t) (det_linePoint a u t))

end NoThreeLine.TwoStar

#print axioms NoThreeLine.TwoStar.residue_height_card_le
#print axioms NoThreeLine.TwoStar.divisorHeightParameters_card_le
#print axioms NoThreeLine.TwoStar.parameter_divisor_mem
