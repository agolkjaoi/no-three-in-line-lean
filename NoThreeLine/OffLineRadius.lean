import NoThreeLine.OffLineDivisors

/-! Position-independent counting in a residue class inside an actual
radius-restricted integer line. No solution of a congruence is assumed. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.OffLineDivisors
open PrimitiveLines GridLineCard

/-- Bounded integer diameter plus one residue class gives the exact floor
upper bound. The least element exists only in the nonempty branch. -/
theorem residue_finset_card_le (S : Finset ℤ) (e M : ℕ) (he : 0 < e)
    (hspan : ∀ s ∈ S, ∀ t ∈ S, s ≤ t → t-s ≤ (M : ℤ))
    (hmod : ∀ s ∈ S, ∀ t ∈ S, (e : ℤ) ∣ t-s) :
    S.card ≤ M/e+1 := by
  classical
  by_cases hS : S.Nonempty
  · let a := S.min' hS
    have ha : a ∈ S := S.min'_mem hS
    let q : ℤ → ℕ := fun t => ((t-a)/(e : ℤ)).toNat
    have hq (t : ℤ) (ht : t ∈ S) : (q t : ℤ)*(e : ℤ)=t-a := by
      have hnonneg : 0 ≤ (t-a)/(e : ℤ) :=
        Int.ediv_nonneg (sub_nonneg.mpr (S.min'_le t ht)) (Int.natCast_nonneg e)
      dsimp [q]
      rw [Int.toNat_of_nonneg hnonneg,Int.ediv_mul_cancel (hmod a ha t ht)]
    have hinj : Set.InjOn q (S : Set ℤ) := by
      intro s hs t ht hst
      have hc := congrArg (fun x : ℕ => (x : ℤ)*(e : ℤ)) hst
      rw [hq s hs,hq t ht] at hc
      omega
    have hmaps : Set.MapsTo q (S : Set ℤ) (Finset.range (M/e+1) : Set ℕ) := by
      intro t ht
      have hp : q t*e ≤ M := by
        have hp' : (q t : ℤ)*(e : ℤ) ≤ M := by
          rw [hq t ht]
          exact hspan a ha t ht (S.min'_le t ht)
        exact_mod_cast hp'
      exact Finset.mem_range.mpr (by have := (Nat.le_div_iff_mul_le he).mpr hp; omega)
    simpa only [Finset.card_range] using Finset.card_le_card_of_injOn q hmaps hinj
  · have hz : S = ∅ := Finset.not_nonempty_iff_eq_empty.mp hS
    simp [hz]

theorem residue_finset_card_mul_le (S : Finset ℤ) (e M : ℕ) (he : 0 < e)
    (hspan : ∀ s ∈ S, ∀ t ∈ S, s ≤ t → t-s ≤ (M : ℤ))
    (hmod : ∀ s ∈ S, ∀ t ∈ S, (e : ℤ) ∣ t-s) :
    e*S.card ≤ M+e := by
  have hc := Nat.mul_le_mul_left e (residue_finset_card_le S e M he hspan hmod)
  have hb := Nat.div_mul_le_self M e
  nlinarith

theorem distance_coordinate_abs_le (p q : ZPoint) (R : ℕ) (hR : distance p q ≤ R) :
    |q.1-p.1| ≤ (R : ℤ) ∧ |q.2-p.2| ≤ (R : ℤ) := by
  have hx : (q.1-p.1).natAbs ≤ R := (le_max_left _ _).trans hR
  have hy : (q.2-p.2).natAbs ≤ R := (le_max_right _ _).trans hR
  constructor
  · rw [← Int.natCast_natAbs]; exact_mod_cast hx
  · rw [← Int.natCast_natAbs]; exact_mod_cast hy

theorem radius_coordinate_span (R : ℕ) (x d s t : ℤ)
    (hs : |x+s*d| ≤ (R : ℤ)) (ht : |x+t*d| ≤ (R : ℤ)) (hst : s ≤ t) :
    (t-s)*(d.natAbs : ℤ) ≤ 2*(R : ℤ) := by
  have hs' := abs_le.mp hs
  have ht' := abs_le.mp ht
  have hb : |(t-s)*d| ≤ 2*(R : ℤ) := by
    rw [abs_le]
    constructor <;> nlinarith
  simpa only [abs_mul,abs_of_nonneg (sub_nonneg.mpr hst),← Int.natCast_natAbs] using hb

theorem radius_parameter_span (a v p : ZPoint) (hv : Primitive v) (R : ℕ)
    (s t : ℤ) (hs : distance p (linePoint a v s) ≤ R)
    (ht : distance p (linePoint a v t) ≤ R) (hst : s ≤ t) :
    t-s ≤ (2*R : ℕ) := by
  have hs' := distance_coordinate_abs_le p (linePoint a v s) R hs
  have ht' := distance_coordinate_abs_le p (linePoint a v t) R ht
  have hx (k : ℤ) : (linePoint a v k).1-p.1=(a.1-p.1)+k*v.1 := by dsimp [linePoint]; ring
  have hy (k : ℤ) : (linePoint a v k).2-p.2=(a.2-p.2)+k*v.2 := by dsimp [linePoint]; ring
  rw [hx s,hy s] at hs'
  rw [hx t,hy t] at ht'
  have hh : (t-s)*(height v : ℤ) ≤ 2*(R : ℤ) := by
    rcases le_total v.1.natAbs v.2.natAbs with h | h
    · simpa only [height,max_eq_right h] using radius_coordinate_span R _ _ s t hs'.2 ht'.2 hst
    · simpa only [height,max_eq_left h] using radius_coordinate_span R _ _ s t hs'.1 ht'.1 hst
  have hhpos : (1 : ℤ) ≤ height v := by exact_mod_cast height_pos v hv
  have hmul := mul_le_mul_of_nonneg_left hhpos (sub_nonneg.mpr hst)
  push_cast
  nlinarith

def radiusParameters (n : ℕ) (a v p : ZPoint) (R : ℕ) : Finset ℤ :=
  (gridLineParameters n a v).filter (fun t => distance p (linePoint a v t) ≤ R)

def divisorParameters (n : ℕ) (a v p : ZPoint) (R e : ℕ) : Finset ℤ := by
  classical
  exact (radiusParameters n a v p R).filter (parameterCongruence a v p e)

theorem divisorParameters_card_mul_le (n : ℕ) (a v p : ZPoint) (hv : Primitive v)
    (R e : ℕ) (he : 0 < e) :
    e*(divisorParameters n a v p R e).card ≤ 2*R+e := by
  classical
  apply residue_finset_card_mul_le _ e (2*R) he
  · intro s hs t ht hst
    exact radius_parameter_span a v p hv R s t
      (Finset.mem_filter.mp (Finset.mem_filter.mp hs).1).2
      (Finset.mem_filter.mp (Finset.mem_filter.mp ht).1).2 hst
  · intro s hs t ht
    exact parameter_difference_dvd a v p hv e s t
      (Finset.mem_filter.mp hs).2 (Finset.mem_filter.mp ht).2

end NoThreeLine.OffLineDivisors

#print axioms NoThreeLine.OffLineDivisors.residue_finset_card_mul_le
#print axioms NoThreeLine.OffLineDivisors.divisorParameters_card_mul_le
