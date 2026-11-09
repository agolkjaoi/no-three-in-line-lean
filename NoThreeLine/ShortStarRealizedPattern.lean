import NoThreeLine.FiniteImageSplit
import NoThreeLine.ShortStarRepeatedWitness
import NoThreeLine.ShortStarBlockCompletions

/-! Actual realized tuples admit a finite leaf/witness block encoding.
The slot count a is now the actual number of distinct physical leaves, and
j is the actual number of distinct selected witnesses. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine.ShortStars
open PrimitiveLines FiniteTuplePattern

theorem exists_realized_pattern {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s) :
    ∃code : Fin m→Fin (leafLabels f).card,
    ∃leafRep : Fin (leafLabels f).card→Fin m,
    ∃block : Fin (leafLabels f).card→Fin (witnessLabels f).card,
    ∃witnessRep : Fin (witnessLabels f).card→Fin (leafLabels f).card,
    Function.LeftInverse code leafRep ∧ Function.LeftInverse block witnessRep ∧
    (∀i,f (leafRep (code i))=f i) ∧
    Function.Injective (fun i=>(f (leafRep i)).val.1) ∧
    Function.Injective (fun k=>(f (leafRep (witnessRep k))).val.2) ∧
    Finset.univ.image (fun k=>(f (leafRep (witnessRep k))).val.2)=witnessLabels f ∧
    (fun i=>(f (leafRep i)).val)∈blockCompletions Γ p H block witnessRep
      (fun k=>f (leafRep (witnessRep k))) := by
  classical
  obtain ⟨code,leafRep,hl,hq,hqi,hqimage⟩ := exists_image_split (fun i=>(f i).val.1)
  let g : Fin (leafLabels f).card→↥(shortStars Γ p H) := fun i=>f (leafRep i)
  have hstar (i : Fin m) : g (code i)=f i := by
    apply Subtype.ext
    apply Prod.ext
    · exact hq i
    · exact witness_eq_of_leaf_eq_realized f s hs (leafRep (code i)) i (hq i)
  have hwimage : Finset.univ.image (fun i=>(g i).val.2)=witnessLabels f := by
    ext z
    constructor
    · intro hz
      obtain ⟨i,_,hi⟩ := Finset.mem_image.mp hz
      exact Finset.mem_image.mpr ⟨leafRep i,Finset.mem_univ _,hi⟩
    · intro hz
      obtain ⟨i,_,hi⟩ := Finset.mem_image.mp hz
      exact Finset.mem_image.mpr ⟨code i,Finset.mem_univ _,by rw [hstar i]; exact hi⟩
  have hwcard := congrArg Finset.card hwimage
  have hsplit := exists_image_split (fun i=>(g i).val.2)
  rw [hwcard] at hsplit
  obtain ⟨block,witnessRep,hw,hz,hzi,hzimage⟩ := hsplit
  refine ⟨code,leafRep,block,witnessRep,hl,hw,hstar,hqi,hzi,hzimage.trans hwimage,?_⟩
  exact mem_blockCompletions_of_pattern Γ p H block witnessRep hw g (fun i=>(hz i).symm)

/-- The two representative maps are finite patterns, and the anchor witnesses
are genuinely distinct. No all-geometric-tuples realization is assumed. -/
theorem realized_pattern_counts {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s) :
    (witnessLabels f).card≤(leafLabels f).card ∧ (leafLabels f).card≤m ∧
    ∃code : Fin m→Fin (leafLabels f).card,
    ∃leafRep : Fin (leafLabels f).card→Fin m,
    ∃block : Fin (leafLabels f).card→Fin (witnessLabels f).card,
    ∃witnessRep : Fin (witnessLabels f).card→Fin (leafLabels f).card,
    Function.LeftInverse code leafRep ∧ Function.LeftInverse block witnessRep ∧
    (∀i,f (leafRep (code i))=f i) ∧
    Function.Injective (fun k=>(f (leafRep (witnessRep k))).val.2) ∧
    (fun i=>(f (leafRep i)).val)∈blockCompletions Γ p H block witnessRep
      (fun k=>f (leafRep (witnessRep k))) := by
  have hc := realized_distinct_label_counts f s hs
  obtain ⟨code,lr,block,wr,hl,hw,hf,hqi,hzi,hzimage,hmem⟩ := exists_realized_pattern f s hs
  exact ⟨hc.1,hc.2,code,lr,block,wr,hl,hw,hf,hzi,hmem⟩

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.exists_realized_pattern
#print axioms NoThreeLine.ShortStars.realized_pattern_counts
