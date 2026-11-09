import NoThreeLine.ProtectedEntropyLedger

/-! Whole-event entropy loss and its squared cost bound at an actual external
birth. Credit can be zero or arbitrarily small. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem protectedEntropyDeletion_square_le {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K v D : ℝ)
    (he : e.Valid B) (hB : 0<B) (hN : occupancy e.process L≤1)
    (hclock : e.clocks L≤K) (hK : K<2) (hv : 0<v) (hvB : v≤2*B)
    (hEv : (E.card:ℝ)*v≤D) (hD : protectedExternalDeletion e Γ L E q≤D) :
    (protectedEntropyDeletion e Γ L E q B)^2≤
      D*(3+Real.log (2*B/v))^2*protectedExternalDeletion e Γ L E q := by
  classical
  let S := E.filter (fun p=>(e.process.accounts p).status=.active)
  let loss := fun p=>(1-birthMultiplier Γ e.process.selected p q)*specifiedLineWeight e L p
  have hnonneg : ∀p∈S,0≤loss p := fun p _=>mul_nonneg
    (sub_nonneg.mpr (birthMultiplier_bounds Γ e.process.selected p q).2)
    (specifiedLineWeight_bounds e L p B K he hN hclock hK).1
  have hcard : (S.card:ℝ)≤E.card := by exact_mod_cast Finset.card_filter_le E _
  have hSv : (S.card:ℝ)*v≤D := (mul_le_mul_of_nonneg_right hcard hv.le).trans hEv
  have hH := protectedEntropyDeletion_bounds e Γ L E q B K he hB hN hclock hK
  exact protectedEntropy_sum_square_bound S loss B v D _ hB hv hvB hnonneg hD hSv hH.1 hH.2

theorem protectedEventCost_nonneg {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K : ℝ) (he : e.Valid B)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2) :
    0≤protectedEventCost e Γ L E q := by
  have h := (protectedEventCost_compare e Γ L E q B K he hN hclock hK).1
  exact (mul_nonneg protectedEntropyCost_margin.1.le
    (protectedExternalDeletion_nonneg e Γ L E q B K he hN hclock hK)).trans h

theorem protectedEntropyDeletion_cost_square {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K v D : ℝ)
    (he : e.Valid B) (hB : 0<B) (hN : occupancy e.process L≤1)
    (hclock : e.clocks L≤K) (hK : K<2) (hv : 0<v) (hvB : v≤2*B)
    (hEv : (E.card:ℝ)*v≤D) (hD : protectedExternalDeletion e Γ L E q≤D) :
    (1-Real.log 2)*(protectedEntropyDeletion e Γ L E q B)^2≤
      D*(3+Real.log (2*B/v))^2*protectedEventCost e Γ L E q := by
  have hd0 := protectedExternalDeletion_nonneg e Γ L E q B K he hN hclock hK
  have hD0 := hd0.trans hD
  have hh := mul_le_mul_of_nonneg_left
    (protectedEntropyDeletion_square_le e Γ L E q B K v D he hB hN hclock hK hv hvB hEv hD)
    protectedEntropyCost_margin.1.le
  have hc := mul_le_mul_of_nonneg_left
    (protectedEventCost_compare e Γ L E q B K he hN hclock hK).1
    (mul_nonneg hD0 (sq_nonneg (3+Real.log (2*B/v))))
  calc
    _ ≤ (1-Real.log 2)*(D*(3+Real.log (2*B/v))^2*protectedExternalDeletion e Γ L E q) := hh
    _ = (D*(3+Real.log (2*B/v))^2)*((1-Real.log 2)*protectedExternalDeletion e Γ L E q) := by ring
    _ ≤ _ := hc

theorem protectedDeletion_cost_square {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K D : ℝ) (he : e.Valid B)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hD : protectedExternalDeletion e Γ L E q≤D) :
    (1-Real.log 2)*(protectedExternalDeletion e Γ L E q)^2≤D*protectedEventCost e Γ L E q := by
  have hd0 := protectedExternalDeletion_nonneg e Γ L E q B K he hN hclock hK
  have hD0 := hd0.trans hD
  have hsq : (protectedExternalDeletion e Γ L E q)^2≤D*protectedExternalDeletion e Γ L E q := by
    simpa only [pow_two] using mul_le_mul_of_nonneg_right hD hd0
  have hcost := mul_le_mul_of_nonneg_left
    (protectedEventCost_compare e Γ L E q B K he hN hclock hK).1 hD0
  calc
    _ ≤ (1-Real.log 2)*(D*protectedExternalDeletion e Γ L E q) :=
      mul_le_mul_of_nonneg_left hsq protectedEntropyCost_margin.1.le
    _ = D*((1-Real.log 2)*protectedExternalDeletion e Γ L E q) := by ring
    _ ≤ _ := hcost

theorem protectedEntropy_external_guard_square {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K M v : ℝ)
    (he : e.Valid B) (hB : 0<B) (hE : E⊆L.val) (hs : e.process.stopped=false)
    (hsp : specified Γ L) (hq : (e.process.accounts q).status=.active) (hqL : q∉L.val)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hvirtual : virtualMass e.process Γ e.coordinates L q≤M)
    (hv : 0<v) (hvB : v≤2*B) (hEv : (E.card:ℝ)*v≤M+2*(Γ.card:ℝ)*B) :
    (1-Real.log 2)*(protectedEntropyDeletion e Γ L E q B)^2≤
      (M+2*(Γ.card:ℝ)*B)*(3+Real.log (2*B/v))^2*protectedEventCost e Γ L E q :=
  protectedEntropyDeletion_cost_square e Γ L E q B K v _ he hB hN hclock hK hv hvB hEv
    (protectedExternalDeletion_closed_bound e Γ L E q B K M he hE hs hsp hq hqL hN hclock hK hvirtual)

end NoThreeLine
#print axioms NoThreeLine.protectedEntropyDeletion_cost_square
#print axioms NoThreeLine.protectedDeletion_cost_square
#print axioms NoThreeLine.protectedEntropy_external_guard_square
