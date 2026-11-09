import NoThreeLine.ReferencePrefixBound
import NoThreeLine.BenchmarkNatTree

/-! Exact natural-unit coefficients of the actual frozen reference tables.
The real coefficient is derived by a cast and the fixed denominator; no
saved numerical prefix is assumed. Geometry will be compared after the
common grid erasure, since compressed rectangles may cross coarse seams. -/
set_option autoImplicit false
open scoped BigOperators
namespace NoThreeLine.BenchmarkPrefix
open FrozenReference

def gridKey (r : Fin 4) (cell : Grid 128) : ℕ :=
  r.val*16384 + cell.1.val*128 + cell.2.val

theorem gridKey_lt (r : Fin 4) (cell : Grid 128) : gridKey r cell < 2^16 := by
  have := r.isLt
  have := cell.1.isLt
  have := cell.2.isLt
  change r.val*16384 + cell.1.val*128 + cell.2.val < 65536
  omega

theorem gridKey_injective : Function.Injective (fun p : Fin 4 × Grid 128 => gridKey p.1 p.2) := by
  intro p q h
  have := p.1.isLt
  have := p.2.1.isLt
  have := p.2.2.isLt
  have := q.1.isLt
  have := q.2.1.isLt
  have := q.2.2.isLt
  dsimp only [gridKey] at h
  apply Prod.ext
  · apply Fin.ext
    omega
  · apply Prod.ext <;> apply Fin.ext <;> omega

def phaseUnitsAt (j : Fin 15348) (r : Fin 4) (cell : Grid 128) : ℕ :=
  if r=rootType j ∧ cell ∈ Finset.univ.image (coarseSymmetry (phasePoint j))
  then phaseUnits j else 0

def prefixUnitsAt (last : Fin 15348) (r : Fin 4) (cell : Grid 128) : ℕ :=
  ∑ j ∈ Finset.Iic last, phaseUnitsAt j r cell

theorem phaseUnitsAt_cast (j : Fin 15348) (r : Fin 4) (cell : Grid 128) :
    (phaseUnitsAt j r cell : ℝ)/100000000 =
      (phaseUnits j : ℝ)/100000000*phaseTypeWeight j r cell := by
  by_cases hr : r=rootType j <;>
    by_cases hc : cell ∈ Finset.univ.image (coarseSymmetry (phasePoint j)) <;>
    simp [phaseUnitsAt,phaseTypeWeight,coarseOrbitWeight,hr,hc]

theorem prefixUnitsAt_cast (last : Fin 15348) (r : Fin 4) (cell : Grid 128) :
    (prefixUnitsAt last r cell : ℝ)/100000000 = fullTypeWeight last r cell := by
  calc
    _ = ∑ j ∈ Finset.Iic last, (phaseUnitsAt j r cell : ℝ)/100000000 := by
      simp [prefixUnitsAt,Finset.sum_div]
    _ = _ := Finset.sum_congr rfl (fun j _ => phaseUnitsAt_cast j r cell)

end NoThreeLine.BenchmarkPrefix

#print axioms NoThreeLine.BenchmarkPrefix.gridKey_injective
#print axioms NoThreeLine.BenchmarkPrefix.prefixUnitsAt_cast
