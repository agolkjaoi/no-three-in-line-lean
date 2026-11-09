import NoThreeLine.ShortStarRepeatedWitness
import Mathlib.Data.Fintype.BigOperators

/-! Actual same-witness fibers and anchored finite completions. Each free
slot chooses a short star sharing a prescribed physical witness; it is not
an unrestricted choice of any star. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines

def sameWitnessFiber {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (z : Grid n) :
    Finset (Grid n×Grid n) := (shortStars Γ p H).filter (fun s=>s.2=z)

@[simp] theorem mem_sameWitnessFiber {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (z : Grid n) (s : Grid n×Grid n) : s∈sameWitnessFiber Γ p H z ↔ s∈shortStars Γ p H ∧ s.2=z :=
  Finset.mem_filter

theorem sameWitnessFiber_card_le_threshold {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (hH : 0≤H) (z : Grid n) : ((sameWitnessFiber Γ p H z).card : ℝ)≤H := by
  have hc : (sameWitnessFiber Γ p H z).card≤(witnesses Γ p H z).card := by
    apply Finset.card_le_card_of_injOn Prod.fst
    · intro s hs
      have hh := (mem_sameWitnessFiber Γ p H z s).mp hs
      have hv := (mem_shortStars Γ p H s.1 s.2).mp hh.1
      exact (mem_witnesses Γ p H z s.1).mpr (hh.2 ▸ Valid.swap Γ p H s.1 s.2 hv)
    · intro s hs t ht hst
      apply Prod.ext hst
      exact ((mem_sameWitnessFiber Γ p H z s).mp hs).2.trans
        ((mem_sameWitnessFiber Γ p H z t).mp ht).2.symm
  exact (show ((sameWitnessFiber Γ p H z).card : ℝ)≤(witnesses Γ p H z).card by exact_mod_cast hc).trans
    (witnesses_card_le_threshold Γ p H hH z)

def anchoredCompletions {n a : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (A : Finset (Fin a)) (base : Fin a→Grid n×Grid n) : Finset (Fin a→Grid n×Grid n) := by
  classical
  exact Fintype.piFinset (fun i=>if i∈A then {base i} else sameWitnessFiber Γ p H (base i).2)

theorem mem_anchoredCompletions {n a : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (A : Finset (Fin a)) (base g : Fin a→Grid n×Grid n) :
    g∈anchoredCompletions Γ p H A base ↔
      (∀i∈A,g i=base i) ∧ (∀i,i∉A → g i∈shortStars Γ p H ∧ (g i).2=(base i).2) := by
  classical
  simp only [anchoredCompletions,Fintype.mem_piFinset]
  constructor
  · intro hg
    constructor
    · intro i hi
      have hh := hg i
      simpa only [if_pos hi,Finset.mem_singleton] using hh
    · intro i hi
      have hh := hg i
      simpa only [if_neg hi,mem_sameWitnessFiber] using hh
  · rintro ⟨ha,hf⟩ i
    by_cases hi : i∈A
    · simpa only [if_pos hi,Finset.mem_singleton] using ha i hi
    · simpa only [if_neg hi,mem_sameWitnessFiber] using hf i hi

theorem anchoredCompletions_card_le {n a : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (hH : 0≤H) (A : Finset (Fin a)) (base : Fin a→Grid n×Grid n) :
    ((anchoredCompletions Γ p H A base).card : ℝ)≤H^(a-A.card) := by
  classical
  have he : (∏i : Fin a,if i∈A then (1:ℝ) else H)=H^(a-A.card) := by
    calc
      _ = ∏i∈Finset.univ\A,if i∈A then (1:ℝ) else H := by
        symm
        apply Finset.prod_subset (Finset.sdiff_subset)
        intro i _ hi
        exact if_pos (by simpa only [Finset.mem_sdiff,Finset.mem_univ,true_and,not_not] using hi)
      _ = ∏_i∈Finset.univ\A,H := Finset.prod_congr rfl (fun i hi=>if_neg (Finset.mem_sdiff.mp hi).2)
      _ = _ := by rw [Finset.prod_const,Finset.card_sdiff_of_subset (Finset.subset_univ _)]; simp
  rw [anchoredCompletions,Fintype.card_piFinset,Nat.cast_prod]
  apply le_trans _ he.le
  apply Finset.prod_le_prod
  · intro i _
    exact Nat.cast_nonneg _
  · intro i _
    by_cases hi : i∈A
    · simp only [if_pos hi,Finset.card_singleton,Nat.cast_one,le_refl]
    · simp only [if_neg hi]
      exact sameWitnessFiber_card_le_threshold Γ p H hH (base i).2

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.sameWitnessFiber_card_le_threshold
#print axioms NoThreeLine.ShortStars.anchoredCompletions_card_le
