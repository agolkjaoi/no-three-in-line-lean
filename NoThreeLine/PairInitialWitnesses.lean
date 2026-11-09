import NoThreeLine.TwoStarSubpower
import NoThreeLine.PairWitnessGeometry

/-! G2 applied to a fixed, state-independent LL initial-edge candidate
set. Both selected witnesses and every active root/cause are separated.
The actual common-change event is proved to supply a candidate. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open PrimitiveLines GridLines AuxiliaryODE TwoStar

def initialWitnessCandidates {n : ℕ} (a b : Grid n) : Finset (Σ _q : Grid n, Grid n×Grid n) :=
  (offBaselineCauses a b).sigma (fun q=>
    ((lineThrough a q) ×ˢ (lineThrough b q)).filter
      (fun zw=>zw.1≠zw.2 ∧ zw.1≠a ∧ zw.1≠b ∧ zw.1≠q ∧
        zw.2≠a ∧ zw.2≠b ∧ zw.2≠q))

theorem initialWitnessCandidates_card_le_sum {n : ℕ} (a b : Grid n) :
    (initialWitnessCandidates a b).card≤twoStarSum a b := by
  rw [initialWitnessCandidates,Finset.card_sigma]
  apply Finset.sum_le_sum
  intro q hq
  exact (Finset.card_filter_le _ _).trans_eq (Finset.card_product _ _)

theorem initialWitnessCandidates_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (a b : Grid n),
      ((initialWitnessCandidates a b).card : ℝ)≤C*(n : ℝ)^(2+ξ) := by
  obtain ⟨C,hC,hbound⟩ := twoStarSum_le_const_rpow ξ hξ
  refine ⟨C,hC,?_⟩
  intro n a b
  exact (Nat.cast_le.mpr (initialWitnessCandidates_card_le_sum a b)).trans (hbound n a b)

theorem actual_two_selected_witnesses_mem {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (a b q z w : Grid n) (ha : (s.accounts a).status=.active)
    (hb : (s.accounts b).status=.active) (hq : (s.accounts q).status=.active)
    (harea : orientedArea a b q≠0) (hz : z∈s.selected) (hw : w∈s.selected)
    (hza : z∈lineThrough a q) (hwb : w∈lineThrough b q) :
    (⟨q,(z,w)⟩ : Σ _q : Grid n, Grid n×Grid n)∈initialWitnessCandidates a b := by
  apply Finset.mem_sigma.mpr
  refine ⟨Finset.mem_filter.mpr ⟨Finset.mem_univ _,harea⟩,?_⟩
  exact Finset.mem_filter.mpr ⟨Finset.mem_product.mpr ⟨hza,hwb⟩,
    two_selected_witnesses_ne s hs a b q z w hq harea hz hw hza hwb,
    selected_ne_active s hs z a hz ha,selected_ne_active s hs z b hz hb,
    selected_ne_active s hs z q hz hq,selected_ne_active s hs w a hw ha,
    selected_ne_active s hs w b hw hb,selected_ne_active s hs w q hw hq⟩

theorem commonChange_LL_initial_candidate {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (Γ : Finset ZPoint) (a b q : Grid n)
    (ha : (s.accounts a).status=.active) (hb : (s.accounts b).status=.active)
    (hq : (s.accounts q).status=.active) (hc : commonChange Γ s.selected a b q)
    (hA : ¬specifiedPair Γ a q) (hB : ¬specifiedPair Γ b q) :
    ∃ z∈s.selected, ∃ w∈s.selected,
      (⟨q,(z,w)⟩ : Σ _q : Grid n, Grid n×Grid n)∈initialWitnessCandidates a b := by
  obtain ⟨z,hz,w,hw,hza,hwb,hzw⟩ := commonChange_LL_witnesses s hs Γ a b q ha hb hq hc hA hB
  exact ⟨z,hz,w,hw,actual_two_selected_witnesses_mem s hs a b q z w ha hb hq
    ((commonChange_classification s hs Γ a b q ha hb hq).mp hc).1 hz hw hza hwb⟩

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.initialWitnessCandidates_card_le_const_rpow
#print axioms NoThreeLine.PairWitness.commonChange_LL_initial_candidate
