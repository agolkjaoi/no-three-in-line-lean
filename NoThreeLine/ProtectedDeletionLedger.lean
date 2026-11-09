import NoThreeLine.ProtectedExternalDeletion
import NoThreeLine.ProtectedLedgerBirth

/-! The whole external-birth loss is the actual saved-ledger loss,
including simultaneous positive retirement. Old saved credit contributes zero. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem protectedLedger_external_total_loss {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (q : Grid n)
    (positive : Grid n→Bool) (he : e.process.Valid) (hs : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hqL : q∉L.val) :
    (∑p∈E,protectedLineCredit L e saved p)-
      (∑p∈E,protectedLineCredit L (e.birth Γ q positive)
        (protectedLineSave L e (e.birth Γ q positive) saved) p)=protectedExternalDeletion e Γ L E q := by
  classical
  rw [←Finset.sum_sub_distrib,protectedExternalDeletion,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro p _
  by_cases hp : (e.process.accounts p).status=.active
  · rw [if_pos hp,protectedLineCredit_external_birth L e saved Γ q p positive he hs hq
      ((e.process.mem_activeEvents p).mpr hp) hqL,protectedLineCredit_active L e saved p hp]
    ring
  · rw [if_neg hp,protectedLineCredit_birth_inactive L e saved Γ q p positive hp,sub_self]

theorem protectedExternalDeletion_closed_bound {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K M : ℝ) (he : e.Valid B)
    (hE : E⊆L.val) (hs : e.process.stopped=false) (hsp : specified Γ L)
    (hq : (e.process.accounts q).status=.active) (hqL : q∉L.val)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hvirtual : virtualMass e.process Γ e.coordinates L q≤M) :
    protectedExternalDeletion e Γ L E q≤M+2*(Γ.card:ℝ)*B :=
  (protectedExternalDeletion_le_virtual e Γ L E q B K he hE hs hsp hq hqL hN hclock hK).trans
    (add_le_add hvirtual le_rfl)

theorem protectedExternalDeletion_closed_square {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K M : ℝ) (he : e.Valid B)
    (hE : E⊆L.val) (hs : e.process.stopped=false) (hsp : specified Γ L)
    (hq : (e.process.accounts q).status=.active) (hqL : q∉L.val)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hvirtual : virtualMass e.process Γ e.coordinates L q≤M) :
    (protectedExternalDeletion e Γ L E q)^2≤
      (M+2*(Γ.card:ℝ)*B)*protectedExternalDeletion e Γ L E q := by
  rw [pow_two]
  exact mul_le_mul_of_nonneg_right
    (protectedExternalDeletion_closed_bound e Γ L E q B K M he hE hs hsp hq hqL hN hclock hK hvirtual)
    (protectedExternalDeletion_nonneg e Γ L E q B K he hN hclock hK)

theorem protectedExternalDeletion_power_bound {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K d γ : ℝ) (he : e.Valid B)
    (hn : 1≤n) (hBd : B≤(n:ℝ)^d) (hdγ : d≤γ)
    (hE : E⊆L.val) (hs : e.process.stopped=false) (hsp : specified Γ L)
    (hq : (e.process.accounts q).status=.active) (hqL : q∉L.val)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hvirtual : virtualMass e.process Γ e.coordinates L q≤(n:ℝ)^γ) :
    protectedExternalDeletion e Γ L E q≤(1+2*(Γ.card:ℝ))*(n:ℝ)^γ ∧
      (protectedExternalDeletion e Γ L E q)^2≤
        ((1+2*(Γ.card:ℝ))*(n:ℝ)^γ)*protectedExternalDeletion e Γ L E q := by
  have hBγ := hBd.trans (Real.rpow_le_rpow_of_exponent_le (by exact_mod_cast hn) hdγ)
  have hD := protectedExternalDeletion_closed_bound e Γ L E q B K ((n:ℝ)^γ)
    he hE hs hsp hq hqL hN hclock hK hvirtual
  have hb : protectedExternalDeletion e Γ L E q≤(1+2*(Γ.card:ℝ))*(n:ℝ)^γ := by
    calc
      _ ≤ (n:ℝ)^γ+2*(Γ.card:ℝ)*B := hD
      _ ≤ (n:ℝ)^γ+2*(Γ.card:ℝ)*(n:ℝ)^γ :=
        add_le_add le_rfl (mul_le_mul_of_nonneg_left hBγ (by positivity))
      _ = _ := by ring
  refine ⟨hb,?_⟩
  rw [pow_two]
  exact mul_le_mul_of_nonneg_right hb (protectedExternalDeletion_nonneg e Γ L E q B K he hN hclock hK)

end NoThreeLine

#print axioms NoThreeLine.protectedLedger_external_total_loss
#print axioms NoThreeLine.protectedExternalDeletion_closed_square
#print axioms NoThreeLine.protectedExternalDeletion_power_bound
