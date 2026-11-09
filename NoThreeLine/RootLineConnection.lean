import NoThreeLine.LineLabelConnection
import NoThreeLine.EmptyLineCreditInvariant

/-! Conditional main-term connection factorization. The complete label set
is separated from specified directions; off-root lines containing two leaves
are actually empty of selected points. No no-exception-to-state claim occurs. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.MixedConnection
open AuxiliaryODE GridLines PrimitiveLines BirthWitness

def rootLeafLine {n : ℕ} (p : Grid n) (C : Finset (Grid n)) (hp : p∉C) (q : C) : LineIndex n := by
  classical
  refine ⟨lineThrough p q.val,Finset.mem_biUnion.mpr ⟨p,Finset.mem_univ _,?_⟩⟩
  exact lineThrough_mem_linesThrough p q.val (fun h => hp (h ▸ q.property))

def DistinctRootLines {n : ℕ} (p : Grid n) (C : Finset (Grid n)) : Prop :=
  ∀q∈C,∀r∈C,q≠r→lineThrough p q≠lineThrough p r

def LeafPairEmpty {n : ℕ} (e : ExtendedState n) (C : Finset (Grid n)) : Prop :=
  ∀K : LineIndex n,2≤multiplicity C K → occupancy e.process K=0

theorem rootLeafLine_injective {n : ℕ} (p : Grid n) (C : Finset (Grid n)) (hp : p∉C)
    (hD : DistinctRootLines p C) : Function.Injective (rootLeafLine p C hp) := by
  intro q r he
  apply Subtype.ext
  by_contra hqr
  exact hD q.val q.property r.val r.property hqr (congrArg Subtype.val he)

theorem rootLeafLine_inter {n : ℕ} (p : Grid n) (C : Finset (Grid n)) (hp : p∉C)
    (hD : DistinctRootLines p C) (q : C) :
    insert p C∩(rootLeafLine p C hp q).val={p,q.val} := by
  classical
  have hqp : q.val≠p := fun h => hp (h ▸ q.property)
  ext x
  constructor
  · intro hx
    obtain ⟨hx,hL⟩ := Finset.mem_inter.mp hx
    rcases Finset.mem_insert.mp hx with hxp|hxC
    · exact Finset.mem_insert.mpr (Or.inl hxp)
    · have hxp : x≠p := fun h => hp (h ▸ hxC)
      have hxq : x=q.val := by
        by_contra hn
        exact hD x hxC q.val q.property hn
          (lineThrough_eq_of_mem p q.val x hqp.symm hxp.symm hL).symm
      exact Finset.mem_insert.mpr (Or.inr (Finset.mem_singleton.mpr hxq))
  · intro hx
    rcases Finset.mem_insert.mp hx with hxp|hxq
    · subst x
      exact Finset.mem_inter.mpr ⟨Finset.mem_insert_self _ _,left_mem_lineThrough p q.val⟩
    · have hx : x=q.val := Finset.mem_singleton.mp hxq
      subst x
      exact Finset.mem_inter.mpr ⟨Finset.mem_insert_of_mem q.property,right_mem_lineThrough p q.val⟩

theorem specified_multiplicity_le_one {n : ℕ} (Γ : Finset ZPoint) (A : Finset (Grid n))
    (hsep : SeparatedLabels Γ A) (K : LineIndex n) (hK : specified Γ K) : multiplicity A K≤1 := by
  apply Finset.card_le_one.mpr
  intro q hq r hr
  by_contra hqr
  have hq' := Finset.mem_inter.mp hq
  have hr' := Finset.mem_inter.mp hr
  apply hsep q hq'.1 r hr'.1 hqr
  apply (specifiedPair_iff_line_mem Γ q r hqr).mpr
  rw [←boardLine_eq K q r hq'.2 hr'.2 hqr]
  exact (Finset.mem_inter.mp ((specified_iff_designated Γ q K hq'.2).mp hK)).1

theorem rootLeafLine_connection {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (C : Finset (Grid n))
    (hp : p∉C) (hD : DistinctRootLines p C) (hsep : SeparatedLabels Γ (insert p C))
    (e : ExtendedState n) (q : C) :
    lineConnection Γ (insert p C) e (rootLeafLine p C hp q)=e.lineCredits (rootLeafLine p C hp q) := by
  classical
  have hqp : p≠q.val := fun h => hp (h ▸ q.property)
  have hm : multiplicity (insert p C) (rootLeafLine p C hp q)=2 := by
    rw [multiplicity,rootLeafLine_inter p C hp hD q]
    simp [hqp]
  have hnot : ¬specified Γ (rootLeafLine p C hp q) := by
    intro hsp
    have hh := specified_multiplicity_le_one Γ _ hsep _ hsp
    omega
  simp only [lineConnection,if_neg hnot,hm,Nat.reduceSub,pow_one]

private theorem other_connection_eq_one {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (C : Finset (Grid n))
    (hp : p∉C) (hsep : SeparatedLabels Γ (insert p C)) (e : ExtendedState n)
    (hE : EmptyLineCredit e) (hEmpty : LeafPairEmpty e C) (K : LineIndex n)
    (hK : K∉Finset.univ.image (rootLeafLine p C hp)) : lineConnection Γ (insert p C) e K=1 := by
  classical
  by_cases hm : multiplicity (insert p C) K≤1
  · simp only [lineConnection,Nat.sub_eq_zero_of_le hm,pow_zero,ite_self]
  · have hnot : ¬specified Γ K := fun hs => hm (specified_multiplicity_le_one Γ _ hsep K hs)
    have hpK : p∉K.val := by
      intro hpK
      have hCK : C∩K.val=∅ := by
        apply Finset.eq_empty_iff_forall_notMem.mpr
        intro q hq
        have hq' := Finset.mem_inter.mp hq
        have hpq : p≠q := fun he => hp (he ▸ hq'.1)
        apply hK
        apply Finset.mem_image.mpr
        refine ⟨⟨q,hq'.1⟩,Finset.mem_univ _,?_⟩
        apply Subtype.ext
        exact (boardLine_eq K p q hpK hq'.2 hpq).symm
      have hi : insert p C∩K.val={p} := by
        rw [Finset.insert_inter_of_mem hpK,hCK]
        simp
      have hc : multiplicity (insert p C) K=1 := by rw [multiplicity,hi]; simp
      omega
    have hi : insert p C∩K.val=C∩K.val := by
      ext q
      simp only [Finset.mem_inter,Finset.mem_insert]
      aesop
    have hmC : 2≤multiplicity C K := by
      unfold multiplicity at hm ⊢
      rw [hi] at hm
      omega
    simp only [lineConnection,if_neg hnot,hE K (hEmpty K hmC),one_pow]

theorem connectionProduct_root_lines {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (C : Finset (Grid n))
    (hp : p∉C) (hD : DistinctRootLines p C) (hsep : SeparatedLabels Γ (insert p C))
    (e : ExtendedState n) (hE : EmptyLineCredit e) (hEmpty : LeafPairEmpty e C) :
    connectionProduct Γ (insert p C) e=∏q : C,e.lineCredits (rootLeafLine p C hp q) := by
  classical
  calc
    _ = ∏K∈Finset.univ.image (rootLeafLine p C hp),lineConnection Γ (insert p C) e K := by
      symm
      apply Finset.prod_subset (Finset.subset_univ _)
      intro K _ hK
      exact other_connection_eq_one Γ p C hp hsep e hE hEmpty K hK
    _ = ∏q : C,lineConnection Γ (insert p C) e (rootLeafLine p C hp q) :=
      Finset.prod_image (fun q _ r _ he => rootLeafLine_injective p C hp hD he)
    _ = _ := Finset.prod_congr rfl (fun q _ => rootLeafLine_connection Γ p C hp hD hsep e q)

end NoThreeLine.MixedConnection

#print axioms NoThreeLine.MixedConnection.connectionProduct_root_lines
