import NoThreeLine.Phase15301OrbitLeaf
import NoThreeLine.Phase15301Group4750Family00IntervalNormalized
import NoThreeLine.Phase15301Group4750Family01IntervalNormalized
import NoThreeLine.Phase15301Group4750Family02IntervalNormalized
import NoThreeLine.Phase15301Group4750Family03IntervalNormalized
import NoThreeLine.Phase15301Group4750Family10IntervalNormalized
import NoThreeLine.Phase15301Group4750Family11IntervalNormalized
import NoThreeLine.Phase15301Group4750Family12IntervalNormalized
import NoThreeLine.Phase15301Group4750Family13IntervalNormalized
import NoThreeLine.Phase15301Group4750Family20IntervalNormalized
import NoThreeLine.Phase15301Group4750Family21IntervalNormalized
import NoThreeLine.Phase15301Group4750Family22IntervalNormalized
import NoThreeLine.Phase15301Group4750Family23IntervalNormalized

/-! An enclosing parent box for actual leaves 47 through 50 of phase 15301, using twelve new-root
full-field kernel certificates. The original risk definitions are shared
because the reference fields are identical; the previous root's numerical
bound is not used. Frozen-prefix equality holds after common-grid erasure.
Actual accepted-prefix transfer keeps its explicit schedule hypotheses. -/
set_option autoImplicit false
open MeasureTheory
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.Phase15301Group4750
open FinitePhase FrozenReference BenchmarkAccepted Phase15301AcceptedLeaf

def familyBound : Fin 3 → Fin 4 → ℚ := ![![(36044987584767244357/18446744073709551616:ℚ),(24268814554881521781/4611686018427387904:ℚ),(974630003544744891/4611686018427387904:ℚ),(27917248221507157333/4611686018427387904:ℚ)],![(19700131387314316927/9223372036854775808:ℚ),(94306287538675315719/18446744073709551616:ℚ),(4476878775943390757/18446744073709551616:ℚ),(110180526273276571007/18446744073709551616:ℚ)],![(11570522306401593469/4611686018427387904:ℚ),(74092655300493625469/18446744073709551616:ℚ),(5165382373752732963/9223372036854775808:ℚ),(25187819593939730369/4611686018427387904:ℚ)] ]

theorem rational_risk_accepted :
    Phase15301Leaf.riskWeight*(∑j : Fin 3,∑f : Fin 4,familyBound j f)<Phase15301Leaf.threshold := by
  decide +kernel

theorem family_integral_le (j : Fin 3) (f : Fin 4) (x y : ℝ)
    (hx : x∈Set.Icc (root.x0 : ℝ) root.x1)
    (hy : y∈Set.Icc (root.y0 : ℝ) root.y1) :
    (∫u in (0 : ℝ)..1,(directionalChord f (Phase15301Leaf.fields j) x y u)^2)≤(familyBound j f : ℝ) := by
  fin_cases j <;> fin_cases f
  · exact Family00.IntervalNormalized.original_directional_integral_bound x y hx hy
  · exact Family01.IntervalNormalized.original_directional_integral_bound x y hx hy
  · exact Family02.IntervalNormalized.original_directional_integral_bound x y hx hy
  · exact Family03.IntervalNormalized.original_directional_integral_bound x y hx hy
  · exact Family10.IntervalNormalized.original_directional_integral_bound x y hx hy
  · exact Family11.IntervalNormalized.original_directional_integral_bound x y hx hy
  · exact Family12.IntervalNormalized.original_directional_integral_bound x y hx hy
  · exact Family13.IntervalNormalized.original_directional_integral_bound x y hx hy
  · exact Family20.IntervalNormalized.original_directional_integral_bound x y hx hy
  · exact Family21.IntervalNormalized.original_directional_integral_bound x y hx hy
  · exact Family22.IntervalNormalized.original_directional_integral_bound x y hx hy
  · exact Family23.IntervalNormalized.original_directional_integral_bound x y hx hy

theorem uniform_direct_risk (x y : ℝ)
    (hx : x∈Set.Icc (root.x0 : ℝ) root.x1)
    (hy : y∈Set.Icc (root.y0 : ℝ) root.y1) :
    Phase15301Leaf.directRisk x y<(Phase15301Leaf.threshold : ℝ) := by
  have hs : (∑j : Fin 3,∑f : Fin 4,
      ∫u in (0 : ℝ)..1,(directionalChord f (Phase15301Leaf.fields j) x y u)^2)≤
      ∑j : Fin 3,∑f : Fin 4,(familyBound j f : ℝ) :=
    Finset.sum_le_sum (fun j _=>Finset.sum_le_sum (fun f _=>family_integral_le j f x y hx hy))
  have hw : (0 : ℝ)≤(Phase15301Leaf.riskWeight : ℝ) := by
    norm_num [Phase15301Leaf.riskWeight,Phase15301Leaf.sieveDensityBound,Phase15301Leaf.densityScale]
  unfold Phase15301Leaf.directRisk
  apply lt_of_le_of_lt (mul_le_mul_of_nonneg_left hs hw)
  exact_mod_cast rational_risk_accepted

theorem uniform_frozen_reference_risk (x y : ℝ)
    (hx : x∈Set.Icc (root.x0 : ℝ) root.x1)
    (hy : y∈Set.Icc (root.y0 : ℝ) root.y1) :
    Phase15301FrozenLeaf.frozenRisk x y<(Phase15301Leaf.threshold : ℝ) := by
  rw [frozenRisk_eq_directRisk]
  exact uniform_direct_risk x y hx hy

theorem uniform_frozen_orbit_risk (f : Fin 4) (x y : ℝ)
    (hx : x∈Set.Icc ((root.symmetry f).x0 : ℝ) (root.symmetry f).x1)
    (hy : y∈Set.Icc ((root.symmetry f).y0 : ℝ) (root.symmetry f).y1) :
    Phase15301FrozenLeaf.frozenRisk x y<(Phase15301Leaf.threshold : ℝ) :=
  BenchmarkSymmetry.root_box_bound_symmetry root Phase15301FrozenLeaf.frozenRisk _
    Phase15301OrbitLeaf.frozenRisk_symmetry uniform_frozen_reference_risk f x y hx hy

theorem uniform_actual_orbit_risk {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀i,PhaseMatches (a i) (index i)) (hi : StrictMono index)
    (hd : ∀i,s.duration i≤(Phase15301Leaf.densityScale : ℝ)*
      ((phaseUnits (index i) : ℝ)/100000000))
    (k : Fin J) (hkl : index k≤15301) (T : ℝ) (hT : 0≤T) (hTk : T≤s.hi k)
    (f : Fin 4) (x y : ℝ)
    (hx : x∈Set.Icc ((root.symmetry f).x0 : ℝ) (root.symmetry f).x1)
    (hy : y∈Set.Icc ((root.symmetry f).y0 : ℝ) (root.symmetry f).y1) :
    actualRisk s a T x y<(Phase15301Leaf.threshold : ℝ) :=
  (actualRisk_le_frozenRisk s a index hm hi hd k hkl T hT hTk x y).trans_lt
    (uniform_frozen_orbit_risk f x y hx hy)

theorem actual_leaf_frozen_risk (i f : Fin 4) (x y : ℝ)
    (h : (x,y)∈(imageBox i f).real.closedSet) :
    Phase15301FrozenLeaf.frozenRisk x y<(Phase15301Leaf.threshold : ℝ) := by
  have hh := image_subset_root i f h
  exact uniform_frozen_orbit_risk f x y hh.1 hh.2

theorem actual_leaf_actual_risk {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀i,PhaseMatches (a i) (index i)) (hi : StrictMono index)
    (hd : ∀i,s.duration i≤(Phase15301Leaf.densityScale : ℝ)*
      ((phaseUnits (index i) : ℝ)/100000000))
    (k : Fin J) (hkl : index k≤15301) (T : ℝ) (hT : 0≤T) (hTk : T≤s.hi k)
    (i f : Fin 4) (x y : ℝ) (h : (x,y)∈(imageBox i f).real.closedSet) :
    actualRisk s a T x y<(Phase15301Leaf.threshold : ℝ) := by
  have hh := image_subset_root i f h
  exact uniform_actual_orbit_risk s a index hm hi hd k hkl T hT hTk f x y hh.1 hh.2

end NoThreeLine.Phase15301Group4750

#print axioms NoThreeLine.Phase15301Group4750.rational_risk_accepted
#print axioms NoThreeLine.Phase15301Group4750.uniform_direct_risk
#print axioms NoThreeLine.Phase15301Group4750.uniform_actual_orbit_risk
#print axioms NoThreeLine.Phase15301Group4750.actual_leaf_frozen_risk
#print axioms NoThreeLine.Phase15301Group4750.actual_leaf_actual_risk
