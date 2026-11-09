import NoThreeLine.GroupPairGenerator
import NoThreeLine.ExtendedState

/-! The actual finite connection product for the mixed quantity with no
birth witnesses. A birth is observed before positive-retirement flags. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.MixedConnection
open AuxiliaryODE GridLines PrimitiveLines BirthLineGroups

def multiplicity {n : ℕ} (C : Finset (Grid n)) (L : LineIndex n) : ℕ := (C∩L.val).card

def lineConnection {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n))
    (e : ExtendedState n) (L : LineIndex n) : ℝ :=
  if specified Γ L then (protection (occupancy e.process L) (e.clocks L))⁻¹ ^ (multiplicity C L-1)
  else e.lineCredits L ^ (multiplicity C L-1)

def connectionProduct {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n)) (e : ExtendedState n) : ℝ :=
  ∏ L : LineIndex n, lineConnection Γ C e L

def rootWeightProduct {n : ℕ} (C : Finset (Grid n)) (e : ExtendedState n) : ℝ :=
  ∏ p∈C, (e.process.accounts p).weight

def phi {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n)) (e : ExtendedState n) : ℝ :=
  if C⊆e.process.activeEvents then rootWeightProduct C e * connectionProduct Γ C e else 0

abbrev birthSnapshot {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint) (q : Grid n) : ExtendedState n :=
  e.birth Γ q (fun _=>false)

theorem snapshot_clocks {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint) (q : Grid n) :
    (birthSnapshot e Γ q).clocks=e.clocks ∧ (birthSnapshot e Γ q).lineCredits=e.lineCredits := ⟨rfl,rfl⟩

theorem birthAccount_weight {n : ℕ} (Γ : Finset ZPoint) (S : Finset (Grid n))
    (p q : Grid n) (a : CreditAccount) (ha : a.status=.active) (positive : Bool) :
    (birthAccount Γ S p q a positive).weight=birthMultiplier Γ S p q*a.weight := by
  unfold birthAccount
  rw [CreditAccount.retire_weight]
  unfold birthGeometry birthMultiplier
  split_ifs <;> simp_all

theorem birthAccount_active_iff {n : ℕ} (Γ : Finset ZPoint) (S : Finset (Grid n))
    (p q : Grid n) (a : CreditAccount) (ha : a.status=.active) :
    (birthAccount Γ S p q a false).status=.active ↔ birthMultiplier Γ S p q≠0 := by
  unfold birthAccount birthGeometry birthMultiplier
  split_ifs <;> simp_all [CreditAccount.retire]

theorem snapshot_selected {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint) (q : Grid n)
    (hstop : e.process.stopped=false) (hq : q∈e.process.activeEvents) :
    (birthSnapshot e Γ q).process.selected=insert q e.process.selected := by
  simp [birthSnapshot,ExtendedState.birth,ProcessState.birth,hstop,(e.process.mem_activeEvents q).mp hq]

theorem snapshot_weight {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint) (q p : Grid n)
    (hstop : e.process.stopped=false) (hq : q∈e.process.activeEvents) (hp : p∈e.process.activeEvents) :
    ((birthSnapshot e Γ q).process.accounts p).weight=
      birthMultiplier Γ e.process.selected p q*(e.process.accounts p).weight := by
  simp only [birthSnapshot,ExtendedState.birth,ProcessState.birth,hstop,
    (e.process.mem_activeEvents q).mp hq,and_self,if_true]
  exact birthAccount_weight Γ e.process.selected p q _ ((e.process.mem_activeEvents p).mp hp) false

theorem snapshot_active_iff {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint) (q p : Grid n)
    (hstop : e.process.stopped=false) (hq : q∈e.process.activeEvents) (hp : p∈e.process.activeEvents) :
    p∈(birthSnapshot e Γ q).process.activeEvents ↔ birthMultiplier Γ e.process.selected p q≠0 := by
  rw [ProcessState.mem_activeEvents]
  simp only [birthSnapshot,ExtendedState.birth,ProcessState.birth,hstop,
    (e.process.mem_activeEvents q).mp hq,and_self,if_true]
  exact birthAccount_active_iff Γ e.process.selected p q _ ((e.process.mem_activeEvents p).mp hp)

theorem snapshot_occupancy {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint) (q : Grid n)
    (hstop : e.process.stopped=false) (hq : q∈e.process.activeEvents) (hqs : q∉e.process.selected)
    (L : LineIndex n) :
    occupancy (birthSnapshot e Γ q).process L=occupancy e.process L + if q∈L.val then 1 else 0 := by
  unfold occupancy
  rw [snapshot_selected e Γ q hstop hq]
  by_cases hL : q∈L.val
  · have he : insert q e.process.selected∩L.val=insert q (e.process.selected∩L.val) := by
      ext p
      simp only [Finset.mem_inter,Finset.mem_insert]
      aesop
    rw [he,Finset.card_insert_of_notMem (by simp [hqs]),if_pos hL]
  · have he : insert q e.process.selected∩L.val=e.process.selected∩L.val := by
      ext p
      simp only [Finset.mem_inter,Finset.mem_insert]
      aesop
    rw [he,if_neg hL,Nat.add_zero]

theorem boardLine_eq {n : ℕ} (L : LineIndex n) (p q : Grid n)
    (hp : p∈L.val) (hq : q∈L.val) (hpq : p≠q) : L.val=lineThrough p q := by
  classical
  obtain ⟨r,_,hL⟩ := Finset.mem_biUnion.mp L.property
  obtain ⟨t,ht,he⟩ := Finset.mem_image.mp hL
  have hrt : r≠t := fun hh => (Finset.mem_erase.mp ht).1 hh.symm
  let d := gridEmbed t-gridEmbed r
  have hd : d≠(0,0) := grid_difference_ne_zero r t hrt
  have hdir : directionLine r d=L.val := by
    rw [← he]
    ext z
    simp only [directionLine,mem_gridLinePoints,mem_lineThrough,orientedArea_eq_det]
    rfl
  have hpdir : p∈directionLine r d := hdir ▸ hp
  have hbase : directionLine p d=L.val := (directionLine_rebase r p d hpdir).symm.trans hdir
  exact hbase.symm.trans (directionLine_eq_lineThrough p q d hd hpq (hbase ▸ hq))

theorem fibre_eq_inter {n : ℕ} (C : Finset (Grid n)) (q : Grid n) (hqC : q∉C)
    (L : LineIndex n) (hqL : q∈L.val) : rootFibre C q L.val=C∩L.val := by
  ext p
  simp only [rootFibre,Finset.mem_filter,Finset.mem_inter]
  constructor
  · rintro ⟨hp,he⟩
    exact ⟨hp,he ▸ right_mem_lineThrough q p⟩
  · rintro ⟨hp,hpL⟩
    exact ⟨hp,(boardLine_eq L q p hqL hpL (fun he => hqC (he ▸ hp))).symm⟩

theorem survival_no_witness {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint) (q p : Grid n)
    (hs : e.process.Valid) (hstop : e.process.stopped=false) (hq : q∈e.process.activeEvents)
    (hp : p∈e.process.activeEvents) (hpa : p∈(birthSnapshot e Γ q).process.activeEvents) (hpq : p≠q) :
    ¬selectedWitness e.process.selected p q := by
  have hne := (snapshot_active_iff e Γ q p hstop hq hp).mp hpa
  have hdeath := geometric_death_after_birth_iff e.process.selected p q
    (hs.2.1 p ((e.process.mem_activeEvents p).mp hp))
    (hs.2.1 q ((e.process.mem_activeEvents q).mp hq)).1 hpq
  intro hW
  have hd := hdeath.mpr hW
  simp [birthMultiplier,hpq,hd] at hne

theorem surviving_line_empty {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) (hs : e.process.Valid) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents)
    (hafter : C⊆(birthSnapshot e Γ q).process.activeEvents) (hqC : q∉C)
    (L : LineIndex n) (hqL : q∈L.val) (hm : 0<multiplicity C L) : occupancy e.process L=0 := by
  obtain ⟨p,hp⟩ := Finset.card_pos.mp hm
  obtain ⟨hpC,hpL⟩ := Finset.mem_inter.mp hp
  have hpq : p≠q := fun he => hqC (he ▸ hpC)
  have hW := survival_no_witness e Γ q p hs hstop hq (hC hpC) (hafter hpC) hpq
  have he := boardLine_eq L q p hqL hpL hpq.symm
  have hempty : ¬(e.process.selected∩L.val).Nonempty := by
    rw [he]
    exact (witness_line_nonempty e.process.selected p q).not.mp hW
  exact Finset.card_eq_zero.mpr (Finset.not_nonempty_iff_eq_empty.mp hempty)

def lineBirthFactor {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n)) (q : Grid n)
    (L : LineIndex n) : ℝ :=
  if q∈L.val ∧ specified Γ L then 2^(multiplicity C L-1) else 1

theorem inverse_protection_step (k : ℝ) : (protection 1 k)⁻¹=2*(protection 0 k)⁻¹ := by
  norm_num [protection,inv_div]
  ring

theorem lineConnection_birth {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) (hs : e.process.Valid) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents)
    (hafter : C⊆(birthSnapshot e Γ q).process.activeEvents) (hqC : q∉C) (L : LineIndex n) :
    lineConnection Γ C (birthSnapshot e Γ q) L=
      lineBirthFactor Γ C q L*lineConnection Γ C e L := by
  have hqs := (hs.2.1 q ((e.process.mem_activeEvents q).mp hq)).1
  by_cases hsp : specified Γ L
  · by_cases hqL : q∈L.val
    · by_cases hm : 0<multiplicity C L
      · have hN := surviving_line_empty e Γ C q hs hstop hq hC hafter hqC L hqL hm
        have hN' : occupancy (birthSnapshot e Γ q).process L=1 := by
          rw [snapshot_occupancy e Γ q hstop hq hqs L,hN,if_pos hqL]
        simp only [lineConnection,lineBirthFactor,hsp,hqL,and_self,if_true,hN,hN']
        change (protection 1 (e.clocks L))⁻¹ ^ _ = _
        rw [inverse_protection_step,mul_pow]
      · have hm0 : multiplicity C L=0 := by omega
        simp [lineConnection,lineBirthFactor,hm0]
    · have hN' := snapshot_occupancy e Γ q hstop hq hqs L
      simp only [hqL,if_false,Nat.add_zero] at hN'
      simp only [lineConnection,lineBirthFactor,hsp,hqL,false_and,if_false,if_true,hN',one_mul]
      rfl
  · simp only [lineConnection,lineBirthFactor,hsp,and_false,if_false,one_mul]
    rfl

theorem connectionProduct_birth {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hs : e.process.Valid) (hstop : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hC : C⊆e.process.activeEvents)
    (hafter : C⊆(birthSnapshot e Γ q).process.activeEvents) (hqC : q∉C) :
    connectionProduct Γ C (birthSnapshot e Γ q)=
      (∏ L : LineIndex n,lineBirthFactor Γ C q L)*connectionProduct Γ C e := by
  unfold connectionProduct
  simp_rw [lineConnection_birth e Γ C q hs hstop hq hC hafter hqC]
  exact Finset.prod_mul_distrib

end NoThreeLine.MixedConnection

#print axioms NoThreeLine.MixedConnection.snapshot_active_iff
#print axioms NoThreeLine.MixedConnection.lineConnection_birth
#print axioms NoThreeLine.MixedConnection.connectionProduct_birth
