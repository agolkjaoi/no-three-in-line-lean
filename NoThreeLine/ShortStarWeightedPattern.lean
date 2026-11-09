import NoThreeLine.ShortStarPatternCover

/-! Price-weighted covers keep one price per actual distinct witness.
Distinct anchor witnesses are required before applying the finite product
identity; only then is the nonnegative anchor sum enlarged to all anchors. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteTuplePattern

theorem sum_biUnion_le_nonneg {ι α : Type*} [DecidableEq ι] [DecidableEq α]
    (I : Finset ι) (T : ι→Finset α) (w : α→ℝ) (hw : ∀x,0≤w x) :
    (∑x∈I.biUnion T,w x)≤∑i∈I,∑x∈T i,w x := by
  classical
  induction I using Finset.induction_on with
  | empty => simp
  | @insert i I hi ih =>
    rw [Finset.biUnion_insert,Finset.sum_insert hi]
    have he := Finset.sum_union_inter (s₁:=T i) (s₂:=I.biUnion T) (f:=w)
    have h0 : 0≤∑x∈T i∩I.biUnion T,w x := Finset.sum_nonneg (fun x _=>hw x)
    linarith

end NoThreeLine.FiniteTuplePattern

namespace NoThreeLine.ShortStars
open PrimitiveLines FiniteTuplePattern

def rawWitnessPrice {n m : ℕ} (price : Grid n→ℝ) (f : Fin m→Grid n×Grid n) : ℝ :=
  ∏z∈Finset.univ.image (fun i=>(f i).2),price z

theorem rawWitnessPrice_nonneg {n m : ℕ} (price : Grid n→ℝ) (hp : ∀q,0≤price q)
    (f : Fin m→Grid n×Grid n) : 0≤rawWitnessPrice price f :=
  Finset.prod_nonneg (fun q _=>hp q)

def distinctAnchors {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (j : ℕ) :
    Finset (Fin j→↥(shortStars Γ p H)) := by
  classical
  exact Finset.univ.filter (fun anchor=>Function.Injective (fun k=>(anchor k).val.2))

def distinctPatternTuples {n m a j : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (P : RepeatPattern m a j) : Finset (Fin m→Grid n×Grid n) := by
  classical
  exact (distinctAnchors Γ p H j).biUnion (fun anchor=>
    (blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor).image (fun g i=>g (P.1 i)))

def distinctPatternCover {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (m a j : ℕ) : Finset (Fin m→Grid n×Grid n) :=
  (legalPatterns m a j).biUnion (distinctPatternTuples Γ p H)

theorem decoded_witness_image {n m a j : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (P : RepeatPattern m a j) (hP : P∈legalPatterns m a j)
    (anchor : Fin j→↥(shortStars Γ p H)) (g : Fin a→Grid n×Grid n)
    (hg : g∈blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor) :
    Finset.univ.image (fun i=>(g (P.1 i)).2)=Finset.univ.image (fun k=>(anchor k).val.2) := by
  classical
  have h := (Finset.mem_filter.mp hP).2
  ext z
  constructor
  · intro hz
    obtain ⟨i,_,rfl⟩ := Finset.mem_image.mp hz
    exact Finset.mem_image.mpr ⟨P.2.2.1 (P.1 i),Finset.mem_univ _,
      (blockCompletion_star_and_witness Γ p H P.2.2.1 P.2.2.2 anchor g hg (P.1 i)).2.symm⟩
  · intro hz
    obtain ⟨k,_,rfl⟩ := Finset.mem_image.mp hz
    refine Finset.mem_image.mpr ⟨P.2.1 (P.2.2.2 k),Finset.mem_univ _,?_⟩
    rw [h.1 (P.2.2.2 k),blockCompletion_anchor Γ p H P.2.2.1 P.2.2.2 h.2 anchor g hg k]

theorem decoded_witness_price {n m a j : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (P : RepeatPattern m a j) (hP : P∈legalPatterns m a j)
    (anchor : Fin j→↥(shortStars Γ p H)) (ha : anchor∈distinctAnchors Γ p H j)
    (g : Fin a→Grid n×Grid n) (hg : g∈blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor)
    (price : Grid n→ℝ) : rawWitnessPrice price (fun i=>g (P.1 i))=∏k : Fin j,price (anchor k).val.2 := by
  unfold rawWitnessPrice
  rw [decoded_witness_image Γ p H P hP anchor g hg]
  exact Finset.prod_image (fun i _ j _ he=>(Finset.mem_filter.mp ha).2 he)

theorem realized_mem_distinctPatternCover {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s) :
    (fun i=>(f i).val)∈distinctPatternCover Γ p H m (leafLabels f).card (witnessLabels f).card := by
  classical
  obtain ⟨code,lr,block,wr,hl,hw,hf,hqi,hzi,hzimage,hmem⟩ := exists_realized_pattern f s hs
  apply Finset.mem_biUnion.mpr
  refine ⟨(code,lr,block,wr),Finset.mem_filter.mpr ⟨Finset.mem_univ _,hl,hw⟩,?_⟩
  apply Finset.mem_biUnion.mpr
  refine ⟨(fun k=>f (lr (wr k))),Finset.mem_filter.mpr ⟨Finset.mem_univ _,hzi⟩,?_⟩
  apply Finset.mem_image.mpr
  refine ⟨(fun i=>(f (lr i)).val),hmem,?_⟩
  funext i
  exact congrArg Subtype.val (hf i)

theorem distinctPatternTuples_price_le {n m a j : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (hH : 0≤H) (P : RepeatPattern m a j) (hP : P∈legalPatterns m a j)
    (price : Grid n→ℝ) (hp : ∀q,0≤price q) :
    (∑f∈distinctPatternTuples Γ p H P,rawWitnessPrice price f)≤
      H^(a-j)*(∑s∈shortStars Γ p H,price s.2)^j := by
  classical
  have hw := (Finset.mem_filter.mp hP).2.2
  apply (sum_biUnion_le_nonneg (distinctAnchors Γ p H j) _ (rawWitnessPrice price)
    (rawWitnessPrice_nonneg price hp)).trans
  calc
    _ ≤ ∑anchor∈distinctAnchors Γ p H j,
        ((blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor).card : ℝ)*(∏k : Fin j,price (anchor k).val.2) := by
      apply Finset.sum_le_sum
      intro anchor ha
      apply (Finset.sum_image_le_of_nonneg (fun f _=>rawWitnessPrice_nonneg price hp f)).trans
      rw [show (∑g∈blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor,
          rawWitnessPrice price (fun i=>g (P.1 i)))=
          ∑_g∈blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor,(∏k : Fin j,price (anchor k).val.2) from
        Finset.sum_congr rfl (fun g hg=>decoded_witness_price Γ p H P hP anchor ha g hg price)]
      simp
    _ ≤ ∑anchor : Fin j→↥(shortStars Γ p H),
        ((blockCompletions Γ p H P.2.2.1 P.2.2.2 anchor).card : ℝ)*(∏k : Fin j,price (anchor k).val.2) := by
      apply Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _)
      intro anchor _ _
      exact mul_nonneg (Nat.cast_nonneg _) (Finset.prod_nonneg (fun k _=>hp _))
    _ ≤ _ := sum_blockCompletions_weight_le Γ p H hH P.2.2.1 P.2.2.2 hw price hp

theorem distinctPatternCover_price_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (hH : 0≤H) (m a j : ℕ) (price : Grid n→ℝ) (hp : ∀q,0≤price q) :
    (∑f∈distinctPatternCover Γ p H m a j,rawWitnessPrice price f)≤
      (repeatPatternCount m a j : ℝ)*H^(a-j)*(∑s∈shortStars Γ p H,price s.2)^j := by
  classical
  apply (sum_biUnion_le_nonneg (legalPatterns m a j) _ (rawWitnessPrice price)
    (rawWitnessPrice_nonneg price hp)).trans
  calc
    _ ≤ ∑P∈legalPatterns m a j,H^(a-j)*(∑s∈shortStars Γ p H,price s.2)^j :=
      Finset.sum_le_sum (fun P hP=>distinctPatternTuples_price_le Γ p H hH P hP price hp)
    _ = ((legalPatterns m a j).card : ℝ)*(H^(a-j)*(∑s∈shortStars Γ p H,price s.2)^j) := by simp
    _ ≤ (repeatPatternCount m a j : ℝ)*(H^(a-j)*(∑s∈shortStars Γ p H,price s.2)^j) :=
      mul_le_mul_of_nonneg_right (by exact_mod_cast legalPatterns_card_le m a j)
        (mul_nonneg (pow_nonneg hH _) (pow_nonneg (Finset.sum_nonneg (fun s _=>hp _)) _))
    _ = _ := by ring

def possibleTuples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (m a j : ℕ) : Finset (Fin m→↥(shortStars Γ p H)) := by
  classical
  exact Finset.univ.filter (fun f=>(leafLabels f).card=a ∧ (witnessLabels f).card=j ∧
    ∃s : ProcessState n,TupleRealized f s)

theorem possibleTuples_price_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (hH : 0≤H) (m a j : ℕ) (price : Grid n→ℝ) (hp : ∀q,0≤price q) :
    (∑f∈possibleTuples Γ p H m a j,∏z∈witnessLabels f,price z)≤
      (repeatPatternCount m a j : ℝ)*H^(a-j)*(∑s∈shortStars Γ p H,price s.2)^j := by
  classical
  let toRaw : (Fin m→↥(shortStars Γ p H))→(Fin m→Grid n×Grid n) := fun f i=>(f i).val
  have hinj : Function.Injective toRaw := by
    intro f g he
    funext i
    exact Subtype.ext (congrFun he i)
  have hsub : (possibleTuples Γ p H m a j).image toRaw⊆distinctPatternCover Γ p H m a j := by
    intro g hg
    obtain ⟨f,hf,rfl⟩ := Finset.mem_image.mp hg
    obtain ⟨ha,hj,s,hs⟩ := (Finset.mem_filter.mp hf).2
    simpa only [ha,hj] using realized_mem_distinctPatternCover f s hs
  have he : (∑f∈possibleTuples Γ p H m a j,∏z∈witnessLabels f,price z)=
      ∑g∈(possibleTuples Γ p H m a j).image toRaw,rawWitnessPrice price g := by
    rw [Finset.sum_image (fun f _ g _ h=>hinj h)]
    rfl
  rw [he]
  exact (Finset.sum_le_sum_of_subset_of_nonneg hsub (fun f _ _=>rawWitnessPrice_nonneg price hp f)).trans
    (distinctPatternCover_price_le Γ p H hH m a j price hp)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.decoded_witness_price
#print axioms NoThreeLine.ShortStars.possibleTuples_price_le
