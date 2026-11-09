import NoThreeLine.ScheduledBoardLabelScale
import NoThreeLine.PhysicalLeafRepetition

/-! C2 products retain two active roots, distinct physical causes, and a
set of distinct selected witnesses. Only repeated cause weights cost B.
The second root is inserted using the proved physical weight floor. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness MixedConnection FiniteWitnessMoments

def causeProduct {n : ℕ} (a b : Grid n) (Q D : Finset (Grid n)) (e : ExtendedState n) : ℝ :=
  activeSelectedIndicator (insert a (insert b Q)) D e * rootWeightProduct Q e

theorem causeProduct_nonneg {n : ℕ} (a b : Grid n) (Q D : Finset (Grid n))
    (e : ExtendedState n) (B : ℝ) (he : e.Valid B) : 0≤causeProduct a b Q D e :=
  mul_nonneg (activeSelectedIndicator_bounds _ _ _).1
    (Finset.prod_nonneg (fun q _ => (he.2.1.1 q).1))

theorem causeProduct_measurable {n : ℕ} (a b : Grid n) (Q D : Finset (Grid n)) :
    Measurable (causeProduct a b Q D) := by
  exact (activeSelectedIndicator_measurable _ _).mul
    (Finset.measurable_prod Q (fun q _ => CreditAccount.measurable_weight.comp
      ((ProcessState.measurable_account n q).comp (ExtendedState.measurable_process n))))

theorem causeProduct_le_physicalLeaf {n : ℕ} (a b : Grid n) (Q D : Finset (Grid n))
    (hab : a≠b) (ha : a∉Q) (hb : b∉Q) (Γ : Finset ZPoint)
    (e : ExtendedState n) (B : ℝ) (he : e.Valid B) (hf : e.process.ActiveWeightFloor Γ) :
    causeProduct a b Q D e ≤ (2:ℝ)^Γ.card * physicalLeafProduct (insert a (insert b Q)) D a e := by
  by_cases h : insert a (insert b Q)⊆e.process.activeEvents ∧ D⊆e.process.selected
  · have hbactive : (e.process.accounts b).status=.active :=
      (e.process.mem_activeEvents b).mp (h.1 (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)))
    have hf' := e.process.activeWeightFloor_uniform Γ hf b hbactive
    have hone : (1:ℝ)≤2^Γ.card*(e.process.accounts b).weight := by
      calc
        1 = (2:ℝ)^Γ.card*(1/2:ℝ)^Γ.card := by rw [← mul_pow]; norm_num
        _ ≤ _ := mul_le_mul_of_nonneg_left hf' (by positivity)
    have hw : 0≤rootWeightProduct Q e := Finset.prod_nonneg (fun q _ => (he.2.1.1 q).1)
    have hE : (insert a (insert b Q)).erase a=insert b Q := by simp [ha,hab]
    simp only [causeProduct,activeSelectedIndicator,if_pos h,one_mul,
      physicalLeafProduct,if_pos h.1,selectedLabelProduct_eq_indicator,if_pos h.2,mul_one,hE]
    have hprod : rootWeightProduct (insert b Q) e=(e.process.accounts b).weight*rootWeightProduct Q e :=
      Finset.prod_insert hb
    rw [hprod]
    simpa only [one_mul,mul_assoc] using mul_le_mul_of_nonneg_right hone hw
  · rw [causeProduct,activeSelectedIndicator,if_neg h,zero_mul]
    exact mul_nonneg (by positivity) (physicalLeafProduct_bounds _ D a e B he).1

def causeTupleProduct {n m : ℕ} (a b : Grid n) (f : Fin m → Grid n)
    (D : Finset (Grid n)) (e : ExtendedState n) : ℝ :=
  activeSelectedIndicator (insert a (insert b (tupleLabels f))) D e *
    ∏ i : Fin m, (e.process.accounts (f i)).weight

theorem causeTupleProduct_repeat {n m : ℕ} (a b : Grid n) (f : Fin m → Grid n)
    (D : Finset (Grid n)) (e : ExtendedState n) (B : ℝ) (hB : 0<B) (he : e.Valid B) :
    causeTupleProduct a b f D e ≤
      B^(m-(tupleLabels f).card)*causeProduct a b (tupleLabels f) D e := by
  have hh := mul_le_mul_of_nonneg_left
    (prod_tuple_le_repeat_cap f (fun q => (e.process.accounts q).weight) B hB he.2.1.1)
    (activeSelectedIndicator_bounds (insert a (insert b (tupleLabels f))) D e).1
  change causeTupleProduct a b f D e ≤ _ at hh
  exact hh.trans_eq (by unfold causeProduct rootWeightProduct; ring)

theorem causeTupleProduct_repeat_coarse {n m : ℕ} (a b : Grid n) (f : Fin m → Grid n)
    (D : Finset (Grid n)) (e : ExtendedState n) (B : ℝ) (hB : 1≤B)
    (hm : 0<m) (he : e.Valid B) :
    causeTupleProduct a b f D e ≤ B^(m-1)*causeProduct a b (tupleLabels f) D e := by
  have hc : 0<(tupleLabels f).card := Finset.card_pos.mpr
    ⟨f ⟨0,hm⟩,Finset.mem_image.mpr ⟨⟨0,hm⟩,Finset.mem_univ _,rfl⟩⟩
  exact (causeTupleProduct_repeat a b f D e B (zero_lt_one.trans_le hB) he).trans
    (mul_le_mul_of_nonneg_right (pow_le_pow_right₀ hB (by omega))
      (causeProduct_nonneg a b _ D e B he))

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.causeProduct_le_physicalLeaf
#print axioms NoThreeLine.PairWitness.causeTupleProduct_repeat
#print axioms NoThreeLine.PairWitness.causeTupleProduct_repeat_coarse
