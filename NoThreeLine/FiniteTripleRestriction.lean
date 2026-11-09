import NoThreeLine.FinitePairRestriction

/-! Three distinct prescribed slots and an actual finite triple relation.
The coarse number of ordered slot choices is at most m^3. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteTuplePattern

def tripleRestricted {α β : Type*} [Fintype α] [DecidableEq β] (m : ℕ)
    (key : α→β) (P : Finset ((β×β)×β)) (i j k : Fin m) : Finset (Fin m→α) := by
  classical
  exact Finset.univ.filter (fun f=>((key (f i),key (f j)),key (f k))∈P)

theorem tripleRestricted_card_le {α β : Type*} [Fintype α] [DecidableEq β]
    (m : ℕ) (key : α→β) (hinj : Function.Injective key) (P : Finset ((β×β)×β))
    (i j k : Fin m) (hij : i≠j) (hki : k≠i) (hkj : k≠j) :
    (tripleRestricted m key P i j k).card≤P.card*Fintype.card α^(m-3) := by
  classical
  let rest : Finset (Fin m) := {i,j,k}ᶜ
  let encode : ↥(tripleRestricted m key P i j k)→↥P×(↥rest→α) := fun f=>
    (⟨((key (f.val i),key (f.val j)),key (f.val k)),(Finset.mem_filter.mp f.property).2⟩,
      fun r=>f.val r.val)
  have hencode : Function.Injective encode := by
    intro f g he
    have hp := congrArg (fun x : ↥P×(↥rest→α)=>x.1.val) he
    have hr := congrArg Prod.snd he
    apply Subtype.ext
    funext r
    by_cases hri : r=i
    · subst r
      exact hinj (congrArg (fun x : (β×β)×β=>x.1.1) hp)
    by_cases hrj : r=j
    · subst r
      exact hinj (congrArg (fun x : (β×β)×β=>x.1.2) hp)
    by_cases hrk : r=k
    · subst r
      exact hinj (congrArg Prod.snd hp)
    have hrest : r∈rest := by simp [rest,hri,hrj,hrk]
    exact congrFun hr ⟨r,hrest⟩
  have hcard : ({i,j,k} : Finset (Fin m)).card=3 := by simp [hij,hki.symm,hkj.symm]
  have hrest : rest.card=m-3 := by simp only [rest,Finset.card_compl,hcard,Fintype.card_fin]
  simpa only [Fintype.card_coe,Fintype.card_prod,Fintype.card_fun,hrest] using
    Fintype.card_le_of_injective encode hencode

def tripleSlots (m : ℕ) : Finset ((Fin m×Fin m)×Fin m) := by
  classical
  exact Finset.univ.filter (fun ijk=>ijk.1.1≠ijk.1.2 ∧ ijk.2≠ijk.1.1 ∧ ijk.2≠ijk.1.2)

def someTripleRestricted {α β : Type*} [Fintype α] [DecidableEq β]
    (m : ℕ) (key : α→β) (P : Finset ((β×β)×β)) : Finset (Fin m→α) := by
  classical
  exact (tripleSlots m).biUnion (fun ijk=>tripleRestricted m key P ijk.1.1 ijk.1.2 ijk.2)

theorem mem_someTripleRestricted {α β : Type*} [Fintype α] [DecidableEq β]
    (m : ℕ) (key : α→β) (P : Finset ((β×β)×β)) (f : Fin m→α) :
    f∈someTripleRestricted m key P ↔ ∃i j k : Fin m,i≠j ∧ k≠i ∧ k≠j ∧
      ((key (f i),key (f j)),key (f k))∈P := by
  classical
  simp [someTripleRestricted,tripleSlots,tripleRestricted,and_assoc]

theorem someTripleRestricted_card_le {α β : Type*} [Fintype α] [DecidableEq β]
    (m : ℕ) (key : α→β) (hinj : Function.Injective key) (P : Finset ((β×β)×β)) :
    (someTripleRestricted m key P).card≤m^3*(P.card*Fintype.card α^(m-3)) := by
  classical
  have hslots : (tripleSlots m).card≤m^3 := by
    have h := Finset.card_filter_le (Finset.univ : Finset ((Fin m×Fin m)×Fin m))
      (fun ijk=>ijk.1.1≠ijk.1.2 ∧ ijk.2≠ijk.1.1 ∧ ijk.2≠ijk.1.2)
    simpa only [tripleSlots,Finset.card_univ,Fintype.card_prod,Fintype.card_fin,pow_succ,pow_zero,mul_one,one_mul] using h
  calc
    _ ≤ ∑ijk∈tripleSlots m,(tripleRestricted m key P ijk.1.1 ijk.1.2 ijk.2).card :=
      Finset.card_biUnion_le
    _ ≤ ∑_ijk∈tripleSlots m,P.card*Fintype.card α^(m-3) := by
      apply Finset.sum_le_sum
      intro ijk hijk
      have h := (Finset.mem_filter.mp hijk).2
      exact tripleRestricted_card_le m key hinj P ijk.1.1 ijk.1.2 ijk.2 h.1 h.2.1 h.2.2
    _ = (tripleSlots m).card*(P.card*Fintype.card α^(m-3)) := by simp
    _ ≤ _ := Nat.mul_le_mul_right _ hslots

end NoThreeLine.FiniteTuplePattern

#print axioms NoThreeLine.FiniteTuplePattern.tripleRestricted_card_le
#print axioms NoThreeLine.FiniteTuplePattern.someTripleRestricted_card_le
