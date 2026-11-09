import NoThreeLine.LabelMomentBound
import NoThreeLine.WitnessProductExpansion

/-! Physical leaves have cap B, while their deterministic mask is in [0,1].
The old finite-label recursion is applied with one inverse-B price for each
new distinct leaf. This preserves the leading coefficient one. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open scoped BigOperators
namespace NoThreeLine.FiniteWitnessMoments

theorem prod_tuple_le_repeat_cap {α : Type*} [DecidableEq α] {k : ℕ}
    (f : Fin k→α) (x : α→ℝ) (B : ℝ) (hB : 0<B) (hx : ∀q,0≤x q ∧ x q≤B) :
    (∏i : Fin k,x (f i))≤B^(k-(tupleLabels f).card)*∏q∈tupleLabels f,x q := by
  have hh := BirthWitness.prod_comp_le_prod_image Finset.univ f (fun q=>x q/B)
    (fun q=>⟨div_nonneg (hx q).1 hB.le,(div_le_one hB).mpr (hx q).2⟩)
  have ha := tupleLabels_card_le f
  have hp : B^k=B^(k-(tupleLabels f).card)*B^(tupleLabels f).card := by
    rw [←pow_add,Nat.sub_add_cancel ha]
  change (∏i : Fin k,x (f i)/B)≤∏q∈tupleLabels f,x q/B at hh
  simp only [Finset.prod_div_distrib,Finset.prod_const,Finset.card_univ,Fintype.card_fin] at hh
  have hb0 := ne_of_gt hB
  calc
    _ = B^k*((∏i : Fin k,x (f i))/B^k) := by field_simp
    _ ≤ B^k*((∏q∈tupleLabels f,x q)/B^(tupleLabels f).card) :=
      mul_le_mul_of_nonneg_left hh (pow_nonneg hB.le k)
    _ = _ := by rw [hp]; field_simp

def physicalRepeatSum {α : Type*} [Fintype α] [DecidableEq α]
    (mask : α→ℝ) (B : ℝ) (k : ℕ) : ℝ :=
  ∑f : Fin k→α,B^(k-(tupleLabels f).card)*(∏i : Fin k,mask (f i))

theorem physicalRepeatSum_eq_tupleMoment {α : Type*} [Fintype α] [DecidableEq α]
    (mask : α→ℝ) (B : ℝ) (hB : 0<B) (k : ℕ) :
    physicalRepeatSum mask B k=B^k*tupleMoment ∅ mask (fun _=>B⁻¹) k := by
  unfold physicalRepeatSum tupleMoment tuplePrice
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro f _
  have ha := tupleLabels_card_le f
  have hp : B^k=B^(k-(tupleLabels f).card)*B^(tupleLabels f).card := by
    rw [←pow_add,Nat.sub_add_cancel ha]
  have hb0 := ne_of_gt hB
  simp only [Finset.sdiff_empty,Finset.prod_const,inv_pow]
  rw [hp]
  field_simp

theorem physicalRepeatSum_le_main_error {α : Type*} [Fintype α] [DecidableEq α]
    (mask : α→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (B : ℝ) (hB : 0<B) (k : ℕ) :
    physicalRepeatSum mask B k≤(∑q : α,mask q)^k+
      (k:ℝ)^2*B*((∑q : α,mask q)+(k:ℝ)*B)^(k-1) := by
  rw [physicalRepeatSum_eq_tupleMoment mask B hB k]
  have hh := mul_le_mul_of_nonneg_left
    (tupleMoment_le_main_add_error mask (fun _=>B⁻¹) (fun q=>(hm q).1)
      (fun _=>inv_nonneg.mpr hB.le) 1 zero_le_one (fun q=>(hm q).2) k) (pow_nonneg hB.le k)
  rw [←Finset.sum_mul] at hh
  apply hh.trans_eq
  cases k with
  | zero => simp
  | succ k =>
    simp only [Nat.add_sub_cancel,mul_one]
    rw [show (∑q : α,mask q)*B⁻¹+((k+1:ℕ):ℝ) =
      ((∑q : α,mask q)+((k+1:ℕ):ℝ)*B)/B by field_simp <;> ring]
    simp only [mul_pow,inv_pow,div_pow,pow_succ]
    field_simp
    <;> ring

def physicalRepeatErrorConstant (k : ℕ) : ℝ := (k:ℝ)^2*((k:ℝ)+1)^(k-1)

theorem physicalRepeatSum_le_length_error {α : Type*} [Fintype α] [DecidableEq α]
    (mask : α→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (B L : ℝ) (hB : 0<B)
    (hBL : B≤L) (hL : (Fintype.card α:ℝ)≤L) (k : ℕ) :
    physicalRepeatSum mask B k≤(∑q : α,mask q)^k+physicalRepeatErrorConstant k*B*L^(k-1) := by
  have hD : (∑q : α,mask q)≤L := (show (∑q : α,mask q)≤(Fintype.card α:ℝ) by
    simpa using Finset.sum_le_sum (s:=Finset.univ) (fun q _=>(hm q).2)).trans hL
  have hD0 : 0≤∑q : α,mask q := Finset.sum_nonneg (fun q _=>(hm q).1)
  have hbase : (∑q : α,mask q)+(k:ℝ)*B≤((k:ℝ)+1)*L := by
    nlinarith [mul_le_mul_of_nonneg_left hBL (Nat.cast_nonneg k)]
  apply (physicalRepeatSum_le_main_error mask hm B hB k).trans
  apply add_le_add le_rfl
  calc
    _ ≤ (k:ℝ)^2*B*(((k:ℝ)+1)*L)^(k-1) := mul_le_mul_of_nonneg_left
      (pow_le_pow_left₀ (add_nonneg hD0 (mul_nonneg (Nat.cast_nonneg k) hB.le)) hbase _) (by positivity)
    _ = _ := by rw [mul_pow]; unfold physicalRepeatErrorConstant; ring

end NoThreeLine.FiniteWitnessMoments
#print axioms NoThreeLine.FiniteWitnessMoments.prod_tuple_le_repeat_cap
#print axioms NoThreeLine.FiniteWitnessMoments.physicalRepeatSum_le_main_error
#print axioms NoThreeLine.FiniteWitnessMoments.physicalRepeatSum_le_length_error
