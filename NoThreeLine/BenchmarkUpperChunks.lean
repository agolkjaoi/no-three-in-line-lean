import NoThreeLine.BenchmarkUpperPartition

/-! Split a directed upper partition into kernel-checkable blocks. The tail
starts at the actual last endpoint returned by the block; composition returns
the exact same checker result, including every rounded branch contribution. -/
set_option autoImplicit false
namespace NoThreeLine.OneSided

def checkUpperBlock (e : Expr) (S : ℕ) (r : ℚ) : List (ℚ × BoundTrace) → Option (ℚ × ℚ)
  | [] => some (r,0)
  | (s,t)::cuts => (checkBound e t true r s).bind fun c =>
      if BranchValid c.a c.b r s then
        (checkUpperBlock e S s cuts).bind fun tail =>
          some (tail.1,roundUp S (branchBound c.a c.b r s)+tail.2)
      else none

theorem checkUpperBlock_append (e : Expr) (S : ℕ) (r : ℚ)
    (xs ys : List (ℚ × BoundTrace)) (last B T : ℚ)
    (hb : checkUpperBlock e S r xs=some (last,B))
    (ht : checkUpperPartition e S last ys=some T) :
    checkUpperPartition e S r (xs++ys)=some (B+T) := by
  induction xs generalizing r B with
  | nil =>
      simp only [checkUpperBlock,Option.some.injEq,Prod.mk.injEq] at hb
      rcases hb with ⟨hr,hB⟩
      subst r
      subst B
      simpa using ht
  | cons p xs ih =>
      obtain ⟨s,t⟩ := p
      simp only [checkUpperBlock,Option.bind_eq_some_iff] at hb
      obtain ⟨c,hc,hb⟩ := hb
      split_ifs at hb with hv
      simp only [Option.bind_eq_some_iff] at hb
      obtain ⟨tail,hb,heq⟩ := hb
      have heq' := Option.some.inj heq
      have hlast : tail.1=last := congrArg Prod.fst heq'
      have hB : roundUp S (branchBound c.a c.b r s)+tail.2=B := congrArg Prod.snd heq'
      have htail : checkUpperBlock e S s xs=some (last,tail.2) := by
        simpa only [←hlast,Prod.mk.eta] using hb
      have hi := ih s tail.2 htail
      simp only [List.cons_append,checkUpperPartition,hc,Option.bind_some,hv,ite_true,hi]
      simp only [Option.bind_some,Option.some.injEq]
      rw [←hB]
      exact (add_assoc _ _ _).symm

theorem checkUpperBlock_to_unit (e : Expr) (S : ℕ) (cuts : List (ℚ × BoundTrace)) (B : ℚ)
    (hS : 0<S) (hb : checkUpperBlock e S 0 cuts=some (1,B)) :
    checkUpperUnitIntegral e S cuts=some B := by
  have h := checkUpperBlock_append e S 0 cuts [] 1 B 0 hb (by simp [checkUpperPartition])
  simpa [checkUpperUnitIntegral,hS] using h

end NoThreeLine.OneSided

#print axioms NoThreeLine.OneSided.checkUpperBlock_append
#print axioms NoThreeLine.OneSided.checkUpperBlock_to_unit
