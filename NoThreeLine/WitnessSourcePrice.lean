import NoThreeLine.WitnessSourceGenerator
import NoThreeLine.EmptyLineCreditInvariant

/-! The S7 source price is obtained from the actual connection factors.
The empty-line r invariant and the genuine k<2 clock domain are explicit.
No source comparison or compensation theorem is assumed. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct EtaMixedGenerator BirthLineGroups

def sharedLine {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (L : LineIndex n) : Prop :=
  q∈L.val ∧ 0<multiplicity C L

instance {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (L : LineIndex n) : Decidable (sharedLine C q L) :=
  inferInstanceAs (Decidable (q∈L.val ∧ 0<multiplicity C L))

theorem sharedLine_iff_group {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (hqC : q∉C)
    (L : LineIndex n) : sharedLine C q L ↔ L.val∈rootGroups C q := by
  constructor
  · rintro ⟨hqL,hm⟩
    obtain ⟨p,hp⟩ := Finset.card_pos.mp hm
    obtain ⟨hpC,hpL⟩ := Finset.mem_inter.mp hp
    exact Finset.mem_image.mpr ⟨p,hpC,
      (boardLine_eq L q p hqL hpL (fun he=>hqC (he ▸ hpC))).symm⟩
  · intro hL
    refine ⟨group_contains_candidate C q L.val hL,?_⟩
    rw [MixedConnection.multiplicity,←fibre_eq_inter C q hqC L (group_contains_candidate C q L.val hL)]
    exact Finset.card_pos.mpr (fibre_nonempty C q L.val hL)

def sourcePriceLine {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (L : LineIndex n) : ℝ :=
  if sharedLine C q L ∧ specified Γ L then protection 1 (e.clocks L) else 1

def sourcePrice {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) : ℝ := ∏L : LineIndex n,sourcePriceLine e Γ C q L

def sourceJumpLine {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) (L : LineIndex n) : ℝ :=
  if sharedLine C q L ∧ specified Γ L then 1/2 else 1

theorem sourceJumpLine_product {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : e.process.Valid) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents)
    (hafter : C⊆(birthSnapshot e Γ q).process.activeEvents) (hqC : q∉C) :
    (∏L : LineIndex n,sourceJumpLine Γ C q L)=
      ∏L∈rootGroups C q,groupMultiplier Γ e.process.selected C q L := by
  classical
  have heq : ∀L : LineIndex n,L.val∈rootGroups C q→sourceJumpLine Γ C q L=
      groupMultiplier Γ e.process.selected C q L.val := by
    intro L hL
    rw [surviving_group_multiplier e Γ C q hs hstop hq hC hafter hqC L.val hL]
    simp only [sourceJumpLine,(sharedLine_iff_group C q hqC L).mpr hL,true_and,
      group_specified_iff Γ C q hqC L hL]
  have hout : ∀L : LineIndex n,L.val∉rootGroups C q→sourceJumpLine Γ C q L=1 := by
    intro L hL
    simp [sourceJumpLine,(sharedLine_iff_group C q hqC L).not.mpr hL]
  apply Finset.prod_bij_ne_one (fun L _ _=>L.val)
  · intro L _ hne
    by_contra hnot
    exact hne (hout L hnot)
  · intro L _ _ K _ _ he
    exact Subtype.ext he
  · intro L hL hne
    let Li : LineIndex n := ⟨L,group_is_boardLine C q hqC L hL⟩
    refine ⟨Li,Finset.mem_univ _,?_,rfl⟩
    simpa only [heq Li hL] using hne
  · intro L _ hne
    apply heq
    by_contra hnot
    exact hne (hout L hnot)

theorem multiplicity_insert {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (hqC : q∉C)
    (L : LineIndex n) : multiplicity (insert q C) L=multiplicity C L+if q∈L.val then 1 else 0 := by
  unfold MixedConnection.multiplicity
  by_cases hqL : q∈L.val
  · have he : insert q C∩L.val=insert q (C∩L.val) := by
      ext p
      simp only [Finset.mem_inter,Finset.mem_insert]
      aesop
    rw [he,Finset.card_insert_of_notMem (by simp [hqC]),if_pos hqL]
  · have he : insert q C∩L.val=C∩L.val := by
      ext p
      simp only [Finset.mem_inter,Finset.mem_insert]
      aesop
    rw [he,if_neg hqL,Nat.add_zero]

theorem inverse_protection_source (k : ℝ) (hk : k<2) (m : ℕ) (hm : 0<m) :
    (protection 0 k)⁻¹^m*protection 1 k=(protection 0 k)⁻¹^(m-1)*(1/2) := by
  have hk' : 2-k≠0 := ne_of_gt (sub_pos.mpr hk)
  have hone : (protection 0 k)⁻¹*protection 1 k=(1/2:ℝ) := by
    norm_num [protection,inv_div]
    field_simp
  obtain ⟨j,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_zero_of_lt hm)
  simp only [Nat.succ_sub_one,pow_succ]
  calc
    _ = (protection 0 k)⁻¹^j*((protection 0 k)⁻¹*protection 1 k) := by ring
    _ = _ := by rw [hone]

theorem lineConnection_source {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : e.process.Valid) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents)
    (hafter : C⊆(birthSnapshot e Γ q).process.activeEvents) (hqC : q∉C) (hE : EmptyLineCredit e)
    (hk : ∀L,sharedLine C q L→specified Γ L→e.clocks L<2) (L : LineIndex n) :
    lineConnection Γ (insert q C) e L*sourcePriceLine e Γ C q L=
      lineConnection Γ C e L*sourceJumpLine Γ C q L := by
  by_cases hqL : q∈L.val
  · by_cases hm : 0<multiplicity C L
    · have hshared : sharedLine C q L := ⟨hqL,hm⟩
      have hN := surviving_line_empty e Γ C q hs hstop hq hC hafter hqC L hqL hm
      by_cases hsp : specified Γ L
      · simp only [lineConnection,sourcePriceLine,sourceJumpLine,hshared,hsp,and_self,if_true,
          multiplicity_insert C q hqC L,if_pos hqL,Nat.add_sub_cancel,hN]
        exact inverse_protection_source (e.clocks L) (hk L hshared hsp) _ hm
      · simp [lineConnection,sourcePriceLine,sourceJumpLine,hsp,hE L hN]
    · have hm0 : multiplicity C L=0 := by omega
      simp [lineConnection,sourcePriceLine,sourceJumpLine,sharedLine,hm0,
        multiplicity_insert C q hqC L,hqL]
  · simp [lineConnection,sourcePriceLine,sourceJumpLine,sharedLine,hqL,
      multiplicity_insert C q hqC L]

theorem connectionProduct_source {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : e.process.Valid) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents)
    (hafter : C⊆(birthSnapshot e Γ q).process.activeEvents) (hqC : q∉C) (hE : EmptyLineCredit e)
    (hk : ∀L,sharedLine C q L→specified Γ L→e.clocks L<2) :
    connectionProduct Γ (insert q C) e*sourcePrice e Γ C q=
      connectionProduct Γ C e*∏L∈rootGroups C q,groupMultiplier Γ e.process.selected C q L := by
  rw [←sourceJumpLine_product e Γ C q hs hstop hq hC hafter hqC]
  unfold connectionProduct sourcePrice
  rw [←Finset.prod_mul_distrib,←Finset.prod_mul_distrib]
  exact Finset.prod_congr rfl (fun L _=>lineConnection_source e Γ C q hs hstop hq hC hafter hqC hE hk L)

theorem phi_source_surviving {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : e.process.Valid) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents)
    (hafter : C⊆(birthSnapshot e Γ q).process.activeEvents) (hqC : q∉C) (hE : EmptyLineCredit e)
    (hk : ∀L,sharedLine C q L→specified Γ L→e.clocks L<2) :
    (e.process.accounts q).weight*phi Γ C (birthSnapshot e Γ q)=
      sourcePrice e Γ C q*phi Γ (insert q C) e := by
  have hInsert : insert q C⊆e.process.activeEvents := Finset.insert_subset hq hC
  rw [phi_external_birth e Γ C q hs hstop hq hC hqC]
  simp only [phi,if_pos hC,if_pos hInsert]
  have hw : rootWeightProduct (insert q C) e=(e.process.accounts q).weight*rootWeightProduct C e :=
    Finset.prod_insert hqC
  rw [hw]
  have hp := connectionProduct_source e Γ C q hs hstop hq hC hafter hqC hE hk
  calc
    _ = (e.process.accounts q).weight*rootWeightProduct C e*
        (connectionProduct Γ C e*∏L∈rootGroups C q,groupMultiplier Γ e.process.selected C q L) := by ring
    _ = _ := by rw [←hp]; ring

theorem sourcePrice_nonneg {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (B : ℝ) (he : e.Valid B) : 0≤sourcePrice e Γ C q := by
  apply Finset.prod_nonneg
  intro L _
  unfold sourcePriceLine
  split_ifs
  · exact div_nonneg (by norm_num) (sub_nonneg.mpr (he.2.1.2.1 L).2)
  · exact zero_le_one

theorem phi_source_le {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (B : ℝ) (he : e.Valid B) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents) (hqC : q∉C) (hE : EmptyLineCredit e)
    (hk : ∀L,sharedLine C q L→specified Γ L→e.clocks L<2) :
    (e.process.accounts q).weight*phi Γ C (birthSnapshot e Γ q)≤
      sourcePrice e Γ C q*phi Γ (insert q C) e := by
  by_cases hafter : C⊆(birthSnapshot e Γ q).process.activeEvents
  · exact (phi_source_surviving e Γ C q he.1 hstop hq hC hafter hqC hE hk).le
  · rw [phi,if_neg hafter,mul_zero]
    exact mul_nonneg (sourcePrice_nonneg e Γ C q B he) (phi_nonneg e Γ (insert q C) B he)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phi_source_surviving
#print axioms NoThreeLine.BirthWitness.phi_source_le
