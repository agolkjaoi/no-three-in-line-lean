import NoThreeLine.Phase15301OrbitLeaf
import NoThreeLine.Phase15301Leaf75Family00
import NoThreeLine.Phase15301Leaf75Family01
import NoThreeLine.Phase15301Leaf75Family02
import NoThreeLine.Phase15301Leaf75Family03
import NoThreeLine.Phase15301Leaf75Family10
import NoThreeLine.Phase15301Leaf75Family11
import NoThreeLine.Phase15301Leaf75Family12
import NoThreeLine.Phase15301Leaf75Family13
import NoThreeLine.Phase15301Leaf75Family20
import NoThreeLine.Phase15301Leaf75Family21
import NoThreeLine.Phase15301Leaf75Family22
import NoThreeLine.Phase15301Leaf75Family23

/-! A fifth actual accepted leaf of phase 15301, using twelve new-root
full-field kernel certificates. The original risk definitions are shared
because the reference fields are identical; the previous root's numerical
bound is not used. Frozen-prefix equality holds after common-grid erasure.
Actual accepted-prefix transfer keeps its explicit schedule hypotheses. -/
set_option autoImplicit false
open MeasureTheory
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.Phase15301Leaf75
open FinitePhase FrozenReference BenchmarkAccepted Phase15301AcceptedLeaf

def familyBound : Fin 3 → Fin 4 → ℚ := ![![(8957766258583755611/4611686018427387904:ℚ),(48530640642377124317/9223372036854775808:ℚ),(4348625760509565489/18446744073709551616:ℚ),(111233461182456988873/18446744073709551616:ℚ)],![(9796677529652136265/4611686018427387904:ℚ),(94313887005744789603/18446744073709551616:ℚ),(4983752541737772849/18446744073709551616:ℚ),(54832329982279439833/9223372036854775808:ℚ)],![(46166406475420303873/18446744073709551616:ℚ),(18520962287132846551/4611686018427387904:ℚ),(10964402267083587115/18446744073709551616:ℚ),(50329925480913955761/9223372036854775808:ℚ)] ]

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

def imageIndex (f : Fin 4) : Fin (ScheduleUnionBatch15301Accepted.accepted0.phase.count*4) :=
  ⟨300+f.val,by have := f.isLt; change 300+f.val<80*4; omega⟩

def imageBox (f : Fin 4) : QRect :=
  (phaseImageBoxes 32768 8 ScheduleUnionBatch15301Accepted.accepted0.phase.sx
    ScheduleUnionBatch15301Accepted.accepted0.phase.sy
    ScheduleUnionBatch15301Accepted.accepted0.phase.leaves (imageIndex f)).qrect 32768

theorem imageBox_eq (f : Fin 4) : imageBox f=root.symmetry f := by
  fin_cases f <;> decide +kernel

theorem image_in_actual_closed_union (f : Fin 4) (x y : ℝ)
    (h : (x,y)∈(imageBox f).real.closedSet) :
    (x,y)∈closedRectangleUnion Finset.univ (fun i =>
      ((phaseImageBoxes 32768 8 ScheduleUnionBatch15301Accepted.accepted0.phase.sx
        ScheduleUnionBatch15301Accepted.accepted0.phase.sy
        ScheduleUnionBatch15301Accepted.accepted0.phase.leaves i).qrect 32768).real) :=
  ⟨imageIndex f,Finset.mem_univ _,h⟩

theorem actual_leaf_frozen_risk (f : Fin 4) (x y : ℝ)
    (h : (x,y)∈(imageBox f).real.closedSet) :
    Phase15301FrozenLeaf.frozenRisk x y<(Phase15301Leaf.threshold : ℝ) := by
  rw [imageBox_eq] at h
  exact uniform_frozen_orbit_risk f x y h.1 h.2

end NoThreeLine.Phase15301Leaf75

#print axioms NoThreeLine.Phase15301Leaf75.rational_risk_accepted
#print axioms NoThreeLine.Phase15301Leaf75.uniform_direct_risk
#print axioms NoThreeLine.Phase15301Leaf75.uniform_actual_orbit_risk
#print axioms NoThreeLine.Phase15301Leaf75.actual_leaf_frozen_risk
