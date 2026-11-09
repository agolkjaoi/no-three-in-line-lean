import NoThreeLine.FinitePairRestriction

/-! A finite pair of tuple coordinates together with one additional point.
The additional point is encoded once, not once per free tuple slot. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteTuplePattern

def pairPointRestricted {α β γ : Type*} [Fintype α] [Fintype γ] [DecidableEq β] [DecidableEq γ]
    (m : ℕ) (key : α→β) (P : Finset ((β×β)×γ)) (i j : Fin m) : Finset ((Fin m→α)×γ) := by
  classical
  exact Finset.univ.filter (fun fv=>((key (fv.1 i),key (fv.1 j)),fv.2)∈P)

theorem pairPointRestricted_card_le {α β γ : Type*} [Fintype α] [Fintype γ] [DecidableEq β] [DecidableEq γ]
    (m : ℕ) (key : α→β) (hinj : Function.Injective key) (P : Finset ((β×β)×γ))
    (i j : Fin m) (hij : i≠j) :
    (pairPointRestricted m key P i j).card≤P.card*Fintype.card α^(m-2) := by
  classical
  let rest : Finset (Fin m) := {i,j}ᶜ
  let encode : ↥(pairPointRestricted m key P i j)→↥P×(↥rest→α) := fun fv=>
    (⟨((key (fv.val.1 i),key (fv.val.1 j)),fv.val.2),(Finset.mem_filter.mp fv.property).2⟩,
      fun k=>fv.val.1 k.val)
  have hencode : Function.Injective encode := by
    intro f g he
    have hp := congrArg (fun x : ↥P×(↥rest→α)=>x.1.val) he
    have hr := congrArg Prod.snd he
    apply Subtype.ext
    apply Prod.ext
    · funext k
      by_cases hki : k=i
      · subst k
        exact hinj (congrArg (fun x : (β×β)×γ=>x.1.1) hp)
      by_cases hkj : k=j
      · subst k
        exact hinj (congrArg (fun x : (β×β)×γ=>x.1.2) hp)
      have hk : k∈rest := by simp [rest,hki,hkj]
      exact congrFun hr ⟨k,hk⟩
    · exact congrArg (fun x : (β×β)×γ=>x.2) hp
  have hrest : rest.card=m-2 := by
    simp only [rest,Finset.card_compl,Finset.card_pair hij,Fintype.card_fin]
  simpa only [Fintype.card_coe,Fintype.card_prod,Fintype.card_fun,hrest] using
    Fintype.card_le_of_injective encode hencode

def somePairPointRestricted {α β γ : Type*} [Fintype α] [Fintype γ] [DecidableEq β] [DecidableEq γ]
    (m : ℕ) (key : α→β) (P : Finset ((β×β)×γ)) : Finset ((Fin m→α)×γ) := by
  classical
  exact (Finset.univ : Finset (Fin m)).offDiag.biUnion
    (fun ij=>pairPointRestricted m key P ij.1 ij.2)

theorem mem_somePairPointRestricted {α β γ : Type*} [Fintype α] [Fintype γ] [DecidableEq β] [DecidableEq γ]
    (m : ℕ) (key : α→β) (P : Finset ((β×β)×γ)) (fv : (Fin m→α)×γ) :
    fv∈somePairPointRestricted m key P ↔ ∃i j : Fin m,i≠j ∧ ((key (fv.1 i),key (fv.1 j)),fv.2)∈P := by
  classical
  simp [somePairPointRestricted,pairPointRestricted,Finset.mem_offDiag]

theorem somePairPointRestricted_card_le {α β γ : Type*} [Fintype α] [Fintype γ] [DecidableEq β] [DecidableEq γ]
    (m : ℕ) (key : α→β) (hinj : Function.Injective key) (P : Finset ((β×β)×γ)) :
    (somePairPointRestricted m key P).card≤m*(m-1)*(P.card*Fintype.card α^(m-2)) := by
  classical
  calc
    _ ≤ ∑ij∈(Finset.univ : Finset (Fin m)).offDiag,(pairPointRestricted m key P ij.1 ij.2).card :=
      Finset.card_biUnion_le
    _ ≤ ∑_ij∈(Finset.univ : Finset (Fin m)).offDiag,P.card*Fintype.card α^(m-2) := by
      apply Finset.sum_le_sum
      intro ij hij
      exact pairPointRestricted_card_le m key hinj P ij.1 ij.2 (Finset.mem_offDiag.mp hij).2.2
    _ = _ := by
      simp only [Finset.sum_const,Finset.offDiag_card,Finset.card_univ,Fintype.card_fin,nsmul_eq_mul]
      rw [Nat.mul_sub_left_distrib,Nat.mul_one]
      simp

end NoThreeLine.FiniteTuplePattern

#print axioms NoThreeLine.FiniteTuplePattern.somePairPointRestricted_card_le
