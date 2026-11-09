import NoThreeLine.PhysicalLeafRepetition
import NoThreeLine.FiniteImageSplit

/-! Distinct-degree counting for physical leaf repetitions. The all-distinct
main term keeps coefficient one; every lower degree retains B^(m-a)L^a,
which is needed before the C22 height sum. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteWitnessMoments
open FiniteTuplePattern

def tuplesOfDegree (α : Type*) [Fintype α] [DecidableEq α] (m a : ℕ) : Finset (Fin m → α) :=
  Finset.univ.filter (fun f => (tupleLabels f).card = a)

def degreeTupleCover (α : Type*) [Fintype α] [DecidableEq α] (m a : ℕ) : Finset (Fin m → α) :=
  Finset.univ.biUnion (fun code : Fin m → Fin a =>
    Finset.univ.image (fun g : Fin a → α => fun i => g (code i)))

theorem tuplesOfDegree_subset_cover {α : Type*} [Fintype α] [DecidableEq α] (m a : ℕ) :
    tuplesOfDegree α m a ⊆ degreeTupleCover α m a := by
  intro f hf
  have ha := (Finset.mem_filter.mp hf).2
  have hs := exists_image_split f
  change (Finset.univ.image f).card = a at ha
  rw [ha] at hs
  obtain ⟨code,rep,_,he,_,_⟩ := hs
  exact Finset.mem_biUnion.mpr ⟨code,Finset.mem_univ _,
    Finset.mem_image.mpr ⟨(fun j => f (rep j)),Finset.mem_univ _,funext he⟩⟩

theorem tuplesOfDegree_card_le {α : Type*} [Fintype α] [DecidableEq α] (m a : ℕ) :
    (tuplesOfDegree α m a).card ≤ a^m * (Fintype.card α)^a := by
  apply (Finset.card_le_card (tuplesOfDegree_subset_cover (α:=α) m a)).trans
  calc
    _ ≤ ∑ code : Fin m → Fin a,
        (Finset.univ.image (fun g : Fin a → α => fun i => g (code i))).card := Finset.card_biUnion_le
    _ ≤ ∑ _code : Fin m → Fin a, Fintype.card (Fin a → α) :=
      Finset.sum_le_sum (fun _ _ => Finset.card_image_le.trans (by simp))
    _ = _ := by simp [Fintype.card_fun]

theorem tupleLabels_card_pos {α : Type*} [DecidableEq α] {m : ℕ} (hm : 0 < m) (f : Fin m → α) :
    1 ≤ (tupleLabels f).card := by
  apply Finset.card_pos.mpr
  exact ⟨f ⟨0,hm⟩,Finset.mem_image.mpr ⟨⟨0,hm⟩,Finset.mem_univ _,rfl⟩⟩

theorem physicalRepeatSum_unit_group {α : Type*} [Fintype α] [DecidableEq α]
    (B : ℝ) (m : ℕ) (hm : 0 < m) :
    physicalRepeatSum (fun _ : α => 1) B m =
      ∑ a ∈ Finset.Icc 1 m, B^(m-a) * ((tuplesOfDegree α m a).card : ℝ) := by
  simp only [physicalRepeatSum,Finset.prod_const_one,mul_one]
  rw [←Finset.sum_fiberwise_of_maps_to
    (fun f (_ : f ∈ (Finset.univ : Finset (Fin m → α))) =>
      (Finset.mem_Icc.mpr ⟨tupleLabels_card_pos hm f,tupleLabels_card_le f⟩ :
        (tupleLabels f).card ∈ Finset.Icc 1 m))
    (fun f => B^(m-(tupleLabels f).card))]
  apply Finset.sum_congr rfl
  intro a _
  calc
    _ = ∑ _f ∈ tuplesOfDegree α m a, B^(m-a) := Finset.sum_congr rfl (fun f hf => by
      rw [(Finset.mem_filter.mp hf).2])
    _ = _ := by simp [mul_comm]

theorem physicalRepeatSum_unit_degree_bound {α : Type*} [Fintype α] [DecidableEq α]
    (B : ℝ) (hB : 0 ≤ B) (m : ℕ) (hm : 0 < m) :
    physicalRepeatSum (fun _ : α => 1) B m ≤ (Fintype.card α : ℝ)^m +
      ∑ a ∈ Finset.Ico 1 m, B^(m-a)*(a:ℝ)^m*(Fintype.card α : ℝ)^a := by
  have he : Finset.Icc 1 m = insert m (Finset.Ico 1 m) := by
    ext a
    simp only [Finset.mem_Icc,Finset.mem_insert,Finset.mem_Ico]
    omega
  have hn : m ∉ Finset.Ico 1 m := by simp
  rw [physicalRepeatSum_unit_group B m hm,he,Finset.sum_insert hn]
  simp only [Nat.sub_self,pow_zero,one_mul]
  apply add_le_add
  · exact_mod_cast (show (tuplesOfDegree α m m).card ≤ (Fintype.card α)^m by
      simpa [Fintype.card_fun] using Finset.card_le_univ (tuplesOfDegree α m m))
  · apply Finset.sum_le_sum
    intro a _
    have hh : ((tuplesOfDegree α m a).card : ℝ) ≤ (a:ℝ)^m*(Fintype.card α:ℝ)^a := by
      exact_mod_cast tuplesOfDegree_card_le (α:=α) m a
    simpa only [mul_assoc] using mul_le_mul_of_nonneg_left hh (pow_nonneg hB _)

end NoThreeLine.FiniteWitnessMoments
#print axioms NoThreeLine.FiniteWitnessMoments.tuplesOfDegree_card_le
#print axioms NoThreeLine.FiniteWitnessMoments.physicalRepeatSum_unit_degree_bound
