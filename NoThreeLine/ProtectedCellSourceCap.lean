import NoThreeLine.ProtectedWholeEnergyHistory
import NoThreeLine.ProtectedEntropyScale

/-! Sharp positive source bounds in terms of the actual cell mass.
The signed entropy source retains its exact whole-event cost. -/
set_option autoImplicit false
set_option maxHeartbeats 1950000
noncomputable section
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines LineDrift

theorem protectedBirthCoefficient_bounds {n : ℕ} (e : ExtendedState n) (mask : Grid n→ℝ)
    (L : LineIndex n) (p : Grid n) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) (hN : occupancy e.process L≤1) :
    0≤e.process.birthRate mask p*(1-b (occupancy e.process L)) ∧
      e.process.birthRate mask p*(1-b (occupancy e.process L))≤(B/n)*(1-b (occupancy e.process L)) := by
  have hr := e.process.birthRate_nonneg mask (fun q=>(hm q).1) he.1 p
  have hα := e.process.acceptance_bounds mask B hB hm (fun q _=>he.2.1.1 q) p
  have hrate : e.process.birthRate mask p≤B/n := by
    rw [←ProcessState.candidate_rate_times_acceptance e.process mask B hB.ne' p]
    exact mul_le_of_le_one_right (div_nonneg hB.le (Nat.cast_nonneg n)) hα.2
  have hb := (one_sub_b_bounds _ hN).1
  exact ⟨mul_nonneg hr hb,mul_le_mul_of_nonneg_right hrate hb⟩

theorem protectedCreditTotalSource_le_mass {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n))
    (B : ℝ) (hB : 0<B) (he : e.Valid B) (hm : ∀q,0≤mask q ∧ mask q≤1)
    (hsp : specified Γ L) (hE : E⊆L.val) (hN : occupancy e.process L≤1)
    (hsv : ∀q∈E,0≤saved q ∧ saved q≤2*B) :
    protectedCreditTotalSource e mask L E≤
      ((B/n)*(1-b (occupancy e.process L)))*protectedCreditTotal L E e saved := by
  unfold protectedCreditTotalSource protectedCreditTotal
  rw [Finset.mul_sum]
  apply Finset.sum_le_sum
  intro p hp
  have hc := (protectedLineCredit_bounds_all L e saved Γ hsp p (hE hp) B he (hsv p hp)).1
  by_cases ha : (e.process.accounts p).status=.active
  · rw [protectedLinePositiveDrift,←protectedLineCredit_active L e saved p ha]
    exact mul_le_mul_of_nonneg_right (protectedBirthCoefficient_bounds e mask L p B hB he hm hN).2 hc
  · simp only [protectedLinePositiveDrift,ProcessState.birthRate,ha,and_false,if_false,zero_mul]
    exact mul_nonneg (mul_nonneg (div_nonneg hB.le (Nat.cast_nonneg n)) (one_sub_b_bounds _ hN).1) hc

theorem protectedEntropyTotalSource_add_cost_le_entropy {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) (hsp : specified Γ L) (hE : E⊆L.val)
    (hN : occupancy e.process L≤1) (hsv : ∀q∈E,0≤saved q ∧ saved q≤2*B) :
    protectedEntropyTotalSource e saved Γ mask L E B+protectedWholeCostRate e Γ mask L E≤
      ((B/n)*(1-b (occupancy e.process L)))*protectedEntropyTotal L E B e saved := by
  have hcost : protectedWholeCostRate e Γ mask L E=∑p∈E,protectedEntropyLedgerCostRate e Γ mask L p := by
    rw [protectedWholeCostRate,protectedEventCostRate_eq_point_sum,Finset.sum_filter]
    rfl
  rw [protectedEntropyTotalSource,hcost,←Finset.sum_add_distrib,protectedEntropyTotal,Finset.mul_sum]
  apply Finset.sum_le_sum
  intro p hp
  let c := protectedLineCredit L e saved p
  let a := e.process.birthRate mask p*(1-b (occupancy e.process L))
  have hc := protectedLineCredit_bounds_all L e saved Γ hsp p (hE hp) B he (hsv p hp)
  have hcoef := protectedBirthCoefficient_bounds e mask L p B hB he hm hN
  rw [protectedEntropySource_shape e saved Γ mask L p B hB]
  calc
    _ = a*(protectedEntropy B c-c) := by unfold a c protectedLineEntropy; ring
    _ ≤ a*protectedEntropy B c := mul_le_mul_of_nonneg_left (sub_le_self _ hc.1) hcoef.1
    _ ≤ _ := mul_le_mul_of_nonneg_right hcoef.2 (protectedEntropy_nonneg B c hB hc.1 hc.2)

theorem protectedEntropyTotal_nonneg_le_credit_log {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (L : LineIndex n) (E : Finset (Grid n))
    (B d : ℝ) (hn : 2≤n) (hB : 1≤B) (hd : 0≤d) (hBd : B≤(n:ℝ)^d)
    (he : e.Valid B) (hsp : specified Γ L) (hE : E⊆L.val) (hsv : ∀q∈E,0≤saved q ∧ saved q≤2*B) :
    0≤protectedEntropyTotal L E B e saved ∧
      protectedEntropyTotal L E B e saved≤
        (entropyLogConstant d*Real.log n)*max 1 (protectedCreditTotal L E e saved) := by
  let c := fun p=>protectedLineCredit L e saved p
  let C := protectedCreditTotal L E e saved
  let D := max 1 C
  have hb : 0<B := zero_lt_one.trans_le hB
  have hc (p) (hp : p∈E) : 0≤c p ∧ c p≤2*B :=
    protectedLineCredit_bounds_all L e saved Γ hsp p (hE hp) B he (hsv p hp)
  have hD : 0≤D := zero_le_one.trans (le_max_left _ _)
  have hroot : Real.sqrt (D*C)≤D := by
    have hr := Real.sqrt_le_sqrt (mul_le_mul_of_nonneg_left (le_max_right 1 C) hD)
    rwa [Real.sqrt_mul_self hD] at hr
  have hsum := protectedEntropy_sum_sqrt_bound E c B (entropyReference n) D hb
    (entropyReference_pos n) ((entropyReference_le_one n).trans (by linarith))
    (fun p hp=>(hc p hp).1) (le_max_right 1 C)
    ((entropyReference_card_le_one E).trans (le_max_left 1 C))
  have hl := entropy_log_scale B d hn hB hd hBd
  refine ⟨Finset.sum_nonneg (fun p hp=>protectedEntropy_nonneg B (c p) hb (hc p hp).1 (hc p hp).2),?_⟩
  exact hsum.trans ((mul_le_mul_of_nonneg_left hroot hl.1).trans (mul_le_mul_of_nonneg_right hl.2 hD))

end NoThreeLine

#print axioms NoThreeLine.protectedCreditTotalSource_le_mass
#print axioms NoThreeLine.protectedEntropyTotalSource_add_cost_le_entropy
#print axioms NoThreeLine.protectedEntropyTotal_nonneg_le_credit_log

