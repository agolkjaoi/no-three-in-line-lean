import NoThreeLine.UnitSourcePrice

/-! Label sets contained in one actual non-specified board line have only
that line's connection factor. Other physical lines contain at most one label,
and no distinct pair of these labels lies on a specified direction. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.MixedConnection
open AuxiliaryODE GridLines PrimitiveLines

theorem boardLine_inter_card_le_one {n : ℕ} (L K : LineIndex n) (hLK : L≠K) :
    (L.val∩K.val).card ≤ 1 := by
  classical
  apply Finset.card_le_one.mpr
  intro p hp q hq
  by_contra hpq
  apply hLK
  apply Subtype.ext
  exact (boardLine_eq L p q (Finset.mem_inter.mp hp).1 (Finset.mem_inter.mp hq).1 hpq).trans
    (boardLine_eq K p q (Finset.mem_inter.mp hp).2 (Finset.mem_inter.mp hq).2 hpq).symm

theorem multiplicity_le_one_of_subset_other {n : ℕ} (C : Finset (Grid n))
    (L K : LineIndex n) (hC : C⊆L.val) (hKL : K≠L) : multiplicity C K ≤ 1 := by
  apply (Finset.card_le_card (show C∩K.val⊆L.val∩K.val from ?_)).trans
    (boardLine_inter_card_le_one L K (Ne.symm hKL))
  intro p hp
  exact Finset.mem_inter.mpr ⟨hC (Finset.mem_inter.mp hp).1,(Finset.mem_inter.mp hp).2⟩

theorem lineConnection_eq_one_of_subset_other {n : ℕ} (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (e : ExtendedState n) (L K : LineIndex n)
    (hC : C⊆L.val) (hKL : K≠L) : lineConnection Γ C e K=1 := by
  have hm := multiplicity_le_one_of_subset_other C L K hC hKL
  simp only [lineConnection,Nat.sub_eq_zero_of_le hm,pow_zero,ite_self]

theorem connectionProduct_of_subset_nonspecified_line {n : ℕ} (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (e : ExtendedState n) (L : LineIndex n)
    (hL : ¬specified Γ L) (hC : C⊆L.val) :
    connectionProduct Γ C e=e.lineCredits L^(C.card-1) := by
  classical
  calc
    _ = lineConnection Γ C e L := Finset.prod_eq_single L
      (fun K _ hKL => lineConnection_eq_one_of_subset_other Γ C e L K hC hKL) (by simp)
    _ = _ := by
      simp only [lineConnection,if_neg hL,multiplicity,Finset.inter_eq_left.mpr hC]

end NoThreeLine.MixedConnection

namespace NoThreeLine.BirthWitness
open AuxiliaryODE GridLines PrimitiveLines MixedConnection

theorem separatedLabels_of_subset_nonspecified_line {n : ℕ} (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (L : LineIndex n) (hL : ¬specified Γ L) (hC : C⊆L.val) :
    SeparatedLabels Γ C := by
  classical
  intro p hp q hq hpq hpair
  apply hL
  apply designated_specified Γ p L
  have he := boardLine_eq L p q (hC hp) (hC hq) hpq
  change L.val∈specifiedLines Γ p∩linesThrough p
  rw [he]
  exact Finset.mem_inter.mpr ⟨(specifiedPair_iff_line_mem Γ p q hpq).mp hpair,
    lineThrough_mem_linesThrough p q hpq⟩

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.MixedConnection.connectionProduct_of_subset_nonspecified_line
#print axioms NoThreeLine.BirthWitness.separatedLabels_of_subset_nonspecified_line
