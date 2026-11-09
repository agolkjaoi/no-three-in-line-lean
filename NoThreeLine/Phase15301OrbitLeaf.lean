import NoThreeLine.BenchmarkReferenceSymmetry
import NoThreeLine.BenchmarkRootSymmetry
import NoThreeLine.Phase15301AcceptedComparison

/-! The same one-leaf numerical certificate covers its four spatial symmetry
images. Reference-field symmetry is proved from the common frozen tables,
not assumed. Actual accepted prefixes use pointwise domination; their own
symmetry is unnecessary. Concrete all-schedule matches remain separate. -/
set_option autoImplicit false
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.Phase15301OrbitLeaf
open FrozenReference BenchmarkSymmetry FinitePhase Phase15301AcceptedLeaf

def certificateLeaf : DyadicLeaf := ⟨8,254,16⟩

theorem certificateLeaf_valid : certificateLeaf.Valid 8 := by decide +kernel

theorem original_root_eq_dyadic :
    Phase15301Original.root=dyadicQRect 128 0 111 certificateLeaf := by decide +kernel

theorem image_box_eq_root_symmetry (f : Fin 4) :
    ((dyadicGridBox 8 0 111 certificateLeaf).symmetry 32768 f).qrect 32768=
      Phase15301Original.root.symmetry f := by
  fin_cases f <;> decide +kernel

theorem frozenPair_swap (j : Fin 3) (x y : ℝ) :
    Phase15301FrozenLeaf.frozenPair j y x=Phase15301FrozenLeaf.frozenPair j x y := by
  unfold Phase15301FrozenLeaf.frozenPair
  rw [fullPhasePrefix_swap 15301 3 x y,fullPhasePrefix_swap 15301 j.castSucc x y]

theorem frozenPair_central (j : Fin 3) (x y : ℝ) :
    Phase15301FrozenLeaf.frozenPair j (1-x) (1-y)=Phase15301FrozenLeaf.frozenPair j x y := by
  unfold Phase15301FrozenLeaf.frozenPair
  rw [fullPhasePrefix_central 15301 3 x y,fullPhasePrefix_central 15301 j.castSucc x y]

theorem frozenRisk_symmetry (f : Fin 4) (x y : ℝ) :
    Phase15301FrozenLeaf.frozenRisk (rootX f x y) (rootY f x y)=
      Phase15301FrozenLeaf.frozenRisk x y := by
  unfold Phase15301FrozenLeaf.frozenRisk
  apply congrArg (fun z : ℝ=>(Phase15301Leaf.sieveDensityBound : ℝ)/24*z)
  apply Finset.sum_congr rfl
  intro j hj
  change angularSquareSum (fun a b=>(Phase15301Leaf.densityScale : ℝ)*
      Phase15301FrozenLeaf.frozenPair j a b) (rootX f x y) (rootY f x y)=
    angularSquareSum (fun a b=>(Phase15301Leaf.densityScale : ℝ)*
      Phase15301FrozenLeaf.frozenPair j a b) x y
  apply angularSquareSum_symmetry
  · intro a b
    exact congrArg (fun z=>(Phase15301Leaf.densityScale : ℝ)*z) (frozenPair_swap j a b)
  · intro a b
    exact congrArg (fun z=>(Phase15301Leaf.densityScale : ℝ)*z) (frozenPair_central j a b)

theorem uniform_frozen_orbit_risk (f : Fin 4) (x y : ℝ)
    (hx : x∈Set.Icc ((Phase15301Original.root.symmetry f).x0 : ℝ)
      (Phase15301Original.root.symmetry f).x1)
    (hy : y∈Set.Icc ((Phase15301Original.root.symmetry f).y0 : ℝ)
      (Phase15301Original.root.symmetry f).y1) :
    Phase15301FrozenLeaf.frozenRisk x y<(Phase15301Leaf.threshold : ℝ) :=
  root_box_bound_symmetry Phase15301Original.root Phase15301FrozenLeaf.frozenRisk _
    frozenRisk_symmetry Phase15301FrozenLeaf.uniform_frozen_reference_risk f x y hx hy

theorem uniform_actual_orbit_risk {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀i,PhaseMatches (a i) (index i)) (hi : StrictMono index)
    (hd : ∀i,s.duration i≤(Phase15301Leaf.densityScale : ℝ)*
      ((phaseUnits (index i) : ℝ)/100000000))
    (k : Fin J) (hkl : index k≤15301) (T : ℝ) (hT : 0≤T) (hTk : T≤s.hi k)
    (f : Fin 4) (x y : ℝ)
    (hx : x∈Set.Icc ((Phase15301Original.root.symmetry f).x0 : ℝ)
      (Phase15301Original.root.symmetry f).x1)
    (hy : y∈Set.Icc ((Phase15301Original.root.symmetry f).y0 : ℝ)
      (Phase15301Original.root.symmetry f).y1) :
    actualRisk s a T x y<(Phase15301Leaf.threshold : ℝ) :=
  (actualRisk_le_frozenRisk s a index hm hi hd k hkl T hT hTk x y).trans_lt
    (uniform_frozen_orbit_risk f x y hx hy)

end NoThreeLine.Phase15301OrbitLeaf

#print axioms NoThreeLine.Phase15301OrbitLeaf.original_root_eq_dyadic
#print axioms NoThreeLine.Phase15301OrbitLeaf.uniform_frozen_orbit_risk
#print axioms NoThreeLine.Phase15301OrbitLeaf.uniform_actual_orbit_risk
