import NoThreeLine.TwoStarGridFibers
import Mathlib.Data.Finset.Lattice.Fold

/-! Actual two-star causes in a pair of dyadic height windows. Directions
are counted in an integer square and right-hand gcds in the nonzero
determinant's divisor set. All enlargements occur on the upper-bound side. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.TwoStar
open PrimitiveLines GridLineCard OffLineDivisors GridLines FiniteDirections

def divisorCap (n : ℕ) : ℕ :=
  (Finset.range (2*n^2+1)).sup (fun D => D.divisors.card)

theorem divisor_card_le_cap (n D : ℕ) (hD : D≤2*n^2) :
    D.divisors.card≤divisorCap n :=
  Finset.le_sup (s:=Finset.range (2*n^2+1)) (f:=fun D=>D.divisors.card)
    (Finset.mem_range.mpr (by omega))

def signedWindow (n H : ℕ) : Finset ZPoint := by
  classical
  exact ((Finset.Icc (-(H : ℤ)) H) ×ˢ (Finset.Icc (-(H : ℤ)) H)).filter
    (fun u => Primitive u ∧ height u<n ∧ height u≤H ∧ H≤2*height u)

theorem signedWindow_card_le (n H : ℕ) (hH : 0<H) :
    (signedWindow n H).card≤9*H^2 := by
  classical
  have hc : (signedWindow n H).card≤(2*H+1)^2 := by
    calc
      _ ≤ ((Finset.Icc (-(H : ℤ)) H) ×ˢ (Finset.Icc (-(H : ℤ)) H)).card :=
        Finset.card_filter_le _ _
      _ = (2*H+1)^2 := by
        rw [Finset.card_product,Int.card_Icc]
        have he : ((H : ℤ)+1-(-(H : ℤ))).toNat=2*H+1 := by omega
        rw [he]
        ring
  nlinarith

theorem mem_signedWindow (n H : ℕ) (u : ZPoint) :
    u∈signedWindow n H ↔ Primitive u ∧ height u<n ∧ height u≤H ∧ H≤2*height u := by
  classical
  constructor
  · exact fun h=>(Finset.mem_filter.mp h).2
  · intro h
    apply Finset.mem_filter.mpr
    refine ⟨?_,h⟩
    have hx : u.1.natAbs≤H := (le_max_left _ _).trans h.2.2.1
    have hy : u.2.natAbs≤H := (le_max_right _ _).trans h.2.2.1
    have hxZ : |u.1|≤(H : ℤ) := by rw [←Int.natCast_natAbs]; exact_mod_cast hx
    have hyZ : |u.2|≤(H : ℤ) := by rw [←Int.natCast_natAbs]; exact_mod_cast hy
    exact Finset.mem_product.mpr ⟨Finset.mem_Icc.mpr (abs_le.mp hxZ),
      Finset.mem_Icc.mpr (abs_le.mp hyZ)⟩

def shellCauses {n : ℕ} (a b : Grid n) (H J : ℕ) : Finset (Grid n) :=
  Finset.univ.filter (fun q => orientedArea a b q≠0 ∧
    height (displacementDirection (gridEmbed a) (gridEmbed q))≤H ∧
    H≤2*height (displacementDirection (gridEmbed a) (gridEmbed q)) ∧
    height (displacementDirection (gridEmbed b) (gridEmbed q))≤J ∧
    J≤2*height (displacementDirection (gridEmbed b) (gridEmbed q)))

theorem off_baseline_roots {n : ℕ} (a b q : Grid n) (h : orientedArea a b q≠0) :
    q≠a ∧ q≠b := by
  constructor
  · intro he; subst q; exact h (by simp [orientedArea])
  · intro he; subst q; exact h (by simp [orientedArea]; ring)

def shellCover {n : ℕ} (a b : Grid n) (H J : ℕ) : Finset (Grid n) :=
  (signedWindow n H).biUnion (fun u =>
    (det u (gridEmbed b-gridEmbed a)).natAbs.divisors.biUnion
      (fun f => gridFiber a b u f J))

theorem shellCauses_subset_cover {n : ℕ} (a b : Grid n) (H J : ℕ) :
    shellCauses a b H J ⊆ shellCover a b H J := by
  intro q hq
  have hm := (Finset.mem_filter.mp hq).2
  have hne := off_baseline_roots a b q hm.1
  let u := displacementDirection (gridEmbed a) (gridEmbed q)
  let f := displacementGcd (gridEmbed b) (gridEmbed q)
  have hu : u∈signedWindow n H := (mem_signedWindow n H u).mpr
    ⟨displacementDirection_primitive _ _ (fun h=>hne.1 (gridEmbed_injective n h)),
      displacementDirection_height_lt a q hne.1,hm.2.1,hm.2.2.1⟩
  have hqf : q∈gridFiber a b u f J :=
    Finset.mem_filter.mpr ⟨Finset.mem_univ _,hm.1,rfl,rfl,hm.2.2.2.1⟩
  have hf := (gridFiber_divisor a b u f J ⟨q,hqf⟩).2
  exact Finset.mem_biUnion.mpr ⟨u,hu,Finset.mem_biUnion.mpr ⟨f,hf,hqf⟩⟩

theorem gridFiber_card_mul_window_le {n : ℕ} (a b : Grid n) (u : ZPoint)
    (H J f : ℕ) (hu : u∈signedWindow n H) (hHJ : H≤J) (hf : 0<f) :
    H*(gridFiber a b u f J).card≤6*J := by
  have hm := (mem_signedWindow n H u).mp hu
  have hc := Nat.mul_le_mul_right (height u) (gridFiber_card_le a b u hm.1 f J hf)
  have hd := Nat.div_mul_le_self (2*J) (height u)
  have hch : (gridFiber a b u f J).card*height u≤2*J+height u := by nlinarith
  have hm' := Nat.mul_le_mul_right (gridFiber a b u f J).card hm.2.2.2
  nlinarith [hm.2.2.1.trans hHJ]

theorem shellCauses_card_le_ordered {n : ℕ} (a b : Grid n) (H J : ℕ)
    (hH : 0<H) (hHJ : H≤J) :
    (shellCauses a b H J).card≤54*H*J*divisorCap n := by
  have hc : (shellCauses a b H J).card ≤
      ∑ u∈signedWindow n H, ∑ f∈(det u (gridEmbed b-gridEmbed a)).natAbs.divisors,
        (gridFiber a b u f J).card := by
    calc
      _ ≤ (shellCover a b H J).card := Finset.card_le_card (shellCauses_subset_cover a b H J)
      _ ≤ ∑ u∈signedWindow n H,
          ((det u (gridEmbed b-gridEmbed a)).natAbs.divisors.biUnion
            (fun f=>gridFiber a b u f J)).card := Finset.card_biUnion_le
      _ ≤ _ := Finset.sum_le_sum (fun _ _ => Finset.card_biUnion_le)
  have hm : H*(shellCauses a b H J).card≤H*(54*H*J*divisorCap n) := by
    calc
      _ ≤ H*(∑ u∈signedWindow n H, ∑ f∈(det u (gridEmbed b-gridEmbed a)).natAbs.divisors,
          (gridFiber a b u f J).card) := Nat.mul_le_mul_left H hc
      _ = ∑ u∈signedWindow n H, ∑ f∈(det u (gridEmbed b-gridEmbed a)).natAbs.divisors,
          H*(gridFiber a b u f J).card := by simp only [Finset.mul_sum]
      _ ≤ ∑ _u∈signedWindow n H, 6*J*divisorCap n := by
        apply Finset.sum_le_sum
        intro u hu
        calc
          _ ≤ ∑ _f∈(det u (gridEmbed b-gridEmbed a)).natAbs.divisors, 6*J :=
            Finset.sum_le_sum (fun f hf=>gridFiber_card_mul_window_le a b u H J f hu hHJ
              (Nat.pos_of_mem_divisors hf))
          _ = 6*J*((det u (gridEmbed b-gridEmbed a)).natAbs.divisors.card) := by
            simp only [Finset.sum_const,nsmul_eq_mul,Nat.cast_id]; ring
          _ ≤ 6*J*divisorCap n := Nat.mul_le_mul_left _ (divisor_card_le_cap n _
            (grid_determinant_le a b u ((mem_signedWindow n H u).mp hu).2.1.le))
      _ = (signedWindow n H).card*(6*J*divisorCap n) := by simp only [Finset.sum_const,nsmul_eq_mul,Nat.cast_id]
      _ ≤ (9*H^2)*(6*J*divisorCap n) := Nat.mul_le_mul_right _ (signedWindow_card_le n H hH)
      _ = _ := by ring
  exact Nat.le_of_mul_le_mul_left hm hH

theorem shellCauses_swap {n : ℕ} (a b : Grid n) (H J : ℕ) :
    shellCauses a b H J=shellCauses b a J H := by
  ext q
  have harea : orientedArea b a q = -orientedArea a b q := by dsimp [orientedArea]; ring
  simp only [shellCauses,Finset.mem_filter,Finset.mem_univ,true_and,harea,neg_ne_zero]
  tauto

theorem shellCauses_card_le {n : ℕ} (a b : Grid n) (H J : ℕ)
    (hH : 0<H) (hJ : 0<J) :
    (shellCauses a b H J).card≤54*H*J*divisorCap n := by
  rcases le_total H J with h | h
  · exact shellCauses_card_le_ordered a b H J hH h
  · rw [shellCauses_swap]
    simpa only [mul_assoc,mul_left_comm,mul_comm] using shellCauses_card_le_ordered b a J H hJ h

end NoThreeLine.TwoStar

#print axioms NoThreeLine.TwoStar.shellCauses_subset_cover
#print axioms NoThreeLine.TwoStar.shellCauses_card_le
