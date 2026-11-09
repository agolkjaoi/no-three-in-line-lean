import NoThreeLine.MixedConnection

/-! The actual external-birth generator for a specified line, after
dividing live weight by its current protection. Saved retirement values
and the changed probability law are not identified by this algebra alone. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines GridLines LineDrift

theorem specified_line_localGrowth {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (p q : Grid n) (L : LineIndex n) (hs : s.Valid)
    (hp : (s.accounts p).status=.active) (hpL : p∈L.val) (hqL : q∈L.val)
    (hsp : specified Γ L) (hpq : p≠q) :
    localGrowthFactor Γ s.selected p q=b (occupancy s L) := by
  have hL := (specified_iff_designated Γ p L hpL).mp hsp
  have he := designated_unique Γ p q hpq L.val hL hqL
  have hspq := (designated_iff Γ p q hpq).mp (he ▸ hL)
  rw [localGrowthFactor_lines Γ s.selected p q (hs.2.1 p hp) hpq,
    specified_factor_sum Γ s.selected p q hpq,if_pos hspq]
  simp only [hspq,not_true_eq_false,false_and,if_false,zero_add]
  rw [←he]
  rfl

theorem specified_line_growth_sum {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (p : Grid n) (L : LineIndex n) (hs : s.Valid)
    (hp : (s.accounts p).status=.active) (hpL : p∈L.val) (hsp : specified Γ L) :
    (∑q∈s.activeEvents,if q∈L.val then s.birthRate mask q*localGrowthFactor Γ s.selected p q else 0)=
      s.birthRate mask p+((∑q∈L.val,s.birthRate mask q)-s.birthRate mask p)*b (occupancy s L) := by
  classical
  have hpA := (s.mem_activeEvents p).mpr hp
  have hspl := Finset.sum_erase_add s.activeEvents
    (fun q=>if q∈L.val then s.birthRate mask q*localGrowthFactor Γ s.selected p q else 0) hpA
  have hself : localGrowthFactor Γ s.selected p p=1 := by simp only [localGrowthFactor,ite_true]
  simp only [if_pos hpL,hself,mul_one] at hspl
  have he : (∑q∈s.activeEvents.erase p,
      if q∈L.val then s.birthRate mask q*localGrowthFactor Γ s.selected p q else 0)=
      (∑q∈s.activeEvents.erase p,if q∈L.val then s.birthRate mask q else 0)*b (occupancy s L) := by
    rw [Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro q hq
    by_cases hqL : q∈L.val
    · rw [if_pos hqL,if_pos hqL,specified_line_localGrowth s Γ p q L hs hp hpL hqL hsp
        (fun h=>(Finset.mem_erase.mp hq).1 h.symm)]
    · simp only [if_neg hqL,zero_mul]
  rw [lineRate_erase_root s.activeEvents (s.birthRate mask) p hpA L.val hpL,state_lineRate] at he
  linarith

def externalLineGrowth {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) : ℝ :=
  ∑q∈s.activeEvents,if q∈L.val then 0 else s.birthRate mask q*localGrowthFactor Γ s.selected p q

theorem growth_sum_split_line {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) :
    (∑q∈s.activeEvents,s.birthRate mask q*localGrowthFactor Γ s.selected p q)=
      (∑q∈s.activeEvents,if q∈L.val then s.birthRate mask q*localGrowthFactor Γ s.selected p q else 0)+
      externalLineGrowth s Γ mask L p := by
  unfold externalLineGrowth
  rw [←Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro q _
  by_cases hq : q∈L.val <;> simp only [hq,ite_true,ite_false,add_zero,zero_add]

def specifiedLineWeight {n : ℕ} (e : ExtendedState n) (L : LineIndex n) (p : Grid n) : ℝ :=
  (e.process.accounts p).weight/protection (occupancy e.process L) (e.clocks L)

def protectedLineContinuousDrift {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) : ℝ :=
  e.process.continuousCreditDrift Γ (e.process.birthRate mask) p/
      protection (occupancy e.process L) (e.clocks L)-
    lineIntensity e.process mask e.coordinates L*b (occupancy e.process L)*specifiedLineWeight e L p

def protectedExternalJumpRate {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool) (L : LineIndex n) (p : Grid n) : ℝ :=
  ∑q∈e.process.activeEvents,if q∈L.val then 0 else e.process.birthRate mask q*
    (((e.process.birth Γ q (positive q)).accounts p).credit-(e.process.accounts p).credit)/
      protection (occupancy e.process L) (e.clocks L)

theorem protectedExternalJumpRate_eq {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool) (L : LineIndex n) (p : Grid n)
    (he : e.process.Valid) (hs : e.process.stopped=false) (hp : (e.process.accounts p).status=.active) :
    protectedExternalJumpRate e Γ mask positive L p=
      -specifiedLineWeight e L p*externalLineGrowth e.process Γ mask L p := by
  have hea : e.process.accounts p=⟨.active,(e.process.accounts p).weight⟩ := by
    cases ha : e.process.accounts p
    simp_all
  unfold protectedExternalJumpRate externalLineGrowth
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q hq
  have hqa := (e.process.mem_activeEvents q).mp hq
  by_cases hqL : q∈L.val
  · simp only [if_pos hqL,mul_zero]
  · rw [if_neg hqL,if_neg hqL]
    simp only [ProcessState.birth,hs,hqa,and_self,if_true]
    rw [hea,birthAccount_active_credit]
    have hg := growthFactor_eq_loss Γ e.process.selected p q (he.2.1 p hp) (he.2.1 q hqa).1
    simp only [CreditAccount.credit,ite_true,true_or]
    rw [hg]
    unfold specifiedLineWeight
    ring

theorem protectedLine_generator {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool) (L : LineIndex n) (p : Grid n)
    (he : e.process.Valid) (hs : e.process.stopped=false) (hp : (e.process.accounts p).status=.active)
    (hpL : p∈L.val) (hsp : specified Γ L) :
    protectedLineContinuousDrift e Γ mask L p+protectedExternalJumpRate e Γ mask positive L p=
      e.process.birthRate mask p*(1-b (occupancy e.process L))*specifiedLineWeight e L p := by
  rw [protectedExternalJumpRate_eq e Γ mask positive L p he hs hp]
  unfold protectedLineContinuousDrift
  simp only [ProcessState.continuousCreditDrift,hs,hp,and_self,if_true]
  rw [growth_sum_split_line,specified_line_growth_sum e.process Γ mask p L he hp hpL hsp]
  change (e.process.accounts p).weight*(e.process.birthRate mask p+
      ((∑q∈L.val,e.process.birthRate mask q)-e.process.birthRate mask p)*b (occupancy e.process L)+
      externalLineGrowth e.process Γ mask L p)/protection (occupancy e.process L) (e.clocks L)-
      (∑q∈L.val,e.process.birthRate mask q)*b (occupancy e.process L)*specifiedLineWeight e L p+
      -specifiedLineWeight e L p*externalLineGrowth e.process Γ mask L p=_
  unfold specifiedLineWeight
  ring

end NoThreeLine

#print axioms NoThreeLine.specified_line_growth_sum
#print axioms NoThreeLine.protectedExternalJumpRate_eq
#print axioms NoThreeLine.protectedLine_generator
