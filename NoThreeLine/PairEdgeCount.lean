import NoThreeLine.PairEdgeCover

/-! Uniform actual geometric counts for the 0/1/2-new-witness edge covers.
The known label set excludes both roots; actual selected evidence supplies
this condition. Cardinalities are derived from G2/G3 and actual line intersections. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open PrimitiveLines GridLines

private theorem union4_card_le {α : Type*} [DecidableEq α] (A B C D : Finset α) :
    (A∪(B∪(C∪D))).card≤A.card+B.card+C.card+D.card := by
  have h1 := Finset.card_union_le A (B∪(C∪D))
  have h2 := Finset.card_union_le B (C∪D)
  have h3 := Finset.card_union_le C D
  omega

private theorem biUnion_card_le {ι α : Type*} [DecidableEq α] (S : Finset ι)
    (F : ι→Finset α) (N : ℕ) (h : ∀i∈S,(F i).card≤N) :
    (S.biUnion F).card≤S.card*N := by
  calc
    _ ≤ ∑i∈S,(F i).card := Finset.card_biUnion_le
    _ ≤ ∑_i∈S,N := Finset.sum_le_sum h
    _ = _ := by simp

private theorem biUnion_card_le_real {ι α : Type*} [DecidableEq α] (S : Finset ι)
    (F : ι→Finset α) (N : ℝ) (h : ∀i∈S,((F i).card : ℝ)≤N) :
    ((S.biUnion F).card : ℝ)≤(S.card : ℝ)*N := by
  calc
    _ ≤ ∑i∈S,((F i).card : ℝ) := by exact_mod_cast (Finset.card_biUnion_le (s:=S) (t:=F))
    _ ≤ ∑_i∈S,N := Finset.sum_le_sum h
    _ = _ := by simp

theorem oldEdgeCover_card_le {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (U : Finset (Grid n)) (ha : a∉U) (hb : b∉U) :
    (oldEdgeCover Γ a b U).card≤(Γ.card+U.card)^2 := by
  have h0 : ((hhCauses Γ a b).image Edge.hh).card≤Γ.card^2 :=
    Finset.card_image_le.trans (hhCauses_card_le Γ a b)
  have h1 : (U.biUnion (fun w=>(specifiedKnownCauses Γ a b w).image
      (fun q=>Edge.hl q w))).card≤U.card*Γ.card := by
    apply biUnion_card_le
    intro w hw
    exact Finset.card_image_le.trans (specifiedKnownCauses_card_le Γ a b w
      (fun he=>hb (he.symm ▸ hw)))
  have h2 : (U.biUnion (fun z=>(specifiedKnownCauses Γ b a z).image
      (fun q=>Edge.lh q z))).card≤U.card*Γ.card := by
    apply biUnion_card_le
    intro z hz
    exact Finset.card_image_le.trans (specifiedKnownCauses_card_le Γ b a z
      (fun he=>ha (he.symm ▸ hz)))
  have h3 : (U.biUnion (fun z=>U.biUnion (fun w=>(knownWitnessCauses a b z w).image
      (fun q=>Edge.ll q z w)))).card≤U.card*U.card := by
    apply biUnion_card_le
    intro z hz
    have hi : (U.biUnion (fun w=>(knownWitnessCauses a b z w).image
        (fun q=>Edge.ll q z w))).card≤U.card*1 := by
      apply biUnion_card_le
      intro w hw
      exact Finset.card_image_le.trans (knownWitnessCauses_card_le_one a b z w
        (fun he=>ha (he.symm ▸ hz)) (fun he=>hb (he.symm ▸ hw)))
    simpa using hi
  have hu := union4_card_le ((hhCauses Γ a b).image Edge.hh)
    (U.biUnion (fun w=>(specifiedKnownCauses Γ a b w).image (fun q=>Edge.hl q w)))
    (U.biUnion (fun z=>(specifiedKnownCauses Γ b a z).image (fun q=>Edge.lh q z)))
    (U.biUnion (fun z=>U.biUnion (fun w=>(knownWitnessCauses a b z w).image (fun q=>Edge.ll q z w))))
  change (oldEdgeCover Γ a b U).card≤_ at hu
  nlinarith

theorem oneNewEdgeCover_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (Γ : Finset ZPoint) (a b : Grid n)
      (U : Finset (Grid n)), a∉U → b∉U →
      ((oneNewEdgeCover Γ a b U).card : ℝ)≤
        2*((Γ.card : ℝ)+(U.card : ℝ))*C*(n : ℝ)^(1+ξ) := by
  obtain ⟨C,hC,hCbound⟩ := specifiedWitnessExtensions_card_le_const_rpow ξ hξ
  obtain ⟨D,hD,hDbound⟩ := witnessExtensions_card_le_const_rpow ξ hξ
  refine ⟨C+D,add_pos hC hD,?_⟩
  intro n Γ a b U ha hb
  have h0 : (((specifiedWitnessExtensions Γ a b).image (fun x=>Edge.hl x.1 x.2)).card : ℝ)≤
      (Γ.card : ℝ)*C*(n : ℝ)^(1+ξ) :=
    (Nat.cast_le.mpr Finset.card_image_le).trans (hCbound n Γ a b)
  have h1 : (((specifiedWitnessExtensions Γ b a).image (fun x=>Edge.lh x.1 x.2)).card : ℝ)≤
      (Γ.card : ℝ)*C*(n : ℝ)^(1+ξ) :=
    (Nat.cast_le.mpr Finset.card_image_le).trans (hCbound n Γ b a)
  have h2 : ((U.biUnion (fun z=>(witnessExtensions a b z).image
      (fun x=>Edge.ll x.1 z x.2))).card : ℝ)≤(U.card : ℝ)*(D*(n : ℝ)^(1+ξ)) := by
    apply biUnion_card_le_real
    intro z hz
    exact (Nat.cast_le.mpr Finset.card_image_le).trans
      (hDbound n a b z (fun he=>ha (he.symm ▸ hz)))
  have h3 : ((U.biUnion (fun w=>(witnessExtensions b a w).image
      (fun x=>Edge.ll x.1 x.2 w))).card : ℝ)≤(U.card : ℝ)*(D*(n : ℝ)^(1+ξ)) := by
    apply biUnion_card_le_real
    intro w hw
    exact (Nat.cast_le.mpr Finset.card_image_le).trans
      (hDbound n b a w (fun he=>hb (he.symm ▸ hw)))
  have hu := union4_card_le
    ((specifiedWitnessExtensions Γ a b).image (fun x=>Edge.hl x.1 x.2))
    ((specifiedWitnessExtensions Γ b a).image (fun x=>Edge.lh x.1 x.2))
    (U.biUnion (fun z=>(witnessExtensions a b z).image (fun x=>Edge.ll x.1 z x.2)))
    (U.biUnion (fun w=>(witnessExtensions b a w).image (fun x=>Edge.ll x.1 x.2 w)))
  have huR : ((oneNewEdgeCover Γ a b U).card : ℝ)≤
      (((specifiedWitnessExtensions Γ a b).image (fun x=>Edge.hl x.1 x.2)).card : ℝ)+
      (((specifiedWitnessExtensions Γ b a).image (fun x=>Edge.lh x.1 x.2)).card : ℝ)+
      ((U.biUnion (fun z=>(witnessExtensions a b z).image (fun x=>Edge.ll x.1 z x.2))).card : ℝ)+
      ((U.biUnion (fun w=>(witnessExtensions b a w).image (fun x=>Edge.ll x.1 x.2 w))).card : ℝ) := by
    exact_mod_cast hu
  calc
    _ ≤ 2*(Γ.card : ℝ)*C*(n : ℝ)^(1+ξ)+2*(U.card : ℝ)*D*(n : ℝ)^(1+ξ) := by linarith
    _ ≤ _ := by
      have hp := Real.rpow_nonneg (Nat.cast_nonneg n) (1+ξ)
      have hcross₁ : 0≤(Γ.card : ℝ)*D*(n : ℝ)^(1+ξ) := by positivity
      have hcross₂ : 0≤(U.card : ℝ)*C*(n : ℝ)^(1+ξ) := by positivity
      nlinarith

theorem twoNewEdgeCover_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (a b : Grid n),
      ((twoNewEdgeCover a b).card : ℝ)≤C*(n : ℝ)^(2+ξ) := by
  obtain ⟨C,hC,hbound⟩ := initialWitnessCandidates_card_le_const_rpow ξ hξ
  exact ⟨C,hC,fun n a b=>(Nat.cast_le.mpr Finset.card_image_le).trans (hbound n a b)⟩

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.oldEdgeCover_card_le
#print axioms NoThreeLine.PairWitness.oneNewEdgeCover_card_le_const_rpow
#print axioms NoThreeLine.PairWitness.twoNewEdgeCover_card_le_const_rpow
