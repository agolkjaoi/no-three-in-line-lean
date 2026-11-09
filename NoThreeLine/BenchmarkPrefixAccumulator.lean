import NoThreeLine.BenchmarkPhaseUpdates

/-! A finite sequence of kernel-checked accumulator transitions reconstructs
the exact coefficient sum over the initial frozen phases. A block must start
at the preceding block's endpoint; no external prefix value is assumed. -/
set_option autoImplicit false
open scoped BigOperators
namespace NoThreeLine.BenchmarkPrefix
open FrozenReference BenchmarkNatTree

def unitsSum (n : ℕ) (hn : n≤15348) (r : Fin 4) (cell : Grid 128) : ℕ :=
  ∑ i : Fin n, phaseUnitsAt ⟨i.val,lt_of_lt_of_le i.isLt hn⟩ r cell

def intervalUpdates (start count : ℕ) (h : start+count≤15348) : List (ℕ × ℕ) :=
  (List.ofFn (fun i : Fin count => (⟨start+i.val,by have := i.isLt; omega⟩ : Fin 15348))).flatMap
    phaseUpdates

theorem intervalUpdates_bounded (start count : ℕ) (h : start+count≤15348)
    (x : ℕ × ℕ) (hx : x∈intervalUpdates start count h) : x.1<2^16 := by
  rcases List.mem_flatMap.mp hx with ⟨j,_,hj⟩
  exact phaseUpdates_bounded j x hj

theorem contribution_intervalUpdates (start count : ℕ) (h : start+count≤15348)
    (r : Fin 4) (cell : Grid 128) :
    contribution (gridKey r cell) (intervalUpdates start count h) =
      ∑ i : Fin count, phaseUnitsAt ⟨start+i.val,by have := i.isLt; omega⟩ r cell := by
  simp [intervalUpdates,contribution_flatMap,contribution_phaseUpdates,List.sum_ofFn]

theorem unitsSum_add (start count : ℕ) (h : start+count≤15348)
    (r : Fin 4) (cell : Grid 128) :
    unitsSum (start+count) h r cell =
      unitsSum start (by omega) r cell + contribution (gridKey r cell) (intervalUpdates start count h) := by
  rw [contribution_intervalUpdates]
  unfold unitsSum
  rw [Fin.sum_univ_add]
  rfl

def Represents (n : ℕ) (hn : n≤15348) (t : BenchmarkNatTree) : Prop :=
  ∀ r cell, get 16 t (gridKey r cell)=unitsSum n hn r cell

theorem represents_zero : Represents 0 (by decide) (.uniform 0) := by
  intro r cell
  simp [BenchmarkNatTree.get,unitsSum]

theorem represents_step (start count : ℕ) (h : start+count≤15348)
    (t out : BenchmarkNatTree) (ht : Represents start (by omega) t)
    (hc : checkUpdates 16 t (intervalUpdates start count h) out=true) :
    Represents (start+count) h out := by
  intro r cell
  rw [checkUpdates_sound _ _ _ _ hc (intervalUpdates_bounded start count h)
    _ (gridKey_lt r cell),ht r cell,← unitsSum_add]

theorem unitsSum_eq_prefix (last : Fin 15348) (r : Fin 4) (cell : Grid 128) :
    unitsSum (last.val+1) (by have := last.isLt; omega) r cell = prefixUnitsAt last r cell := by
  unfold unitsSum prefixUnitsAt
  apply Finset.sum_bij (fun (i : Fin (last.val+1)) _ =>
    (⟨i.val,by have := i.isLt; have := last.isLt; omega⟩ : Fin 15348))
  · intro i hi
    exact Finset.mem_Iic.mpr (by change i.val≤last.val; omega)
  · intro i hi j hj hij
    exact Fin.ext (congrArg (fun x : Fin 15348 => x.val) hij)
  · intro j hj
    have hj' : j≤last := Finset.mem_Iic.mp hj
    exact ⟨⟨j.val,by omega⟩,Finset.mem_univ _,Fin.ext rfl⟩
  · intro i hi
    rfl

theorem represents_fullTypeWeight (last : Fin 15348) (t : BenchmarkNatTree)
    (h : Represents (last.val+1) (by have := last.isLt; omega) t)
    (r : Fin 4) (cell : Grid 128) :
    (get 16 t (gridKey r cell) : ℝ)/100000000 = fullTypeWeight last r cell := by
  rw [h r cell,unitsSum_eq_prefix,prefixUnitsAt_cast]

end NoThreeLine.BenchmarkPrefix

#print axioms NoThreeLine.BenchmarkPrefix.represents_step
#print axioms NoThreeLine.BenchmarkPrefix.represents_fullTypeWeight
