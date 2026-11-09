import NoThreeLine.ProtectedEntropyFirstMean
import NoThreeLine.ProtectedLedgerGlobalBounds

/-! A uniform finite entropy-source bound on all valid physical states.
The constant is for integrability, not the final asymptotic bracket estimate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines LineDrift

def protectedEntropySourceCap (n : ℕ) (B : ℝ) : ℝ := ((B/n)*(2*B))*(1+(n:ℝ)^2)

theorem protectedEntropySourceCap_nonneg (n : ℕ) (B : ℝ) (hB : 0≤B) :
    0≤protectedEntropySourceCap n B := by unfold protectedEntropySourceCap; positivity

theorem protectedEntropySource_bounds_all {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (hsp : specified Γ L)
    (p : Grid n) (hpL : p∈L.val) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) :
    ‖protectedEntropySource e saved Γ mask L p B‖≤protectedEntropySourceCap n B := by
  have hr (q : Grid n) : 0≤e.process.birthRate mask q ∧ e.process.birthRate mask q≤B/n := by
    refine ⟨e.process.birthRate_nonneg mask (fun q=>(hm q).1) he.1 q,?_⟩
    have hα := e.process.acceptance_bounds mask B hB hm (fun q _=>he.2.1.1 q) q
    rw [←ProcessState.candidate_rate_times_acceptance e.process mask B hB.ne' q]
    exact mul_le_of_le_one_right (div_nonneg hB.le (Nat.cast_nonneg n)) hα.2
  by_cases hp : (e.process.accounts p).status=.active
  · have hN := state_designated_count_le_one e.process Γ p he.1 hp L.val
      ((specified_iff_designated Γ p L hpL).mp hsp)
    change occupancy e.process L≤1 at hN
    have hc : 0≤specifiedLineWeight e L p ∧ specifiedLineWeight e L p≤2*B := by
      simpa only [CreditAccount.credit,hp,true_or,if_true,specifiedLineWeight] using
        protectedPhysicalCredit_bounds_two L e p B he (hN.trans (by omega))
    have hh := protectedEntropy_bounds B _ hB hc.1 hc.2
    have hd : ‖protectedEntropy B (specifiedLineWeight e L p)-specifiedLineWeight e L p‖≤2*B := by
      rw [Real.norm_eq_abs,abs_le]
      constructor <;> linarith
    have hb := one_sub_b_bounds _ hN
    have hcoef : ‖e.process.birthRate mask p*(1-b (occupancy e.process L))‖≤B/n := by
      rw [Real.norm_eq_abs,abs_of_nonneg (mul_nonneg (hr p).1 hb.1)]
      exact (mul_le_of_le_one_right (hr p).1 (hb.2.trans (by norm_num))).trans (hr p).2
    have hterm (q : Grid n) : 0≤(if q∈L.val then (0:ℝ) else e.process.birthRate mask q*
        (specifiedLineWeight e L p*protectedEntropyCost (birthMultiplier Γ e.process.selected p q))) ∧
        (if q∈L.val then (0:ℝ) else e.process.birthRate mask q*
        (specifiedLineWeight e L p*protectedEntropyCost (birthMultiplier Γ e.process.selected p q)))≤(B/n)*(2*B) := by
      have hJ := birthMultiplier_bounds Γ e.process.selected p q
      have hψ0 := protectedEntropyCost_nonneg _ hJ.1
      have hψ := (protectedEntropyCost_actual_bounds _ (birthMultiplier_trichotomy Γ e.process.selected p q)).2
      have hψ1 : protectedEntropyCost (birthMultiplier Γ e.process.selected p q)≤1 := by linarith
      split_ifs
      · exact ⟨le_rfl,mul_nonneg (div_nonneg hB.le (Nat.cast_nonneg n)) (by linarith)⟩
      · refine ⟨mul_nonneg (hr q).1 (mul_nonneg hc.1 hψ0),?_⟩
        exact mul_le_mul (hr q).2 ((mul_le_of_le_one_right hc.1 hψ1).trans hc.2)
          (mul_nonneg hc.1 hψ0) (div_nonneg hB.le (Nat.cast_nonneg n))
    have hcost0 : 0≤protectedEntropyPointCostRate e Γ mask L p :=
      Finset.sum_nonneg (fun q _=>(hterm q).1)
    have hcard : (e.process.activeEvents.card:ℝ)≤(n:ℝ)^2 := by
      exact_mod_cast (show e.process.activeEvents.card≤n^2 by simpa [Grid,pow_two] using Finset.card_le_univ e.process.activeEvents)
    have hcost : ‖protectedEntropyPointCostRate e Γ mask L p‖≤(n:ℝ)^2*((B/n)*(2*B)) := by
      rw [Real.norm_eq_abs,abs_of_nonneg hcost0]
      calc
        _ ≤ ∑_q∈e.process.activeEvents,(B/n)*(2*B) := Finset.sum_le_sum (fun q _=>(hterm q).2)
        _ = (e.process.activeEvents.card:ℝ)*((B/n)*(2*B)) := by simp
        _ ≤ _ := mul_le_mul_of_nonneg_right hcard (by positivity)
    rw [protectedEntropySource_shape e saved Γ mask L p B hB,protectedLineEntropy,
      protectedLineCredit_active L e saved p hp,protectedEntropyLedgerCostRate,if_pos hp]
    calc
      _ ≤ ‖e.process.birthRate mask p*(1-b (occupancy e.process L))*
        (protectedEntropy B (specifiedLineWeight e L p)-specifiedLineWeight e L p)‖+
          ‖protectedEntropyPointCostRate e Γ mask L p‖ := norm_sub_le _ _
      _ ≤ (B/n)*(2*B)+(n:ℝ)^2*((B/n)*(2*B)) := add_le_add
        (by rw [norm_mul]; exact mul_le_mul hcoef hd (norm_nonneg _) (div_nonneg hB.le (Nat.cast_nonneg n))) hcost
      _ = _ := by unfold protectedEntropySourceCap; ring
  · have hz : protectedEntropySource e saved Γ mask L p B=0 := by
      simp only [protectedEntropySource,protectedEntropyLedgerCostRate,hp,if_false,
        protectedLinePositiveDrift,ProcessState.birthRate,and_false,if_false,zero_mul,mul_zero,sub_self]
    rw [hz,norm_zero]
    exact protectedEntropySourceCap_nonneg n B hB.le

end NoThreeLine
#print axioms NoThreeLine.protectedEntropySource_bounds_all
