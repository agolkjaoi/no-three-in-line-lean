import NoThreeLine.ProtectedExternalGeometry

/-! Whole-event protected-weight loss under an actual external birth.
The virtual and specified-direction parts are added before taking a square. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines GridLines MixedConnection

def protectedExternalDeletion {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) : ℝ :=
  ∑p∈E.filter (fun p=>(e.process.accounts p).status=.active),
    (1-birthMultiplier Γ e.process.selected p q)*specifiedLineWeight e L p

theorem birthMultiplier_trichotomy {n : ℕ} (Γ : Finset ZPoint) (s : Finset (Grid n)) (p q : Grid n) :
    birthMultiplier Γ s p q=0 ∨ birthMultiplier Γ s p q=1/2 ∨ birthMultiplier Γ s p q=1 := by
  unfold birthMultiplier
  split_ifs <;> simp

theorem protectedExternalDeletion_nonneg {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K : ℝ) (he : e.Valid B)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2) :
    0≤protectedExternalDeletion e Γ L E q :=
  Finset.sum_nonneg (fun p _=>mul_nonneg
    (sub_nonneg.mpr (birthMultiplier_bounds Γ e.process.selected p q).2)
    (specifiedLineWeight_bounds e L p B K he hN hclock hK).1)

theorem protectedExternalDeletion_eq_snapshot_loss {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n)
    (he : e.process.Valid) (hs : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hqL : q∉L.val) :
    protectedExternalDeletion e Γ L E q=
      ∑p∈E.filter (fun p=>(e.process.accounts p).status=.active),
        (specifiedLineWeight e L p-specifiedLineWeight (birthSnapshot e Γ q) L p) := by
  apply Finset.sum_congr rfl
  intro p hp
  rw [specifiedLineWeight_external_birth e Γ L p q he hs hq
    ((e.process.mem_activeEvents p).mpr (Finset.mem_filter.mp hp).2) hqL]
  ring

theorem protectedExternalDeletion_le_virtual {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K : ℝ) (he : e.Valid B)
    (hE : E⊆L.val) (hs : e.process.stopped=false) (hsp : specified Γ L)
    (hq : (e.process.accounts q).status=.active) (hqL : q∉L.val)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2) :
    protectedExternalDeletion e Γ L E q≤
      virtualMass e.process Γ e.coordinates L q+2*(Γ.card:ℝ)*B := by
  classical
  let A := E.filter (fun p=>(e.process.accounts p).status=.active)
  let S := A.filter (fun p=>specifiedPair Γ p q)
  have hAL : A⊆L.val := fun p hp=>hE (Finset.mem_filter.mp hp).1
  have hc (p) := specifiedLineWeight_bounds e L p B K he hN hclock hK
  have hB0 : 0≤B := (he.2.1.1 q).1.trans (he.2.1.1 q).2
  have hsum : protectedExternalDeletion e Γ L E q≤
      (∑p∈A,if virtualLeaf e.process Γ p q then specifiedLineWeight e L p else 0)+
      (∑p∈A,if specifiedPair Γ p q then specifiedLineWeight e L p else 0) := by
    rw [←Finset.sum_add_distrib]
    apply Finset.sum_le_sum
    intro p hp
    exact protected_external_loss_leaf_le e Γ L p q B K he (Finset.mem_filter.mp hp).2 hq
      (fun hpq=>hqL (hpq ▸ hAL hp)) hN hclock hK
  have hv : (∑p∈A,if virtualLeaf e.process Γ p q then specifiedLineWeight e L p else 0)≤
      virtualMass e.process Γ e.coordinates L q := by
    have hh := Finset.sum_le_sum_of_subset_of_nonneg (f:=fun p=>
      if virtualLeaf e.process Γ p q then specifiedLineWeight e L p else 0) hAL
      (fun p _ _=>by split_ifs; exact (hc p).1; exact le_rfl)
    apply hh.trans_eq
    rw [virtualMass,if_pos ⟨hs,hsp,hN,hqL,hq⟩]
    apply Finset.sum_congr rfl
    intro p _
    rw [specifiedLineWeight_eq_normalized]
  have hS : S⊆externalSpecifiedPoints Γ L q := by
    intro p hp
    exact Finset.mem_filter.mpr ⟨hAL (Finset.mem_filter.mp hp).1,(Finset.mem_filter.mp hp).2⟩
  have hcard : (S.card:ℝ)≤Γ.card := by
    exact_mod_cast (Finset.card_le_card hS).trans (externalSpecifiedPoints_card_le Γ L q hqL)
  have hspec : (∑p∈A,if specifiedPair Γ p q then specifiedLineWeight e L p else 0)≤2*(Γ.card:ℝ)*B := by
    change (∑p∈A,if specifiedPair Γ p q then specifiedLineWeight e L p else 0)≤_
    rw [←Finset.sum_filter]
    calc
      _ ≤ ∑_p∈S,2*B := Finset.sum_le_sum (fun p _=>(hc p).2)
      _ = (S.card:ℝ)*(2*B) := by simp
      _ ≤ (Γ.card:ℝ)*(2*B) := mul_le_mul_of_nonneg_right hcard (by positivity)
      _ = _ := by ring
  exact hsum.trans (add_le_add hv hspec)

theorem protectedExternalDeletion_guard_bound {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K M : ℝ) (he : e.Valid B)
    (hE : E⊆L.val) (hs : e.process.stopped=false) (hsp : specified Γ L)
    (hq : (e.process.accounts q).status=.active) (hqL : q∉L.val)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hguard : e.coordinates∉virtualGuard e.process Γ M) :
    protectedExternalDeletion e Γ L E q≤M+2*(Γ.card:ℝ)*B :=
  (protectedExternalDeletion_le_virtual e Γ L E q B K he hE hs hsp hq hqL hN hclock hK).trans
    (add_le_add ((outside_virtualGuard e.process Γ M e.coordinates).mp hguard L q).le le_rfl)

theorem protectedExternalDeletion_square_bound {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K M : ℝ) (he : e.Valid B)
    (hE : E⊆L.val) (hs : e.process.stopped=false) (hsp : specified Γ L)
    (hq : (e.process.accounts q).status=.active) (hqL : q∉L.val)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hguard : e.coordinates∉virtualGuard e.process Γ M) :
    (protectedExternalDeletion e Γ L E q)^2≤
      (M+2*(Γ.card:ℝ)*B)*protectedExternalDeletion e Γ L E q := by
  rw [pow_two]
  exact mul_le_mul_of_nonneg_right
    (protectedExternalDeletion_guard_bound e Γ L E q B K M he hE hs hsp hq hqL hN hclock hK hguard)
    (protectedExternalDeletion_nonneg e Γ L E q B K he hN hclock hK)

end NoThreeLine

#print axioms NoThreeLine.protectedExternalDeletion_eq_snapshot_loss
#print axioms NoThreeLine.protectedExternalDeletion_le_virtual
#print axioms NoThreeLine.protectedExternalDeletion_square_bound
