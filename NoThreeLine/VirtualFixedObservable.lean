import NoThreeLine.VirtualTuplePatterns
import NoThreeLine.PhysicalLeafConnectionRemoval
import NoThreeLine.ShortStarWeightedPattern

/-! Fixed geometric indices for the virtual-mass expansion.  Active and
selected indicators remain inside a measurable physical-leaf observable. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments FiniteTuplePattern BirthWitness MixedConnection

def rawLeaves {n m : ℕ} (f : Fin m → (Σ _ : Grid n, Grid n)) : Finset (Grid n) :=
  Finset.univ.image (fun i => (f i).1)

def rawWitnesses {n m : ℕ} (f : Fin m → (Σ _ : Grid n, Grid n)) : Finset (Grid n) :=
  Finset.univ.image (fun i => (f i).2)

def rawProduct {n m : ℕ} (q : Grid n) (f : Fin m → (Σ _ : Grid n, Grid n))
    (e : ExtendedState n) : ℝ := physicalLeafProduct (insert q (rawLeaves f)) (rawWitnesses f) q e

def anchorProduct {n a : ℕ} {L : LineIndex n} {q : Grid n}
    (g : Fin a → candidates L q) : ExtendedState n → ℝ := rawProduct q (fun i => (g i).val)

theorem rawProduct_measurable {n m : ℕ} (q : Grid n) (f : Fin m → (Σ _ : Grid n, Grid n)) :
    Measurable (rawProduct q f) := physicalLeafProduct_measurable _ _ _

theorem rawProduct_nonneg {n m : ℕ} (q : Grid n) (f : Fin m → (Σ _ : Grid n, Grid n))
    (e : ExtendedState n) (B : ℝ) (he : e.Valid B) : 0 ≤ rawProduct q f e :=
  (physicalLeafProduct_bounds _ _ _ e B he).1

def legalCodes (m a : ℕ) : Finset (Fin m → Fin a) :=
  Finset.univ.filter Function.Surjective

theorem rawLeaves_decode {n m a : ℕ} (code : Fin m → Fin a) (hcode : Function.Surjective code)
    (g : Fin a → (Σ _ : Grid n, Grid n)) : rawLeaves (fun i => g (code i)) = rawLeaves g := by
  ext y
  simp only [rawLeaves, Finset.mem_image, Finset.mem_univ, true_and]
  constructor
  · rintro ⟨i, hi⟩; exact ⟨code i, hi⟩
  · rintro ⟨j, hj⟩
    obtain ⟨i, rfl⟩ := hcode j
    exact ⟨i, hj⟩

theorem rawWitnesses_decode {n m a : ℕ} (code : Fin m → Fin a) (hcode : Function.Surjective code)
    (g : Fin a → (Σ _ : Grid n, Grid n)) : rawWitnesses (fun i => g (code i)) = rawWitnesses g := by
  ext y
  simp only [rawWitnesses, Finset.mem_image, Finset.mem_univ, true_and]
  constructor
  · rintro ⟨i, hi⟩; exact ⟨code i, hi⟩
  · rintro ⟨j, hj⟩
    obtain ⟨i, rfl⟩ := hcode j
    exact ⟨i, hj⟩

theorem rawProduct_decode {n m a : ℕ} {L : LineIndex n} {q : Grid n}
    (code : Fin m → Fin a) (hcode : Function.Surjective code)
    (g : Fin a → candidates L q) (e : ExtendedState n) :
    rawProduct q (fun i => (g (code i)).val) e = anchorProduct g e := by
  simp only [rawProduct, anchorProduct]
  rw [rawLeaves_decode code hcode (fun i => (g i).val),
    rawWitnesses_decode code hcode (fun i => (g i).val)]

def fixedCover {n : ℕ} (L : LineIndex n) (q : Grid n) (m a : ℕ) :
    Finset (Fin m → (Σ _ : Grid n, Grid n)) :=
  (legalCodes m a).biUnion (fun code => (anchors L q a).image (fun g i => (g (code i)).val))

theorem tuple_mem_fixedCover {n m : ℕ} {s : ProcessState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves s Γ L q)
    (hs : s.Valid) (hqL : q ∉ L.val) (hq : (s.accounts q).status = .active) :
    tuplePairs f ∈ fixedCover L q m (leafLabels f).card := by
  have hsplit := exists_image_split f
  have hc : (Finset.univ.image f).card = (leafLabels f).card := (leafLabels_card f).symm
  rw [hc] at hsplit
  obtain ⟨code, rep, hleft, hf, hi, _⟩ := hsplit
  let g : Fin (leafLabels f).card → candidates L q := fun j =>
    ⟨⟨(f (rep j)).val, witness s Γ L q (f (rep j))⟩, witness_candidate s Γ L q (f (rep j))⟩
  apply Finset.mem_biUnion.mpr
  refine ⟨code, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hleft.surjective⟩, ?_⟩
  apply Finset.mem_image.mpr
  refine ⟨g, Finset.mem_filter.mpr ⟨Finset.mem_univ _, Subtype.val_injective.comp hi,
    (witness_injective s hs Γ L q hqL hq).comp hi⟩, ?_⟩
  funext i
  dsimp only [g, tuplePairs]
  rw [hf i]

theorem rawProduct_tuplePairs {n m : ℕ} {e : ExtendedState n} {Γ : Finset ZPoint}
    {L : LineIndex n} {q : Grid n} (f : Fin m → leaves e.process Γ L q)
    (hqL : q ∉ L.val) (hq : (e.process.accounts q).status = .active) :
    rawProduct q (tuplePairs f) e = ∏ y ∈ leafLabels f, (e.process.accounts y).weight := by
  have hleaf : rawLeaves (tuplePairs f) = leafLabels f := by
    simp only [rawLeaves, tuplePairs, leafLabels, tupleLabels, Finset.image_image, Function.comp_def]
  have hwit : rawWitnesses (tuplePairs f) = witnessLabels f := by
    simp only [rawWitnesses, tuplePairs, witnessLabels, tupleLabels, Finset.image_image, Function.comp_def]
  have hqa : q ∈ e.process.activeEvents := (e.process.mem_activeEvents q).mpr hq
  have hC : insert q (leafLabels f) ⊆ e.process.activeEvents := by
    apply Finset.insert_subset_iff.mpr
    exact ⟨hqa, fun y hy => (e.process.mem_activeEvents y).mpr (leafLabels_active f y hy)⟩
  have hnot : q ∉ leafLabels f := fun h => hqL (leafLabels_subset_line f h)
  rw [rawProduct, hleaf, hwit, physicalLeafProduct, if_pos hC,
    selectedLabelProduct_eq_indicator, if_pos (witnessLabels_subset_selected f), mul_one,
    Finset.erase_insert hnot]
  rfl

theorem sum_fixedCover_product_le {n m a : ℕ} (L : LineIndex n) (q : Grid n)
    (e : ExtendedState n) (B : ℝ) (he : e.Valid B) :
    (∑ f ∈ fixedCover L q m a, rawProduct q f e) ≤
      (a : ℝ)^m * ∑ g ∈ anchors L q a, anchorProduct g e := by
  apply (sum_biUnion_le_nonneg (legalCodes m a) _ (fun f => rawProduct q f e)
    (fun f => rawProduct_nonneg q f e B he)).trans
  calc
    _ ≤ ∑ code ∈ legalCodes m a, ∑ g ∈ anchors L q a,
        rawProduct q (fun i => (g (code i)).val) e := by
      apply Finset.sum_le_sum
      intro code _
      exact Finset.sum_image_le_of_nonneg (fun f _ => rawProduct_nonneg q f e B he)
    _ = ∑ _code ∈ legalCodes m a, ∑ g ∈ anchors L q a, anchorProduct g e := by
      apply Finset.sum_congr rfl
      intro code hc
      exact Finset.sum_congr rfl (fun g _ => rawProduct_decode code (Finset.mem_filter.mp hc).2 g e)
    _ = ((legalCodes m a).card : ℝ) * ∑ g ∈ anchors L q a, anchorProduct g e := by simp
    _ ≤ _ := mul_le_mul_of_nonneg_right
      (by exact_mod_cast (show (legalCodes m a).card ≤ a^m by
        simpa using Finset.card_le_univ (legalCodes m a)))
      (Finset.sum_nonneg (fun g _ => rawProduct_nonneg q _ e B he))

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.rawProduct_measurable
#print axioms NoThreeLine.VirtualWitness.tuple_mem_fixedCover
#print axioms NoThreeLine.VirtualWitness.sum_fixedCover_product_le
