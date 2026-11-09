import NoThreeLine.PairInfluence
import NoThreeLine.GridLines

/-! Partition actual active roots by their actual line through an external
candidate. Each group has one common actual birth multiplier. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthLineGroups
open GridLines PrimitiveLines AuxiliaryODE

theorem lineThrough_swap {n : ℕ} (p q : Grid n) : lineThrough p q = lineThrough q p := by
  ext r
  simp only [mem_lineThrough,orientedArea_swap_first p q r,neg_eq_zero]

theorem specifiedPair_swap {n : ℕ} (Γ : Finset ZPoint) (p q : Grid n) :
    specifiedPair Γ p q ↔ specifiedPair Γ q p := by
  unfold specifiedPair
  constructor <;> rintro ⟨d,hd,hne,hdet⟩ <;> refine ⟨d,hd,hne,?_⟩ <;>
    linear_combination -hdet

theorem witness_line_nonempty {n : ℕ} (S : Finset (Grid n)) (p q : Grid n) :
    selectedWitness S p q ↔ (S ∩ lineThrough q p).Nonempty := by
  simp only [selectedWitness,Finset.Nonempty,Finset.mem_inter,mem_lineThrough,
    orientedArea_swap_first q p,neg_eq_zero]

def lineMultiplier {n : ℕ} (Γ : Finset ZPoint) (S : Finset (Grid n))
    (q : Grid n) (L : Finset (Grid n)) : ℝ :=
  if (S∩L).Nonempty then 0 else if L∈specifiedLines Γ q then 1/2 else 1

theorem actual_multiplier_eq_line {n : ℕ} (Γ : Finset ZPoint) (S : Finset (Grid n))
    (p q : Grid n) (hp : SafeCandidate S p) (hq : q∉S) (hpq : p≠q) :
    birthMultiplier Γ S p q = lineMultiplier Γ S q (lineThrough q p) := by
  have hsp : specifiedPair Γ p q ↔ lineThrough q p∈specifiedLines Γ q :=
    (specifiedPair_swap Γ p q).trans (specifiedPair_iff_line_mem Γ q p hpq.symm)
  have hw := witness_line_nonempty S p q
  have hd := geometric_death_after_birth_iff S p q hp hq hpq
  by_cases hW : selectedWitness S p q <;> by_cases hP : specifiedPair Γ p q <;>
    simp [birthMultiplier,lineMultiplier,hpq,hd,← hw,← hsp,hW,hP]

def rootGroups {n : ℕ} (C : Finset (Grid n)) (q : Grid n) : Finset (Finset (Grid n)) :=
  C.image (lineThrough q)

def rootFibre {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (L : Finset (Grid n)) : Finset (Grid n) :=
  C.filter (fun p => lineThrough q p=L)

theorem fibre_nonempty {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (L : Finset (Grid n))
    (hL : L∈rootGroups C q) : (rootFibre C q L).Nonempty := by
  obtain ⟨p,hp,he⟩ := Finset.mem_image.mp hL
  exact ⟨p,Finset.mem_filter.mpr ⟨hp,he⟩⟩

theorem fibres_disjoint {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (L K : Finset (Grid n))
    (hLK : L≠K) : Disjoint (rootFibre C q L) (rootFibre C q K) := by
  apply Finset.disjoint_left.mpr
  intro p hp hq
  exact hLK ((Finset.mem_filter.mp hp).2.symm.trans (Finset.mem_filter.mp hq).2)

theorem fibres_cover {n : ℕ} (C : Finset (Grid n)) (q : Grid n) :
    (rootGroups C q).biUnion (rootFibre C q) = C := by
  ext p
  simp only [Finset.mem_biUnion,rootFibre,Finset.mem_filter]
  constructor
  · rintro ⟨L,_,hp,_⟩
    exact hp
  · intro hp
    exact ⟨lineThrough q p,Finset.mem_image.mpr ⟨p,hp,rfl⟩,hp,rfl⟩

def groupRoot {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (L : Finset (Grid n)) : Grid n :=
  if h : (rootFibre C q L).Nonempty then h.choose else q

theorem groupRoot_mem_fibre {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (L : Finset (Grid n))
    (hL : L∈rootGroups C q) : groupRoot C q L∈rootFibre C q L := by
  simp only [groupRoot,dif_pos (fibre_nonempty C q L hL)]
  exact (fibre_nonempty C q L hL).choose_spec

theorem groupRoot_mem {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (L : Finset (Grid n))
    (hL : L∈rootGroups C q) : groupRoot C q L∈C :=
  (Finset.mem_filter.mp (groupRoot_mem_fibre C q L hL)).1

theorem groupRoot_line {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (L : Finset (Grid n))
    (hL : L∈rootGroups C q) : lineThrough q (groupRoot C q L)=L :=
  (Finset.mem_filter.mp (groupRoot_mem_fibre C q L hL)).2

theorem groupRoot_injOn {n : ℕ} (C : Finset (Grid n)) (q : Grid n) :
    Set.InjOn (groupRoot C q) (rootGroups C q) := by
  intro L hL K hK he
  have h := congrArg (lineThrough q) he
  simpa only [groupRoot_line C q L hL,groupRoot_line C q K hK] using h

def representativeRoots {n : ℕ} (C : Finset (Grid n)) (q : Grid n) : Finset (Grid n) :=
  (rootGroups C q).image (groupRoot C q)

theorem representatives_subset {n : ℕ} (C : Finset (Grid n)) (q : Grid n) :
    representativeRoots C q ⊆ C := by
  intro p hp
  obtain ⟨L,hL,rfl⟩ := Finset.mem_image.mp hp
  exact groupRoot_mem C q L hL

theorem different_groups_area_ne {n : ℕ} (C : Finset (Grid n)) (q a b : Grid n)
    (hq : q∉C) (ha : a∈C) (hb : b∈C) (hg : lineThrough q a≠lineThrough q b) :
    orientedArea a b q≠0 := by
  intro hz
  have hqa : q≠a := fun he => hq (he ▸ ha)
  have hqb : q≠b := fun he => hq (he ▸ hb)
  apply hg
  apply lineThrough_eq_of_mem q a b hqa hqb
  rw [mem_lineThrough,orientedArea_cycle q a b]
  exact hz

def groupMultiplier {n : ℕ} (Γ : Finset ZPoint) (S C : Finset (Grid n))
    (q : Grid n) (L : Finset (Grid n)) : ℝ :=
  birthMultiplier Γ S (groupRoot C q L) q

theorem groupMultiplier_bounds {n : ℕ} (Γ : Finset ZPoint) (S C : Finset (Grid n))
    (q : Grid n) (L : Finset (Grid n)) :
    0≤groupMultiplier Γ S C q L ∧ groupMultiplier Γ S C q L≤1 :=
  birthMultiplier_bounds Γ S _ q

theorem groupMultiplier_actual {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : s.Valid) (hC : C⊆s.activeEvents)
    (hq : q∈s.activeEvents) (hqC : q∉C) (L : Finset (Grid n)) (hL : L∈rootGroups C q)
    (p : Grid n) (hp : p∈rootFibre C q L) :
    groupMultiplier Γ s.selected C q L = birthMultiplier Γ s.selected p q := by
  have hqs := (hs.2.1 q ((s.mem_activeEvents q).mp hq)).1
  have hrC := groupRoot_mem C q L hL
  have hpC := (Finset.mem_filter.mp hp).1
  have hrq : groupRoot C q L≠q := fun he => hqC (he ▸ hrC)
  have hpq : p≠q := fun he => hqC (he ▸ hpC)
  unfold groupMultiplier
  rw [actual_multiplier_eq_line Γ s.selected _ q
    (hs.2.1 _ ((s.mem_activeEvents _).mp (hC hrC))) hqs hrq,
    actual_multiplier_eq_line Γ s.selected p q
    (hs.2.1 p ((s.mem_activeEvents p).mp (hC hpC))) hqs hpq,
    groupRoot_line C q L hL,(Finset.mem_filter.mp hp).2]

theorem changed_groups_commonChange {n : ℕ} (Γ : Finset ZPoint) (S C : Finset (Grid n))
    (q : Grid n) (hq : q∉C) (L K : Finset (Grid n))
    (hL : L∈rootGroups C q) (hK : K∈rootGroups C q) (hLK : L≠K)
    (hJL : groupMultiplier Γ S C q L<1) (hJK : groupMultiplier Γ S C q K<1) :
    commonChange Γ S (groupRoot C q L) (groupRoot C q K) q := by
  refine ⟨different_groups_area_ne C q _ _ hq (groupRoot_mem C q L hL)
    (groupRoot_mem C q K hK) ?_,hJL,hJK⟩
  simpa only [groupRoot_line C q L hL,groupRoot_line C q K hK] using hLK

end NoThreeLine.BirthLineGroups

#print axioms NoThreeLine.BirthLineGroups.fibres_cover
#print axioms NoThreeLine.BirthLineGroups.groupMultiplier_actual
#print axioms NoThreeLine.BirthLineGroups.changed_groups_commonChange
