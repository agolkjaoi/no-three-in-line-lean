import NoThreeLine.BenchmarkPrefixUnits
import NoThreeLine.BenchmarkNatTreeFacts

/-! A phase contributes its literal natural-unit weight once to each distinct
symmetry image. The accumulator therefore agrees with the actual frozen-table
coefficient, including diagonal source cells with repeated symmetry images. -/
set_option autoImplicit false
namespace NoThreeLine.BenchmarkPrefix
open FrozenReference BenchmarkNatTree

def phasePositions (j : Fin 15348) : List (Fin 4 × Grid 128) :=
  (List.ofFn (fun f : Fin 4 => (rootType j,coarseSymmetry (phasePoint j) f))).dedup

def phaseUpdates (j : Fin 15348) : List (ℕ × ℕ) :=
  (phasePositions j).map (fun p => (gridKey p.1 p.2,phaseUnits j))

theorem phasePositions_nodup (j : Fin 15348) : (phasePositions j).Nodup :=
  List.nodup_dedup _

theorem mem_phasePositions (j : Fin 15348) (p : Fin 4 × Grid 128) :
    p ∈ phasePositions j ↔ p.1=rootType j ∧
      p.2∈Finset.univ.image (coarseSymmetry (phasePoint j)) := by
  rcases p with ⟨r,cell⟩
  simp only [phasePositions,List.mem_dedup,List.mem_ofFn,Finset.mem_image,
    Finset.mem_univ,true_and,Prod.mk.injEq,Prod.fst,Prod.snd]
  constructor
  · rintro ⟨f,hf⟩
    exact ⟨hf.1.symm,⟨f,hf.2⟩⟩
  · rintro ⟨hr,f,hf⟩
    exact ⟨f,hr.symm,hf⟩

theorem phaseUpdates_bounded (j : Fin 15348) (x : ℕ × ℕ)
    (hx : x∈phaseUpdates j) : x.1<2^16 := by
  rcases List.mem_map.mp hx with ⟨p,_,rfl⟩
  exact gridKey_lt p.1 p.2

theorem contribution_phaseUpdates (j : Fin 15348) (r : Fin 4) (cell : Grid 128) :
    contribution (gridKey r cell) (phaseUpdates j) = phaseUnitsAt j r cell := by
  unfold phaseUpdates
  rw [contribution_map_nodup _ gridKey_injective (r,cell) _ _ (phasePositions_nodup j)]
  simp only [mem_phasePositions,phaseUnitsAt]

theorem get_add_phaseUpdates (t : BenchmarkNatTree) (j : Fin 15348)
    (r : Fin 4) (cell : Grid 128) :
    get 16 (addMany 16 t (phaseUpdates j)) (gridKey r cell) =
      get 16 t (gridKey r cell) + phaseUnitsAt j r cell := by
  rw [get_addMany _ _ _ _ (phaseUpdates_bounded j) (gridKey_lt r cell),
    contribution_phaseUpdates]

end NoThreeLine.BenchmarkPrefix

#print axioms NoThreeLine.BenchmarkPrefix.contribution_phaseUpdates
#print axioms NoThreeLine.BenchmarkPrefix.get_add_phaseUpdates
