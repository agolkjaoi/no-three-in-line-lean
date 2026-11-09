import NoThreeLine.ProtectedWholeEnergy
import NoThreeLine.ProtectedWholeSquareMeasurable
import NoThreeLine.ProtectedWholeSquareUniformBounds

/-! Joint measurability and a coarse finite cap for actual whole-event cost.
The cap is for integrability; it is not a sharp expectation or tail estimate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

theorem protectedEventCost_measurable {n : ℕ} (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) :
    Measurable (fun e : ExtendedState n=>protectedEventCost e Γ L E q) := by
  have hs := ExtendedState.measurable_process n
  have ha (p : Grid n) := CreditAccount.measurable_status.comp ((ProcessState.measurable_account n p).comp hs)
  have hψ (p : Grid n) : Measurable (fun e : ExtendedState n=>
      protectedEntropyCost (birthMultiplier Γ e.process.selected p q)) :=
    (measurable_of_countable (fun S : Finset (Grid n)=>protectedEntropyCost (birthMultiplier Γ S p q))).comp
      ((ProcessState.measurable_selected n).comp hs)
  unfold protectedEventCost
  simp only [Finset.sum_filter]
  apply Finset.measurable_sum
  intro p _
  exact Measurable.ite (ha p |>.eq_const CreditStatus.active).setOf
    ((specifiedLineWeight_measurable L p).mul (hψ p)) measurable_const

theorem protectedWholeCostRate_measurable {n : ℕ} (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) :
    Measurable (fun e : ExtendedState n=>protectedWholeCostRate e Γ mask L E) :=
  protectedExternalEventRate_measurable mask L _ (fun q=>protectedEventCost_measurable Γ L E q)

theorem protectedEventCost_bounds_all {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (L : LineIndex n) (hsp : specified Γ L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (B : ℝ) (hB : 0<B)
    (he : e.Valid B) (q : Grid n) :
    0≤protectedEventCost e Γ L E q ∧
      protectedEventCost e Γ L E q≤(E.card:ℝ)*(2*B) := by
  classical
  have ht (p) (hp : p∈E.filter (fun p=>(e.process.accounts p).status=.active)) :
      0≤specifiedLineWeight e L p*protectedEntropyCost (birthMultiplier Γ e.process.selected p q) ∧
      specifiedLineWeight e L p*protectedEntropyCost (birthMultiplier Γ e.process.selected p q)≤2*B := by
    have hc := protectedLineCredit_bounds_all L e (fun _=>0) Γ hsp p
      (hE (Finset.mem_filter.mp hp).1) B he ⟨le_rfl,by positivity⟩
    have hc' : 0≤specifiedLineWeight e L p ∧ specifiedLineWeight e L p≤2*B := by
      simpa only [protectedLineCredit_active L e (fun _=>0) p (Finset.mem_filter.mp hp).2] using hc
    have hJ := birthMultiplier_bounds Γ e.process.selected p q
    have hψ0 := protectedEntropyCost_nonneg _ hJ.1
    have hψ := (protectedEntropyCost_actual_bounds _ (birthMultiplier_trichotomy Γ e.process.selected p q)).2
    have hψ1 : protectedEntropyCost (birthMultiplier Γ e.process.selected p q)≤1 := by linarith
    exact ⟨mul_nonneg hc'.1 hψ0,(mul_le_of_le_one_right hc'.1 hψ1).trans hc'.2⟩
  constructor
  · exact Finset.sum_nonneg (fun p hp=>(ht p hp).1)
  · calc
      _ ≤ ∑_p∈E.filter (fun p=>(e.process.accounts p).status=.active),(2*B) :=
        Finset.sum_le_sum (fun p hp=>(ht p hp).2)
      _ = ((E.filter (fun p=>(e.process.accounts p).status=.active)).card:ℝ)*(2*B) := by
        simp only [Finset.sum_const,nsmul_eq_mul]
      _ ≤ _ := mul_le_mul_of_nonneg_right
        (by exact_mod_cast Finset.card_le_card (Finset.filter_subset (fun p=>(e.process.accounts p).status=.active) E))
        (by positivity)

theorem protectedWholeCostRate_bounds {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (hsp : specified Γ L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) :
    0≤protectedWholeCostRate e Γ mask L E ∧
      ‖protectedWholeCostRate e Γ mask L E‖≤(n:ℝ)^2*(B/n)*((E.card:ℝ)*(2*B)) := by
  have hc (q) := protectedEventCost_bounds_all e Γ L hsp E hE B hB he q
  constructor
  · apply Finset.sum_nonneg
    intro q _
    split_ifs
    · exact le_rfl
    · exact mul_nonneg (e.process.birthRate_nonneg mask (fun q=>(hm q).1) he.1 q) (hc q).1
  · apply protectedExternalEventRate_norm_bound e mask L B hB he hm _ _ (by positivity)
    intro q _
    rw [Real.norm_eq_abs,abs_of_nonneg (hc q).1]
    exact (hc q).2

end NoThreeLine
#print axioms NoThreeLine.protectedWholeCostRate_measurable
#print axioms NoThreeLine.protectedEventCost_bounds_all
#print axioms NoThreeLine.protectedWholeCostRate_bounds
