import NoThreeLine.ShortStarWeightedPattern

/-! A bad pair of coordinates costs its actual finite pair count, while
all remaining coordinates are free. This is a finite counting lemma only. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteTuplePattern

def pairRestricted {α β : Type*} [Fintype α] [DecidableEq β] (m : ℕ)
    (key : α→β) (P : Finset (β×β)) (i j : Fin m) : Finset (Fin m→α) := by
  classical
  exact Finset.univ.filter (fun f=>(key (f i),key (f j))∈P)

theorem pairRestricted_card_le {α β : Type*} [Fintype α] [DecidableEq β]
    (m : ℕ) (key : α→β) (hinj : Function.Injective key) (P : Finset (β×β))
    (i j : Fin m) (hij : i≠j) :
    (pairRestricted m key P i j).card≤P.card*Fintype.card α^(m-2) := by
  classical
  let rest : Finset (Fin m) := {i,j}ᶜ
  let encode : ↥(pairRestricted m key P i j)→↥P×(↥rest→α) := fun f=>
    (⟨(key (f.val i),key (f.val j)),(Finset.mem_filter.mp f.property).2⟩,
      fun k=>f.val k.val)
  have hencode : Function.Injective encode := by
    intro f g he
    have hp := congrArg (fun x : ↥P×(↥rest→α)=>x.1.val) he
    have hr := congrArg Prod.snd he
    apply Subtype.ext
    funext k
    by_cases hki : k=i
    · subst k
      exact hinj (congrArg Prod.fst hp)
    by_cases hkj : k=j
    · subst k
      exact hinj (congrArg Prod.snd hp)
    have hk : k∈rest := by simp [rest,hki,hkj]
    exact congrFun hr ⟨k,hk⟩
  have hc := Fintype.card_le_of_injective encode hencode
  have hrest : rest.card=m-2 := by
    simp only [rest,Finset.card_compl,Finset.card_pair hij,Fintype.card_fin]
  simpa only [Fintype.card_coe,Fintype.card_prod,Fintype.card_fun,hrest] using hc

def somePairRestricted {α β : Type*} [Fintype α] [DecidableEq β]
    (m : ℕ) (key : α→β) (P : Finset (β×β)) : Finset (Fin m→α) := by
  classical
  exact (Finset.univ : Finset (Fin m)).offDiag.biUnion
    (fun ij=>pairRestricted m key P ij.1 ij.2)

theorem mem_somePairRestricted {α β : Type*} [Fintype α] [DecidableEq β]
    (m : ℕ) (key : α→β) (P : Finset (β×β)) (f : Fin m→α) :
    f∈somePairRestricted m key P ↔ ∃i j : Fin m,i≠j ∧ (key (f i),key (f j))∈P := by
  classical
  simp [somePairRestricted,pairRestricted,Finset.mem_offDiag]

theorem somePairRestricted_card_le {α β : Type*} [Fintype α] [DecidableEq β]
    (m : ℕ) (key : α→β) (hinj : Function.Injective key) (P : Finset (β×β)) :
    (somePairRestricted m key P).card≤m*(m-1)*(P.card*Fintype.card α^(m-2)) := by
  classical
  calc
    _ ≤ ∑ij∈(Finset.univ : Finset (Fin m)).offDiag,(pairRestricted m key P ij.1 ij.2).card :=
      Finset.card_biUnion_le
    _ ≤ ∑_ij∈(Finset.univ : Finset (Fin m)).offDiag,P.card*Fintype.card α^(m-2) := by
      apply Finset.sum_le_sum
      intro ij hij
      exact pairRestricted_card_le m key hinj P ij.1 ij.2 (Finset.mem_offDiag.mp hij).2.2
    _ = _ := by
      simp only [Finset.sum_const,Finset.offDiag_card,Finset.card_univ,Fintype.card_fin,nsmul_eq_mul]
      rw [Nat.mul_sub_left_distrib,Nat.mul_one]
      simp

end NoThreeLine.FiniteTuplePattern

#print axioms NoThreeLine.FiniteTuplePattern.pairRestricted_card_le
#print axioms NoThreeLine.FiniteTuplePattern.somePairRestricted_card_le
