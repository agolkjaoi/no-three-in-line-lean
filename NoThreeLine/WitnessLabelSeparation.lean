import NoThreeLine.UnitSourcePrice
import NoThreeLine.LabelMomentPairUnion

/-! The bad relation is the actual specified-line relation on distinct
grid labels. Root-line exclusion is required only on nonzero weights. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open FiniteWitnessMoments

def specifiedDistinctPair {n : ℕ} (Γ : Finset (ℤ×ℤ)) (q r : Grid n) : Prop :=
  q≠r ∧ specifiedPair Γ q r

instance {n : ℕ} (Γ : Finset (ℤ×ℤ)) : DecidableRel (specifiedDistinctPair (n:=n) Γ) :=
  fun q r=>inferInstanceAs (Decidable (q≠r ∧ specifiedPair Γ q r))

theorem separated_insert_tupleLabels {n m : ℕ} (Γ : Finset (ℤ×ℤ)) (p : Grid n)
    (w : Grid n→ℝ) (f : Fin m→Grid n)
    (hroot : ∀q,w q≠0→¬specifiedPair Γ p q) (hw : ∀i,w (f i)≠0)
    (hf : ¬∃i j,i≠j ∧ specifiedDistinctPair Γ (f i) (f j)) :
    SeparatedLabels Γ (insert p (tupleLabels f)) := by
  intro a ha b hb hab
  rcases Finset.mem_insert.mp ha with rfl | ha
  · rcases Finset.mem_insert.mp hb with rfl | hb
    · exact (hab rfl).elim
    · obtain ⟨j,_,rfl⟩ := Finset.mem_image.mp hb
      exact hroot (f j) (hw j)
  · obtain ⟨i,_,rfl⟩ := Finset.mem_image.mp ha
    rcases Finset.mem_insert.mp hb with rfl | hb
    · intro hr
      exact hroot (f i) (hw i) ((BirthLineGroups.specifiedPair_swap Γ (f i) _).mp hr)
    · obtain ⟨j,_,rfl⟩ := Finset.mem_image.mp hb
      intro hr
      apply hf
      exact ⟨i,j,(fun he=>hab (congrArg f he)),hab,hr⟩

theorem separated_insert_tupleLabels_of_prod_ne_zero {n m : ℕ} (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (w : Grid n→ℝ) (f : Fin m→Grid n)
    (hroot : ∀q,w q≠0→¬specifiedPair Γ p q) (hw : (∏i : Fin m,w (f i))≠0)
    (hf : ¬∃i j,i≠j ∧ specifiedDistinctPair Γ (f i) (f j)) :
    SeparatedLabels Γ (insert p (tupleLabels f)) := by
  apply separated_insert_tupleLabels Γ p w f hroot _ hf
  intro i hi
  exact hw (Finset.prod_eq_zero (Finset.mem_univ i) hi)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.separated_insert_tupleLabels_of_prod_ne_zero
