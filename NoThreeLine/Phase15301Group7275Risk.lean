import NoThreeLine.Phase15301OrbitLeaf
import NoThreeLine.Phase15301Group7275Family00
import NoThreeLine.Phase15301Group7275Family01
import NoThreeLine.Phase15301Group7275Family02
import NoThreeLine.Phase15301Group7275Family03
import NoThreeLine.Phase15301Group7275Family10
import NoThreeLine.Phase15301Group7275Family11
import NoThreeLine.Phase15301Group7275Family12
import NoThreeLine.Phase15301Group7275Family13
import NoThreeLine.Phase15301Group7275Family20
import NoThreeLine.Phase15301Group7275Family21
import NoThreeLine.Phase15301Group7275Family22
import NoThreeLine.Phase15301Group7275Family23

/-! An enclosing parent box for actual leaves 72 through 75 of phase 15301, using twelve new-root
full-field kernel certificates. The original risk definitions are shared
because the reference fields are identical; the previous root's numerical
bound is not used. Frozen-prefix equality holds after common-grid erasure.
Actual accepted-prefix transfer keeps its explicit schedule hypotheses. -/
set_option autoImplicit false
open MeasureTheory
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.Phase15301Group7275
open FinitePhase FrozenReference BenchmarkAccepted Phase15301AcceptedLeaf

def familyBound : Fin 3 → Fin 4 → ℚ := ![![(35841426820386785565/18446744073709551616:ℚ),(1516680605534252103/288230376151711744:ℚ),(1079093857903618755/4611686018427387904:ℚ),(6953832454913491003/1152921504606846976:ℚ)],![(39187333466401451897/18446744073709551616:ℚ),(47159105596637006005/9223372036854775808:ℚ),(4951383849517872149/18446744073709551616:ℚ),(27424292479525245277/4611686018427387904:ℚ)],![(11542085799624312035/4611686018427387904:ℚ),(74090929208027927603/18446744073709551616:ℚ),(10947342967148262643/18446744073709551616:ℚ),(100664344634481829089/18446744073709551616:ℚ)] ]

theorem rational_risk_accepted :
    Phase15301Leaf.riskWeight*(∑j : Fin 3,∑f : Fin 4,familyBound j f)<Phase15301Leaf.threshold := by
  decide +kernel

theorem family_integral_le (j : Fin 3) (f : Fin 4) (x y : ℝ)
    (hx : x∈Set.Icc (root.x0 : ℝ) root.x1)
    (hy : y∈Set.Icc (root.y0 : ℝ) root.y1) :
    (∫u in (0 : ℝ)..1,(directionalChord f (Phase15301Leaf.fields j) x y u)^2)≤(familyBound j f : ℝ) := by
  fin_cases j <;> fin_cases f
  · exact Family00.original_directional_integral_bound x y hx hy
  · exact Family01.original_directional_integral_bound x y hx hy
  · exact Family02.original_directional_integral_bound x y hx hy
  · exact Family03.original_directional_integral_bound x y hx hy
  · exact Family10.original_directional_integral_bound x y hx hy
  · exact Family11.original_directional_integral_bound x y hx hy
  · exact Family12.original_directional_integral_bound x y hx hy
  · exact Family13.original_directional_integral_bound x y hx hy
  · exact Family20.original_directional_integral_bound x y hx hy
  · exact Family21.original_directional_integral_bound x y hx hy
  · exact Family22.original_directional_integral_bound x y hx hy
  · exact Family23.original_directional_integral_bound x y hx hy

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

end NoThreeLine.Phase15301Group7275

#print axioms NoThreeLine.Phase15301Group7275.rational_risk_accepted
#print axioms NoThreeLine.Phase15301Group7275.uniform_direct_risk
#print axioms NoThreeLine.Phase15301Group7275.uniform_actual_orbit_risk
#print axioms NoThreeLine.Phase15301Group7275.actual_leaf_frozen_risk
#print axioms NoThreeLine.Phase15301Group7275.actual_leaf_actual_risk
