import NoThreeLine.ShortStarWitnessFibers

/-! Fixed witness-block patterns: j representative slots and a-j same-
witness extension slots. This counts encoded completions, not arbitrary
tuples without a supplied pattern or a probabilistic source estimate. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines

def blockCompletions {n a j : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (block : Fin a→Fin j) (rep : Fin j→Fin a) (anchor : Fin j→↥(shortStars Γ p H)) :
    Finset (Fin a→Grid n×Grid n) :=
  anchoredCompletions Γ p H (Finset.univ.image rep) (fun i=>(anchor (block i)).val)

theorem blockCompletions_card_le {n a j : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (hH : 0≤H) (block : Fin a→Fin j) (rep : Fin j→Fin a)
    (hr : Function.LeftInverse block rep) (anchor : Fin j→↥(shortStars Γ p H)) :
    ((blockCompletions Γ p H block rep anchor).card : ℝ)≤H^(a-j) := by
  have hc : (Finset.univ.image rep).card=j := by
    rw [Finset.card_image_of_injective _ hr.injective]
    simp
  simpa only [blockCompletions,hc] using
    anchoredCompletions_card_le Γ p H hH (Finset.univ.image rep) (fun i=>(anchor (block i)).val)

theorem blockCompletion_anchor {n a j : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (block : Fin a→Fin j) (rep : Fin j→Fin a) (hr : Function.LeftInverse block rep)
    (anchor : Fin j→↥(shortStars Γ p H)) (g : Fin a→Grid n×Grid n)
    (hg : g∈blockCompletions Γ p H block rep anchor) (k : Fin j) : g (rep k)=(anchor k).val := by
  have hh := (mem_anchoredCompletions Γ p H (Finset.univ.image rep) _ g).mp hg
  simpa only [hr k] using hh.1 (rep k) (Finset.mem_image.mpr ⟨k,Finset.mem_univ _,rfl⟩)

theorem blockCompletion_star_and_witness {n a j : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (block : Fin a→Fin j) (rep : Fin j→Fin a)
    (anchor : Fin j→↥(shortStars Γ p H)) (g : Fin a→Grid n×Grid n)
    (hg : g∈blockCompletions Γ p H block rep anchor) (i : Fin a) :
    g i∈shortStars Γ p H ∧ (g i).2=(anchor (block i)).val.2 := by
  classical
  have hh := (mem_anchoredCompletions Γ p H (Finset.univ.image rep) _ g).mp hg
  by_cases hi : i∈Finset.univ.image rep
  · rw [hh.1 i hi]
    exact ⟨(anchor (block i)).property,rfl⟩
  · exact hh.2 i hi

theorem mem_blockCompletions_of_pattern {n a j : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (block : Fin a→Fin j) (rep : Fin j→Fin a) (hr : Function.LeftInverse block rep)
    (f : Fin a→↥(shortStars Γ p H))
    (hf : ∀i,(f i).val.2=(f (rep (block i))).val.2) :
    (fun i=>(f i).val)∈blockCompletions Γ p H block rep (fun k=>f (rep k)) := by
  apply (mem_anchoredCompletions Γ p H (Finset.univ.image rep) _ _).mpr
  constructor
  · intro i hi
    obtain ⟨k,_,rfl⟩ := Finset.mem_image.mp hi
    rw [hr k]
  · intro i _
    exact ⟨(f i).property,hf i⟩

theorem sum_blockCompletions_card_le {n a j : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (hH : 0≤H) (block : Fin a→Fin j) (rep : Fin j→Fin a)
    (hr : Function.LeftInverse block rep) :
    (∑anchor : Fin j→↥(shortStars Γ p H),((blockCompletions Γ p H block rep anchor).card : ℝ))≤
      ((shortStars Γ p H).card : ℝ)^j*H^(a-j) := by
  calc
    _ ≤ ∑_anchor : Fin j→↥(shortStars Γ p H),H^(a-j) :=
      Finset.sum_le_sum (fun anchor _=>blockCompletions_card_le Γ p H hH block rep hr anchor)
    _ = _ := by simp only [Finset.sum_const,nsmul_eq_mul,Finset.card_univ,Fintype.card_fun,
      Fintype.card_fin,Fintype.card_coe,Nat.cast_pow]

theorem sum_blockCompletions_weight_le {n a j : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (hH : 0≤H) (block : Fin a→Fin j) (rep : Fin j→Fin a)
    (hr : Function.LeftInverse block rep) (price : Grid n→ℝ) (hp : ∀q,0≤price q) :
    (∑anchor : Fin j→↥(shortStars Γ p H),
      ((blockCompletions Γ p H block rep anchor).card : ℝ)*(∏k : Fin j,price (anchor k).val.2))≤
      H^(a-j)*(∑s∈shortStars Γ p H,price s.2)^j := by
  calc
    _ ≤ ∑anchor : Fin j→↥(shortStars Γ p H),H^(a-j)*(∏k : Fin j,price (anchor k).val.2) :=
      Finset.sum_le_sum (fun anchor _=>mul_le_mul_of_nonneg_right
        (blockCompletions_card_le Γ p H hH block rep hr anchor)
        (Finset.prod_nonneg (fun k _=>hp (anchor k).val.2)))
    _ = H^(a-j)*(∑s : ↥(shortStars Γ p H),price s.val.2)^j := by
      rw [←Finset.mul_sum,←Fintype.sum_pow (fun s : ↥(shortStars Γ p H)=>price s.val.2) j]
    _ = _ := congrArg (fun x : ℝ=>H^(a-j)*x^j)
      (Finset.sum_coe_sort (shortStars Γ p H) (fun s : Grid n×Grid n=>price s.2))

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.mem_blockCompletions_of_pattern
#print axioms NoThreeLine.ShortStars.sum_blockCompletions_card_le
#print axioms NoThreeLine.ShortStars.sum_blockCompletions_weight_le
