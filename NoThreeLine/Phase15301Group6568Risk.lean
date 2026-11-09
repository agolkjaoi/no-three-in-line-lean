import NoThreeLine.Phase15301OrbitLeaf
import NoThreeLine.Phase15301Group6568Family00IntervalNormalized
import NoThreeLine.Phase15301Group6568Family01IntervalNormalized
import NoThreeLine.Phase15301Group6568Family02IntervalNormalized
import NoThreeLine.Phase15301Group6568Family03IntervalNormalized
import NoThreeLine.Phase15301Group6568Family10IntervalNormalized
import NoThreeLine.Phase15301Group6568Family11IntervalNormalized
import NoThreeLine.Phase15301Group6568Family12IntervalNormalized
import NoThreeLine.Phase15301Group6568Family13IntervalNormalized
import NoThreeLine.Phase15301Group6568Family20IntervalNormalized
import NoThreeLine.Phase15301Group6568Family21IntervalNormalized
import NoThreeLine.Phase15301Group6568Family22IntervalNormalized
import NoThreeLine.Phase15301Group6568Family23IntervalNormalized

/-! An enclosing parent box for actual leaves 65 through 68 of phase 15301, using twelve new-root
full-field kernel certificates. The original risk definitions are shared
because the reference fields are identical; the previous root's numerical
bound is not used. Frozen-prefix equality holds after common-grid erasure.
Actual accepted-prefix transfer keeps its explicit schedule hypotheses. -/
set_option autoImplicit false
open MeasureTheory
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.Phase15301Group6568
open FinitePhase FrozenReference BenchmarkAccepted Phase15301AcceptedLeaf

def familyBound : Fin 3 → Fin 4 → ℚ := ![![(1117210671143617495/576460752303423488:ℚ),(48579803124198698459/9223372036854775808:ℚ),(4303041400692401931/18446744073709551616:ℚ),(55635065930274942445/9223372036854775808:ℚ)],![(19541828250889396937/9223372036854775808:ℚ),(94407133796121929741/18446744073709551616:ℚ),(1234159144614908933/4611686018427387904:ℚ),(109722716431852833137/18446744073709551616:ℚ)],![(46133574256683362875/18446744073709551616:ℚ),(74156879017674652773/18446744073709551616:ℚ),(5454595920511903141/9223372036854775808:ℚ),(25169615774549588125/4611686018427387904:ℚ)] ]

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

end NoThreeLine.Phase15301Group6568

#print axioms NoThreeLine.Phase15301Group6568.rational_risk_accepted
#print axioms NoThreeLine.Phase15301Group6568.uniform_direct_risk
#print axioms NoThreeLine.Phase15301Group6568.uniform_actual_orbit_risk
#print axioms NoThreeLine.Phase15301Group6568.actual_leaf_frozen_risk
#print axioms NoThreeLine.Phase15301Group6568.actual_leaf_actual_risk
