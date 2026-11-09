import NoThreeLine.VirtualTupleLabels
import NoThreeLine.FiniteImageSplit

/-! A deterministic finite cover of virtual tuples by their distinct leaf
representatives.  Every representative has a distinct selected witness in
the actual state; counting the enlarged candidate space uses G3 only. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments FiniteTuplePattern

def anchors {n : ℕ} (L : LineIndex n) (q : Grid n) (a : ℕ) :
    Finset (Fin a → candidates L q) :=
  Finset.univ.filter (fun g => Function.Injective (fun i => (g i).val.1) ∧
    Function.Injective (fun i => (g i).val.2))

def tuplePairs {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q) :
    Fin m → (Σ _ : Grid n, Grid n) :=
  fun i => ⟨(f i).val, witness s Γ L q (f i)⟩

theorem exists_anchor_pattern {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q)
    (hs : s.Valid) (hqL : q ∉ L.val) (hq : (s.accounts q).status = .active) :
    ∃ code : Fin m → Fin (leafLabels f).card,
    ∃ g : Fin (leafLabels f).card → candidates L q,
      g ∈ anchors L q (leafLabels f).card ∧
      (∀ i, tuplePairs f i = (g (code i)).val) ∧
      (∀ j, (g j).val.2 ∈ s.selected) := by
  have hsplit := exists_image_split f
  have hc : (Finset.univ.image f).card = (leafLabels f).card := (leafLabels_card f).symm
  rw [hc] at hsplit
  obtain ⟨code, rep, _, hf, hi, _⟩ := hsplit
  let g : Fin (leafLabels f).card → candidates L q := fun j =>
    ⟨⟨(f (rep j)).val, witness s Γ L q (f (rep j))⟩, witness_candidate s Γ L q (f (rep j))⟩
  refine ⟨code, g, ?_, ?_, ?_⟩
  · apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ _, ?_, ?_⟩
    · exact Subtype.val_injective.comp hi
    · exact (witness_injective s hs Γ L q hqL hq).comp hi
  · intro i
    dsimp only [g, tuplePairs]
    rw [hf i]
  · intro j
    exact witness_selected s Γ L q (f (rep j))

def patternCover {n : ℕ} (L : LineIndex n) (q : Grid n) (m a : ℕ) :
    Finset (Fin m → (Σ _ : Grid n, Grid n)) :=
  Finset.univ.biUnion (fun code : Fin m → Fin a =>
    (anchors L q a).image (fun g i => (g (code i)).val))

theorem tuple_mem_patternCover {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q)
    (hs : s.Valid) (hqL : q ∉ L.val) (hq : (s.accounts q).status = .active) :
    tuplePairs f ∈ patternCover L q m (leafLabels f).card := by
  obtain ⟨code, g, hg, hf, _⟩ := exists_anchor_pattern f hs hqL hq
  apply Finset.mem_biUnion.mpr
  exact ⟨code, Finset.mem_univ _, Finset.mem_image.mpr ⟨g, hg, (funext hf).symm⟩⟩

theorem patternCover_card_le {n : ℕ} (L : LineIndex n) (q : Grid n) (m a : ℕ) :
    (patternCover L q m a).card ≤ a ^ m * (candidates L q).card ^ a := by
  calc
    _ ≤ ∑ code : Fin m → Fin a,
        ((anchors L q a).image (fun g i => (g (code i)).val)).card :=
      Finset.card_biUnion_le
    _ ≤ ∑ _code : Fin m → Fin a, (anchors L q a).card :=
      Finset.sum_le_sum (fun _ _ => Finset.card_image_le)
    _ ≤ ∑ _code : Fin m → Fin a, Fintype.card (Fin a → candidates L q) :=
      Finset.sum_le_sum (fun _ _ => Finset.card_le_univ _)
    _ = _ := by simp [Fintype.card_fun]

theorem patternCover_card_le_const_rpow (ξ : ℝ) (hξ : 0 < ξ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (n m a : ℕ) (L : LineIndex n) (q : Grid n), q ∉ L.val →
      ((patternCover L q m a).card : ℝ) ≤
        (a : ℝ) ^ m * (C * (n : ℝ) ^ (1 + ξ)) ^ a := by
  obtain ⟨C, hC, h⟩ := candidates_card_le_const_rpow ξ hξ
  refine ⟨C, hC, ?_⟩
  intro n m a L q hq
  calc
    _ ≤ (a : ℝ) ^ m * ((candidates L q).card : ℝ) ^ a := by
      exact_mod_cast patternCover_card_le L q m a
    _ ≤ _ := mul_le_mul_of_nonneg_left
      (pow_le_pow_left₀ (Nat.cast_nonneg _) (h n L q hq) a) (by positivity)

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.exists_anchor_pattern
#print axioms NoThreeLine.VirtualWitness.tuple_mem_patternCover
#print axioms NoThreeLine.VirtualWitness.patternCover_card_le_const_rpow
