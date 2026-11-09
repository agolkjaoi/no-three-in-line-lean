import NoThreeLine.Phase15301Compressed1Chunk08

/-! Exact complete range check, composed from checked consecutive rectangle
blocks. The table list equality checks full coverage and preserves its order. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.Phase15301Compressed1
open BenchmarkPrefix BenchmarkNatTree

abbrev entries := Phase15301Compressed1Data.entries
abbrev boxes := Phase15301Compressed1Data.boxes
abbrev units := Phase15301Compressed1Data.units
abbrev Matches := Phase15301Compressed1Data.Matches
theorem boxes_valid (i : Fin 262) : (boxes i).Valid 128 := Phase15301Compressed1Data.boxes_valid i
theorem original_matching : ∀ i, Matches i := Phase15301Compressed1Data.original_matching
def cellTree : BenchmarkNatTree := Phase15301Compressed1Chunk08.tree

theorem partial00 : checkRanges 14 (.uniform 0) (boxesRanges Phase15301Compressed1Chunk00.boxList) Phase15301Compressed1Chunk00.tree=true :=
  Phase15301Compressed1Chunk00.checked

theorem partial01 : checkRanges 14 (.uniform 0) (boxesRanges (Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList)) Phase15301Compressed1Chunk01.tree=true :=
  checkBoxes_append 14 (.uniform 0) Phase15301Compressed1Chunk00.tree Phase15301Compressed1Chunk01.tree Phase15301Compressed1Chunk00.boxList Phase15301Compressed1Chunk01.boxList partial00 Phase15301Compressed1Chunk01.checked

theorem partial02 : checkRanges 14 (.uniform 0) (boxesRanges ((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList)) Phase15301Compressed1Chunk02.tree=true :=
  checkBoxes_append 14 (.uniform 0) Phase15301Compressed1Chunk01.tree Phase15301Compressed1Chunk02.tree (Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) Phase15301Compressed1Chunk02.boxList partial01 Phase15301Compressed1Chunk02.checked

theorem partial03 : checkRanges 14 (.uniform 0) (boxesRanges (((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList)) Phase15301Compressed1Chunk03.tree=true :=
  checkBoxes_append 14 (.uniform 0) Phase15301Compressed1Chunk02.tree Phase15301Compressed1Chunk03.tree ((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) Phase15301Compressed1Chunk03.boxList partial02 Phase15301Compressed1Chunk03.checked

theorem partial04 : checkRanges 14 (.uniform 0) (boxesRanges ((((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList) ++ Phase15301Compressed1Chunk04.boxList)) Phase15301Compressed1Chunk04.tree=true :=
  checkBoxes_append 14 (.uniform 0) Phase15301Compressed1Chunk03.tree Phase15301Compressed1Chunk04.tree (((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList) Phase15301Compressed1Chunk04.boxList partial03 Phase15301Compressed1Chunk04.checked

theorem partial05 : checkRanges 14 (.uniform 0) (boxesRanges (((((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList) ++ Phase15301Compressed1Chunk04.boxList) ++ Phase15301Compressed1Chunk05.boxList)) Phase15301Compressed1Chunk05.tree=true :=
  checkBoxes_append 14 (.uniform 0) Phase15301Compressed1Chunk04.tree Phase15301Compressed1Chunk05.tree ((((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList) ++ Phase15301Compressed1Chunk04.boxList) Phase15301Compressed1Chunk05.boxList partial04 Phase15301Compressed1Chunk05.checked

theorem partial06 : checkRanges 14 (.uniform 0) (boxesRanges ((((((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList) ++ Phase15301Compressed1Chunk04.boxList) ++ Phase15301Compressed1Chunk05.boxList) ++ Phase15301Compressed1Chunk06.boxList)) Phase15301Compressed1Chunk06.tree=true :=
  checkBoxes_append 14 (.uniform 0) Phase15301Compressed1Chunk05.tree Phase15301Compressed1Chunk06.tree (((((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList) ++ Phase15301Compressed1Chunk04.boxList) ++ Phase15301Compressed1Chunk05.boxList) Phase15301Compressed1Chunk06.boxList partial05 Phase15301Compressed1Chunk06.checked

theorem partial07 : checkRanges 14 (.uniform 0) (boxesRanges (((((((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList) ++ Phase15301Compressed1Chunk04.boxList) ++ Phase15301Compressed1Chunk05.boxList) ++ Phase15301Compressed1Chunk06.boxList) ++ Phase15301Compressed1Chunk07.boxList)) Phase15301Compressed1Chunk07.tree=true :=
  checkBoxes_append 14 (.uniform 0) Phase15301Compressed1Chunk06.tree Phase15301Compressed1Chunk07.tree ((((((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList) ++ Phase15301Compressed1Chunk04.boxList) ++ Phase15301Compressed1Chunk05.boxList) ++ Phase15301Compressed1Chunk06.boxList) Phase15301Compressed1Chunk07.boxList partial06 Phase15301Compressed1Chunk07.checked

theorem partial08 : checkRanges 14 (.uniform 0) (boxesRanges ((((((((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList) ++ Phase15301Compressed1Chunk04.boxList) ++ Phase15301Compressed1Chunk05.boxList) ++ Phase15301Compressed1Chunk06.boxList) ++ Phase15301Compressed1Chunk07.boxList) ++ Phase15301Compressed1Chunk08.boxList)) Phase15301Compressed1Chunk08.tree=true :=
  checkBoxes_append 14 (.uniform 0) Phase15301Compressed1Chunk07.tree Phase15301Compressed1Chunk08.tree (((((((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList) ++ Phase15301Compressed1Chunk04.boxList) ++ Phase15301Compressed1Chunk05.boxList) ++ Phase15301Compressed1Chunk06.boxList) ++ Phase15301Compressed1Chunk07.boxList) Phase15301Compressed1Chunk08.boxList partial07 Phase15301Compressed1Chunk08.checked

theorem entries_list_eq : entries.toList=((((((((Phase15301Compressed1Chunk00.boxList ++ Phase15301Compressed1Chunk01.boxList) ++ Phase15301Compressed1Chunk02.boxList) ++ Phase15301Compressed1Chunk03.boxList) ++ Phase15301Compressed1Chunk04.boxList) ++ Phase15301Compressed1Chunk05.boxList) ++ Phase15301Compressed1Chunk06.boxList) ++ Phase15301Compressed1Chunk07.boxList) ++ Phase15301Compressed1Chunk08.boxList) := by decide +kernel

theorem ranges_checked : checkRanges 14 (.uniform 0) (boxesRanges entries.toList) cellTree=true := by
  rw [entries_list_eq]
  exact partial08

theorem cell_coefficient (p : Grid 128) : get 14 cellTree (cellKey p)=boxesUnits entries.toList p := by
  apply checked_boxes entries.toList cellTree _ ranges_checked p
  intro x hx
  rw [← FiniteInputTree.ofFn_get] at hx
  obtain ⟨i,rfl⟩ := List.mem_ofFn.mp hx
  exact (boxes_valid i).2.2.2

end NoThreeLine.Phase15301Compressed1

#print axioms NoThreeLine.Phase15301Compressed1.original_matching
#print axioms NoThreeLine.Phase15301Compressed1.cell_coefficient
