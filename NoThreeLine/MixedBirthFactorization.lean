import NoThreeLine.MixedConnection

/-! Actual D-empty mixed quantity: the external birth ratio, including
all physical line connection factors, is the product of actual group
multipliers. The snapshot precedes positive retirement. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.MixedConnection
open AuxiliaryODE GridLines PrimitiveLines BirthLineGroups LineDrift

theorem group_is_boardLine {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (hqC : q∉C)
    (L : Finset (Grid n)) (hL : L∈rootGroups C q) : L∈boardLines n := by
  classical
  obtain ⟨p,hp,rfl⟩ := Finset.mem_image.mp hL
  exact Finset.mem_biUnion.mpr ⟨q,Finset.mem_univ q,
    lineThrough_mem_linesThrough q p (fun he => hqC (he ▸ hp))⟩

theorem group_contains_candidate {n : ℕ} (C : Finset (Grid n)) (q : Grid n)
    (L : Finset (Grid n)) (hL : L∈rootGroups C q) : q∈L := by
  obtain ⟨p,_,rfl⟩ := Finset.mem_image.mp hL
  exact left_mem_lineThrough q p

theorem group_specified_iff {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) (hqC : q∉C) (L : LineIndex n) (hL : L.val∈rootGroups C q) :
    specified Γ L ↔ L.val∈specifiedLines Γ q := by
  rw [specified_iff_designated Γ q L (group_contains_candidate C q L.val hL)]
  have ht : L.val∈linesThrough q := by
    obtain ⟨p,hp,he⟩ := Finset.mem_image.mp hL
    rw [← he]
    exact lineThrough_mem_linesThrough q p (fun hh => hqC (hh ▸ hp))
  simp only [designatedLines,Finset.mem_inter,ht,and_true]

def groupBirthFactor {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n)) (q : Grid n)
    (L : Finset (Grid n)) : ℝ :=
  if L∈specifiedLines Γ q then 2^((rootFibre C q L).card-1) else 1

theorem lineBirthFactor_eq_group {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) (hqC : q∉C) (L : LineIndex n) (hL : L.val∈rootGroups C q) :
    lineBirthFactor Γ C q L=groupBirthFactor Γ C q L.val := by
  have hqL := group_contains_candidate C q L.val hL
  simp only [lineBirthFactor,groupBirthFactor,hqL,true_and,group_specified_iff Γ C q hqC L hL,
    fibre_eq_inter C q hqC L hqL,multiplicity]

theorem lineBirthFactor_eq_one_outside_groups {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) (hqC : q∉C) (L : LineIndex n) (hL : L.val∉rootGroups C q) :
    lineBirthFactor Γ C q L=1 := by
  by_cases hqL : q∈L.val
  · have hm : multiplicity C L=0 := by
      apply Finset.card_eq_zero.mpr
      apply Finset.eq_empty_iff_forall_notMem.mpr
      intro p hp
      obtain ⟨hpC,hpL⟩ := Finset.mem_inter.mp hp
      apply hL
      exact Finset.mem_image.mpr ⟨p,hpC,
        (boardLine_eq L q p hqL hpL (fun he => hqC (he ▸ hpC))).symm⟩
    simp [lineBirthFactor,hm]
  · simp [lineBirthFactor,hqL]

theorem lineBirthFactor_product {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) (hqC : q∉C) :
    (∏ L : LineIndex n,lineBirthFactor Γ C q L)=∏ L∈rootGroups C q,groupBirthFactor Γ C q L := by
  classical
  apply Finset.prod_bij_ne_one (fun L _ _ => L.val)
  · intro L hL hne
    by_contra hnot
    exact hne (lineBirthFactor_eq_one_outside_groups Γ C q hqC L hnot)
  · intro L _ _ K _ _ he
    exact Subtype.ext he
  · intro L hL hne
    let Li : LineIndex n := ⟨L,group_is_boardLine C q hqC L hL⟩
    refine ⟨Li,Finset.mem_univ Li,?_,rfl⟩
    simpa only [lineBirthFactor_eq_group Γ C q hqC Li hL] using hne
  · intro L hL hne
    have hg : L.val∈rootGroups C q := by
      by_contra hnot
      exact hne (lineBirthFactor_eq_one_outside_groups Γ C q hqC L hnot)
    exact lineBirthFactor_eq_group Γ C q hqC L hg

theorem surviving_group_multiplier {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : e.process.Valid) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents)
    (hafter : C⊆(birthSnapshot e Γ q).process.activeEvents) (hqC : q∉C)
    (L : Finset (Grid n)) (hL : L∈rootGroups C q) :
    groupMultiplier Γ e.process.selected C q L=if L∈specifiedLines Γ q then 1/2 else 1 := by
  have hrC := groupRoot_mem C q L hL
  have hrq : groupRoot C q L≠q := fun he => hqC (he ▸ hrC)
  have hW := survival_no_witness e Γ q _ hs hstop hq (hC hrC) (hafter hrC) hrq
  have he : ¬(e.process.selected∩L).Nonempty := by
    rw [← groupRoot_line C q L hL]
    exact (witness_line_nonempty e.process.selected _ q).not.mp hW
  unfold groupMultiplier
  rw [actual_multiplier_eq_line Γ e.process.selected _ q
    (hs.2.1 _ ((e.process.mem_activeEvents _).mp (hC hrC)))
    (hs.2.1 q ((e.process.mem_activeEvents q).mp hq)).1 hrq,
    groupRoot_line C q L hL]
  simp only [lineMultiplier,if_neg he]

theorem half_power_connection (m : ℕ) (hm : 0<m) : (1/2:ℝ)^m*2^(m-1)=1/2 := by
  obtain ⟨j,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_zero_of_lt hm)
  simp only [Nat.succ_sub_one,pow_succ]
  calc
    (1/2:ℝ)^j*(1/2)*2^j = (1/2)*((1/2:ℝ)*2)^j := by rw [mul_pow]; ring
    _ = 1/2 := by norm_num

theorem corrected_group_jump {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : e.process.Valid) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents)
    (hafter : C⊆(birthSnapshot e Γ q).process.activeEvents) (hqC : q∉C)
    (L : Finset (Grid n)) (hL : L∈rootGroups C q) :
    groupMultiplier Γ e.process.selected C q L ^ (rootFibre C q L).card * groupBirthFactor Γ C q L =
      groupMultiplier Γ e.process.selected C q L := by
  rw [surviving_group_multiplier e Γ C q hs hstop hq hC hafter hqC L hL]
  by_cases hsp : L∈specifiedLines Γ q
  · simp only [groupBirthFactor,if_pos hsp]
    exact half_power_connection _ (Finset.card_pos.mpr (fibre_nonempty C q L hL))
  · simp [groupBirthFactor,hsp]

theorem root_multiplier_product {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : e.process.Valid)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents) (hqC : q∉C) :
    (∏ p∈C,birthMultiplier Γ e.process.selected p q)=
      ∏ L∈rootGroups C q,groupMultiplier Γ e.process.selected C q L ^ (rootFibre C q L).card := by
  rw [← Finset.prod_fiberwise_of_maps_to
    (fun p (hp : p∈C) => (Finset.mem_image_of_mem (lineThrough q) hp : lineThrough q p∈rootGroups C q))
    (fun p => birthMultiplier Γ e.process.selected p q)]
  apply Finset.prod_congr rfl
  intro L hL
  change (∏ p∈rootFibre C q L,birthMultiplier Γ e.process.selected p q)=_
  calc
    _ = ∏ _p∈rootFibre C q L,groupMultiplier Γ e.process.selected C q L := by
      apply Finset.prod_congr rfl
      intro p hp
      exact (groupMultiplier_actual e.process Γ C q hs hC hq hqC L hL p hp).symm
    _ = _ := Finset.prod_const _

theorem rootWeightProduct_birth {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents) :
    rootWeightProduct C (birthSnapshot e Γ q)=
      (∏ p∈C,birthMultiplier Γ e.process.selected p q)*rootWeightProduct C e := by
  unfold rootWeightProduct
  calc
    _ = ∏ p∈C,(birthMultiplier Γ e.process.selected p q*(e.process.accounts p).weight) := by
      apply Finset.prod_congr rfl
      intro p hp
      exact snapshot_weight e Γ q p hstop hq (hC hp)
    _ = _ := Finset.prod_mul_distrib

theorem phi_external_birth {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : e.process.Valid) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents) (hqC : q∉C) :
    phi Γ C (birthSnapshot e Γ q)=phi Γ C e *
      ∏ L∈rootGroups C q,groupMultiplier Γ e.process.selected C q L := by
  classical
  by_cases hafter : C⊆(birthSnapshot e Γ q).process.activeEvents
  · have hcorrect :
        (∏ L∈rootGroups C q,groupMultiplier Γ e.process.selected C q L ^ (rootFibre C q L).card) *
        (∏ L∈rootGroups C q,groupBirthFactor Γ C q L) =
        ∏ L∈rootGroups C q,groupMultiplier Γ e.process.selected C q L := by
      rw [← Finset.prod_mul_distrib]
      apply Finset.prod_congr rfl
      intro L hL
      exact corrected_group_jump e Γ C q hs hstop hq hC hafter hqC L hL
    rw [phi,if_pos hafter,phi,if_pos hC,rootWeightProduct_birth e Γ C q hstop hq hC,
      connectionProduct_birth e Γ C q hs hstop hq hC hafter hqC,
      lineBirthFactor_product Γ C q hqC,root_multiplier_product e Γ C q hs hq hC hqC]
    calc
      _ = (rootWeightProduct C e*connectionProduct Γ C e)*
          ((∏ L∈rootGroups C q,groupMultiplier Γ e.process.selected C q L ^ (rootFibre C q L).card)*
            (∏ L∈rootGroups C q,groupBirthFactor Γ C q L)) := by ring
      _ = _ := by rw [hcorrect]
  · obtain ⟨p,hpC,hpa⟩ := Finset.not_subset.mp hafter
    have hJ : birthMultiplier Γ e.process.selected p q=0 := by
      by_contra hne
      exact hpa ((snapshot_active_iff e Γ q p hstop hq (hC hpC)).mpr hne)
    have hL : lineThrough q p∈rootGroups C q := Finset.mem_image_of_mem _ hpC
    have hpF : p∈rootFibre C q (lineThrough q p) := Finset.mem_filter.mpr ⟨hpC,rfl⟩
    have hgroup : groupMultiplier Γ e.process.selected C q (lineThrough q p)=0 :=
      (groupMultiplier_actual e.process Γ C q hs hC hq hqC _ hL p hpF).trans hJ
    have hprod : (∏ L∈rootGroups C q,groupMultiplier Γ e.process.selected C q L)=0 :=
      Finset.prod_eq_zero hL hgroup
    simp only [phi,if_neg hafter,hprod,mul_zero]

end NoThreeLine.MixedConnection

#print axioms NoThreeLine.MixedConnection.lineBirthFactor_product
#print axioms NoThreeLine.MixedConnection.corrected_group_jump
#print axioms NoThreeLine.MixedConnection.phi_external_birth
