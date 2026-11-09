import NoThreeLine.Phase15301Leaf
import NoThreeLine.Phase15301Reference0
import NoThreeLine.Phase15301Reference1
import NoThreeLine.Phase15301Reference2

/-! Strict risk for one accepted leaf, with the actual common-table reference
prefix through phase15301. Density scaling appears once in each actual chord.
This is not all leaves, the full accepted-mask schedule, or final Target. -/
set_option autoImplicit false
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.Phase15301FrozenLeaf
open FrozenReference

def frozenPair (j : Fin 3) (x y : ℝ) : ℝ :=
  fullPhasePrefix 15301 3 x y+fullPhasePrefix 15301 j.castSucc x y

theorem erased_fields_eq (j : Fin 3) :
    eraseGrid (commonGridLines 32768) (commonGridLines 32768) (Phase15301Leaf.fields j)=frozenPair j := by
  fin_cases j
  · exact Phase15301Reference0.original_erased_eq_frozen_prefix
  · exact Phase15301Reference1.original_erased_eq_frozen_prefix
  · exact Phase15301Reference2.original_erased_eq_frozen_prefix

theorem scaled_field_eq (j : Fin 3) :
    eraseGrid (commonGridLines 32768) (commonGridLines 32768)
      (fun a b => (Phase15301Leaf.densityScale : ℝ)*Phase15301Leaf.fields j a b) =
    (fun a b => (Phase15301Leaf.densityScale : ℝ)*frozenPair j a b) := by
  rw [← erased_fields_eq j]
  funext x y
  classical
  unfold eraseGrid
  split_ifs <;> simp

def frozenRisk (x y : ℝ) : ℝ :=
  (Phase15301Leaf.sieveDensityBound : ℝ)/24*(∑ j : Fin 3, ∑ f : Fin 4,
    ∫ u in (0 : ℝ)..1, (directionalChord f
      (fun a b => (Phase15301Leaf.densityScale : ℝ)*frozenPair j a b) x y u)^2)

theorem uniform_frozen_reference_risk (x y : ℝ)
    (hx : x∈Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y∈Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1) :
    frozenRisk x y<(Phase15301Leaf.threshold : ℝ) := by
  have h := Phase15301Leaf.uniform_scaled_erased_risk
    (commonGridLines 32768) (commonGridLines 32768) x y hx hy
  simpa only [Phase15301Leaf.scaledErasedRisk,scaled_field_eq,frozenRisk] using h

end NoThreeLine.Phase15301FrozenLeaf

#print axioms NoThreeLine.Phase15301FrozenLeaf.erased_fields_eq
#print axioms NoThreeLine.Phase15301FrozenLeaf.uniform_frozen_reference_risk
