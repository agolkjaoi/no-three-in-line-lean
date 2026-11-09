import NoThreeLine.PairWitnessGeometry
import NoThreeLine.PairCauseProduct

/-! Expand powers of the actual pairRate over actual active causes. The
physical n^{-m} rate factor and B^{m-k} repeated-cause cost remain explicit.
This state-dependent finite expansion is not a witness-graph count. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines GridLines BirthWitness FiniteWitnessMoments

def causes {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint) (a b : Grid n) : Finset (Grid n) :=
  s.activeEvents.filter (fun q => commonChange Γ s.selected a b q)

def pairEnabled {n : ℕ} (s : ProcessState n) (a b : Grid n) : Prop :=
  s.stopped=false ∧ (s.accounts a).status=.active ∧ (s.accounts b).status=.active

instance {n : ℕ} (s : ProcessState n) (a b : Grid n) : Decidable (pairEnabled s a b) :=
  Classical.propDecidable _

theorem pairRate_eq_cause_sum {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (a b : Grid n) (h : pairEnabled s a b) :
    pairRate s Γ mask z a b = (∑ q : causes s Γ a b, mask q.val*z.1 q.val)/n := by
  rw [pairRate,if_pos h.2,Finset.sum_coe_sort (f:=fun q : Grid n => mask q*z.1 q),Finset.sum_div]
  simp only [causes,ProcessState.activeEvents,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro q _
  by_cases ha : (s.accounts q).status=.active <;>
    by_cases hc : commonChange Γ s.selected a b q <;> simp [phaseRate,h.1,ha,hc]

theorem pairRate_disabled {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (a b : Grid n) (h : ¬pairEnabled s a b) :
    pairRate s Γ mask z a b=0 := by
  unfold pairEnabled at h
  by_cases hs : s.stopped=false
  · simp only [hs,true_and] at h
    exact if_neg h
  · have ht : s.stopped=true := by cases he : s.stopped <;> simp_all
    exact pairRate_stopped s Γ mask z a b ht

theorem causeTuple_roots_excluded {n m : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (a b : Grid n) (f : Fin m → causes s Γ a b) (hm : 0<m) :
    a≠b ∧ a∉tupleLabels (fun i => (f i).val) ∧ b∉tupleLabels (fun i => (f i).val) ∧
      0<(tupleLabels (fun i => (f i).val)).card := by
  have hd (i : Fin m) := offBaseline_distinct a b (f i).val (Finset.mem_filter.mp (f i).property).2.1
  refine ⟨(hd ⟨0,hm⟩).1,?_,?_,?_⟩
  · intro ha
    obtain ⟨i,_,he⟩ := Finset.mem_image.mp ha
    exact (hd i).2.1 he.symm
  · intro hb
    obtain ⟨i,_,he⟩ := Finset.mem_image.mp hb
    exact (hd i).2.2 he.symm
  · exact Finset.card_pos.mpr ⟨(f ⟨0,hm⟩).val,Finset.mem_image.mpr ⟨⟨0,hm⟩,Finset.mem_univ _,rfl⟩⟩

theorem pairRate_pow_repeat {n m : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (a b : Grid n) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hmask : ∀q,0≤mask q ∧ mask q≤1) (hm : 0<m) :
    pairRate e.process Γ mask e.coordinates a b ^ m ≤
      if pairEnabled e.process a b then
        (∑ f : Fin m → causes e.process Γ a b,
          B^(m-(tupleLabels (fun i => (f i).val)).card) *
            ∏ q∈tupleLabels (fun i => (f i).val),(e.process.accounts q).weight)/(n:ℝ)^m
      else 0 := by
  by_cases h : pairEnabled e.process a b
  · rw [if_pos h]
    have hr0 := pairRate_nonneg e.process Γ mask e.coordinates (fun q => (hmask q).1)
      (fun q => (he.2.1.1 q).1) a b
    have hr : pairRate e.process Γ mask e.coordinates a b ≤
        (∑ q : causes e.process Γ a b,(e.process.accounts q.val).weight)/n := by
      rw [pairRate_eq_cause_sum e.process Γ mask e.coordinates a b h]
      apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
      exact Finset.sum_le_sum (fun q _ => mul_le_of_le_one_left (he.2.1.1 q.val).1 (hmask q.val).2)
    apply (pow_le_pow_left₀ hr0 hr m).trans
    rw [div_pow,Fintype.sum_pow]
    apply div_le_div_of_nonneg_right _ (pow_nonneg (Nat.cast_nonneg n) _)
    exact Finset.sum_le_sum (fun f _ => prod_tuple_le_repeat_cap (fun i => (f i).val)
      (fun q => (e.process.accounts q).weight) B hB he.2.1.1)
  · rw [if_neg h,pairRate_disabled e.process Γ mask e.coordinates a b h,zero_pow (by omega)]

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.pairRate_eq_cause_sum
#print axioms NoThreeLine.PairWitness.causeTuple_roots_excluded
#print axioms NoThreeLine.PairWitness.pairRate_pow_repeat
