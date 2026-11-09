import NoThreeLine.ProtectedLineBounds

/-! Actual births outside a specified line preserve its occupancy and
scale its live protected weights by their real death/halving multipliers.
The first birth on the line preserves each surviving protected weight;
the second removes the moving weight. Saved values require a separate ledger. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines LineDrift MixedConnection

theorem specifiedLineWeight_external_birth {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (p q : Grid n) (he : e.process.Valid) (hs : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hp : p∈e.process.activeEvents) (hqL : q∉L.val) :
    specifiedLineWeight (birthSnapshot e Γ q) L p=
      birthMultiplier Γ e.process.selected p q*specifiedLineWeight e L p := by
  have hN := snapshot_occupancy e Γ q hs hq (he.2.1 q ((e.process.mem_activeEvents q).mp hq)).1 L
  simp only [if_neg hqL,Nat.add_zero] at hN
  unfold specifiedLineWeight
  rw [snapshot_weight e Γ q p hs hq hp,hN]
  change (birthMultiplier Γ e.process.selected p q*(e.process.accounts p).weight)/
    protection (occupancy e.process L) (e.clocks L)=_
  ring

theorem specifiedLineWeight_first_line_birth {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (p q : Grid n) (he : e.process.Valid) (hs : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hp : p∈e.process.activeEvents)
    (hpL : p∈L.val) (hqL : q∈L.val) (hsp : specified Γ L) (hN : occupancy e.process L=0)
    (hpq : p≠q) :
    specifiedLineWeight (birthSnapshot e Γ q) L p=specifiedLineWeight e L p := by
  have hf := specified_line_localGrowth e.process Γ p q L he ((e.process.mem_activeEvents p).mp hp) hpL hqL hsp hpq
  have hl := growthFactor_eq_loss Γ e.process.selected p q
    (he.2.1 p ((e.process.mem_activeEvents p).mp hp)) (he.2.1 q ((e.process.mem_activeEvents q).mp hq)).1
  rw [hN] at hf
  norm_num [b] at hf
  have hm : birthMultiplier Γ e.process.selected p q=1/2 := by linarith
  have hN' := snapshot_occupancy e Γ q hs hq (he.2.1 q ((e.process.mem_activeEvents q).mp hq)).1 L
  rw [hN,if_pos hqL] at hN'
  unfold specifiedLineWeight
  rw [snapshot_weight e Γ q p hs hq hp,hm,hN',hN]
  change ((1/2)*(e.process.accounts p).weight)/protection 1 (e.clocks L)=
    (e.process.accounts p).weight/protection 0 (e.clocks L)
  norm_num [protection,div_eq_mul_inv,mul_inv_rev,inv_inv]
  ring

theorem specifiedLineWeight_second_line_birth {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (p q : Grid n) (he : e.process.Valid) (hs : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hqL : q∈L.val) (hN : occupancy e.process L=1) :
    specifiedLineWeight (birthSnapshot e Γ q) L p=0 := by
  have hN' := snapshot_occupancy e Γ q hs hq (he.2.1 q ((e.process.mem_activeEvents q).mp hq)).1 L
  rw [hN,if_pos hqL] at hN'
  simp only [specifiedLineWeight,hN',protection]
  norm_num

theorem specifiedLineWeight_selected_birth {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (hs : e.process.stopped=false) (hq : q∈e.process.activeEvents) :
    specifiedLineWeight (birthSnapshot e Γ q) L q=0 := by
  unfold specifiedLineWeight
  rw [snapshot_weight e Γ q q hs hq hq]
  simp [birthMultiplier]

end NoThreeLine

#print axioms NoThreeLine.specifiedLineWeight_external_birth
#print axioms NoThreeLine.specifiedLineWeight_first_line_birth
#print axioms NoThreeLine.specifiedLineWeight_second_line_birth
