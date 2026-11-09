import NoThreeLine.MixedFlowDerivative

/-! Causewise geometric cancellation of the actual connection drift.
External active candidates leave exactly one loss coefficient per line group. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.MixedConnection
open AuxiliaryODE GridLines PrimitiveLines BirthLineGroups

def lineCauseFactor {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint) (L : LineIndex n) : ℝ :=
  if specified Γ L then if occupancy s L≤1 then 1/(2-(occupancy s L:ℝ)) else 0
  else if occupancy s L=1 then 1 else 0

def causeLineDebit {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) (L : LineIndex n) : ℝ :=
  if q∈L.val then ((multiplicity C L-1:ℕ):ℝ)*lineCauseFactor s Γ L else 0

def causeGrowth {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) : ℝ :=
  (∑ p∈C,localGrowthFactor Γ s.selected p q) - ∑ L : LineIndex n,causeLineDebit s Γ C q L

theorem active_line_occupancy_le_one {n : ℕ} (s : ProcessState n) (q : Grid n)
    (hs : s.Valid) (hq : q∈s.activeEvents) (L : LineIndex n) (hqL : q∈L.val) : occupancy s L≤1 := by
  have hsafe := hs.2.1 q ((s.mem_activeEvents q).mp hq)
  apply Finset.card_le_one.mpr
  intro a ha b hb
  obtain ⟨haS,haL⟩ := Finset.mem_inter.mp ha
  obtain ⟨hbS,hbL⟩ := Finset.mem_inter.mp hb
  by_contra hab
  have hqa : q≠a := fun he => hsafe.1 (he ▸ haS)
  have hline := boardLine_eq L q a hqL haL hqa
  have hz : orientedArea q a b=0 := (mem_lineThrough q a b).mp (hline ▸ hbL)
  rw [orientedArea_cycle q a b] at hz
  exact hsafe.2 a haS b hbS hab hz

theorem groupMultiplier_eq_line {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : s.Valid) (hC : C⊆s.activeEvents)
    (hq : q∈s.activeEvents) (hqC : q∉C) (L : Finset (Grid n)) (hL : L∈rootGroups C q) :
    groupMultiplier Γ s.selected C q L=lineMultiplier Γ s.selected q L := by
  have hrC := groupRoot_mem C q L hL
  unfold groupMultiplier
  rw [actual_multiplier_eq_line Γ s.selected _ q (hs.2.1 _ ((s.mem_activeEvents _).mp (hC hrC)))
    (hs.2.1 q ((s.mem_activeEvents q).mp hq)).1 (fun he => hqC (he ▸ hrC)),groupRoot_line C q L hL]

theorem lineCauseFactor_group {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : s.Valid) (hC : C⊆s.activeEvents)
    (hq : q∈s.activeEvents) (hqC : q∉C) (L : LineIndex n) (hL : L.val∈rootGroups C q) :
    lineCauseFactor s Γ L=1-groupMultiplier Γ s.selected C q L.val := by
  have hN := active_line_occupancy_le_one s q hs hq L (group_contains_candidate C q L.val hL)
  rw [groupMultiplier_eq_line s Γ C q hs hC hq hqC L.val hL]
  have hspec := group_specified_iff Γ C q hqC L hL
  by_cases hzero : occupancy s L=0
  · have hempty : ¬(s.selected∩L.val).Nonempty := by
      intro hp
      have hpos : 0<occupancy s L := Finset.card_pos.mpr hp
      omega
    by_cases hsp : specified Γ L <;>
      norm_num [lineCauseFactor,lineMultiplier,hzero,hempty,← hspec,hsp]
  · have hone : occupancy s L=1 := by omega
    have hnonempty : (s.selected∩L.val).Nonempty := Finset.card_pos.mp (by change 0<occupancy s L; omega)
    by_cases hsp : specified Γ L <;>
      norm_num [lineCauseFactor,lineMultiplier,hone,hnonempty,hsp]

def groupDebit {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) (L : Finset (Grid n)) : ℝ :=
  (((rootFibre C q L).card-1:ℕ):ℝ)*(1-groupMultiplier Γ s.selected C q L)

theorem causeLineDebit_eq_group {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : s.Valid) (hC : C⊆s.activeEvents)
    (hq : q∈s.activeEvents) (hqC : q∉C) (L : LineIndex n) (hL : L.val∈rootGroups C q) :
    causeLineDebit s Γ C q L=groupDebit s Γ C q L.val := by
  have hqL := group_contains_candidate C q L.val hL
  rw [causeLineDebit,if_pos hqL,lineCauseFactor_group s Γ C q hs hC hq hqC L hL]
  simp only [groupDebit,fibre_eq_inter C q hqC L hqL,multiplicity]

theorem causeLineDebit_zero_outside {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hqC : q∉C) (L : LineIndex n) (hL : L.val∉rootGroups C q) :
    causeLineDebit s Γ C q L=0 := by
  by_cases hqL : q∈L.val
  · have hm : multiplicity C L=0 := by
      apply Finset.card_eq_zero.mpr
      apply Finset.eq_empty_iff_forall_notMem.mpr
      intro p hp
      obtain ⟨hpC,hpL⟩ := Finset.mem_inter.mp hp
      apply hL
      exact Finset.mem_image.mpr ⟨p,hpC,
        (boardLine_eq L q p hqL hpL (fun he => hqC (he ▸ hpC))).symm⟩
    simp [causeLineDebit,hm]
  · simp [causeLineDebit,hqL]

theorem causeLineDebit_sum {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : s.Valid) (hC : C⊆s.activeEvents)
    (hq : q∈s.activeEvents) (hqC : q∉C) :
    (∑ L : LineIndex n,causeLineDebit s Γ C q L)=∑ L∈rootGroups C q,groupDebit s Γ C q L := by
  classical
  apply Finset.sum_bij_ne_zero (fun L _ _=>L.val)
  · intro L _ hne
    by_contra hnot
    exact hne (causeLineDebit_zero_outside s Γ C q hqC L hnot)
  · intro L _ _ K _ _ he
    exact Subtype.ext he
  · intro L hL hne
    let Li : LineIndex n := ⟨L,group_is_boardLine C q hqC L hL⟩
    refine ⟨Li,Finset.mem_univ Li,?_,rfl⟩
    simpa only [causeLineDebit_eq_group s Γ C q hs hC hq hqC Li hL] using hne
  · intro L _ hne
    have hg : L.val∈rootGroups C q := by
      by_contra hnot
      exact hne (causeLineDebit_zero_outside s Γ C q hqC L hnot)
    exact causeLineDebit_eq_group s Γ C q hs hC hq hqC L hg

theorem rootGrowth_sum_groups {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : s.Valid) (hC : C⊆s.activeEvents)
    (hq : q∈s.activeEvents) (hqC : q∉C) :
    (∑ p∈C,localGrowthFactor Γ s.selected p q)=
      ∑ L∈rootGroups C q,((rootFibre C q L).card:ℝ)*(1-groupMultiplier Γ s.selected C q L) := by
  rw [← Finset.sum_fiberwise_of_maps_to
    (fun p (hp : p∈C) => (Finset.mem_image_of_mem (lineThrough q) hp : lineThrough q p∈rootGroups C q))
    (fun p => localGrowthFactor Γ s.selected p q)]
  apply Finset.sum_congr rfl
  intro L hL
  change (∑ p∈rootFibre C q L,localGrowthFactor Γ s.selected p q)=_
  calc
    _ = ∑ _p∈rootFibre C q L,(1-groupMultiplier Γ s.selected C q L) := by
      apply Finset.sum_congr rfl
      intro p hp
      rw [growthFactor_eq_loss Γ s.selected p q (hs.2.1 p
        ((s.mem_activeEvents p).mp (hC (Finset.mem_filter.mp hp).1)))
        (hs.2.1 q ((s.mem_activeEvents q).mp hq)).1,
        ← groupMultiplier_actual s Γ C q hs hC hq hqC L hL p hp]
    _ = _ := by simp only [Finset.sum_const,nsmul_eq_mul]

theorem causeGrowth_external {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : s.Valid) (hC : C⊆s.activeEvents)
    (hq : q∈s.activeEvents) (hqC : q∉C) :
    causeGrowth s Γ C q=∑ L∈rootGroups C q,(1-groupMultiplier Γ s.selected C q L) := by
  rw [causeGrowth,rootGrowth_sum_groups s Γ C q hs hC hq hqC,
    causeLineDebit_sum s Γ C q hs hC hq hqC,← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro L hL
  have hm : 1≤(rootFibre C q L).card := Finset.card_pos.mpr (fibre_nonempty C q L hL)
  unfold groupDebit
  rw [Nat.cast_sub hm,Nat.cast_one]
  ring

theorem external_relative_generator_S6 {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : s.Valid) (hC : C⊆s.activeEvents)
    (hq : q∈s.activeEvents) (hqC : q∉C) :
    causeGrowth s Γ C q+(∏ L∈rootGroups C q,groupMultiplier Γ s.selected C q L)-1=
      GroupPairGenerator.groupCoefficient Γ s.selected C q := by
  rw [causeGrowth_external s Γ C q hs hC hq hqC]
  rfl

end NoThreeLine.MixedConnection

#print axioms NoThreeLine.MixedConnection.causeGrowth_external
#print axioms NoThreeLine.MixedConnection.external_relative_generator_S6
