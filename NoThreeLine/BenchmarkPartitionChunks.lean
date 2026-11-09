import NoThreeLine.Partition

/-! Kernel checks may be divided into finite blocks without changing the
partition, branch checker, rounding precision, or resulting rational bound.
Each block returns its actual last endpoint. The composition theorem below
connects these finite computations back to the original checkPartition. -/
set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine

def checkPartitionBlock (e : Expr) (S : ℕ) (r : ℚ) : List ℚ → Option (ℚ × ℚ)
  | [] => some (r,0)
  | s :: cuts => (e.check r s).bind fun c =>
      if BranchValid c.a c.b r s then
        (checkPartitionBlock e S s cuts).bind fun tail =>
          some (tail.1,roundUp S (branchBound c.a c.b r s)+tail.2)
      else none

theorem checkPartitionBlock_append (e : Expr) (S : ℕ) (r : ℚ)
    (xs ys : List ℚ) (last B T : ℚ)
    (hb : checkPartitionBlock e S r xs = some (last,B))
    (ht : checkPartition e S last ys = some T) :
    checkPartition e S r (xs++ys) = some (B+T) := by
  induction xs generalizing r B with
  | nil =>
      simp only [checkPartitionBlock,Option.some.injEq,Prod.mk.injEq] at hb
      rcases hb with ⟨hr,hB⟩
      subst r
      subst B
      simpa using ht
  | cons s xs ih =>
      simp only [checkPartitionBlock,Option.bind_eq_some_iff] at hb
      obtain ⟨c,hc,hb⟩ := hb
      split_ifs at hb with hv
      simp only [Option.bind_eq_some_iff] at hb
      obtain ⟨tail,hb,heq⟩ := hb
      have heq' := Option.some.inj heq
      have hlast : tail.1=last := congrArg Prod.fst heq'
      have hB : roundUp S (branchBound c.a c.b r s)+tail.2=B :=
        congrArg Prod.snd heq'
      have htail : checkPartitionBlock e S s xs = some (last,tail.2) := by
        simpa only [← hlast,Prod.mk.eta] using hb
      have hi := ih s tail.2 htail
      simp only [List.cons_append,checkPartition,hc,Option.bind_some,hv,ite_true,hi]
      simp only [Option.bind_some,Option.some.injEq]
      rw [← hB]
      exact (add_assoc _ _ _).symm

theorem checkPartitionBlock_to_unit (e : Expr) (S : ℕ) (cuts : List ℚ) (B : ℚ)
    (hS : 0 < S) (hb : checkPartitionBlock e S 0 cuts = some (1,B)) :
    checkUnitIntegral e S cuts = some B := by
  have h := checkPartitionBlock_append e S 0 cuts [] 1 B 0 hb (by simp [checkPartition])
  simpa [checkUnitIntegral,hS] using h

end NoThreeLine

#print axioms NoThreeLine.checkPartitionBlock_append
#print axioms NoThreeLine.checkPartitionBlock_to_unit
