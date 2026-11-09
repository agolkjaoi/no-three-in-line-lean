import NoThreeLine.SourceCutObservable

/-! For a label set with no distinct pair on a specified line, the actual
S7 shared-line source price is exactly one, in every physical state. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection GridLines

def SeparatedLabels {n : ℕ} (Γ : Finset ZPoint) (A : Finset (Grid n)) : Prop :=
  ∀p∈A,∀q∈A,p≠q→¬specifiedPair Γ p q

theorem SeparatedLabels.mono {n : ℕ} (Γ : Finset ZPoint) (A B : Finset (Grid n))
    (h : SeparatedLabels Γ A) (hBA : B⊆A) : SeparatedLabels Γ B :=
  fun p hp q hq hpq=>h p (hBA hp) q (hBA hq) hpq

theorem sourcePrice_eq_one_of_no_specified_pair {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hq : q∉C)
    (hsep : ∀p∈C,¬specifiedPair Γ q p) : sourcePrice e Γ C q=1 := by
  classical
  apply Finset.prod_eq_one
  intro J _
  apply if_neg
  rintro ⟨⟨hqJ,hpos⟩,hsp⟩
  obtain ⟨p,hp⟩ := Finset.card_pos.mp hpos
  obtain ⟨hpC,hpJ⟩ := Finset.mem_inter.mp hp
  have hqp : q≠p := fun he=>hq (he ▸ hpC)
  have hd := (specified_iff_designated Γ q J hqJ).mp hsp
  apply hsep p hpC
  apply (specifiedPair_iff_line_mem Γ q p hqp).mpr
  rw [←boardLine_eq J q p hqJ hpJ hqp]
  exact (Finset.mem_inter.mp hd).1

theorem sourcePrice_eq_one_of_separated {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C D : Finset (Grid n)) (hCD : Disjoint C D) (hsep : SeparatedLabels Γ (C∪D))
    (q : Grid n) (hq : q∈D) : sourcePrice e Γ C q=1 := by
  have hqC : q∉C := fun h=>Finset.disjoint_left.mp hCD h hq
  apply sourcePrice_eq_one_of_no_specified_pair e Γ C q hqC
  intro p hp
  exact hsep q (Finset.mem_union_right C hq) p (Finset.mem_union_left D hp) (fun he=>hqC (he ▸ hp))

theorem sourceSum_unit_price {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n→ℝ)
    (hCD : Disjoint C D) (hsep : SeparatedLabels Γ (C∪D)) :
    sourceSum a Γ C D L mask retention=
      ∑q∈D,(mask q*retention q/n)*mixed Γ (insert q C) (D.erase q) L a := by
  apply Finset.sum_congr rfl
  intro q hq
  rw [sourcePrice_eq_one_of_separated a.augmented.physical Γ C D hCD hsep q hq,mul_one]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.sourcePrice_eq_one_of_separated
#print axioms NoThreeLine.BirthWitness.sourceSum_unit_price
