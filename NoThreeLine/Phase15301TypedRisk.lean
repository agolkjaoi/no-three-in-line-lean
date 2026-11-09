import NoThreeLine.BenchmarkTypedRisk
import NoThreeLine.Phase15301Leaf77Risk

/-! The two individually certified leaves in the generic all-root-type
risk vocabulary. Only root type 3 and these two root boxes receive a
numerical bound. The actual schedule's structural hypotheses stay explicit. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators Interval

namespace NoThreeLine.Phase15301TypedRisk
open FinitePhase FrozenReference BenchmarkTypedRisk

theorem actualPair_three {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T : ℝ) (j : Fin 3) :
    BenchmarkTypedRisk.actualPair s a T 3 j=Phase15301AcceptedLeaf.actualPair s a T j := by
  funext x y
  simp only [BenchmarkTypedRisk.actualPair,Phase15301AcceptedLeaf.actualPair,otherType_three]

theorem actualRisk_three {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (T x y : ℝ) :
    BenchmarkTypedRisk.actualRisk (Phase15301Leaf.sieveDensityBound : ℝ) s a T 3 x y=
      Phase15301AcceptedLeaf.actualRisk s a T x y := by
  simp only [BenchmarkTypedRisk.actualRisk,Phase15301AcceptedLeaf.actualRisk,actualPair_three]

theorem referencePair_three (j : Fin 3) :
    referencePair 15301 3 j=Phase15301FrozenLeaf.frozenPair j := by
  funext x y
  simp only [referencePair,Phase15301FrozenLeaf.frozenPair,otherType_three]

theorem referenceRisk_three (x y : ℝ) :
    referenceRisk (Phase15301Leaf.sieveDensityBound : ℝ)
      (Phase15301Leaf.densityScale : ℝ) 15301 3 x y=
      Phase15301FrozenLeaf.frozenRisk x y := by
  simp only [referenceRisk,Phase15301FrozenLeaf.frozenRisk,referencePair_three]

def certifiedRoot (second : Bool) : QRect :=
  if second then Phase15301Leaf77.root else Phase15301Original.root

theorem uniform_reference_risk (second : Bool) (f : Fin 4) (x y : ℝ)
    (hx : x∈Set.Icc (((certifiedRoot second).symmetry f).x0 : ℝ)
      ((certifiedRoot second).symmetry f).x1)
    (hy : y∈Set.Icc (((certifiedRoot second).symmetry f).y0 : ℝ)
      ((certifiedRoot second).symmetry f).y1) :
    referenceRisk (Phase15301Leaf.sieveDensityBound : ℝ)
      (Phase15301Leaf.densityScale : ℝ) 15301 3 x y<(Phase15301Leaf.threshold : ℝ) := by
  rw [referenceRisk_three]
  cases second with
  | false => exact Phase15301OrbitLeaf.uniform_frozen_orbit_risk f x y hx hy
  | true => exact Phase15301Leaf77.uniform_frozen_orbit_risk f x y hx hy

theorem uniform_actual_risk {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀i,PhaseMatches (a i) (index i)) (hi : StrictMono index)
    (hd : ∀i,s.duration i≤(Phase15301Leaf.densityScale : ℝ)*
      ((phaseUnits (index i) : ℝ)/100000000))
    (k : Fin J) (hkl : index k≤15301) (T : ℝ) (hT : 0≤T) (hTk : T≤s.hi k)
    (second : Bool) (f : Fin 4) (x y : ℝ)
    (hx : x∈Set.Icc (((certifiedRoot second).symmetry f).x0 : ℝ)
      ((certifiedRoot second).symmetry f).x1)
    (hy : y∈Set.Icc (((certifiedRoot second).symmetry f).y0 : ℝ)
      ((certifiedRoot second).symmetry f).y1) :
    BenchmarkTypedRisk.actualRisk (Phase15301Leaf.sieveDensityBound : ℝ) s a T 3 x y<
      (Phase15301Leaf.threshold : ℝ) := by
  have hD : (0 : ℝ)≤(Phase15301Leaf.sieveDensityBound : ℝ) := by
    norm_num [Phase15301Leaf.sieveDensityBound]
  exact (actualRisk_le_referenceRisk _ hD s a index hm hi _
    Phase15301AcceptedLeaf.scale_pos.le hd k 15301 hkl T hT hTk 3 x y).trans_lt
    (uniform_reference_risk second f x y hx hy)

end NoThreeLine.Phase15301TypedRisk

#print axioms NoThreeLine.Phase15301TypedRisk.actualRisk_three
#print axioms NoThreeLine.Phase15301TypedRisk.referenceRisk_three
#print axioms NoThreeLine.Phase15301TypedRisk.uniform_actual_risk
