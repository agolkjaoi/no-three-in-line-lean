import NoThreeLine.TwoStarResidue
import NoThreeLine.PairLineLength

/-! Canonical signed primitive directions and actual off-baseline grid
fibers for the two-star initial edge. Cardinal bounds come from the
integer residue proof; neither solvability nor a geometric count is an input. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.TwoStar
open PrimitiveLines GridLineCard OffLineDivisors GridLines FiniteDirections

def displacementDirection (p q : ZPoint) : ZPoint :=
  ((q.1-p.1)/(displacementGcd p q : ℤ), (q.2-p.2)/(displacementGcd p q : ℤ))

theorem displacementDirection_primitive (p q : ZPoint) (hne : q≠p) :
    Primitive (displacementDirection p q) :=
  Int.gcd_div_gcd_div_gcd (displacementGcd_pos p q hne)

theorem displacementDirection_scale (p q : ZPoint) :
    q=linePoint p (displacementDirection p q) (displacementGcd p q) := by
  apply Prod.ext
  · have h := Int.ediv_mul_cancel (displacementGcd_dvd_x p q)
    dsimp [linePoint,displacementDirection]
    nlinarith
  · have h := Int.ediv_mul_cancel (displacementGcd_dvd_y p q)
    dsimp [linePoint,displacementDirection]
    nlinarith

theorem distance_eq_direction_height (p q : ZPoint) :
    distance p q=height (displacementDirection p q)*displacementGcd p q := by
  have hs := displacementDirection_scale p q
  have hx : q.1-p.1=(displacementDirection p q).1*(displacementGcd p q : ℤ) := by
    have := congrArg Prod.fst hs
    dsimp [linePoint] at this
    nlinarith
  have hy : q.2-p.2=(displacementDirection p q).2*(displacementGcd p q : ℤ) := by
    have := congrArg Prod.snd hs
    dsimp [linePoint] at this
    nlinarith
  dsimp [distance,height]
  simp only [Prod.fst_sub,Prod.snd_sub,hx,hy,Int.natAbs_mul,Int.natAbs_natCast]
  exact (max_mul _ _ _).symm

theorem displacementDirection_height_lt {n : ℕ} (p q : Grid n) (hne : q≠p) :
    height (displacementDirection (gridEmbed p) (gridEmbed q))<n := by
  have hg : 1≤displacementGcd (gridEmbed p) (gridEmbed q) :=
    displacementGcd_pos _ _ (fun h=>hne (gridEmbed_injective n h))
  have hd := grid_difference_natAbs_lt p q
  have hb : distance (gridEmbed p) (gridEmbed q)<n := max_lt hd.1 hd.2
  rw [distance_eq_direction_height] at hb
  have hh := Nat.mul_le_mul_left (height (displacementDirection (gridEmbed p) (gridEmbed q))) hg
  exact lt_of_le_of_lt (by simpa only [mul_one] using hh) hb

theorem off_baseline_direction_det {n : ℕ} (a b q : Grid n)
    (h : orientedArea a b q≠0) :
    det (displacementDirection (gridEmbed a) (gridEmbed q)) (gridEmbed b-gridEmbed a)≠0 := by
  have hs := displacementDirection_scale (gridEmbed a) (gridEmbed q)
  have hx := congrArg Prod.fst hs
  have hy := congrArg Prod.snd hs
  dsimp [linePoint] at hx hy
  intro he
  apply h
  rw [orientedArea_eq_det]
  dsimp [det] at he ⊢
  rw [hx,hy]
  linear_combination -(displacementGcd (gridEmbed a) (gridEmbed q) : ℤ)*he

/-- The actual cause bucket: left primitive direction, right displacement
gcd and right primitive-height cap. Roots and all baseline points are excluded. -/
def gridFiber {n : ℕ} (a b : Grid n) (u : ZPoint) (f J : ℕ) : Finset (Grid n) :=
  Finset.univ.filter (fun q => orientedArea a b q≠0 ∧
    displacementDirection (gridEmbed a) (gridEmbed q)=u ∧
    displacementGcd (gridEmbed b) (gridEmbed q)=f ∧
    height (displacementDirection (gridEmbed b) (gridEmbed q))≤J)

theorem gridFiber_parameter_mem {n : ℕ} (a b : Grid n) (u : ZPoint)
    (hu : Primitive u) (f J : ℕ) (q : Grid n) (hq : q∈gridFiber a b u f J) :
    parameter (gridEmbed a) u (gridEmbed q) ∈
      divisorHeightParameters n (gridEmbed a) u (gridEmbed b) f J := by
  classical
  have hm := (Finset.mem_filter.mp hq).2
  have hs := displacementDirection_scale (gridEmbed a) (gridEmbed q)
  rw [hm.2.1] at hs
  have hline : q∈gridLinePoints n (gridEmbed a) u := by
    apply (mem_gridLinePoints _ _ _).mpr
    rw [hs]
    exact det_linePoint _ _ _
  have hp := linePoint_parameter (gridEmbed a) u (gridEmbed q) hu
    ((mem_gridLinePoints _ _ _).mp hline)
  have hd : distance (gridEmbed b) (gridEmbed q)≤f*J := by
    rw [distance_eq_direction_height,hm.2.2.1]
    simpa only [mul_comm] using Nat.mul_le_mul_right f hm.2.2.2
  unfold divisorHeightParameters divisorParameters radiusParameters
  apply Finset.mem_filter.mpr
  refine ⟨Finset.mem_filter.mpr ⟨Finset.mem_image.mpr ⟨q,hline,rfl⟩,?_⟩,?_⟩
  · simpa only [←hp] using hd
  · rw [parameterCongruence_iff_dvd_gcd,←hp,hm.2.2.1]

theorem gridFiber_card_le {n : ℕ} (a b : Grid n) (u : ZPoint)
    (hu : Primitive u) (f J : ℕ) (hf : 0<f) :
    (gridFiber a b u f J).card≤(2*J)/height u+1 := by
  have hinj : Set.InjOn (fun q:Grid n=>parameter (gridEmbed a) u (gridEmbed q))
      (gridFiber a b u f J : Set (Grid n)) := by
    intro q hq r hr he
    have hs (s : Grid n) (hs : s∈gridFiber a b u f J) :
        s∈gridLinePoints n (gridEmbed a) u := by
      apply (mem_gridLinePoints _ _ _).mpr
      have h := displacementDirection_scale (gridEmbed a) (gridEmbed s)
      rw [(Finset.mem_filter.mp hs).2.2.1] at h
      rw [h]
      exact det_linePoint _ _ _
    exact parameter_injective_on_gridLine n (gridEmbed a) u hu (hs q hq) (hs r hr) he
  exact (Finset.card_le_card_of_injOn _
    (fun q hq=>gridFiber_parameter_mem a b u hu f J q hq) hinj).trans
    (divisorHeightParameters_card_le n (gridEmbed a) u (gridEmbed b) hu f J hf)

theorem gridFiber_divisor {n : ℕ} (a b : Grid n) (u : ZPoint) (f J : ℕ)
    (h : (gridFiber a b u f J).Nonempty) :
    det u (gridEmbed b-gridEmbed a)≠0 ∧
    f∈(det u (gridEmbed b-gridEmbed a)).natAbs.divisors := by
  obtain ⟨q,hq⟩ := h
  have hm := (Finset.mem_filter.mp hq).2
  have hd := off_baseline_direction_det a b q hm.1
  rw [hm.2.1] at hd
  refine ⟨hd,?_⟩
  rw [←hm.2.2.1]
  apply displacementGcd_mem_divisors (gridEmbed a) u (gridEmbed b) (gridEmbed q) hd
  have hs := displacementDirection_scale (gridEmbed a) (gridEmbed q)
  rw [hm.2.1] at hs
  rw [hs]
  exact det_linePoint _ _ _

end NoThreeLine.TwoStar

#print axioms NoThreeLine.TwoStar.displacementDirection_primitive
#print axioms NoThreeLine.TwoStar.gridFiber_card_le
#print axioms NoThreeLine.TwoStar.gridFiber_divisor
