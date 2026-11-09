import NoThreeLine.ShortStarRealizedPattern

/-! Finite covers of actual realized tuples by representative patterns.
Overlapping encodings are counted from above. No probability or source price
is assigned to arbitrary tuples by this purely finite counting theorem. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines

abbrev RepeatPattern (m a j : ℕ) :=
  (Fin m→Fin a) × (Fin a→Fin m) × (Fin a→Fin j) × (Fin j→Fin a)

def legalPatterns (m a j : ℕ) : Finset (RepeatPattern m a j) := by
  classical
  exact Finset.univ.filter (fun P=>Function.LeftInverse P.1 P.2.1 ∧
    Function.LeftInverse P.2.2.1 P.2.2.2)

def patternTuples {n m a j : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (P : RepeatPattern m a j) : Finset (Fin m→Grid n×Grid n) := by
  classical
  exact Finset.univ.biUnion (fun anchor : Fin j→↥(shortStars Γ p H)=>
    (blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor).image (fun g i=>g (P.1 i)))

def patternCover {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (m a j : ℕ) : Finset (Fin m→Grid n×Grid n) :=
  (legalPatterns m a j).biUnion (patternTuples Γ p H)

def repeatPatternCount (m a j : ℕ) : ℕ := a^m*m^a*j^a*a^j

theorem repeatPattern_card (m a j : ℕ) : Fintype.card (RepeatPattern m a j)=repeatPatternCount m a j := by
  simp only [RepeatPattern,Fintype.card_prod,Fintype.card_fun,Fintype.card_fin,repeatPatternCount]
  ring

theorem legalPatterns_card_le (m a j : ℕ) : (legalPatterns m a j).card≤repeatPatternCount m a j := by
  calc _≤Fintype.card (RepeatPattern m a j) := Finset.card_le_univ _
       _=_ := repeatPattern_card m a j

theorem realized_mem_patternCover {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s) :
    (fun i=>(f i).val)∈patternCover Γ p H m (leafLabels f).card (witnessLabels f).card := by
  classical
  obtain ⟨code,lr,block,wr,hl,hw,hf,hqi,hzi,hzimage,hmem⟩ := exists_realized_pattern f s hs
  apply Finset.mem_biUnion.mpr
  refine ⟨(code,lr,block,wr),?_,?_⟩
  · simp only [legalPatterns,Finset.mem_filter,Finset.mem_univ,true_and]
    exact ⟨hl,hw⟩
  · apply Finset.mem_biUnion.mpr
    refine ⟨(fun k=>f (lr (wr k))),Finset.mem_univ _,?_⟩
    apply Finset.mem_image.mpr
    refine ⟨(fun i=>(f (lr i)).val),hmem,?_⟩
    funext i
    exact congrArg Subtype.val (hf i)

theorem patternTuples_card_le {n m a j : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (hH : 0≤H) (P : RepeatPattern m a j) (hP : P∈legalPatterns m a j) :
    ((patternTuples Γ p H P).card : ℝ)≤((shortStars Γ p H).card : ℝ)^j*H^(a-j) := by
  classical
  have hw := (Finset.mem_filter.mp hP).2.2
  calc
    _ ≤ ∑anchor : Fin j→↥(shortStars Γ p H),
        (((blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor).image (fun g i=>g (P.1 i))).card : ℝ) := by
      exact_mod_cast (Finset.card_biUnion_le (s:=Finset.univ)
        (t:=fun anchor : Fin j→↥(shortStars Γ p H)=>
          (blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor).image (fun g i=>g (P.1 i))))
    _ ≤ ∑anchor : Fin j→↥(shortStars Γ p H),
        ((blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor).card : ℝ) := by
      apply Finset.sum_le_sum
      intro anchor _
      exact_mod_cast (Finset.card_image_le (s:=blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor)
        (f:=fun g i=>g (P.1 i)))
    _ ≤ _ := sum_blockCompletions_card_le Γ p H hH P.2.2.1 P.2.2.2 hw

theorem patternCover_card_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (hH : 0≤H) (m a j : ℕ) :
    ((patternCover Γ p H m a j).card : ℝ)≤
      (repeatPatternCount m a j : ℝ)*((shortStars Γ p H).card : ℝ)^j*H^(a-j) := by
  classical
  calc
    _ ≤ ∑P∈legalPatterns m a j,((patternTuples Γ p H P).card : ℝ) := by
      exact_mod_cast (Finset.card_biUnion_le (s:=legalPatterns m a j) (t:=patternTuples Γ p H))
    _ ≤ ∑P∈legalPatterns m a j,((shortStars Γ p H).card : ℝ)^j*H^(a-j) :=
      Finset.sum_le_sum (fun P hP=>patternTuples_card_le Γ p H hH P hP)
    _ = ((legalPatterns m a j).card : ℝ)*(((shortStars Γ p H).card : ℝ)^j*H^(a-j)) := by simp
    _ ≤ (repeatPatternCount m a j : ℝ)*(((shortStars Γ p H).card : ℝ)^j*H^(a-j)) :=
      mul_le_mul_of_nonneg_right (by exact_mod_cast legalPatterns_card_le m a j)
        (mul_nonneg (pow_nonneg (Nat.cast_nonneg _) _) (pow_nonneg hH _))
    _ = _ := by ring

def realizedTuples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (m a j : ℕ) (s : ProcessState n) : Finset (Fin m→↥(shortStars Γ p H)) := by
  classical
  exact Finset.univ.filter (fun f=>TupleRealized f s ∧ (leafLabels f).card=a ∧ (witnessLabels f).card=j)

theorem realizedTuples_card_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (hH : 0≤H) (m a j : ℕ) (s : ProcessState n) :
    ((realizedTuples Γ p H m a j s).card : ℝ)≤
      (repeatPatternCount m a j : ℝ)*((shortStars Γ p H).card : ℝ)^j*H^(a-j) := by
  classical
  let toRaw : (Fin m→↥(shortStars Γ p H))→(Fin m→Grid n×Grid n) := fun f i=>(f i).val
  have hinj : Function.Injective toRaw := by
    intro f g he
    funext i
    exact Subtype.ext (congrFun he i)
  have hsub : (realizedTuples Γ p H m a j s).image toRaw⊆patternCover Γ p H m a j := by
    intro g hg
    obtain ⟨f,hf,rfl⟩ := Finset.mem_image.mp hg
    have hh := (Finset.mem_filter.mp hf).2
    simpa only [hh.2.1,hh.2.2] using realized_mem_patternCover f s hh.1
  have hc : (realizedTuples Γ p H m a j s).card≤(patternCover Γ p H m a j).card := by
    rw [←Finset.card_image_of_injective _ hinj]
    exact Finset.card_le_card hsub
  exact (by exact_mod_cast hc : ((realizedTuples Γ p H m a j s).card : ℝ)≤
    ((patternCover Γ p H m a j).card : ℝ)).trans (patternCover_card_le Γ p H hH m a j)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.realized_mem_patternCover
#print axioms NoThreeLine.ShortStars.realizedTuples_card_le
